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

.. list-table::
   :widths: 20 25 20 30
   :header-rows: 1

   * - **Use Case**
     - **Purpose**
     - **Performance Requirements**
     - **Applications**
   * - `SR-IOV Network with RDMA`_
     - High-performance networking with hardware acceleration
     - • >10 Gbps throughput
       • <1μs latency
       • Dedicated VF resources
     - HPC simulations, distributed ML training, financial trading
       
       *Keywords: SR-IOV, RDMA, HPC, low-latency, VF isolation*
   * - `Host Device Network with RDMA`_
     - Direct hardware access for legacy applications
     - • Raw device control
       • Exclusive hardware access
       • Minimal CPU overhead
     - Legacy HPC codes, specialized protocols, DPDK applications
       
       *Keywords: host-device, PCI-passthrough, direct-access, exclusive-access*
   * - `IP over InfiniBand with RDMA Shared Device`_
     - InfiniBand networking with shared RDMA resources
     - • >50 Gbps bandwidth
       • Parallel I/O workloads
       • Shared device efficiency
     - Distributed storage, data analytics, scientific computing
       
       *Keywords: InfiniBand, IPoIB, shared-device, high-bandwidth*
   * - `MacVLAN Network with RDMA Shared Device`_
     - Network isolation with shared RDMA capabilities
     - • Multi-tenant segmentation
       • 10+ pods per node
       • Moderate throughput
     - Cloud-native HPC, microservices, multi-tenant ML
       
       *Keywords: MacVLAN, multi-tenant, network-segmentation, resource-sharing*
   * - `SR-IOV InfiniBand Network with RDMA`_
     - Virtualized InfiniBand with hardware acceleration
     - • >100 Gbps bandwidth
       • Hardware acceleration
       • Isolated IB partitions
     - Large-scale HPC clusters, AI/ML training, research computing
       
       *Keywords: SR-IOV, InfiniBand, hardware-acceleration, ultra-high-bandwidth*

===================
Deployment Examples
===================

.. _sriov-network-with-rdma-deployment:

SR-IOV Network with RDMA
=========================

**Step 1**: Create NicClusterPolicy

.. literalinclude:: ../_build/examples/sriov-network-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../_build/examples/sriov-network-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Configure SR-IOV

.. literalinclude:: ../_build/examples/sriov-network-rdma/30-sriovnetworknodepolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovnetworknodepolicy.yaml

**Step 4**: Create SR-IOV Network

.. literalinclude:: ../_build/examples/sriov-network-rdma/40-sriovnetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovnetwork.yaml

**Step 5**: Deploy test workload

.. literalinclude:: ../_build/examples/sriov-network-rdma/50-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it sriov-test-pod -- ip addr show
    kubectl exec -it sriov-test-pod -- ibv_devices

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../_build/examples/sriov-network-rdma/complete.yaml
      :language: yaml

.. _host-device-network-with-rdma-sr-iov-deployment:

Host Device Network with RDMA
=====================================

**Step 1**: Create NicClusterPolicy with host device support

.. literalinclude:: ../_build/examples/host-device-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../_build/examples/host-device-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create HostDeviceNetwork

.. literalinclude:: ../_build/examples/host-device-rdma/30-hostdevicenetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f hostdevicenetwork.yaml

**Step 4**: Deploy test workload

.. literalinclude:: ../_build/examples/host-device-rdma/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it hostdev-test-pod -- lspci | grep Mellanox

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../_build/examples/host-device-rdma/complete.yaml
      :language: yaml

.. _ip-over-infiniband-with-rdma-shared-device-deployment:

IP over InfiniBand with RDMA Shared Device
===========================================

**Step 1**: Create NicClusterPolicy with IPoIB support

.. literalinclude:: ../_build/examples/ipoib-rdma-shared/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../_build/examples/ipoib-rdma-shared/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create IPoIBNetwork

.. literalinclude:: ../_build/examples/ipoib-rdma-shared/30-ipoibnetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ipoibnetwork.yaml

**Step 4**: Deploy test workload

.. literalinclude:: ../_build/examples/ipoib-rdma-shared/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it ipoib-test-pod -- ibstat
    kubectl exec -it ipoib-test-pod -- ip addr show

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../_build/examples/ipoib-rdma-shared/complete.yaml
      :language: yaml

.. _macvlan-network-with-rdma-shared-device-deployment:

MacVLAN Network with RDMA Shared Device
========================================

**Step 1**: Create NicClusterPolicy with RDMA shared device

.. literalinclude:: ../_build/examples/macvlan-rdma-shared/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../_build/examples/macvlan-rdma-shared/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create MacvlanNetwork

.. literalinclude:: ../_build/examples/macvlan-rdma-shared/30-macvlannetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f macvlannetwork.yaml

**Step 4**: Deploy test workload

.. literalinclude:: ../_build/examples/macvlan-rdma-shared/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it macvlan-test-pod -- ip addr show
    kubectl exec -it macvlan-test-pod -- ibv_devinfo

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../_build/examples/macvlan-rdma-shared/complete.yaml
      :language: yaml

.. _sr-iov-infiniband-network-with-rdma-deployment:

SR-IOV InfiniBand Network with RDMA
====================================

**Step 1**: Create NicClusterPolicy for InfiniBand

.. literalinclude:: ../_build/examples/sriov-ib-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../_build/examples/sriov-ib-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Configure SR-IOV for InfiniBand

.. literalinclude:: ../_build/examples/sriov-ib-rdma/30-sriovnetworknodepolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovnetworknodepolicy.yaml

**Step 4**: Create SriovIBNetwork

.. literalinclude:: ../_build/examples/sriov-ib-rdma/40-sriovibnetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovibnetwork.yaml

**Step 5**: Deploy test workload

.. literalinclude:: ../_build/examples/sriov-ib-rdma/50-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it sriov-ib-test-pod -- ibv_devices
    kubectl exec -it sriov-ib-test-pod -- ibstat

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../_build/examples/sriov-ib-rdma/complete.yaml
      :language: yaml
