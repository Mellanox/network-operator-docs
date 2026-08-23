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

*********************************
Spectrum-X Kubernetes Quick Start
*********************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none


.. note::

   These walkthroughs target **Spectrum-X RA 2.3** on **Network Operator 26.7.0**.
   For the RA-to-release mapping and other RAs, see
   :doc:`NVIDIA Spectrum-X <spectrum-x>`. For supported platforms (operating
   systems, Kubernetes distributions, NIC hardware), see
   :doc:`Platform Support <../platform-support>`.

   On Network Operator 26.7.0, **Single-Plane**, **Hardware Multiplane**
   (``hwplb``), and **Software Multiplane** (``swplb``) deployments are GA.
   For background on the operators and CNIs each walkthrough relies on, see
   :doc:`Architecture and Components <components>`.

   Every walkthrough begins by applying a **Spectrum-X profile ConfigMap**.
   From 26.7.0, ``spectrumXOptimized.version`` names that ConfigMap instead of
   selecting a built-in RA version — see
   :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.

.. tip::

   The configuration in each walkthrough can be automated end-to-end with
   NVIDIA Kubernetes Launch Kit — see
   :doc:`Configuration Assistance with Kubernetes Launch Kit <../k8s-launch-kit/k8s-launch-kit>`.

.. note::

   To allocate rail VFs through Dynamic Resource Allocation and pair each
   VF with the GPU behind the same PCIe root, add one
   ``ResourceClaimTemplate`` per rail after completing a walkthrough — see
   :doc:`DRA SR-IOV Driver <../dra-sriov-driver/dra-sriov-driver>`.

   Once the cluster is up, :doc:`Verify and Troubleshoot
   <verify-and-troubleshoot>` walks through checking each layer.

The walkthrough installs Network Operator via Helm, applies the Spectrum-X
CRDs, and deploys a test pod, adapted to the multiplane mode and NIC family
you choose below.

=========================
Choose a deployment mode
=========================

.. list-table::
   :header-rows: 1
   :widths: 20 12 22 22 24

   * - Mode
     - ``multiplaneMode``
     - NICs
     - GPU platforms
     - Use when
   * - **Single-Plane**
     - ``none``
     - BlueField-3 SuperNIC, ConnectX-7 NIC, ConnectX-8 SuperNIC
     - H100/H200/B200 (BlueField-3 SuperNIC), GB200 (ConnectX-7 NIC)
     - One PF per rail. Simplest setup. ConnectX-8 SuperNIC also supports single-plane configuration.
   * - **Hardware Multiplane**
     - ``hwplb``
     - ConnectX-8 SuperNIC
     - B300, GB300
     - Plane Load Balancing happens in the NIC hardware and the planes are hidden from the workload. **The recommended mode on multiplane platforms.** Set ``numberOfPlanes: 2`` (Dual-Plane) or ``4`` (Quad-Plane).
   * - **Software Multiplane**
     - ``swplb``
     - ConnectX-8 SuperNIC
     - B300, GB300
     - Software Plane Load Balancing across planes, with each plane exposed to the workload as its own interface. Set ``numberOfPlanes: 2`` (Dual-Plane) or ``4`` (Quad-Plane).

