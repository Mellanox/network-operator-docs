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
.. include:: ../common/vars.rst

*********************************************************
Hardware Multiplane Spectrum-X Quick Start (Tech Preview)
*********************************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. warning::

   Hardware Multiplane (``hwplb``) is **tech preview**, planned for a future
   Spectrum-X Reference Architecture, and is **not part of the current
   validated Spectrum-X Reference Architecture**. Use only for evaluation
   purposes.

.. note::

   You can automate the configuration of this use case with NVIDIA Kubernetes Launch Kit.
   For more details, see :doc:`Configuration Assistance with Kubernetes Launch Kit <../k8s-launch-kit/k8s-launch-kit>`.

This walkthrough deploys a **Hardware Multiplane** Spectrum-X cluster on
Kubernetes using **ConnectX-8 SuperNICs** (``nicType: 1023``). NIC LAG and
**Hardware Plane Load Balancing** (``hwplb``) handle per-plane fan-out at
the hardware layer, so each rail still uses a single ``CIDRPool`` while
exposing multiple per-plane PFs. Used on **B300**
and **GB300** platforms — set ``numberOfPlanes: 2`` for Dual-Plane or
``numberOfPlanes: 4`` for Quad-Plane (B300 only). The configuration uses
RA 2.1 with ``multiplaneMode: hwplb``. The example below uses
``numberOfPlanes: 2``. Replace ``TODO_*`` values with your cluster-specific
values before applying.

================================
Step 1: Install the Helm Chart
================================

Add the NVIDIA NGC Helm repository:

.. code-block:: bash

   helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
   helm repo update

Install the Network Operator. Spectrum-X Operator and NIC Configuration Operator are deployed via the same chart and enabled later through ``NicClusterPolicy``.

.. code-block:: bash
   :substitutions:

   helm install network-operator nvidia/network-operator \
     -n nvidia-network-operator \
     --create-namespace \
     --version |helm-chart-version| \
     --set sriovNetworkOperator.enabled=true \
     --wait

Verify the installation:

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods

================================
Step 2: Apply NicClusterPolicy
================================

Enable the NIC Configuration Operator, NV-IPAM, Spectrum-X Operator (with XPlane), and the secondary network components.

.. code-block:: yaml
   :substitutions:

   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     nicConfigurationOperator:
       operator:
         image: nic-configuration-operator
         repository: |network-operator-repository|
         version: |nic-configuration-operator-version|
       configurationDaemon:
         image: nic-configuration-operator-daemon
         repository: |network-operator-repository|
         version: |nic-configuration-operator-version|
       nicFirmwareStorage:
         create: true
         pvcName: nic-fw-storage-pvc
         storageClassName: nic-fw-storage-class
         availableStorageSize: 1Gi
       logLevel: info
     nvIpam:
       image: nvidia-k8s-ipam
       repository: |network-operator-repository|
       version: |nvidia-ipam-version|
       enableWebhook: false
     spectrumXOperator:
       image: spectrum-x-operator
       repository: |network-operator-repository|
       version: |spectrumxop-version|
       xPlane:
         image: xplane
         repository: |network-operator-repository|
         version: |spectrumxop-version|
     secondaryNetwork:
       cniPlugins:
         image: plugins
         repository: |network-operator-repository|
         version: |cni-plugins-version|
       multus:
         image: multus-cni
         repository: |network-operator-repository|
         version: |multus-version|

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

==================================
Step 3: NicInterfaceNameTemplate
==================================

Map PCI addresses to rail/plane indices and define interface naming. Replace ``TODO_PCI_*`` with the PCI addresses of the Spectrum-X NICs on your nodes.

.. code-block:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicInterfaceNameTemplate
   metadata:
     name: spectrum-x-interface-names
     namespace: nvidia-network-operator
   spec:
     pfsPerNic: 2
     rdmaDevicePrefix: "rdma_rail%rail_id%_plane%plane_id%"
     netDevicePrefix: "net_rail%rail_id%_plane%plane_id%"
     railPciAddresses:
       - ["TODO_PCI_RAIL0_NIC0", "TODO_PCI_RAIL0_NIC1"]
       - ["TODO_PCI_RAIL1_NIC0", "TODO_PCI_RAIL1_NIC1"]

