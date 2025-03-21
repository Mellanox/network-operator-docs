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
     - >=1.27 and <=1.31.4
     -
   * - Helm
     - v3.5+
     - For information and methods of Helm installation, please refer to the official Helm Website.
   * - Node Feature Discovery
     - >=0.15.6 and <=0.17.0
     - When deploying the Network Operator and GPU Operator on the same cluster, ensure only one instance of Node Feature Discovery (NFD) is installed. We recommend using the version included with the GPU Operator.

=================================
Network Operator Component Matrix
=================================

The following component versions are deployed by the Network Operator:


.. list-table::
   :header-rows: 1

   * - Component
     - Container Image
     - Notes
   * - Node Feature Discovery
     - registry.k8s.io/nfd/node-feature-discovery:|node-feature-discovery-version|
     - Optionally deployed. May already be present in the cluster with proper configuration.
   * -  NVIDIA DOCA Driver container
     - nvcr.io/nvidia/mellanox/doca-driver:|doca-driver-version|
     - LTS version: |doca-driver-version-lts|
   * - k8s-rdma-shared-device-plugin
     - ghcr.io/mellanox/k8s-rdma-shared-dev-plugin:|k8s-rdma-shared-dev-plugin-version|
     -
   * - sriov-network-device-plugin
     - ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:|sriov-device-plugin-version|
     -
   * - containernetworking CNI plugins
     - ghcr.io/k8snetworkplumbingwg/plugins:|cni-plugins-version|
     -
   * - whereabouts CNI
     - ghcr.io/k8snetworkplumbingwg/whereabouts:|whereabouts-version|
     -
   * - multus CNI
     - ghcr.io/k8snetworkplumbingwg/multus-cni:|multus-version|
     -
   * - IPoIB CNI
     -  ghcr.io/mellanox/ipoib-cni:|ipoib-cni-version|
     -
   * - IB Kubernetes
     -  ghcr.io/mellanox/ib-kubernetes:|ib-kubernetes-version|
     -
   * - NV IPAM Plugin
     -  ghcr.io/mellanox/nvidia-k8s-ipam:|nvidia-ipam-version|
     -
   * - NIC Feature Discovery
     - ghcr.io/mellanox/nic-feature-discovery:|nic-feature-discovery-version|
     -
   * - DOCA Telemetry
     - nvcr.io/nvidia/doca/doca_telemetry:|doca-telemetry-version|
     -

===================
System Requirements
===================

* NVIDIA RDMA-capable network adapters:
   * NVIDIA ConnectX NICs
        * ConnectX-5 or newer
   * NVIDIA BlueField Network Platforms
        * BlueField-2 DPU (NIC mode)
        * BlueField-3 DPU (NIC mode)
        * BlueField-3 SuperNIC (NIC mode)
* NVIDIA GPU Operator Version 24.3.x or newer (required for the workloads using NVIDIA GPUs and GPUDirect RDMA technology)

=======================
Tested Network Adapters
=======================
The following network adapters have been tested with the Network Operator:

* ConnectX-6 Dx
* ConnectX-7
* BlueField-2 NIC Mode
* BlueField-3 NIC Mode

=============================
Supported ARM Based Platforms
=============================
The following ARM based systems has been tested with Network Operator:

.. list-table::
   :header-rows: 1

   * - System
     - Network Adapters
     - OS
     - Notes
   * - NVIDIA IGX Orin
     - ConnectX-7
     - Ubuntu 22.04 (ARM64)
     - GA (RoCE only, without GPUDirect RDMA)
   * - NVIDIA Grace ARM Server
     - BlueField-3 NIC Mode
     - Ubuntu 22.04 (ARM64) / OCP 4.17 / SLES 15.6
     - GA (RoCE only, without GPUDirect RDMA)

====================================================
Supported Operating Systems and Kubernetes Platforms
====================================================
NVIDIA Network Operator has been validated in the following scenarios:

.. list-table::
   :header-rows: 1

   * - Operating System
     - Kubernetes
     - Red Hat OpenShift
     - Notes
   * - Ubuntu 24.04 LTS
     - 1.27-1.31.4
     - 
     - 
   * - Ubuntu 22.04 LTS
     - 1.27-1.31.4
     - 
     - RT kernels support
   * - Red Hat Core OS
     - 
     - 4.14, 4.16, 4.17
     - RT kernels support
   * - Red Hat Enterprise Linux 9.5, 9.4, 9.2
     - 1.27-1.31.4
     - 
     - 
   * - Red Hat Enterprise Linux 8.10, 8.8
     - 1.27-1.31.4
     - 
     - RT kernels support
   * - SUSE Linux Enterprise Server 15 SP6
     - 1.27-1.31.4
     - 
     - Kubernetes and Rancher


=============================
Supported Container Runtimes
=============================
NVIDIA Network Operator has been validated in the following scenarios:

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