Select your mode below. The tabs on this page are linked — choosing here
switches every mode-specific step that follows.

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

      This walkthrough deploys a **Single-Plane** Spectrum-X cluster on Kubernetes:
      one PF per rail, one ``CIDRPool`` per rail, one network per rail. Used on
      **HGX H100/H200/B200** platforms (BlueField-3 SuperNIC, ``nicType: a2dc``) and
      **GB200 NVL72** platforms (ConnectX-7 NIC, ``nicType: 1021``).
      **ConnectX-8 SuperNIC** (``nicType: 1023``) also supports single-plane configuration —
      useful if you want a single-plane setup on B300/GB300 hardware. The
      configuration uses Spectrum-X RA 2.3 with ``multiplaneMode: none`` and
      ``numberOfPlanes: 1``. The example below uses BlueField-3 SuperNIC; change
      ``nicType`` for other NICs. Replace ``TODO_*`` values with your
      cluster-specific values before applying.

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

      This walkthrough deploys a **Hardware Multiplane** Spectrum-X cluster on
      Kubernetes using **ConnectX-8 SuperNICs** (``nicType: 1023``). NIC LAG and
      **Hardware Plane Load Balancing** (``hwplb``) handle per-plane fan-out at
      the hardware layer, so each rail still uses a single ``CIDRPool`` while
      exposing multiple per-plane PFs. Used on **B300**
      and **GB300** platforms — set ``numberOfPlanes: 2`` for Dual-Plane or
      ``numberOfPlanes: 4`` for Quad-Plane. The configuration uses
      Spectrum-X RA 2.3 with ``multiplaneMode: hwplb``. The example below uses
      ``numberOfPlanes: 2``. Replace ``TODO_*`` values with your cluster-specific
      values before applying.

   .. tab-item:: Software Multiplane
      :sync: swplb

      This walkthrough deploys a **Software Multiplane** Spectrum-X cluster on
      Kubernetes using **ConnectX-8 SuperNICs** (``nicType: 1023``). Each SuperNIC
      is split into multiple PFs, each assigned to a separate plane, and the
      software stack performs **Software Plane Load Balancing** (``swplb``) across
      them. Used on **B300** and **GB300** platforms — set ``numberOfPlanes: 2``
      for Dual-Plane or ``numberOfPlanes: 4`` for Quad-Plane. The
      configuration uses Spectrum-X RA 2.3 with ``multiplaneMode: swplb``. The example below
      uses ``numberOfPlanes: 2``. Replace ``TODO_*`` values with your
      cluster-specific values before applying.

================================
Step 1: Prepare the Worker Nodes
================================

Spectrum-X requires two host-level settings on every worker node. Both take effect only after a reboot, so apply them before installing the Network Operator.

**Virtualization support.** SR-IOV Virtual Functions require IOMMU and VF capability to be enabled in the platform firmware and on the kernel command line. Follow the host preparation procedure for your platform in the NVIDIA Spectrum-X deployment guide for your Reference Architecture.

**RDMA subsystem namespace awareness.** Linux network namespaces do not isolate RDMA devices by default — every RDMA device stays visible in every namespace and Pod. Switch the subsystem to namespace-exclusive mode:

.. code-block:: bash

   echo "options ib_core netns_mode=0" >> /etc/modprobe.d/ib_core.conf

Reboot the node for both settings to take effect.

.. warning::

   Without ``netns_mode=0``, RDMA devices are not isolated per Pod: workloads see RDMA devices that belong to other Pods, and the per-rail isolation this walkthrough builds does not hold.

==============================
Step 2: Install the Helm Chart
==============================

Add the NVIDIA NGC Helm repository:

.. code-block:: bash

   helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
   helm repo update

Spectrum-X requires several non-default chart values. Create ``values.yaml``:

.. code-block:: yaml

   sriovNetworkOperator:
     enabled: true

   maintenanceOperator:
     enabled: true

   sriov-network-operator:
     sriovOperatorConfig:
       deploy: true
       configDaemonNodeSelector:
         network.nvidia.com/operator.nic-configuration.wait: "false"
       featureGates:
         manageSoftwareBridges: true
       disablePlugins:
       - mellanox

