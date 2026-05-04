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
.. include:: ../../common/vars.rst

*************************
Configuration Reference
*************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

The Launch Kit configuration file (typically ``cluster-config.yaml``, produced by ``l8k discover`` and consumed by ``l8k generate``) is YAML. This page documents every top-level section.

================================================================================
Full Schema
================================================================================

.. code-block:: yaml
   :substitutions:

   networkOperator:
     selectedRelease: "26.4"
     version: |k8s-launch-kit-version|
     componentVersion: |k8s-launch-kit-component-version|
     repository: |k8s-launch-kit-network-operator-repository|
     namespace: nvidia-network-operator
     imagePullSecrets: []
     docsBaseURL: |k8s-launch-kit-docs-base-url|

   docaDriver:
     enable: true
     version: |doca-driver-version|
     unloadStorageModules: false
     enableNFSRDMA: false
     unloadThirdPartyRDMAModules: false
     skipPreflightChecks: false

   nvIpam:
     poolName: nv-ipam-pool
     startingSubnet: "192.168.2.0"
     mask: 24
     offset: 1

   sriov:
     ethernetMtu: 9000
     infinibandMtu: 4000
     numVfs: 8
     priority: 90
     resourceName: sriov_resource
     networkName: sriov-network

   hostdev:
     resourceName: hostdev-resource
     networkName: hostdev-network

   rdmaShared:
     resourceName: rdma_shared_resource
     hcaMax: 63

   ipoib:
     networkName: ipoib-network

   macvlan:
     networkName: macvlan-network

   nicConfigurationOperator:
     deployNicInterfaceNameTemplate: true
     rdmaPrefix: "rdma_r%rail%"
     netdevPrefix: "eth_r%rail%"

   spectrumX:
     nicType: "1023"
     overlay: "none"
     rdmaPrefix: "roce_p%plane%_r%rail%"
     netdevPrefix: "eth_p%plane%_r%rail%"

   workload:
     manifest: ""

   profile:
     fabric: ethernet
     deployment: sriov
     multirail: false
     spectrumX:
       spcxVersion: "RA2.1"
       multiplaneMode: swplb
       numberOfPlanes: 4
     ai: false

   clusterConfig:
   - identifier: "dgx-b200-nvidia-b200"
     machineType: "DGX-B200"
     productType: "NVIDIA-B200"
     capabilities:
       nodes:
         sriov: true
         rdma: true
         ib: false
     workerNodes: ["worker-0", "worker-1"]
     nodeSelector:
       nvidia.kubernetes-launch-kit.machine: "DGX-B200-NVIDIA-B200"
     thirdPartyRDMAModules: []
     storageModules: []
     linkType: Ethernet
     pfs:
     - deviceID: "1023"
       pciAddress: "0000:05:00.0"
       rdmaDevice: "mlx5_0"
       networkInterface: "net1"
       traffic: east-west
       rail: 0

================================================================================
networkOperator
================================================================================

Network Operator version, image registry, namespace, and pull secrets.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Field**
     - **Description**
   * - ``selectedRelease``
     - Pin to a release line. Supported: ``25.10``, ``26.1``, ``26.4``. Auto-fills ``version`` and image tags from an embedded catalog. Equivalent to the ``--network-operator-release`` flag.
   * - ``version``
     - Explicit Network Operator version. Overrides the catalog when set.
   * - ``componentVersion``
     - Tag for component images (CNI, device plugins, etc.).
   * - ``repository``
     - Container registry (default: ``nvcr.io/nvidia/mellanox``).
   * - ``namespace``
     - Operator namespace (default: ``nvidia-network-operator``).
   * - ``imagePullSecrets``
     - List of secret names. Propagated to ``NicClusterPolicy.spec.global.imagePullSecrets`` and per-group ``NicNodePolicy`` sub-specs.
   * - ``docsBaseURL``
     - Documentation URL embedded in generated annotations.

================================================================================
docaDriver
================================================================================

