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
.. include:: ../common/vars.rst

*********************************
Quick Start Guide for Kubernetes
*********************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================
Before You Begin
================

Before deploying the NVIDIA Network Operator, ensure you have the following:

Prerequisites
=============

#. **Kubernetes Cluster**: A running Kubernetes cluster (v1.19+) with nodes that have NVIDIA NICs.

#. **CLI Tools**: Install ``kubectl`` and ``helm`` on your client machine:

   .. code-block:: bash

      $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
          && chmod 700 get_helm.sh \
          && ./get_helm.sh

#. **Container Runtime**: Nodes must be configured with a container engine such as CRI-O or containerd.

===================================
Install Network Operator Helm Chart
===================================

Add the NVIDIA NGC Helm repository:

.. code-block:: bash

   helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
   helm repo update

Install the Network Operator:

.. code-block:: bash
   :substitutions:

   helm install network-operator nvidia/network-operator \
     -n nvidia-network-operator \
     --create-namespace \
     --version |network-operator-version| \
     --set sriovNetworkOperator.enabled=true \
     --wait

Verify the installation:

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods

================================
Overview of Quickstart Use Cases
================================

This quick start guide covers five essential networking configurations for different computational requirements:

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: Quick Start Guide

   SR-IOV Network with RDMA <sriov-network-rdma>
   Host Device Network with RDMA <host-device-rdma>
   IP over InfiniBand with RDMA Shared Device <ipoib-rdma-shared>
   MacVLAN Network with RDMA Shared Device <macvlan-rdma-shared>
   SR-IOV InfiniBand Network with RDMA <sriov-ib-rdma>

.. list-table::
   :widths: 20 25 20 30
   :header-rows: 1

   * - **Use Case**
     - **Purpose**
     - **Performance Requirements**
     - **Applications**
   * - :doc:`SR-IOV Network with RDMA <sriov-network-rdma>`
     - High-performance networking with hardware acceleration
     - • >10 Gbps throughput
       • <1μs latency
       • Dedicated VF resources
     - HPC simulations, distributed ML training, financial trading
       
       *Keywords: SR-IOV, RDMA, HPC, low-latency, VF isolation*
   * - :doc:`Host Device Network with RDMA <host-device-rdma>`
     - Direct hardware access for legacy applications
     - • Raw device control
       • Exclusive hardware access
       • Minimal CPU overhead
     - Legacy HPC codes, specialized protocols, DPDK applications
       
       *Keywords: host-device, PCI-passthrough, direct-access, exclusive-access*
   * - :doc:`IP over InfiniBand with RDMA Shared Device <ipoib-rdma-shared>`
     - InfiniBand networking with shared RDMA resources
     - • >50 Gbps bandwidth
       • Parallel I/O workloads
       • Shared device efficiency
     - Distributed storage, data analytics, scientific computing
       
       *Keywords: InfiniBand, IPoIB, shared-device, high-bandwidth*
   * - :doc:`MacVLAN Network with RDMA Shared Device <macvlan-rdma-shared>`
     - Network isolation with shared RDMA capabilities
     - • Multi-tenant segmentation
       • 10+ pods per node
       • Moderate throughput
     - Cloud-native HPC, microservices, multi-tenant ML
       
       *Keywords: MacVLAN, multi-tenant, network-segmentation, resource-sharing*
   * - :doc:`SR-IOV InfiniBand Network with RDMA <sriov-ib-rdma>`
     - Virtualized InfiniBand with hardware acceleration
     - • >100 Gbps bandwidth
       • Hardware acceleration
       • Isolated IB partitions
     - Large-scale HPC clusters, AI/ML training, research computing
       
       *Keywords: SR-IOV, InfiniBand, hardware-acceleration, ultra-high-bandwidth*