.. list-table::
   :header-rows: 1
   :widths: 36 64

   * - Value
     - Why it is required
   * - ``featureGates.manageSoftwareBridges``
     - Lets the SR-IOV Network Operator manage the OVS software bridges that the Spectrum-X data path needs. Without it, the bridges are never created.
   * - ``disablePlugins: [mellanox]``
     - Hands SuperNIC firmware, NV config, and SR-IOV enablement to the NIC Configuration Operator. Leaving the SR-IOV Network Operator's own Mellanox plugin enabled configures the same state twice and makes the configuration flap.
   * - ``configDaemonNodeSelector``
     - Makes the SR-IOV config daemon wait for the NIC Configuration Operator to finish per-node firmware and NIC configuration before it touches VFs.
   * - ``featureGates.dynamicResourceAllocation``
     - Not set in this walkthrough, which allocates VFs through the SR-IOV device plugin. Add it only for Dynamic Resource Allocation (DRA) workloads: enabling it replaces the device plugin with the DRA driver, so the resource requests in Step 9 no longer apply. See :doc:`DRA SR-IOV Driver <../dra-sriov-driver/dra-sriov-driver>`.

Install the Network Operator. Spectrum-X Operator and NIC Configuration Operator are deployed via the same chart and enabled later through ``NicClusterPolicy``.

.. code-block:: bash
   :substitutions:

   helm install network-operator nvidia/network-operator \
     -n nvidia-network-operator \
     --create-namespace \
     --version |helm-chart-version| \
     -f values.yaml \
     --wait

Verify the installation:

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods

==============================
Step 3: Apply NicClusterPolicy
==============================

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
         repository: |nic-configuration-operator-repository|
         version: |nic-configuration-operator-version|
       configurationDaemon:
         image: nic-configuration-operator-daemon
         repository: |nic-configuration-operator-repository|
         version: |nic-configuration-operator-version|
       nicFirmwareStorage:
         create: true
         pvcName: nic-fw-storage-pvc
         storageClassName: nic-fw-storage-class
         availableStorageSize: 1Gi
       logLevel: info
     nvIpam:
       image: nvidia-k8s-ipam
       repository: |nvidia-ipam-repository|
       version: |nvidia-ipam-version|
       enableWebhook: false
     spectrumXOperator:
       image: spectrum-x-operator
       repository: |spectrumxop-repository|
       version: |spectrumxop-version|
       # xPlane is only used when multiplaneMode=hwplb (Hardware Multiplane).
       # Including it here lets you flip multiplaneMode without re-applying NicClusterPolicy.
       xPlane:
         image: xplane
         # xPlane ships on the DOCA release cadence, so its repository and tag
         # differ from the other Network Operator components.
         repository: |xplane-repository|
         version: |xplane-version|
     secondaryNetwork:
       cniPlugins:
         image: plugins
         repository: |cni-plugins-repository|
         version: |cni-plugins-version|
       multus:
         image: multus-cni
         repository: |multus-repository|
         version: |multus-version|

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

================================
Step 4: Name the Rail Interfaces
================================

Create the ``NicInterfaceNameTemplate`` that maps PCI addresses to rails and
gives each interface a predictable name.

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

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

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

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

   .. tab-item:: Software Multiplane
      :sync: swplb

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

====================================
Step 5: Apply the Spectrum-X Profile
====================================

The NIC Configuration Operator reads Spectrum-X NIC tuning from a **profile ConfigMap**, not from a built-in RA version. Obtain the RA 2.3 profile YAML from NVOnline, or contact your NVIDIA CPM, then apply it as a labeled ConfigMap whose **name** is the value you will reference from ``spectrumXOptimized.version``.

.. code-block:: yaml

   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: spectrum-x-ra2.3-profile
     namespace: nvidia-network-operator
     labels:
       network.nvidia.com/operator.nic-configuration.spectrum-x-profile: ""
   data:
     profile: |
       # TODO_PASTE_RA23_PROFILE_YAML
       # Contents supplied by NVIDIA: useSoftwareCCAlgorithm, docaCCVersion,
       # mlxConfig (per multiplane mode and device ID), runtimeConfig.

.. code-block:: bash

   kubectl apply -f spectrum-x-profile-configmap.yaml

The profile must include ``mlxConfig`` tuning for the multiplane mode you selected and for your NIC's device ID. For where the profile comes from and how it is referenced, see :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`; for the ConfigMap format itself, see :doc:`Configuration Details <../nic-conf-operator/configuration-details>`.