OFED driver configuration and kernel driver dependencies validation.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Field**
     - **Description**
   * - ``enable``
     - Include the OFED driver in generated manifests. Set to ``false`` to skip (or use ``--enable-doca-driver`` to flip).
   * - ``version``
     - DOCA driver version tag.
   * - ``unloadStorageModules``
     - Unload storage-over-RDMA modules (``nvme_rdma``, ``ib_isert``, ``rpcrdma``, ...). Auto-set to ``true`` during discovery if such modules are detected.
   * - ``unloadThirdPartyRDMAModules``
     - Unload third-party RDMA modules (``rdma_rxe``, ``qedr``, ``bnxt_re``, ...). Auto-set to ``true`` during discovery if such modules are detected. Storage and third-party module lists are sourced from the ``doca-driver-build`` project.
   * - ``enableNFSRDMA``
     - Enable NFS-over-RDMA support.
   * - ``skipPreflightChecks``
     - Skip the kernel driver dependencies validation. Useful for environments where it's known-good.

See :doc:`../workflows/discover` for how OFED-dependent modules are detected.

================================================================================
nvIpam
================================================================================

NV-IPAM configuration. Either provide an explicit ``subnets`` list or let Launch Kit auto-generate non-overlapping subnets per node group.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Field**
     - **Description**
   * - ``poolName``
     - Pool name used in IPPool CRs.
   * - ``subnets``
     - Explicit list of ``{subnet, gateway}`` entries. Mutually exclusive with the auto-generation fields.
   * - ``startingSubnet``
     - First subnet for auto-generation (e.g., ``192.168.2.0``).
   * - ``mask``
     - Prefix length for auto-generated subnets.
   * - ``offset``
     - Increment used between auto-generated subnets.

================================================================================
sriov / hostdev / rdmaShared / ipoib / macvlan
================================================================================

Profile-specific parameters --- only the section for the selected profile is consumed.

.. list-table::
   :header-rows: 1
   :widths: 25 25 50

   * - **Section**
     - **Field**
     - **Description**
   * - ``sriov``
     - ``ethernetMtu`` / ``infinibandMtu``
     - MTU values per fabric.
   * - ``sriov``
     - ``numVfs``
     - Number of virtual functions per PF.
   * - ``sriov``
     - ``priority``
     - SriovNetworkNodePolicy priority.
   * - ``sriov``
     - ``resourceName`` / ``networkName``
     - Kubernetes resource and network names.
   * - ``hostdev``
     - ``resourceName`` / ``networkName``
     - Kubernetes resource and network names for host-device.
   * - ``rdmaShared``
     - ``resourceName``
     - Kubernetes resource name.
   * - ``rdmaShared``
     - ``hcaMax``
     - Maximum HCAs per host (soft limit).
   * - ``ipoib``
     - ``networkName``
     - IPoIB network name.
   * - ``macvlan``
     - ``networkName``
     - MacVLAN network name.

================================================================================
nicConfigurationOperator
================================================================================

Controls when NIC interface names are templated by the NIC Configuration Operator.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Field**
     - **Description**
   * - ``deployNicInterfaceNameTemplate``
     - "Enable when needed". Templates are deployed when groups have cross-rail PCI conflicts or when names are otherwise ambiguous. See :doc:`../heterogeneous-clusters`.
   * - ``rdmaPrefix``
     - RDMA device naming template (default: ``rdma_r%rail%``).
   * - ``netdevPrefix``
     - Netdev naming template (default: ``eth_r%rail%``).

================================================================================
spectrumX
================================================================================

Spectrum-X-specific settings.

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - **Field**
     - **Description**
   * - ``nicType``
     - NIC type device ID. ``1023`` = ConnectX-8; ``a2dc`` = BlueField-3 SuperNIC.
   * - ``overlay``
     - Overlay mode.
   * - ``rdmaPrefix``
     - RDMA device naming template with ``%plane%`` and ``%rail%`` substitutions.
   * - ``netdevPrefix``
     - Netdev naming template with ``%plane%`` and ``%rail%`` substitutions.

