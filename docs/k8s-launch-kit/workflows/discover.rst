.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

.. headings # #, * *, =, -, ^, "
.. include:: ../../common/vars.rst

******************
Discover Workflow
******************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Use this when:** you want Launch Kit to inspect a live cluster's network hardware and produce a ``cluster-config.yaml`` describing it. Skip this workflow if you are generating manifests offline against a known machine type --- see :doc:`../presets`.

The ``l8k discover`` subcommand deploys a minimal Network Operator profile with the NIC Configuration Operator, then probes each node for NIC PCI addresses, device IDs, RDMA capability, InfiniBand support, OFED-dependent kernel modules, GPU topology, and machine type.

================================================================================
Basic Discovery
================================================================================

.. code-block:: bash

   l8k discover

No flags required. ``--kubeconfig`` falls back to ``$KUBECONFIG`` (or ``~/.kube/config``), and the output is written to ``./cluster-config.yaml`` by default. Discovery groups nodes by PCI topology (PCI addresses + device IDs across each node's PFs), labels each node with ``nvidia.kubernetes-launch-kit.machine: <machineType>-<gpuType>``, and writes a ``nodeSelector`` keyed by that label per group.

================================================================================
Discovery with a Base Configuration
================================================================================

Provide your own configuration as a base. Discovery merges discovered hardware into your config, preserving custom settings (network operator version, subnets, MTU, etc.):

.. code-block:: bash

   l8k discover --user-config ./my-config.yaml \
       --kubeconfig ~/.kube/config

Without ``--save-cluster-config``, the file specified by ``--user-config`` is updated in place. To save results to a separate file:

.. code-block:: bash

   l8k discover --user-config ./my-config.yaml \
       --save-cluster-config ./discovered-config.yaml \
       --kubeconfig ~/.kube/config

================================================================================
Filtering Nodes
================================================================================

Limit discovery to a subset of nodes using ``--node-selector``:

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --node-selector "feature.node.kubernetes.io/pci-15b3.present=true" \
       --save-cluster-config ./cluster-config.yaml

The default selector targets nodes with Mellanox NICs.

================================================================================
PF Topology and Hardware Detection
================================================================================

For each NIC, Launch Kit derives PCI topology, NUMA affinity, and the connected GPU. The primary signal is ``nvidia-smi`` (queried via the NIC Configuration Daemon). When ``nvidia-smi`` is unavailable, Launch Kit falls back to sysfs and an embedded ``pci.ids`` database.

When GPU operator labels (``nvidia.com/gpu.machine``, ``nvidia.com/gpu.product``) are not present, Launch Kit additionally execs into a NIC Configuration Daemon pod to read DMI data and ``nvidia-smi`` output directly, deriving the machine type and GPU product from hardware.

================================================================================
Group Labelling
================================================================================

After discovery resolves ``machineType`` and ``gpuType`` for a group, every node in the group is patched with two l8k-specific labels via a strategic-merge patch:

- ``nvidia.kubernetes-launch-kit.machine: <machineType>-<gpuType>`` --- per-source-group identity. Used as the source group's ``nodeSelector``.
- ``nvidia.kubernetes-launch-kit.gpu: <gpuType>`` --- written alongside the machine label so auto-merged groups (different machineTypes sharing a GPU type) have a stable selector. Same value as ``nvidia.com/gpu.product`` by construction.

Label values keep their original case (e.g. ``DGX-B200-NVIDIA-H100-NVL``, ``NVIDIA-H100-NVL``); upstream parsing already trims whitespace and replaces spaces with hyphens. Values that would exceed Kubernetes' 63-char label limit are skipped (logged at debug).

The labels drive two pieces of downstream behaviour:

- **Group identity**: each group's ``identifier`` (lowercase, RFC 1123 resource-name form) and ``nodeSelector`` in ``cluster-config.yaml`` are keyed by the label. ``l8k generate --groups <id1,id2,...>`` targets exactly the nodes that carry the matching machine label(s); ``--gpu-type <X>`` selects every node whose ``gpuType`` matches.
- **Auto-merge selection**: when ``l8k generate`` merges groups sharing a GPU type, the merged group's ``nodeSelector`` keys on ``nvidia.kubernetes-launch-kit.gpu`` so it covers every source machineType in the merged set.

Both labels are l8k state, not GPU operator state. Configs loaded from an earlier l8k version that used differential nodeSelectors keep working unchanged --- the labels are only written on a fresh discovery run.

Groups whose ``machineType`` or ``gpuType`` could not be resolved keep a fallback ``group-N`` identifier. The machine label is skipped in that case, but the GPU label is still written when ``gpuType`` alone is resolved.

================================================================================
Fabric Type Detection
================================================================================

For each group's east-west PFs that have an RDMA device, Launch Kit reads ``/sys/class/infiniband/<rdmaDevice>/ports/1/{state,phys_state,link_layer,sm_lid}`` from inside the NIC Configuration Daemon pod. A port contributes to the group's fabric verdict when:

- Port is ``ACTIVE`` and ``link_layer=Ethernet`` --- contributes ``Ethernet``.
- Port is ``ACTIVE``, ``link_layer=InfiniBand``, and a subnet manager is present (``sm_lid`` non-zero) --- contributes ``InfiniBand``.

If every contributing port agrees on a single value, that value is recorded as ``linkType`` on the group in ``cluster-config.yaml``. If no port produced a contribution (all down, IB without SM, probes failed), or different ports contribute different values, the field is **left empty** --- discovery couldn't prove the cluster is using a specific fabric, and downstream code treats the absence as "unknown".

This is more reliable than reading ``link_layer`` alone: that file just reflects firmware config and may be a default rather than the cluster's actual fabric.

================================================================================
North-South Filtering
================================================================================

Each PF is classified by **traffic direction**:

- **East-west** --- GPU interconnect (ConnectX, BlueField-3 SuperNIC). Included in generated manifests and assigned a sequential ``rail`` index.
- **North-south** --- management or out-of-band (BlueField DPUs). Saved in ``cluster-config.yaml`` for visibility but **filtered out** of generated manifests.

BlueField-3 SuperNICs are explicitly classified as east-west even though they share a part-number prefix with BlueField DPUs --- see the SuperNIC entry in the embedded DPU exclusion list.

For a traffic-directions diagram, see :doc:`../heterogeneous-clusters`.

================================================================================
Kernel Driver Dependencies Validation
================================================================================

During discovery, Launch Kit detects kernel modules that depend on OFED drivers. It execs into ``nic-configuration-daemon`` pods and builds a reverse dependency graph from ``/sys/module/*/holders/`` for the core MLX and OFED kernel modules.

The discovered modules are classified into two categories:

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **Category**
     - **Examples**
     - **Action**
   * - Storage-over-RDMA
     - ``nvme_rdma``, ``ib_isert``, ``rpcrdma``
     - Auto-enables ``docaDriver.unloadStorageModules: true``
   * - Third-party RDMA
     - ``rdma_rxe``, ``qedr``, ``bnxt_re``
     - Auto-enables ``docaDriver.unloadThirdPartyRDMAModules: true``

Storage and third-party RDMA module lists are sourced from the ``doca-driver-build`` project to keep them in sync with the driver container itself. ``mlx5``-prefixed modules (the OFED stack itself) are excluded from classification.

After discovery, the config reflects the auto-enabled flags and the discovered modules are saved per group as ``storageModules`` and ``thirdPartyRDMAModules`` lists.

To skip the kernel driver dependencies validation entirely (for environments where it's known-good), set ``docaDriver.skipPreflightChecks: true`` in your config.

.. warning::

   Verify that no running workloads depend on modules that will be unloaded. To disable automatic unloading, set ``unloadStorageModules`` and ``unloadThirdPartyRDMAModules`` back to ``false`` in your config after discovery.

================================================================================
Discovery Output
================================================================================

The output ``cluster-config.yaml`` contains all parameters needed for manifest generation. The typical workflow is:

#. Run ``l8k discover`` to produce ``cluster-config.yaml``.
#. Edit the file to customize network parameters (subnets, MTU, image pull secrets, etc.).
#. Run ``l8k generate --user-config ./cluster-config.yaml`` to produce manifests.

You can also provide a pre-configured file directly to ``l8k generate`` without running discovery, or skip discovery entirely with ``--for <preset>``.

For the full configuration schema, see :doc:`Configuration Reference <../reference/config>`.

================================================================================
Debug Logging
================================================================================

Every probe and decision in discovery emits a structured-field debug line. To see them:

.. code-block:: bash

   l8k discover --log-level debug

Logged probes include the GPU operator label read and hardware-fallback path, the DMI machine-type cat, the ``nvidia-smi`` and sysfs fallback, OFED-dependent module discovery and classification, preset matching with hit/miss, the PCI-fingerprint per-node bucketing, and the east-west / north-south traffic classification per PF. Phase summary lines (``Discovery summary``, ``Group merge complete``) are emitted at info level by default. The same convention applies to ``l8k generate`` for the group-merge logs.

================================================================================
See Also
================================================================================

- :doc:`Generate Workflow <generate>` --- next step in the pipeline
- :doc:`Heterogeneous Clusters <../heterogeneous-clusters>` --- how groups are formed
- :doc:`Cluster Topology Presets <../presets>` --- offline alternative to discovery
- :doc:`CLI Reference <../reference/cli>` --- ``l8k discover`` flags
