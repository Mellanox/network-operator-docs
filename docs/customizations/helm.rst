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


********************************
Helm Chart Customization Options
********************************

There are various customizations you can do to tailor the deployment of the Network Operator to your cluster needs. You
can find those below.

.. contents::
   :depth: 2
   :local:
   :backlinks: none

==================
General Parameters
==================

In order to tailor the deployment of the Network Operator to your cluster needs, use the following parameters:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - nfd.enabled
     - Bool
     - true
     - Deploy Node Feature Discovery
   * - sriovNetworkOperator.enabled
     - Bool
     - false
     - Deploy SR-IOV Network Operator
   * - sriovNetworkOperator.configDaemonNodeSelectorExtra
     - List
     - node-role.kubernetes.io/worker: ""
     - Additional values for SR-IOV Config Daemon nodes selector
   * - upgradeCRDs
     - Bool
     - true
     - Enable CRDs upgrade with helm pre-install and pre-upgrade hooks
   * - psp.enabled
     - Bool
     - false
     - Deploy Pod Security Policy
   * - operator.repository
     - String
     - nvcr.io/nvidia
     - Network Operator image repository
   * - operator.image
     - String
     - network-operator
     - Network Operator image name
   * - operator.tag
     - String
     - None
     - Network Operator image tag. If set to None, the chart's appVersion will be used
   * - operator.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the Network Operator images
   * - deployCR
     - Bool
     - false
     - Network Operator image repository
   * - nodeAffinity
     - Object
     - | requiredDuringSchedulingIgnoredDuringExecution:
       |   nodeSelectorTerms:
       |     - matchExpressions:
       |       - key: node-role.kubernetes.io/master
       |         operator: DoesNotExist
       |       - key: node-role.kubernetes.io/control-plane
       |         operator: DoesNotExist
     - Configure node affinity settings for Network Operator components

The NFD labels required by the Network Operator and GPU Operator:

.. list-table::
   :header-rows: 1

   * - Label
     - Location
   * - feature.node.kubernetes.io/pci-15b3.present
     - Nodes containing NVIDIA Networking hardware
   * - feature.node.kubernetes.io/pci-10de.present
     - Nodes containing NVIDIA GPU hardware

================
MLNX_OFED Driver
================

======================================
MLNX_OFED Driver Environment Variables
======================================

=========================
RDMA Shared Device Plugin
=========================

==========================================
RDMA Device Plugin Resource Configurations
==========================================

============================
SR-IOV Network Device Plugin
============================

===================================================
SR-IOV Network Device Plugin Resource Configuration
===================================================

=============
IB Kubernetes
=============

==========
UFM Secret
==========

=================
Secondary Network
=================

==========
CNI Plugin
==========

==========
Multus CNI
==========

=========
IPoIB CNI
=========

===============
IPAM CNI Plugin
===============

==================
NVIDIA IPAM Plugin
==================