===============================
Step 6: Configure the SuperNICs
===============================

Create the ``NicConfigurationTemplate`` that applies the Spectrum-X profile to
the SuperNICs and sets the multiplane mode.

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

      Configure the NICs for Spectrum-X RA 2.3 in single-plane mode. Use ``nicType: a2dc`` for BlueField-3 SuperNIC (HGX H100/H200/B200), ``nicType: 1021`` for ConnectX-7 NIC (GB200), or ``nicType: 1023`` for ConnectX-8 SuperNIC.

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
             pciAddresses:  # every east-west PF, all rails
               - "TODO_PCI_RAIL0_NIC0"
               - "TODO_PCI_RAIL1_NIC0"
           template:
             numVfs: 1
             linkType: Ethernet
             spectrumXOptimized:
               enabled: true
               version: "spectrum-x-ra2.3-profile"  # name of the profile ConfigMap from Step 5
               overlay: "none"
               multiplaneMode: "none"
               numberOfPlanes: 1
             pciPerformanceOptimized:
               enabled: true
               maxReadRequest: 4096

      .. code-block:: bash

         kubectl apply -f nicconfigurationtemplate.yaml

      .. note::

         List the east-west PFs explicitly in ``nicSelector.pciAddresses``. On nodes that also carry a north-south DPU with the same device ID, selecting on ``nicType`` alone matches the north-south device as well and applies Spectrum-X configuration to the wrong NIC.

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

      Configure the ConnectX-8 SuperNICs for Spectrum-X RA 2.3 with ``hwplb`` multiplane mode. ``hwplb`` requires ConnectX-8 SuperNIC (``nicType: 1023``) or ConnectX-9 SuperNIC (``nicType: 1025``, tech preview); it is not supported on BlueField-3 SuperNIC or ConnectX-7 NIC. For Quad-Plane, set ``numberOfPlanes: 4``.

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
             pciAddresses:  # every east-west PF, all rails
               - "TODO_PCI_RAIL0_NIC0"
               - "TODO_PCI_RAIL0_NIC1"
               - "TODO_PCI_RAIL1_NIC0"
               - "TODO_PCI_RAIL1_NIC1"
           template:
             numVfs: 1
             linkType: Ethernet
             spectrumXOptimized:
               enabled: true
               version: "spectrum-x-ra2.3-profile"  # name of the profile ConfigMap from Step 5
               overlay: "none"
               multiplaneMode: "hwplb"
               numberOfPlanes: 2
             pciPerformanceOptimized:
               enabled: true
               maxReadRequest: 4096

      .. code-block:: bash

         kubectl apply -f nicconfigurationtemplate.yaml

      .. note::

         List the east-west PFs explicitly in ``nicSelector.pciAddresses``. On nodes that also carry a north-south DPU with the same device ID, selecting on ``nicType`` alone matches the north-south device as well and applies Spectrum-X configuration to the wrong NIC.

   .. tab-item:: Software Multiplane
      :sync: swplb

      Configure the ConnectX-8 SuperNICs for Spectrum-X RA 2.3 with ``swplb`` multiplane mode. For Quad-Plane, set ``numberOfPlanes: 4``.

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
             pciAddresses:  # every east-west PF, all rails
               - "TODO_PCI_RAIL0_NIC0"
               - "TODO_PCI_RAIL0_NIC1"
               - "TODO_PCI_RAIL1_NIC0"
               - "TODO_PCI_RAIL1_NIC1"
           template:
             numVfs: 1
             linkType: Ethernet
             spectrumXOptimized:
               enabled: true
               version: "spectrum-x-ra2.3-profile"  # name of the profile ConfigMap from Step 5
               overlay: "none"
               multiplaneMode: "swplb"
               numberOfPlanes: 2
             pciPerformanceOptimized:
               enabled: true
               maxReadRequest: 4096

      .. code-block:: bash

         kubectl apply -f nicconfigurationtemplate.yaml

      .. note::

         List the east-west PFs explicitly in ``nicSelector.pciAddresses``. On nodes that also carry a north-south DPU with the same device ID, selecting on ``nicType`` alone matches the north-south device as well and applies Spectrum-X configuration to the wrong NIC.

