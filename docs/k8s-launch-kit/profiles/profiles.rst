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

*********************
Deployment Profiles
*********************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

A **profile** is a named combination of fabric and deployment type. Each profile maps to a complete set of Kubernetes manifests produced by ``l8k generate``. Pick a profile from the decision tree or table below, then follow the link.

For the conceptual difference between fabric and deployment type, see :doc:`../overview`.

================================================================================
Decision Tree
================================================================================

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Profiles

   SR-IOV Ethernet <sriov-ethernet>
   SR-IOV InfiniBand <sriov-infiniband>
   Host Device <host-device>
   IP over InfiniBand (RDMA Shared) <ipoib-rdma-shared>
   MacVLAN (RDMA Shared) <macvlan-rdma-shared>
   Spectrum-X <spectrum-x>

Fabric is determined by the underlying hardware topology (Spectrum-X clusters are detected as a distinct fabric, not as a flavour of Ethernet). Pick the deployment type for each fabric:

.. mermaid::

   flowchart TD
       Start{Fabric}
       Start -->|Ethernet| EthDT{Deployment type}
       Start -->|InfiniBand| IBDT{Deployment type}
       Start -->|Spectrum-X<br/>HW topology| SPCXRA{RA version}

       EthDT -->|sriov| SRIOVE([SR-IOV Ethernet])
       EthDT -->|host_device| HDE([Host Device])
       EthDT -->|rdma_shared + MacVLAN| MV([MacVLAN RDMA Shared])

       IBDT -->|sriov| SRIOVIB([SR-IOV InfiniBand])
       IBDT -->|host_device| HDI([Host Device])
       IBDT -->|rdma_shared + IPoIB| IPOIB([IPoIB RDMA Shared])

       SPCXRA -->|RA2.1<br/>Network Operator 26.1| SX1([Spectrum-X RA2.1])
       SPCXRA -->|RA2.2<br/>Network Operator 26.4| SX2([Spectrum-X RA2.2])
       SX1 --> MPM[multiplane mode<br/>swplb / hwplb / uniplane / none<br/>+ number of planes]
       SX2 --> MPM

       classDef profile fill:#a2efb6,stroke:#28a745,color:#000
       classDef params fill:#fff3cd,stroke:#ffc107,color:#000
       class SRIOVE,HDE,MV,SRIOVIB,HDI,IPOIB,SX1,SX2 profile
       class MPM params

================================================================================
Decision Matrix
================================================================================

.. list-table::
   :widths: 25 30 20 25
   :header-rows: 1

   * - **Profile**
     - **When to use**
     - **Fabric / Deployment type**
     - **Keywords**
   * - :doc:`SR-IOV Ethernet <sriov-ethernet>`
     - High-performance Ethernet networking with hardware acceleration. Per-pod dedicated VFs.
     - ethernet / sriov
     - SR-IOV, RDMA, low-latency, dedicated VFs
   * - :doc:`SR-IOV InfiniBand <sriov-infiniband>`
     - Virtualized InfiniBand with hardware acceleration. Isolated IB partitions per pod.
     - infiniband / sriov
     - SR-IOV, InfiniBand, large-scale HPC
   * - :doc:`Host Device <host-device>`
     - Direct hardware passthrough. Minimal CPU overhead. Exclusive device access per pod.
     - ethernet or infiniband / host_device
     - host-device, PCI-passthrough, DPDK
   * - :doc:`IP over InfiniBand (RDMA Shared) <ipoib-rdma-shared>`
     - InfiniBand networking with shared RDMA resources. Parallel I/O workloads.
     - infiniband / rdma_shared
     - IPoIB, shared-device, high-bandwidth
   * - :doc:`MacVLAN (RDMA Shared) <macvlan-rdma-shared>`
     - Multi-tenant Ethernet with shared RDMA capabilities and network isolation.
     - ethernet / rdma_shared
     - MacVLAN, multi-tenant, network-segmentation
   * - :doc:`Spectrum-X <spectrum-x>`
     - NVIDIA Spectrum-X multi-rail AI interconnect (RA2.1 or RA2.2). HWPLB / SWPLB / Uniplane / None modes.
     - ethernet / sriov / spectrum-x
     - Spectrum-X, multiplane, RA2.2, HWPLB

================================================================================
See Also
================================================================================

- :doc:`Overview <../overview>` --- profile selection vocabulary
- :doc:`Generate Workflow <../workflows/generate>` --- how profile flags are consumed
- :doc:`Heterogeneous Clusters <../heterogeneous-clusters>` --- mixing profiles per node group