================================================================================
workload
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - **Field**
     - **Description**
   * - ``manifest``
     - Path to a custom workload manifest. When set, Launch Kit patches it with network annotations, resource requests, and node affinity instead of generating an example DaemonSet. See :doc:`../workflows/generate`.

================================================================================
profile
================================================================================

Profile selection (also overridable via CLI flags).

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Field**
     - **Description**
   * - ``fabric``
     - ``ethernet`` or ``infiniband``.
   * - ``deployment``
     - ``sriov``, ``rdma_shared``, or ``host_device``.
   * - ``multirail``
     - Enable multirail.
   * - ``spectrumX.spcxVersion``
     - Spectrum-X reference architecture (``RA2.1`` or ``RA2.2``).
   * - ``spectrumX.multiplaneMode``
     - Multiplane mode: ``hwplb``, ``swplb``, ``uniplane``, ``none``.
   * - ``spectrumX.numberOfPlanes``
     - Number of planes.

================================================================================
clusterConfig
================================================================================

Discovered node groups, populated by ``l8k discover``. Each entry describes one group.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Field**
     - **Description**
   * - ``identifier``
     - Sanitised ``<machineType>-<gpuType>`` (e.g. ``dgx-b200-nvidia-h100-nvl``) when both fields are resolved; ``group-0`` / ``group-1`` fallback when they aren't. Used as the NicNodePolicy / SriovNetworkNodePolicy name suffix.
   * - ``machineType`` / ``productType``
     - Hardware type strings (e.g., ``DGX-B200`` / ``NVIDIA-B200``).
   * - ``capabilities.nodes.sriov`` / ``rdma`` / ``ib``
     - Boolean flags reflecting hardware capability.
   * - ``workerNodes``
     - List of node names in this group.
   * - ``nodeSelector``
     - Per-group selector. After ``l8k discover``, this is ``{nvidia.kubernetes-launch-kit.machine: <machineType>-<gpuType>}`` --- a label discovery writes onto every node in the group. When ``l8k generate`` auto-merges groups sharing a GPU type, the merged group falls back to ``{nvidia.kubernetes-launch-kit.gpu: <gpuType>}`` instead (different source machineTypes can't share a single machine label). Discovery writes both labels onto every node, so the merged selector has a value to bind to. Configs from earlier l8k versions with old-style differential nodeSelectors are preserved as-is.
   * - ``thirdPartyRDMAModules`` / ``storageModules``
     - OFED-dependent modules detected on the group.
   * - ``presetApplied``
     - ``true`` when a topology preset matched ``(machineType, gpuType)`` and was applied.
   * - ``presetDeviation``
     - List of field-level discrepancies between the matched preset and discovered hardware. Non-empty means the preset was applied but the cluster differs from the preset. Each entry has ``field`` (``pciAddress`` / ``deviceID``), ``expected``, ``got``, and ``detail``. See :doc:`../presets` "Validation and Deviations".
   * - ``linkType``
     - The discovered fabric for the group: ``Ethernet`` or ``InfiniBand``. Populated by the fabric probe only when **every** east-west port produces a confirmed verdict (port ACTIVE plus, for IB, a subnet manager is present) and they agree. When omitted, discovery couldn't prove the cluster's fabric — downstream code should treat the absence as "unknown". See :doc:`../workflows/discover` "Fabric Type Detection".
   * - ``pfs``
     - List of physical functions. Each entry has ``deviceID``, ``pciAddress``, ``rdmaDevice``, ``networkInterface``, ``traffic`` (``east-west`` or ``north-south``), and ``rail`` (sequential index for east-west PFs).

North-south PFs are listed for visibility but filtered out of generated manifests. See :doc:`../overview` and :doc:`../workflows/discover`.

================================================================================
See Also
================================================================================

- :doc:`CLI Reference <cli>` --- flag reference
- :doc:`Discover Workflow <../workflows/discover>` --- how this file is produced
- :doc:`Generate Workflow <../workflows/generate>` --- how this file is consumed
