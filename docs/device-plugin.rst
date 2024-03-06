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


*************
Device Plugin
*************

Kubernetes provides a device plugin framework that can be used to advertise system hardware resources to the Kubelet.
More information about the device plugin framework can be found at https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/.

This document presents configuration with the following device plugins:

.. list-table::
   :header-rows: 1

   * - Device Plugin
     - Project
   * - SR-IOV network device plugin
     - https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin
   * - RDMA shared device plugin
     - https://github.com/Mellanox/k8s-rdma-shared-dev-plugin

- SR-IOV network device plugin - A device plugin for discovering and advertising the SR-IOV virtual functions (VFs) that are available on a Kubernetes host.
- RDMA shared device plugin - device plugin for sharing RDMA devices between PODs on the same host.
