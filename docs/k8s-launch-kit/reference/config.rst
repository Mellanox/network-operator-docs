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

The Launch Kit configuration file (typically ``cluster-config.yaml``, produced by ``l8k discover`` and consumed by ``l8k generate``) is YAML. This page covers host networking settings and the generated bundle contract. Use discovery output as the editable starting point; default configuration and presets are embedded in the binary, while matching profile templates are installed alongside it.

================================================================================
Configuration Example
================================================================================

.. code-block:: yaml
   :substitutions:

   flavor: k8s
   networkNamespaces: [default]

   networkOperator:
     selectedRelease: "26.10"
     skipHelmChart: false
     secondaryNetwork:
       multus: auto
       cniPlugins: auto
     version: |k8s-launch-kit-version|
     componentVersion: |k8s-launch-kit-component-version|
     repository: |k8s-launch-kit-network-operator-repository|
     namespace: nvidia-network-operator
     imagePullSecrets: []

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
     rdmaPrefix: "rdma_r%rail_id%"
     netdevPrefix: "eth_r%rail_id%"

   spectrumX:
     overlay: none
     singlePlane:
       netdevPrefix: "eth_r%rail_id%"
       rdmaPrefix: "roce_r%rail_id%"
     hwplb:
       netdevPrefix: "eth_r%rail_id%_p%plane_id%"
       rdmaPrefix: "roce_r%rail_id%"
     swplb:
       netdevPrefix: "eth_r%rail_id%_p%plane_id%"
       rdmaPrefix: "roce_r%rail_id%_p%plane_id%"
     ovsConfig: {}

   workload:
     manifest: ""

   profile:
     fabric: ethernet
     deployment: sriov
     multirail: false
     routing: destination-based
     spectrumX:
       enable: false

   maintenance:
     maxParallelOperations: 4
     maxUnavailable: 4
     maxNodeMaintenanceTimeSeconds: 3600
     maxParallelUpgrades: 4

   validation:
     connectivity: true
     mode: strict
     checks: [icmp, rping, ib_write_bw]
     gpuDirect:
       enabled: false
       gpuResourceType: nvidia.com/gpu

   clusterConfig:
   - identifier: "dgx-b200-nvidia-b200"
     machineType: "DGX-B200"
     gpuType: "NVIDIA-B200"
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
     - Pin to a release line. Supported: ``26.1``, ``26.4``, ``26.7``, ``26.10``. Auto-fills ``version`` and image tags from an embedded catalog. Equivalent to the ``--network-operator-release`` flag.
   * - ``version``
     - Explicit Network Operator version when no release catalog selection is set. A nonempty ``selectedRelease`` replaces catalog-managed versions and repositories.
   * - ``componentVersion``
     - Tag for component images (CNI, device plugins, etc.).
   * - ``repository``
     - Container registry (default: ``nvcr.io/nvidia/mellanox``).
   * - ``namespace``
     - Operator namespace (default: ``nvidia-network-operator``).
   * - ``imagePullSecrets``
     - List of secret names. Propagated to ``NicClusterPolicy.spec.global.imagePullSecrets`` and per-group ``NicNodePolicy`` sub-specs.
   * - ``skipHelmChart``
     - External Helm ownership. Omits ``values.yaml`` and skips Helm management/checks; custom-resource preflight and apply remain active.
   * - ``operatorRepository`` / ``helmRepoURL``
     - Operator image registry and Helm chart repository, distinct from component ``repository``.
   * - ``secondaryNetwork.multus`` / ``secondaryNetwork.cniPlugins``
     - Independent ownership policies: ``auto``, ``managed``, or ``external``. Automatic resolution uses discovery evidence; external sections are omitted. Ownership conflicts block apply even with overwrite.

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
     - Skip the driver init-container module dependency check. Does not skip discovery.

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
     - Explicit list of ``{subnet, gateway}`` entries. A nonempty list takes precedence over the auto-generation fields.
   * - ``startingSubnet``
     - First subnet for auto-generation (e.g., ``192.168.2.0``).
   * - ``mask``
     - Prefix length for auto-generated subnets.
   * - ``offset``
     - Increment used between auto-generated subnets.
   * - ``perNodeBlockSize``
     - Addresses allocated per node in standard-profile IPPools (default ``10``).
   * - ``reserveFirstIPs`` / ``reserveLastIPs``
     - Reserve address ranges in every standard-profile subnet. Per-subnet ``exclusions`` may specify additional ``startIP`` / ``endIP`` ranges.

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
     - Enable naming templates (default ``true``). A single standard-profile source with observed interface names can use existing names without emitting a template; Spectrum-X keeps required naming. See :doc:`../heterogeneous-clusters`.
   * - ``rdmaPrefix``
     - RDMA device naming template (default: ``rdma_r%rail_id%``).
   * - ``netdevPrefix``
     - Netdev naming template (default: ``eth_r%rail_id%``).

