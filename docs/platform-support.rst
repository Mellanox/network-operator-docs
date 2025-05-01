.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
.. include:: ./common/vars.rst

****************
Platform Support
****************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none

=============
Prerequisites
=============

.. list-table::
   :header-rows: 1

   * - Component
     - Version
     - Notes
   * - Kubernetes
     - >=1.29 and <=1.32
     -
   * - Helm
     - v3.5+
     - For information and methods of Helm installation, please refer to the official Helm Website.
   * - Node Feature Discovery
     - >=0.15.6 and <=0.17.0
     - When deploying the Network Operator and GPU Operator on the same cluster, ensure only one instance of Node Feature Discovery (NFD) is installed. We recommend using the version included with the GPU Operator.


===================
System Requirements
===================

* **RDMA‑capable NVIDIA network adapters**
   * NVIDIA ConnectX NICs and SuperNICs
   * NVIDIA BlueField Networking Platforms
* **NVIDIA GPU Operator v25.3.x or newer** – required for workloads that use NVIDIA GPUs and GPUDirect RDMA.

=================================
Supported NVIDIA Network Adapters
=================================
The following adapters have been tested and validated with **NVIDIA Network Operator**:

.. list-table::
   :header-rows: 1

   * - Product Family
     - Network Technology
     - Max Port Speed
     - Notes
   * - NVIDIA ConnectX‑6 NIC
     - Ethernet & InfiniBand
     - 200 Gb/s
     - IB RDMA and RoCE
   * - NVIDIA ConnectX-6 Dx NIC
     - Ethernet
     - 200 Gb/s
     - RoCE
   * - NVIDIA ConnectX-7 NIC
     - Ethernet & InfiniBand
     - 400 Gb/s
     - IB RDMA and RoCE
   * - NVIDIA ConnectX-8 SuperNIC
     - Ethernet & InfiniBand
     - 800 Gb/s
     - IB RDMA and RoCE
   * - NVIDIA BlueField-3 DPU
     - Ethernet
     - 200 Gb/s
     - NIC mode only; RoCE
   * - NVIDIA BlueField-3 SuperNIC
     - Ethernet
     - 400 Gb/s
     - NIC mode only; RoCE

====================================
Supported NVIDIA Data Center Systems
====================================
The following NVIDIA Data Center systems have been tested and validated with **NVIDIA Network Operator**:

.. list-table::
   :header-rows: 1

   * - System
     - CPU Architecture
     - GPU Architecture
     - Network Adapter(s)
     - Operating System(s)
     - Notes
   * - NVIDIA IGX Orin
     - Arm (NVIDIA Orin)
     - NVIDIA Ampere
     - ConnectX-7
     - Ubuntu 22.04 (ARM64)
     - GA (RoCE only, without GPUDirect RDMA)
   * - NVIDIA Grace ARM Server
     - Arm (NVIDIA Grace)
     - NVIDIA Hopper
     - BlueField-3 (NIC Mode)
     - Ubuntu 22.04 (ARM64) / OCP 4.17 / SLES 15.6
     - GA (RoCE only, without GPUDirect RDMA)
   * - NVIDIA DGX/HGX GB200 NVL72
     - Arm (NVIDIA Grace)
     - NVIDIA Blackwell
     - ConnectX-7
     - Ubuntu 24.04 (ARM64)
     - GA
   * - NVIDIA DGX/HGX B200
     - x86
     - NVIDIA Blackwell
     - BlueField-3 SuperNIC (NIC mode)
     - Ubuntu 24.04 (x86)
     - GA

====================================================
Supported Operating Systems and Kubernetes Platforms
====================================================
**NVIDIA Network Operator** has been validated on the following OS / platform combinations:

.. list-table::
   :header-rows: 1

   * - Operating System
     - Upstream Kubernetes
     - Red Hat OpenShift
     - Rancher RKE2
     - Canonical MicroK8s
     - Notes
   * - Ubuntu 24.04 LTS
     - 1.29–1.32
     - —
     - —
     - 1.29–1.32
     - —
   * - Ubuntu 22.04 LTS
     - 1.29–1.32
     - —
     - —
     - 1.29–1.32
     - RT‑kernel support
   * - Red Hat CoreOS
     - —
     - 4.15–4.18
     - —
     - —
     - RT kernels support
   * - Red Hat Enterprise Linux 9.4 / 9.2
     - 1.29–1.32
     - —
     - —
     - —
     - RT kernels support
   * - Red Hat Enterprise Linux 8.10 / 8.8
     - 1.29–1.32
     - —
     - —
     - —
     - RT‑kernel support
   * - SUSE Linux Enterprise Server 15 SP6
     - 1.29–1.32
     - —
     - 1.29–1.32
     - —
     - Kubernetes and Rancher


=============================
Supported Container Runtimes
=============================
**NVIDIA Network Operator** has been validated in the following scenarios:

.. list-table::
   :header-rows: 1

   * - Operating System
     - Containerd
     - CRI-O
     - Notes
   * - Ubuntu 24.04 LTS
     - Yes
     - No
     - 
   * - Ubuntu 22.04 LTS
     - Yes
     - No
     - 
   * - Red Hat Core OS
     - No
     - Yes
     - 
   * - Red Hat Enterprise Linux 9
     - Yes
     - Yes
     - 
   * - Red Hat Enterprise Linux 8
     - Yes
     - Yes
     - 
   * - SUSE Linux Enterprise Server 15 SP6
     - Yes
     - No
     - 

=======================================================
Supported Precompiled Container Images for DOCA Drivers
=======================================================

--------
Overview
--------

To save startup time and operational effort, precompiled DOCA driver container images are available for common OS/flavor/kernel/architecture variants.

