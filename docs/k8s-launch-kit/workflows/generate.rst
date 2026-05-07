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
Generate Workflow
******************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Use this when:** you have a ``cluster-config.yaml`` (from :doc:`discover`) or a known hardware preset and want to render Kubernetes manifests for a specific deployment profile.

================================================================================
Profile Selection via CLI Flags
================================================================================

Specify the deployment profile using ``--fabric``, ``--deployment-type``, and ``--multirail``:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

For Spectrum-X, the ``--spectrum-x`` flag automatically sets ``--fabric ethernet``, ``--deployment-type sriov``, and ``--multirail true``.

.. note::

   If the configuration file already contains a ``profile`` section, CLI flags are optional. CLI flags override configuration file values when both are provided.

================================================================================
Hardware-Derived Defaults
================================================================================

When a flag is unset on both the CLI and in the configuration file, ``l8k generate`` fills it from the discovered cluster:

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **Flag**
     - **Default**
     - **Trigger**
   * - ``--fabric``
     - the cluster's fabric (``ethernet`` or ``infiniband``)
     - every group's ``linkType`` (Unit 5 fabric probe) agrees; skipped+warned otherwise
   * - ``--deployment-type``
     - ``sriov``
     - always
   * - ``--multirail``
     - ``true``
     - always; opt out via ``--multirail=false`` (YAML cannot express explicit-false)
   * - ``--multiplane-mode``
     - ``uniplane`` (CX7 / BF3 SuperNIC), ``swplb`` (CX8), ``hwplb`` (CX9)
     - only when ``--spectrum-x`` is set; per east-west PF deviceID, skipped+warned when groups have mixed deviceIDs
   * - ``--number-of-planes``
     - 1 (CX7 / BF3 SuperNIC), 2 (CX8), 4 (CX9)
     - only when ``--spectrum-x`` is set
   * - ``--network-operator-release``
     - matching release for the chosen RA (RA2.1 → 26.1, RA2.2 → 26.4)
     - only when ``--spectrum-x`` is set

Each applied default is logged at info level (``Defaulted --multiplane-mode=swplb (ConnectX-8 (deviceID 1023))``); the full reasoning trail is at debug level (``--log-level debug``).

Resolution precedence (lowest → highest): hardware default < config-file < CLI flag. The Spectrum-X cohort rules (RA-to-release pairing, ``multiplane-mode=none`` requiring ``number-of-planes=1``, etc.) are enforced after defaults run, so a partial CLI input plus defaults must still resolve to a consistent whole.

For the full profile decision matrix, see :doc:`../profiles/profiles`.

================================================================================
Network Operator Release
================================================================================

For Spectrum-X profiles --- and recommended for all deployments --- pin the Network Operator release line:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --network-operator-release 26.4 \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

Supported release lines: ``26.1`` and ``26.4``. The release auto-fills versions and image tags from an embedded catalog. RA2.1 Spectrum-X requires ``--network-operator-release 26.1``; RA2.2 Spectrum-X requires ``26.4``.

================================================================================
Generation without a Live Cluster
================================================================================

To generate manifests for a known machine type without running discovery, use ``--for <preset>``:

.. code-block:: bash

   l8k generate --for ThinkSystem-SR680a-V3 \
       --node-selector "nvidia.com/gpu.product=NVIDIA-H200" \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

See :doc:`../presets` for available presets and how to add new ones.

================================================================================
Output Directory Structure
================================================================================

Generated files follow a numbered naming convention that determines deployment order:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **File pattern**
     - **Contents**
   * - ``10-nicclusterpolicy.yaml``
     - Cluster-wide components: Multus, CNI plugins, NV-IPAM, NIC Configuration Operator, Spectrum-X Operator.
   * - ``11-nicnodepolicy.yaml``
     - Per-node-group components: OFED driver and device plugins. Rendered once per group with the group's ``nodeSelector``.
   * - ``20-ippool.yaml``
     - NV-IPAM IP pools.
   * - ``30-*.yaml``
     - Network resources (``SriovNetworkNodePolicy``, ``SriovNetwork``, ``HostDeviceNetwork``, ``MacvlanNetwork``, ``IPoIBNetwork``).
   * - ``35-nicinterfacenametemplate.yaml``
     - NIC rename templates (only when needed --- see :doc:`../heterogeneous-clusters`).
   * - ``40-*.yaml`` / ``50-*.yaml``
     - Example workload DaemonSets.
   * - ``overview.html``
     - Human-readable deployment summary.