=============================
Step 7: Allocate Rail Subnets
=============================

Create the ``CIDRPool`` resources that NV-IPAM uses to assign rail addresses to
Pods.

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

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

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

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

   .. tab-item:: Software Multiplane
      :sync: swplb

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

============================
Step 8: Define the Rail Pool
============================

Create the ``SpectrumXRailPoolConfig`` that describes the rail topology and
exposes each rail as a schedulable resource.

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

      One entry in ``railTopology`` per rail, selecting the single PF in that rail (matching ``NicInterfaceNameTemplate``) and referencing the matching ``CIDRPool``.

      .. code-block:: yaml

         apiVersion: spectrumx.nvidia.com/v1alpha2
         kind: SpectrumXRailPoolConfig
         metadata:
           name: rails
           namespace: nvidia-network-operator
         spec:
           draEnabled: false
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

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

      With ``hwplb``, ``railTopology`` has one entry per rail. Each entry lists all per-plane PF netdev names belonging to that rail and references a single per-rail ``CIDRPool``.

      .. code-block:: yaml

         apiVersion: spectrumx.nvidia.com/v1alpha2
         kind: SpectrumXRailPoolConfig
         metadata:
           name: rails
           namespace: nvidia-network-operator
         spec:
           draEnabled: false
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

   .. tab-item:: Software Multiplane
      :sync: swplb

      With ``swplb``, ``railTopology`` has one entry per (rail, plane) combination. Each entry selects a single PF (netdev name from ``NicInterfaceNameTemplate``) and references the matching per-plane ``CIDRPool``.

      .. code-block:: yaml

         apiVersion: spectrumx.nvidia.com/v1alpha2
         kind: SpectrumXRailPoolConfig
         metadata:
           name: rails
           namespace: nvidia-network-operator
         spec:
           draEnabled: false
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

=========================
Step 9: Deploy a Test Pod
=========================

.. tab-set::

   .. tab-item:: Single-Plane
      :sync: single-plane

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
                   nvidia.com/rail0: "1"
                   nvidia.com/rail1: "1"
                 limits:
                   nvidia.com/rail0: "1"
                   nvidia.com/rail1: "1"

      .. code-block:: bash

         kubectl apply -f pod.yaml
         kubectl -n default exec -it spectrum-x-test -- rdma link

   .. tab-item:: Hardware Multiplane
      :sync: hwplb

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
                   nvidia.com/rail0: "1"
                   nvidia.com/rail1: "1"
                 limits:
                   nvidia.com/rail0: "1"
                   nvidia.com/rail1: "1"

      .. code-block:: bash

         kubectl apply -f pod.yaml
         kubectl -n default exec -it spectrum-x-test -- rdma link

   .. tab-item:: Software Multiplane
      :sync: swplb

      Request one VF per (rail, plane) combination. The network annotation lists each rail-plane and the resource request matches the SR-IOV device-plugin resource the Spectrum-X Operator creates for each rail-plane.

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
                   nvidia.com/rail0p0: "1"
                   nvidia.com/rail0p1: "1"
                   nvidia.com/rail1p0: "1"
                   nvidia.com/rail1p1: "1"
                 limits:
                   nvidia.com/rail0p0: "1"
                   nvidia.com/rail0p1: "1"
                   nvidia.com/rail1p0: "1"
                   nvidia.com/rail1p1: "1"

      .. code-block:: bash

         kubectl apply -f pod.yaml
         kubectl -n default exec -it spectrum-x-test -- rdma link

.. toctree::
   :maxdepth: 1
   :titlesonly:
   :hidden:

   Single Plane <quick-start-single-plane.rst>
   Hardware Multiplane <quick-start-hwplb.rst>
   Software Multiplane <quick-start-swplb.rst>