================================================================================
spectrumX
================================================================================

Spectrum-X-specific settings.

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - **Field**
     - **Description**
   * - ``overlay``
     - Overlay mode.
   * - ``singlePlane`` / ``hwplb`` / ``swplb``
     - Mode-specific ``rdmaPrefix`` and ``netdevPrefix`` maps. Use ``%rail_id%`` and, where appropriate, ``%plane_id%``. VR HWPLB RDMA names additionally require ``%nic_id%``.
   * - ``ovsConfig``
     - RA2.4 string map for OVS ``other_config`` overrides. Omitted keys retain operator defaults.

NIC type and PCI selectors are derived from each source group's east-west PF inventory; there is no ``spectrumX.nicType`` setting.

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
     - Enable multirail. Explicit ``false`` is preserved in YAML and on the CLI.
   * - ``routing``
     - ``destination-based`` or ``source-based``; connectivity requires an explicit resolved decision.
   * - ``ignoreARP``
     - Standard-profile ARP tuning. OpenShift requires the relevant Multus tuning allowlist entries.
   * - ``spectrumX.enable``
     - Enable Spectrum-X profile selection. Set this with ``spcxVersion`` for a YAML-only selection.
   * - ``spectrumX.spcxVersion``
     - Spectrum-X reference architecture; see :doc:`../profiles/spectrum-x` for the release matrix and RA2.4 contract.
   * - ``spectrumX.multiplaneMode``
     - Multiplane mode: ``hwplb``, ``swplb``, ``none``.
   * - ``spectrumX.numberOfPlanes``
     - Number of planes.
   * - ``spectrumX.topologyType``
     - Topology scheme for Spectrum-X IP allocation: ``2-tier`` or ``3-tier``. Required for Spectrum-X. Equivalent to ``--topology-scheme``.
   * - ``spectrumX.ipVersion``
     - IP version for Spectrum-X address allocation: ``ipv4`` (default) or ``ipv6``. Equivalent to ``--ip-version``.
   * - ``spectrumX.topologyFile``
     - Path to a spcx-gen/reference-generator or NVIDIA AIR topology JSON. Required for Spectrum-X generation --- the profiles always render ``CIDRPool`` resources. Equivalent to ``--topology-file``.
   * - ``spectrumX.hostFirstOctet``
     - First octet used for IPv4 host allocation. Config-only --- there is no CLI flag. Traditional layouts default to ``172`` for ``2-tier`` and ``10`` for ``3-tier``. VR defaults to ``240`` and requires ``240``–``255``. No effect when ``ipVersion`` is ``ipv6``.
   * - ``spectrumX.profile``
     - Inline profile contents as a YAML string, not a filename. RA2.4 requires the complete doSPCX ConfigMap; RA2.3 accepts a full legacy ConfigMap or raw ``data.profile``. ``--spectrum-x-config`` reads those contents from a file.
   * - ``spectrumX.configMapName``
     - Name for the generated profile ConfigMap. Required only when ``spectrumX.profile`` holds raw ``data.profile`` YAML. Equivalent to ``--spectrum-x-configmap-name``.
   * - ``spectrumX.ipv6SiteID``
     - VR IPv6 site nibble, ``0``–``15`` (default ``0``); config-only.
   * - ``spectrumX.useDRA``
     - Generate DRA ``ResourceClaimTemplate`` resources and a claim-based example workload instead of SR-IOV device-plugin resource requests. Config-only --- there is no CLI flag. Defaults to ``false``. Requires Kubernetes 1.34 or later and the DRA Driver for SR-IOV --- see :doc:`../profiles/spectrum-x`.

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
   * - ``machineType`` / ``gpuType``
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
     - The discovered fabric for the group: ``Ethernet`` or ``InfiniBand``. Populated only when the configured link layers of all selected workers and east-west PF ports are readable and agree. Link state and subnet-manager presence do not gate detection. When omitted, discovery couldn't prove the cluster's fabric — downstream code should treat the absence as "unknown". See :doc:`../workflows/discover` "Fabric Type Detection".
   * - ``spectrumX.platformType`` / ``spectrumX.interfaceNames``
     - Derived RA platform and desired mode-specific naming. Recomputed during discovery/resolution; not user platform overrides.
   * - ``spectrumX.swPlaneByRail``
     - RA2.4 switch-plane offsets keyed by existing rail IDs. Nonzero values require HWPLB; refresh can drop assignments if hardware or membership changes.
   * - ``netplanManaged`` / ``netplanManagementUnknown``
     - Confirmed or uncertain host netplan naming ownership. A confirmed conflict blocks naming-template generation; uncertainty warns.
   * - ``pfs``
     - List of physical functions. Each entry has ``deviceID``, ``pciAddress``, ``rdmaDevice``, ``networkInterface``, ``traffic`` (``east-west`` or ``north-south``), and ``rail`` (sequential index for east-west PFs).