In heterogeneous clusters, per-group files include the group identifier in the filename (e.g., ``30-sriovnetworknodepolicy-group-0.yaml``).

================================================================================
Group-Specific Generation
================================================================================

In heterogeneous clusters, two flags scope the output to a subset of source groups:

.. code-block:: bash

   # By identifier (comma-separated; case-sensitive match against
   # cluster-config.yaml's clusterConfig[].identifier):
   l8k generate --user-config ./cluster-config.yaml \
       --fabric infiniband --deployment-type sriov --multirail \
       --groups dgx-b200-nvidia-h100-nvl,poweredge-xe9680-nvidia-h200 \
       --save-deployment-files ./deployments

   # By GPU type (case-insensitive match against gpuType):
   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --gpu-type NVIDIA-H200 \
       --save-deployment-files ./deployments

``--groups`` and ``--gpu-type`` are mutually exclusive. An empty match is a validation error. ``--gpu-type`` is best for declarative pipelines; ``--groups`` is best for staged rollouts where the cohort is enumerated explicitly. See :doc:`../heterogeneous-clusters` for the per-Kind rendering rules under filter.

================================================================================
Custom Workload Manifests
================================================================================

By default, Launch Kit generates example DaemonSet workloads for each profile. To use your own workload manifest instead:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov \
       --workload-manifest /path/to/my-workload.yaml \
       --save-deployment-files ./deployments

Launch Kit patches the workload manifest with the correct network annotations, resource requests, and node affinity based on the cluster configuration. Supported workload kinds: ``Pod``, ``Deployment``, ``DaemonSet``, ``StatefulSet``, ``Job``, ``ReplicaSet``.

**Before** --- input manifest:

.. code-block:: yaml

   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: my-rdma-workload
     namespace: default
   spec:
     selector:
       matchLabels:
         app: my-rdma-workload
     template:
       metadata:
         labels:
           app: my-rdma-workload
       spec:
         containers:
         - name: rdma-app
           image: my-registry/my-rdma-app:latest
           securityContext:
             capabilities:
               add: ["IPC_LOCK"]

**After** --- patched by Launch Kit for an SR-IOV deployment with 2 rails:

.. code-block:: yaml

   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: my-rdma-workload
     namespace: default
   spec:
     selector:
       matchLabels:
         app: my-rdma-workload
     template:
       metadata:
         labels:
           app: my-rdma-workload
         annotations:
           k8s.v1.cni.cncf.io/networks: sriov-network-rail-0,sriov-network-rail-1
       spec:
         affinity:
           nodeAffinity:
             requiredDuringSchedulingIgnoredDuringExecution:
               nodeSelectorTerms:
               - matchExpressions:
                 - key: nvidia.com/gpu.machine
                   operator: In
                   values:
                   - DGX-B200
         containers:
         - name: rdma-app
           image: my-registry/my-rdma-app:latest
           securityContext:
             capabilities:
               add: ["IPC_LOCK"]
           resources:
             requests:
               nvidia.com/sriov_resource_rail_0: "1"
               nvidia.com/sriov_resource_rail_1: "1"
             limits:
               nvidia.com/sriov_resource_rail_0: "1"
               nvidia.com/sriov_resource_rail_1: "1"

================================================================================
See Also
================================================================================

- :doc:`Deploy Workflow <deploy>` --- apply the generated manifests
- :doc:`Deployment Profiles <../profiles/profiles>` --- profile decision matrix
- :doc:`Heterogeneous Clusters <../heterogeneous-clusters>` --- per-group manifests
- :doc:`Cluster Topology Presets <../presets>` --- offline generation with ``--for``
- :doc:`CLI Reference <../reference/cli>` --- ``l8k generate`` flags
