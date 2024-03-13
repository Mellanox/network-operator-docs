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

*******************
System Requirements
*******************

* NVIDIA RDMA-capable network adapters:
   * NVIDIA ConnectX NICs
        * ConnectX-5 or newer
   * NVIDIA BlueField Network Platforms
        * BlueField-2 DPU (NIC mode)
        * BlueField-3 DPU (NIC mode)
        * BlueField-3 SuperNIC (NIC mode)
* NVIDIA GPU Operator Version 23.9.x or newer (required for the workloads using NVIDIA GPUs and GPUDirect RDMA technology)
* Operating Systems:
    * Ubuntu: v22.04, v20.04
    * OpenShift Container Platform (OCP): v 4.14, v4.13, v4.12
    * RHEL: v9.2, v9.1, v8.8, v8.6
* Container runtime: containerd, CRI-O

***********************
Tested Network Adapters
***********************
The following network adapters have been tested with the Network Operator:

* ConnectX-6 Dx
* ConnectX-7
* BlueField-2 NIC Mode
* BlueField-3 NIC Mode

*****************************
Supported ARM Based Platforms
*****************************
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
     - Tech Preview (RoCE only, without GPUDirect RDMA)

*************
Prerequisites
*************

.. list-table::
   :header-rows: 1

   * - Component
     - Version
     - Notes
   * - Kubernetes
     - >=1.24 and <=1.27
     -
   * - Helm
     - v3.5+
     - For information and methods of Helm installation, please refer to the official Helm Website.

******************
Component Versions
******************
The following component versions are deployed by the Network Operator:


.. list-table::
   :header-rows: 1

   * - Component
     - Version
     - Notes
   * - Node Feature Discovery
     - |node-feature-discovery-version|
     - Optionally deployed. May already be present in the cluster with proper configuration.
   * - NVIDIA MLNX_OFED driver container
     - |mofed-version|
     -
   * - k8s-rdma-shared-device-plugin
     - |k8s-rdma-shared-dev-plugin-version|
     -
   * - sriov-network-device-plugin
     - |sriov-device-plugin-version|
     -
   * - containernetworking CNI plugins
     - |cni-plugins-version|
     -
   * - whereabouts CNI
     - |whereabouts-version|
     -
   * - multus CNI
     - |multus-version|
     -
   * - IPoIB CNI
     - |ipoib-cni-version|
     -
   * - IB Kubernetes
     - |ib-kubernetes-version|
     -
   * - NV IPAM Plugin
     - |nvidia-ipam-version|
     -