North-south PFs are listed for visibility but filtered out of generated manifests. See :doc:`../overview` and :doc:`../workflows/discover`.

================================================================================
Platform, Maintenance, and Validation Settings
================================================================================

``flavor`` selects ``k8s`` or ``ocp``. ``networkNamespaces`` lists secondary-network and workload namespaces. OpenShift operator packages are externally installed; optional ``sriov.operatorNamespace``, ``maintenance.operatorNamespace``, and ``nfd.operatorNamespace`` / ``nfd.configurationName`` identify their resources. Use the OpenShift installation guidance before discovery and deployment.

``maintenance`` controls node maintenance concurrency: ``maxParallelOperations`` (positive integer or percentage), ``maxUnavailable`` (nonnegative integer or percentage), ``maxNodeMaintenanceTimeSeconds`` (nonnegative seconds), and legacy OFED ``maxParallelUpgrades`` (nonnegative integer; zero means unlimited). Review these budgets before applying disruptive driver or NIC configuration.

``validation`` selects ``connectivity``, ``mode`` (``quick``, ``full``, ``strict``), and ``checks`` (``icmp``, ``rping``, ``ib_write_bw``). ``gpuDirect.enabled`` is an explicit decision; ``gpuDirect.gpuResourceType`` defaults to ``nvidia.com/gpu``. The ``rdma`` map controls ``rpingIterations``, ``ibWriteSize``, and ``ibWriteMinBandwidthGbps``. See :doc:`../workflows/validate` for acceptance semantics.

================================================================================
Deploy and Validate Configuration Lookup
================================================================================

Standalone deploy and validate select the first existing candidate:

#. Explicit ``--user-config`` (an unreadable explicit path is an error).
#. ``<deployment-files>/.l8k/resolved-config.yaml``.
#. ``<deployment-files>/../.l8k/resolved-config.yaml``.
#. ``<deployment-files>/../cluster-config.yaml``.
#. ``<deployment-files>/cluster-config.yaml``.
#. ``./cluster-config.yaml``.
#. With ``--config-dir``, its ``l8k-config.yaml`` only; otherwise local then installation share-directory ``l8k-config.yaml``.

The sidecar records the effective generation settings and is loaded without reapplying defaults or expanding the catalog. An explicit source configuration intentionally bypasses it. Keep the complete bundle, including ``.l8k``, when moving generated artifacts between systems.

================================================================================
See Also
================================================================================

- :doc:`CLI Reference <cli>` --- flag reference
- :doc:`Discover Workflow <../workflows/discover>` --- how this file is produced
- :doc:`Generate Workflow <../workflows/generate>` --- how this file is consumed
