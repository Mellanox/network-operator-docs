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

***********************************
Single-Plane Spectrum-X Quick Start
***********************************

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

This walkthrough deploys a **Single-Plane** Spectrum-X cluster on Kubernetes:
one PF per rail, one ``CIDRPool`` per rail, one network per rail. Used on
**HGX H100/H200/B200** platforms (BlueField-3 SuperNIC, ``nicType: a2dc``) and
**GB200 NVL72** platforms (ConnectX-7 NIC, ``nicType: 1021``).
**ConnectX-8 SuperNIC** (``nicType: 1023``) also supports single-plane configuration —
useful if you want a single-plane setup on B300/GB300 hardware. The
configuration uses RA 2.1 with ``multiplaneMode: none`` and
``numberOfPlanes: 1``. The example below uses BlueField-3 SuperNIC; change
``nicType`` for other NICs. Replace ``TODO_*`` values with your
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

Map PCI addresses to rails and define interface naming. With single-plane configuration there is one PF per NIC, so ``pfsPerNic`` is ``1`` and ``%plane_id%`` is always ``0``. Replace ``TODO_PCI_*`` with the PCI addresses of the BlueField-3 SuperNICs on your nodes.

.. code-block:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicInterfaceNameTemplate
   metadata:
     name: spectrum-x-interface-names
     namespace: nvidia-network-operator
   spec:
     pfsPerNic: 1
     rdmaDevicePrefix: "rdma_rail%rail_id%"
     netDevicePrefix: "net_rail%rail_id%"
     railPciAddresses:
       - ["TODO_PCI_RAIL0_NIC0"]
       - ["TODO_PCI_RAIL1_NIC0"]

.. code-block:: bash

   kubectl apply -f nicinterfacenametemplate.yaml

==================================
Step 4: NicConfigurationTemplate
==================================

Configure the NICs for Spectrum-X RA 2.1 in single-plane mode. Use ``nicType: a2dc`` for BlueField-3 SuperNIC (HGX H100/H200/B200), ``nicType: 1021`` for ConnectX-7 NIC (GB200), or ``nicType: 1023`` for ConnectX-8 SuperNIC.

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
       nicType: "a2dc"  # BlueField-3 SuperNIC (HGX H100/H200/B200). Use "1021" for ConnectX-7 NIC (GB200) or "1023" for ConnectX-8 SuperNIC.
     template:
       numVfs: 1
       linkType: Ethernet
       spectrumXOptimized:
         enabled: true
         version: "RA2.1"
         overlay: "none"
         multiplaneMode: "none"
         numberOfPlanes: 1

.. code-block:: bash

   kubectl apply -f nicconfigurationtemplate.yaml

================================
Step 5: CIDRPool (per rail)
================================

In single-plane mode each rail is a single network, so one ``CIDRPool`` per rail is sufficient. Replace ``TODO_*`` with subnets that match your cluster's east-west topology.

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

One entry in ``railTopology`` per rail, selecting the single PF in that rail (matching ``NicInterfaceNameTemplate``) and referencing the matching ``CIDRPool``.

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
           pfNames: ["net_rail0"]
         cidrPoolRef: rail-0
         mtu: 9216
       - name: rail1
         nicSelector:
           pfNames: ["net_rail1"]
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
