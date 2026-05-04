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
.. include:: ../common/vars.rst

**********
Overview
**********

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

This page explains the Launch Kit mental model. New users should read this once before working through the :doc:`Quick Start <quick-start>`. Returning users can skip it.

================================================================================
Workflow Phases
================================================================================

Launch Kit operates in three phases:

#. **Discover** --- Probe the cluster's network hardware (NICs, PCI addresses, RDMA capability, OFED-dependent kernel modules, GPU topology) and write a ``cluster-config.yaml`` describing what was found.
#. **Generate** --- Take a cluster configuration plus a deployment profile selection and render a complete set of numbered Kubernetes YAML manifests to a directory.
#. **Deploy** --- Apply the generated manifests to the cluster in dependency order. Optional: ``--dry-run`` previews what would be applied without touching the cluster.

Each phase has a dedicated CLI subcommand --- ``l8k discover``, ``l8k generate``, ``l8k generate --deploy`` --- and a dedicated how-to page (:doc:`workflows/discover`, :doc:`workflows/generate`, :doc:`workflows/deploy`).

The artifact pipeline:

.. mermaid::

   flowchart LR
       KC[kubeconfig]
       BC[base config<br/>optional]
       D([l8k discover])
       CC[cluster-config.yaml]
       FLAGS[--fabric<br/>--deployment-type<br/>--network-operator-release]
       G([l8k generate])
       MAN[./deployment/*.yaml]
       APPLY([deploy])
       CLUSTER[(running cluster)]

       KC --> D
       BC -.-> D
       D --> CC
       CC --> G
       FLAGS -.-> G
       G --> MAN
       MAN --> APPLY
       APPLY --> CLUSTER

       classDef artifact fill:#fff,stroke:#888,stroke-dasharray: 4 3
       classDef action fill:#79b8ff,stroke:#005cc5,color:#fff
       classDef state fill:#a2efb6,stroke:#28a745,color:#000
       class KC,BC,CC,MAN,FLAGS artifact
       class D,G,APPLY action
       class CLUSTER state

================================================================================
Profiles
================================================================================

A **profile** is a named combination of fabric and deployment type that maps to a complete set of Kubernetes manifests. Launch Kit ships seven profiles:

- ``sriov-ethernet`` --- SR-IOV with Ethernet
- ``sriov-infiniband`` --- SR-IOV with InfiniBand
- ``host-device`` --- direct passthrough to host network devices
- ``macvlan-rdma-shared`` --- Ethernet with shared RDMA device plugin and MacVLAN
- ``ipoib-rdma-shared`` --- InfiniBand with shared RDMA device plugin and IPoIB
- ``spectrum-x`` --- Spectrum-X multi-rail AI interconnect (RA2.2 on Network Operator 26.4)
- ``spectrum-x-ra2.1`` --- Spectrum-X for the RA2.1 reference architecture (Network Operator 26.1)

Profiles are selected by flag combinations on ``l8k generate``: ``--fabric``, ``--deployment-type``, ``--multirail``, and ``--spectrum-x``. See :doc:`Deployment Profiles <profiles/profiles>` for the decision matrix.

================================================================================
Network Operator Releases
================================================================================

Launch Kit pins to specific NVIDIA Network Operator releases. The ``--network-operator-release`` flag (and the ``networkOperator.selectedRelease`` config key) selects between supported release lines:

- ``25.10``
- ``26.1`` --- required for ``spectrum-x-ra2.1``.
- ``26.4`` --- required for ``spectrum-x`` (RA2.2).

The selected release auto-fills versions and image tags from an embedded catalog. Version mismatches (for example, requesting RA2.1 with release 26.4) error out with a specific message.

.. note::

   Launch Kit is backward compatible with older Network Operator releases --- a single ``l8k`` binary supports every release line in the catalog above. Always install the **latest** ``l8k`` release; pick the target Network Operator line via ``--network-operator-release``. New releases of l8k add new lines to the catalog and pick up patch bumps for existing ones, so an older l8k binary will miss them.

================================================================================
Node Groups and Heterogeneity
================================================================================

During discovery, nodes are placed into **groups** by their PCI topology (the set of PCI addresses and device IDs across each node's PFs). Each group carries a ``machineType`` (e.g., ``DGX-B200``), a ``gpuType`` (e.g., ``NVIDIA-H100-NVL``), and a list of physical functions (PFs). Discovery writes a label ``nvidia.kubernetes-launch-kit.machine: <machineType>-<gpuType>`` (sanitised) to every node in the group; the group's ``identifier`` and ``nodeSelector`` are both keyed by that label.

When the cluster has multiple groups, you have two strategies:

- **Automatic combination at generation** --- groups stay separate in ``cluster-config.yaml``, but ``l8k generate`` automatically combines groups sharing the same GPU type and east-west rail count into a single render group keyed by GPU type. One ``l8k generate`` run produces a single set of manifests covering all matching source groups.
- **Filter by group identifiers** --- run ``l8k generate --groups <a,b,...>`` to restrict output to a named set of source groups. Use this when groups need different Network Operator releases, fabrics, deployment types, or driver versions per cohort.
- **Filter by GPU type** --- run ``l8k generate --gpu-type <X>`` to restrict output to all source groups whose ``gpuType`` matches (case-insensitive). Best for declarative pipelines and CI/CD.

See :doc:`Heterogeneous Clusters <heterogeneous-clusters>` for the full picture.

================================================================================
Fabrics and Traffic Direction
================================================================================

The ``--fabric`` flag selects between ``ethernet`` and ``infiniband``. Fabric is the physical transport; deployment type (``sriov`` / ``rdma_shared`` / ``host_device``) is the kubelet-facing networking model.

During discovery, Launch Kit also classifies each PF by **traffic direction**:

- **East-west** --- GPU-to-GPU interconnect (ConnectX, BlueField-3 SuperNIC). These PFs appear in generated manifests.
- **North-south** --- management / out-of-band (BlueField DPUs). These PFs are saved in ``cluster-config.yaml`` for visibility but **filtered out** of generated manifests.

Each east-west PF is assigned a sequential ``rail`` index (``rail: 0``, ``rail: 1``, ...) used in resource and network names.

================================================================================
Spectrum-X Multiplane Modes
================================================================================

Spectrum-X profiles add a **multiplane mode** dimension on top of profile selection:

- ``hwplb`` --- hardware plane load balancing (large 2- or 3-tier switch topologies)
- ``swplb`` --- software plane load balancing (smaller-scale Spectrum-X clusters)
- ``uniplane`` --- single unified plane (forces ``--number-of-planes 1``)
- ``none`` --- no plane separation (BlueField-3 SuperNIC; simple topologies)

NIC type constrains available modes (ConnectX-8 supports ``swplb``/``hwplb``/``uniplane``; BF3 SuperNIC supports ``none`` only). See :doc:`profiles/spectrum-x`.

================================================================================
Cluster Topology Presets
================================================================================

A **preset** is a pre-recorded hardware topology for a known machine type (e.g., ``ThinkSystem-SR680a-V3``, ``PowerEdge-XE9680``). Presets list expected PCI addresses, traffic class, NUMA affinity, and rail assignments.

Two ways presets are used:

- **Discovery overlay** --- if the discovered machine type matches a known preset, the preset's topology is overlaid on discovery output for consistency.
- **Offline generation** --- ``l8k generate --for <preset>`` skips discovery entirely and produces manifests for any cluster matching the preset's hardware.

See :doc:`Cluster Topology Presets <presets>`.

================================================================================
Glossary
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - **Term**
     - **Definition**
   * - **PF**
     - Physical Function. A physical NIC interface, identified by PCI address.
   * - **VF**
     - Virtual Function. An SR-IOV-virtualised slice of a PF.
   * - **Rail**
     - A sequential index assigned to each east-west PF. Used in resource and network names.
   * - **Fabric**
     - The physical transport layer: ``ethernet`` or ``infiniband``.
   * - **Deployment type**
     - The kubelet-facing networking model: ``sriov``, ``rdma_shared``, or ``host_device``.
   * - **Profile**
     - A named (fabric, deployment type, options) combination. See :doc:`profiles/profiles`.
   * - **Group**
     - A set of nodes sharing the same PCI topology. See :doc:`heterogeneous-clusters`.
   * - **East-west**
     - GPU-to-GPU interconnect traffic.
   * - **North-south**
     - Management or out-of-band traffic. Filtered out of generated manifests.
   * - **Preset**
     - A pre-recorded hardware topology for a known machine type. See :doc:`presets`.
   * - **Multiplane mode**
     - Spectrum-X load-balancing mode: ``hwplb``, ``swplb``, ``uniplane``, ``none``.

================================================================================
See Also
================================================================================

- :doc:`Quick Start <quick-start>` --- the canonical end-to-end walkthrough
- :doc:`Deployment Profiles <profiles/profiles>` --- decision matrix
- :doc:`Heterogeneous Clusters <heterogeneous-clusters>` --- mixed-hardware deep dive
- :doc:`Configuration Reference <reference/config>` --- ``l8k-config.yaml`` schema