.. code-block:: bash

   kubectl apply -f nicinterfacenametemplate.yaml

==================================
Step 4: NicConfigurationTemplate
==================================

Configure the ConnectX-8 SuperNICs for Spectrum-X RA 2.1 with ``hwplb`` multiplane mode. ``hwplb`` requires ConnectX-8 SuperNIC (``nicType: 1023``); it is not supported on BlueField-3 SuperNIC or ConnectX-7 NIC. For Quad-Plane (B300 only), set ``numberOfPlanes: 4``.

.. code-block:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicConfigurationTemplate
   metadata:
     name: spectrum-x-configuration
     namespace: nvidia-network-operator
   spec:
     nodeSelector:
       feature.node.kubernetes.io/network-sriov.capable: "true"
     nicSelector:
       nicType: "1023"  # ConnectX-8 SuperNIC (B300, GB300)
     template:
       numVfs: 1
       linkType: Ethernet
       spectrumXOptimized:
         enabled: true
         version: "RA2.1"
         overlay: "none"
         multiplaneMode: "hwplb"
         numberOfPlanes: 2

.. code-block:: bash

   kubectl apply -f nicconfigurationtemplate.yaml

================================
Step 5: CIDRPool (per rail)
================================

With ``hwplb``, load balancing happens at the NIC layer, so each rail uses a single ``CIDRPool`` covering all of its planes. Replace ``TODO_*`` with subnets that match your cluster's east-west topology.

.. code-block:: yaml

   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-0
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL0_CIDR             # e.g., 10.0.0.0/15
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL0_SUBNET        # same as cidr
       - dst: TODO_EAST_WEST_SUBNET
   ---
   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-1
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL1_CIDR
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL1_SUBNET
       - dst: TODO_EAST_WEST_SUBNET

.. code-block:: bash

   kubectl apply -f cidrpool.yaml

================================
Step 6: SpectrumXRailPoolConfig
================================

With ``hwplb``, ``railTopology`` has one entry per rail. Each entry lists all per-plane PF netdev names belonging to that rail and references a single per-rail ``CIDRPool``.

.. code-block:: yaml

   apiVersion: spectrumx.nvidia.com/v1alpha2
   kind: SpectrumXRailPoolConfig
   metadata:
     name: rails
     namespace: nvidia-network-operator
   spec:
     draEnabled: true
     networkNamespace: default
     numVfs: 1
     railTopology:
       - name: rail0
         nicSelector:
           pfNames: ["net_rail0_plane0", "net_rail0_plane1"]
         cidrPoolRef: rail-0
         mtu: 9216
       - name: rail1
         nicSelector:
           pfNames: ["net_rail1_plane0", "net_rail1_plane1"]
         cidrPoolRef: rail-1
         mtu: 9216

.. code-block:: bash

   kubectl apply -f spectrumxrailpoolconfig.yaml

================================
Step 7: Deploy a Test Pod
================================

Request one VF per rail. The network annotation references the rails created by ``SpectrumXRailPoolConfig``.

.. code-block:: yaml

   apiVersion: v1
   kind: Pod
   metadata:
     name: spectrum-x-test
     namespace: default
     annotations:
       k8s.v1.cni.cncf.io/networks: rail0,rail1
   spec:
     containers:
       - name: spectrum-x-test
         image: nvcr.io/nvidia/doca/doca:3.3.0-full-rt-host
         command: ["/bin/bash", "-c", "sleep infinity"]
         securityContext:
           capabilities:
             add: ["IPC_LOCK", "NET_RAW"]
         resources:
           requests:
             nvidia.com/rail_0: "1"
             nvidia.com/rail_1: "1"
           limits:
             nvidia.com/rail_0: "1"
             nvidia.com/rail_1: "1"

.. code-block:: bash

   kubectl apply -f pod.yaml
   kubectl -n default exec -it spectrum-x-test -- rdma link