The container image tag pattern used for common variants is: **driver_ver-container_ver-kernel_ver-flavor-os-arch**. For example: ``24.07-0.6.1.0-0-6.8.0-49-generic-ubuntu24.04-amd64``

**NOTE:** For the ``generic`` flavor of Ubuntu, the default Kernel version is used for precompiling (e.g. *6.8.0-31* for Ubuntu 24.04). Whereas for all other flavors, their latest (at time of DOCA packaging/release) Kernel version is used.

---------------------------
Supported Operating Systems
---------------------------

Currently precompiled DOCA driver container images are provided for the following operating systems:

- Ubuntu 24.04 (amd64/arm64)
- Ubuntu 22.04 (amd64/arm64)

-----------
Limitations
-----------

- NVIDIA supports precompiled driver containers for the most recently released DOCA GA drivers.
- NVIDIA builds precompiled driver containers for ``generic``, ``nvidia``, ``aws``, ``azure``, and ``oracle`` kernel flavors.
- Precompiled driver containers are currently unsigned.
- If your hosts use a different kernel variant, you can create a custom precompiled driver container and host it in your own container registry. Please refer to :ref:`advanced-configurations-precompiled` section.

.. warning::
   - Only ``generic`` kernel variant is tested and supported as a GA.
   - ``nvidia``, ``aws``, ``azure``, and ``oracle`` kernel variants are supported as a Tech Preview and have limited testing.


=================================
Network Operator Component Matrix
=================================

The following component versions are deployed by **NVIDIA Network Operator**:


.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Image
     - Tag
     - NVAIE
     - Notes
   * - `NVIDIA Network Operator <https://github.com/Mellanox/network-operator>`_
     - NVIDIA (OSS)
     - nvcr.io/nvstaging/mellanox
     - network-operator
     - v25.4.0-beta.1
     - Yes
     - 
   * - `NVIDIA Network Operator <https://github.com/Mellanox/network-operator>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - network-operator-init-container
     - v0.0.3
     - Yes
     - 
   * - `DOCA-OFED Driver Container <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/mellanox/containers/doca-driver>`_
     - NVIDIA (EULA)
     - nvcr.io/nvstaging/mellanox
     - doca-driver
     - 25.04-0.3.8.0-0
     - Yes
     - LTS version: 24.10-0.7.0.0-0
   * - `RDMA Shared Device Plugin <https://github.com/Mellanox/k8s-rdma-shared-dev-plugin>`_ 
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - k8s-rdma-shared-dev-plugin
     - v1.5.2
     - Yes
     - 
   * - `IB Kubernetes Plugin <https://github.com/Mellanox/ib-kubernetes>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - ib-kubernetes
     - v1.1.0
     - Yes
     - 
   * - `IP Over Infiniband (IPoIB) CNI plugin <https://github.com/Mellanox/ipoib-cni>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - ipoib-cni
     - v1.1.0
     - Yes
     - 
   * - `NVIDIA IPAM Plugin <https://github.com/Mellanox/nvidia-k8s-ipam>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - nvidia-k8s-ipam
     - v0.3.6
     - Yes
     - 
   * - `NVIDIA NIC Feature Discovery <https://github.com/Mellanox/nic-feature-discovery>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - nic-feature-discovery
     - v0.0.1
     - Yes
     - 
   * - `DOCA Telemetry Service (DTS) <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/doca/containers/doca_telemetry>`_
     - NVIDIA (EULA)
     - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.16.5-doca2.6.0-host
     - Yes
     - 
   * - `Node Feature Discovery <https://github.com/kubernetes-sigs/node-feature-discovery>`_
     - Community (OSS)
     - registry.k8s.io/nfd
     - node-feature-discovery
     - v0.15.6
     - Yes
     - Optionally deployed. May already be present in the cluster with proper configuration.
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-25.4.0-beta.1
     - Yes
     - 
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-beta.1
     - Yes
     - 
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-beta.1
     - Yes
     - 
   * - `SR-IOV Network Device Plugin <https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - sriov-network-device-plugin
     - v3.9.0
     - Yes
     - 
   * - `SR-IOV CNI plugin <https://github.com/k8snetworkplumbingwg/sriov-cni>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - sriov-cni
     - v2.8.1
     - Yes
     - 
   * - `InfiniBand SR-IOV CNI plugin <https://github.com/k8snetworkplumbingwg/ib-sriov-cni>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - ib-sriov-cni
     - v1.1.1
     - Yes
     - 
   * - `K8s CNI network plugins <https://github.com/containernetworking/plugins>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - plugins
     - v1.6.2
     - Yes
     - 
   * - `Multus CNI <https://github.com/k8snetworkplumbingwg/multus-cni>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - multus-cni
     - v4.1.0
     - Yes
     - 
   * - `Whereabouts IPAM Plugin <https://github.com/k8snetworkplumbingwg/whereabouts>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - whereabouts
     - v0.7.0
     - Yes
     - 
   * - `RDMA CNI plugin <https://github.com/k8snetworkplumbingwg/rdma-cni>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - rdma-cni
     - v1.2.0
     - Yes
     - 
   * - `Open vSwitch CNI plugin <https://github.com/k8snetworkplumbingwg/ovs-cni>`_
     - Community (OSS)
     - ghcr.io/k8snetworkplumbingwg
     - ovs-cni-plugin
     - v0.37.0
     - No
     - 
   * - `NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - nic-configuration-operator
     - v0.1.18
     - No
     - 
   * - `NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v0.1.18
     - No
     - 
   * - `NVIDIA Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_
     - NVIDIA (OSS)
     - ghcr.io/mellanox
     - maintenance-operator
     - v0.2.0
     - No
     - 
