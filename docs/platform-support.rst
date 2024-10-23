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
     - >=1.27 and <=1.30.4
     -
   * - Helm
     - v3.5+
     - For information and methods of Helm installation, please refer to the official Helm Website.
   * - Node Feature Discovery
     - >=0.15.6 and <=0.16.3
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
     - nvcr.io/nvidia/mellanox/doca-driver:|mofed-version|
     -
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
     - Only one instance of NFD should be deployed.
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
     - ConnectX-7
     - Ubuntu 22.04 (ARM64) / OCP 4.16
     - GA

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
     - 1.27-1.30.4
     - 
     - 
   * - Ubuntu 22.04 LTS
     - 1.27-1.30.4
     - 
     - RT kernels support
   * - Ubuntu 20.04 LTS
     - 1.27-1.30.4
     - 
     - 
   * - Red Hat Core OS
     - 
     - 4.14-4.16
     - RT kernels support
   * - Red Hat Enterprise Linux 9.4, 9.3, 9.2, 9.0
     - 1.27-1.30.4
     - 
     - 
   * - Red Hat Enterprise Linux 8.10, 8.9, 8.8, 8.6
     - 1.27-1.30.4
     - 
     - RT kernels support


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
   * - Ubuntu 20.04 LTS
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

