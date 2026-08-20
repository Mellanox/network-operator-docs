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

******************************************
Software Multiplane Spectrum-X Quick Start
******************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. warning::

   On Network Operator 26.4.x, this Spectrum-X RA 2.1 configuration workflow is
   **Tech Preview** — intended for early evaluation of new configuration flows
   and capabilities, not for production use. The validated, generally available
   Spectrum-X RA 2.1 solution is Network Operator 26.1.x (see the `NVIDIA
   Spectrum-X Validated Solution Stack
   <https://networking-docs.nvidia.com/software/spectrumx-solution-stack>`_).

.. note::

   You can automate the configuration of this use case with NVIDIA Kubernetes Launch Kit.
   For more details, see :doc:`Configuration Assistance with Kubernetes Launch Kit <../k8s-launch-kit/k8s-launch-kit>`.

This walkthrough deploys a **Software Multiplane** Spectrum-X cluster on
Kubernetes using **ConnectX-8 SuperNICs** (``nicType: 1023``). Each SuperNIC
is split into multiple PFs, each assigned to a separate plane, and the
software stack performs **Software Plane Load Balancing** (``swplb``) across
them. Used on **B300** and **GB300** platforms — set ``numberOfPlanes: 2``
for Dual-Plane or ``numberOfPlanes: 4`` for Quad-Plane (B300 only). The
configuration uses RA 2.1 with ``multiplaneMode: swplb``. The example below
uses ``numberOfPlanes: 2``. Replace ``TODO_*`` values with your
cluster-specific values before applying.

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
       # xPlane is only used when multiplaneMode=hwplb (Hardware Multiplane).
       # Including it here lets you flip multiplaneMode without re-applying NicClusterPolicy.
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

Configure the ConnectX-8 SuperNICs for Spectrum-X RA 2.1 with ``swplb`` multiplane mode. For Quad-Plane (B300 only), set ``numberOfPlanes: 4``.

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
         multiplaneMode: "swplb"
         numberOfPlanes: 2

.. code-block:: bash

   kubectl apply -f nicconfigurationtemplate.yaml

==================================
Step 5: CIDRPool (per rail-plane)
==================================

With ``swplb``, each rail is split into multiple planes, and each plane requires its own ``CIDRPool``. Create one pool per (rail, plane) combination. Replace ``TODO_*`` with subnets that match your cluster's east-west topology.

.. code-block:: yaml

   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-0-plane-0
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL0_PLANE0_CIDR      # e.g., 10.0.0.0/15
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL0_PLANE0_SUBNET # same as cidr
       - dst: TODO_EAST_WEST_SUBNET
   ---
   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-0-plane-1
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL0_PLANE1_CIDR
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL0_PLANE1_SUBNET
       - dst: TODO_EAST_WEST_SUBNET
   ---
   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-1-plane-0
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL1_PLANE0_CIDR
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL1_PLANE0_SUBNET
       - dst: TODO_EAST_WEST_SUBNET
   ---
   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: CIDRPool
   metadata:
     name: rail-1-plane-1
     namespace: nvidia-network-operator
   spec:
     cidr: TODO_RAIL1_PLANE1_CIDR
     gatewayIndex: 0
     perNodeNetworkPrefix: 31
     perNodeExclusions:
       - startIndex: 1
         endIndex: 1
     routes:
       - dst: TODO_RAIL1_PLANE1_SUBNET
       - dst: TODO_EAST_WEST_SUBNET

.. code-block:: bash

   kubectl apply -f cidrpool.yaml

================================
Step 6: SpectrumXRailPoolConfig
================================

With ``swplb``, ``railTopology`` has one entry per (rail, plane) combination. Each entry selects a single PF (netdev name from ``NicInterfaceNameTemplate``) and references the matching per-plane ``CIDRPool``.

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
       - name: rail0p0
         nicSelector:
           pfNames: ["net_rail0_plane0"]
         cidrPoolRef: rail-0-plane-0
         mtu: 9216
       - name: rail0p1
         nicSelector:
           pfNames: ["net_rail0_plane1"]
         cidrPoolRef: rail-0-plane-1
         mtu: 9216
       - name: rail1p0
         nicSelector:
           pfNames: ["net_rail1_plane0"]
         cidrPoolRef: rail-1-plane-0
         mtu: 9216
       - name: rail1p1
         nicSelector:
           pfNames: ["net_rail1_plane1"]
         cidrPoolRef: rail-1-plane-1
         mtu: 9216

.. code-block:: bash

   kubectl apply -f spectrumxrailpoolconfig.yaml

================================
Step 7: Deploy a Test Pod
================================

Request one VF per (rail, plane) combination. The network annotation lists each rail-plane and the resource request matches the corresponding DRA resource.

.. code-block:: yaml

   apiVersion: v1
   kind: Pod
   metadata:
     name: spectrum-x-test
     namespace: default
     annotations:
       k8s.v1.cni.cncf.io/networks: rail0p0,rail0p1,rail1p0,rail1p1
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
             nvidia.com/rail_0_plane_0: "1"
             nvidia.com/rail_0_plane_1: "1"
             nvidia.com/rail_1_plane_0: "1"
             nvidia.com/rail_1_plane_1: "1"
           limits:
             nvidia.com/rail_0_plane_0: "1"
             nvidia.com/rail_0_plane_1: "1"
             nvidia.com/rail_1_plane_0: "1"
             nvidia.com/rail_1_plane_1: "1"

.. code-block:: bash

   kubectl apply -f pod.yaml
   kubectl -n default exec -it spectrum-x-test -- rdma link
