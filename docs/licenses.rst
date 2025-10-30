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

************************************
Legal Notices and 3rd Party Licenses
************************************

.. list-table::
   :header-rows: 1

   * - Component
     - Version
     - Legal Notices and 3rd Party Licenses
   * - NVIDIA Network Operator
     - |network-operator-version|
     - | - `License <https://content.mellanox.com/Legal/license_Network-Operator_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Network-Operator_25.10.0.pdf>`__
   * - NVIDIA Network Operator Init Container
     - |doca-init-container-version|
     - | - `License <https://content.mellanox.com/Legal/license_Network-Operator-Init-Container_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Network-Operator-Init-Container_25.10.0.pdf>`__
   * - RDMA Shared Device Plugin
     - |k8s-rdma-shared-dev-plugin-version|
     - | - `License <https://content.mellanox.com/Legal/license_K8S-RDMA-Shared-Device-Plugin_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_K8S-RDMA-Shared-Device-Plugin_25.10.0.pdf>`__
   * - IB Kubernetes Plugin
     - |ib-kubernetes-version|
     - | - `License <https://content.mellanox.com/Legal/license_IB-Kubernetes_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_IB-Kubernetes_25.10.0.pdf>`__
   * - IP Over Infiniband (IPoIB) CNI plugin
     - |ipoib-cni-version|
     - | - `License <https://content.mellanox.com/Legal/license_IPoIB-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_IPoIB-CNI_25.10.0.pdf>`__
   * - NVIDIA IPAM Plugin
     - |nvidia-ipam-version|
     - | - `License <https://content.mellanox.com/Legal/license_NVIDIA-K8S-IPAM_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_NVIDIA-K8S-IPAM_25.10.0.pdf>`__
   * - NVIDIA NIC Feature Discovery
     - |nic-feature-discovery-version|
     - | - `License <https://content.mellanox.com/Legal/license_NVIDIA-NIC-Feature-Discovery_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_NVIDIA-NIC-Feature-Discovery_25.10.0.pdf>`__
   * - Node Feature Discovery
     - |node-feature-discovery-version|
     - | - `License <https://content.mellanox.com/Legal/license_Node-Feature-Discovery_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Node-Feature-Discovery_25.10.0.pdf>`__
   * - SRIOV Network Operator
     - |sriovnetop-version|
     - | - `License <https://content.mellanox.com/Legal/license_SRIOV-Network-Operator_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_SRIOV-Network-Operator_25.10.0.pdf>`__
   * - SR-IOV Network Device Plugin
     - |sriovnetop-sriov-device-plugin-version|
     - | - `License <https://content.mellanox.com/Legal/license_SRIOV-Network-Device-Plugin_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_SRIOV-Network-Device-Plugin_25.10.0.pdf>`__
   * - SR-IOV CNI plugin
     - |sriovnetop-sriov-cni-version|
     - | - `License <https://content.mellanox.com/Legal/license_SRIOV-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_SRIOV-CNI_25.10.0.pdf>`__
   * - InfiniBand SR-IOV CNI plugin
     - |sriovnetop-ib-sriov-cni-version|
     - | - `License <https://content.mellanox.com/Legal/license_IB-SRIOV-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_IB-SRIOV-CNI_25.10.0.pdf>`__
   * - Multus CNI
     - |multus-version|
     - | - `License <https://content.mellanox.com/Legal/license_Multus-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Multus-CNI_25.10.0.pdf>`__
   * - RDMA CNI plugin
     - |rdma-cni-version|
     - | - `License <https://content.mellanox.com/Legal/license_RDMA-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_RDMA-CNI_25.10.0.pdf>`__
   * - Open vSwitch CNI plugin
     - |ovs-cni-version|
     - | - `License <https://content.mellanox.com/Legal/license_OVS-CNI_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_OVS-CNI_25.10.0.pdf>`__
   * - NVIDIA NIC Configuration Operator
     - |nic-configuration-operator-version|
     - | - `License <https://content.mellanox.com/Legal/license_NIC-Configuration-Operator_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_NIC-Configuration-Operator_25.10.0.pdf>`__
   * - NVIDIA Maintenance Operator
     - |maintenance-operator-version|
     - | - `License <https://content.mellanox.com/Legal/license_Maintenance-Operator_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Maintenance-Operator_25.10.0.pdf>`__
   * - NVIDIA SpectrumX Operator
     - |spectrumxop-version|
     - | - `License <https://content.mellanox.com/Legal/license_Spectrumx-Operator_25.10.0.pdf>`__
       | - `3rd Part Notice <https://content.mellanox.com/Legal/3rdPartyNotice_Spectrumx-Operator_25.10.0.pdf>`__
