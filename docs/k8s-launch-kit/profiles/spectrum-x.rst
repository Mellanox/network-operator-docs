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

************
Spectrum-X
************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Use Case
================================================================================

NVIDIA Spectrum-X multi-rail AI interconnect for Ethernet fabrics. Combines SR-IOV with multiplane load balancing to scale GPU-to-GPU bandwidth across switch tiers.

The RA version is the value of ``--spectrum-x``. Select the profile that matches the Network Operator release and its NIC configuration data format:

.. list-table::
   :header-rows: 1
   :widths: 14 22 30 34

   * - **RA**
     - **Release**
     - **Profile directory**
     - **Notes**
   * - ``RA2.4``
     - ``26.10`` and newer catalogued releases
     - ``spectrum-x-ra2.4``
     - Profile ConfigMap and per-group ``platformType``. Requires matching NIC Configuration Operator CRDs.
   * - ``RA3.1``
     - ``26.10`` and newer catalogued releases
     - ``spectrum-x-ra3.1``
     - Accepted by the CLI using the same doSPCX contract; this guide targets RA2.4.
   * - ``RA2.3``
     - ``26.7``
     - ``spectrum-x``
     - Legacy YAML ``data.profile`` ConfigMap. Restricted to 26.7.
   * - ``RA2.2``
     - ``26.4``
     - ``spectrum-x-ra2.2``
     - Uses v1alpha2 ``SpectrumXRailPoolConfig`` with built-in NIC tuning.
   * - ``RA2.1``
     - ``26.1``
     - ``spectrum-x-ra2.1``
     - Uses ``SriovNetworkPoolConfig`` + ``SriovNetworkNodePolicy`` + ``OVSNetwork`` with NV-IPAM glue.

If the release and RA version are mismatched, Launch Kit reports an error. Pass the release explicitly when using a saved configuration that selects another release. RA2.3 output cannot be deployed unchanged with the 26.10 configuration API.

For deeper Spectrum-X background, see :doc:`Spectrum-X Configuration <../../spectrum-x/spectrum-x-configuration>`.

================================================================================
RA2.4: Profile ConfigMap
================================================================================

Use the full published ConfigMap with ``data.format: dospcx-data.tar.gz/v1``
and ``binaryData.dospcx-data.tar.gz``. Raw legacy ``data.profile`` YAML is
not accepted for RA2.4. Launch Kit preserves the ConfigMap contents and source
annotations, supplies the Network Operator namespace and discovery label,
and renders it once for the selected groups.

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml --spectrum-x RA2.4 \
       --network-operator-release 26.10 \
       --spectrum-x-config ./spectrum-x-profile-configmap.yaml \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode hwplb --number-of-planes 2 \
       --save-deployment-files ./deployment-ra24 --output json

The topology file may use reference-generator or supported NVIDIA AIR JSON. Every selected ``workerNodes`` name must match a host endpoint exactly, including case and FQDN form, and every required rail/plane link must be represented. Keep the topology and profile with the saved source configuration. If a saved configuration explicitly has ``multirail: false``, select ``--multirail`` when enabling Spectrum-X.

The NIC template receives ``version: RA2.4``, independently of the
ConfigMap name. Launch Kit derives each group's ``platformType`` from
``clusterConfig[].gpuType`` (a ``machineType`` containing ``VR`` takes precedence) using the platform identifiers ``h100``,
``h200``, ``b200``, ``gb200``, ``b300``, ``gb300``, ``rtx``, and ``vr``.
Unknown or ambiguous GPU platforms prevent RA2.4 generation. The supplied
profile must support the selected platform and hardware layout. Platform recognition and successful rendering do not establish RA hardware qualification.

For the platform-to-``platformType`` mapping, NIC IDs, plane counts, and
PF/VF totals, see :ref:`spectrum-x-platform-configuration`.

.. important::

   The installed NIC Configuration Operator must support the current
   profile format and expose ``spectrumXOptimized.platformType`` as a
   string in the served ``NicConfigurationTemplate`` CRD. Older 26.10
   betas, including beta.2, do not meet this requirement. Launch Kit
   checks API compatibility before applying the profile ConfigMap and NIC
   templates, including during dry-run. Generation alone does not prove
   that the installed APIs are compatible.

Optional settings use the following configuration keys:

.. code-block:: yaml

   spectrumX:
     ovsConfig:
       max-idle: "0"
   clusterConfig:
     - identifier: machine-a
       gpuType: NVIDIA-GB300
       spectrumX:
         swPlaneByRail:
           0: 0
           1: 1

This is a fragment to merge into the discovered configuration.
``spectrumX.ovsConfig`` is a string map rendered into the rail-pool
``spec.ovsConfig``. Per-group ``spectrumX.swPlaneByRail`` maps existing
east-west rail IDs to ``swPlane`` offsets; omitted assignments mean zero.
Nonzero offsets require ``hwplb``. See :doc:`Architecture and Components
<../../spectrum-x/components>` for their OVS meaning.

RA2.4 generation requires dense zero-based rail IDs and a uniform physical
NIC count per rail that divides the plane count. PFs of one physical NIC
must remain on one rail. Groups merged into a rail pool must agree on
layout and effective switch-plane assignments. Current generation permits
one rail-pool parent: a complete compatible GPU/rail-count cohort or one
source selected with ``--groups``.

Review the generated profile ConfigMap, selectors, addresses, and templates, then use
``l8k deploy --deployment-files ./deployment-ra24 --dry-run`` before
deployment and ``l8k validate --deployment-files ./deployment-ra24 --wait 10m``
after deployment. Discovery refresh can drop switch-plane assignments when
worker membership or hardware changes; review them before regenerating.

================================================================================
The RA2.3 Profile ConfigMap
================================================================================

For Network Operator 26.7.x, RA2.3 uses a legacy profile ConfigMap. The following examples are for that release line, not the RA2.4 configuration workflow. Pass its contents with ``--spectrum-x-config``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.3 \
       --network-operator-release 26.7 \
       --spectrum-x-config ./spectrum-x-profile.yaml \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode swplb --number-of-planes 2

The file may be either a full ConfigMap manifest or just the YAML that belongs under its ``data.profile`` key. With raw ``data.profile`` YAML, also pass ``--spectrum-x-configmap-name`` to name the generated ConfigMap; with a full manifest, the name comes from ``metadata.name``.

Launch Kit renders the ConfigMap into the Network Operator namespace with the label the NIC Configuration Operator watches, and sets ``spectrumXOptimized.version`` on the generated ``NicConfigurationTemplate`` to the ConfigMap's name.

The ``RA2.3`` profile also sets ``pciPerformanceOptimized`` on that template, with ``maxReadRequest: 4096`` --- the largest PCIe read request size the API accepts. The values are fixed and not configurable from the cluster configuration. The ``RA2.1`` profile does not set this field.

================================================================================
Multiplane Modes
================================================================================

The ``--multiplane-mode`` flag selects how planes are mapped onto NICs. ``--spectrum-x`` implies ethernet fabric, sriov deployment, and multirail.

When omitted, mode and plane count are derived from east-west NICs and the GPU platform. ConnectX-7 and BlueField-3 default to ``none`` with one plane. ConnectX-8 uses ``none`` with one plane for H100/H200/B200/GB200/RTX, and ``swplb`` with two planes for B300/GB300 or an unrecognised platform. ConnectX-9 falls back to ``hwplb`` with four planes; VR HWPLB with RA2.4 defaults to eight. Explicit configuration and flags override defaults. Select the mode and count required by the validated fabric and profile; generator defaults do not qualify a platform.

HWPLB
------

Hardware Plane Load Balancing for larger-scale clusters with 2-tier or 3-tier switch topologies. Requires ConnectX-8 SuperNIC or ConnectX-9 SuperNIC:

.. code-block:: bash

   l8k generate --spectrum-x RA2.4 \
       --network-operator-release 26.10 \
       --spectrum-x-config ./spectrum-x-profile-configmap.yaml \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode hwplb --number-of-planes 4

SWPLB
------

Software Plane Load Balancing for smaller-scale Spectrum-X clusters. Generates separate resources per-rail per-plane:

.. code-block:: bash

   l8k generate --spectrum-x RA2.4 \
       --network-operator-release 26.10 \
       --spectrum-x-config ./spectrum-x-profile-configmap.yaml \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode swplb --number-of-planes 2

None (Single Plane)
--------------------

No multiplane separation. Use with ConnectX-7 NIC, BlueField-3 SuperNIC, or simple topologies. ``none`` requires ``--number-of-planes 1``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.4 \
       --network-operator-release 26.10 \
       --spectrum-x-config ./spectrum-x-profile-configmap.yaml \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode none --number-of-planes 1

Side-by-side comparison of the three modes:

.. mermaid::

   flowchart TB
       subgraph HWPLB[HWPLB - hardware load balancing]
           H_NIC[NIC]
           H_NIC -->|HW LB| H_P1[Plane 1]
           H_NIC -->|HW LB| H_P2[Plane 2]
       end
       subgraph SWPLB[SWPLB - software load balancing]
           S_NIC[NIC] --> S_OVS[OVS]
           S_OVS -->|SW LB| S_P1[Plane 1]
           S_OVS -->|SW LB| S_P2[Plane 2]
       end
       subgraph NONE[None - single plane]
           N_NIC[NIC] --> N_NET[Standard network]
       end

================================================================================
NIC Types, Defaults, and Accepted Modes
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 26 12 28 34

   * - **NIC Type**
     - **Device ID**
     - **Hardware default**
     - **Modes accepted**
   * - ConnectX-7 NIC
     - ``1021``
     - ``none``, 1 plane
     - ``none``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none``, 1 plane
     - ``none``, ``swplb``
   * - ConnectX-8 SuperNIC
     - ``1023``
     - platform-dependent --- see above
     - ``none``, ``swplb``, ``hwplb``
   * - ConnectX-9 SuperNIC
     - ``1025``
     - ``hwplb``, 4 planes (VR: 8)
     - ``none``, ``swplb``, ``hwplb``

**Hardware default** is the mode and plane count Launch Kit picks when
``--multiplane-mode`` and ``--number-of-planes`` are omitted.

**Modes accepted** is what the generated manifests will pass. Launch Kit itself
does not restrict modes per NIC --- ``--multiplane-mode`` takes ``none``,
``swplb``, or ``hwplb`` for any NIC --- but the ``NicConfigurationTemplate`` API
rejects ``hwplb`` on anything other than ConnectX-8 SuperNIC or ConnectX-9
SuperNIC. Passing a mode outside this column generates manifests the cluster
will refuse.

.. note::

   Accepted generation modes and NIC IDs are software capabilities. Use the RA2.4 platform matrix and a validated doSPCX bundle for the exact hardware; do not infer support or performance qualification from successful generation. In particular, VR eight-plane generation requires four dual-NIC rails, complete topology coordinates, and matching operator/profile support. It is not a claim that VR is qualified by RA2.4.

RA2.4 templates select both NIC type and the source group's east-west PCI addresses. Check that these selectors exclude north-south interfaces. Each source gets its own NIC template even when rail resources are merged.

Desired interface prefixes are configured under ``spectrumX.singlePlane``, ``spectrumX.hwplb``, and ``spectrumX.swplb`` and saved per group in ``spectrumX.interfaceNames``. Standard HWPLB uses ``eth_r%rail_id%_p%plane_id%`` and ``roce_r%rail_id%``. VR HWPLB uses ``roce_r%rail_id%_n%nic_id%`` and emits separate endpoints and pools for both NICs on each rail. Its eight-plane topology must describe all physical PF links and explicit reference-generator host indices. Review endpoint names and addresses against actual cabling before deployment.

================================================================================
DRA-Based Workload Allocation
================================================================================

By default the Spectrum-X profiles hand rails to workloads through the SR-IOV device plugin: the generated workload requests ``nvidia.com/rail<N>`` resources (``nvidia.com/rail<N>p<P>`` in ``swplb``). Setting ``profile.spectrumX.useDRA: true`` switches generation to Kubernetes Dynamic Resource Allocation (DRA) instead, so the rails of one node can be claimed by more than one workload.

``useDRA`` is config-only --- there is no CLI flag --- and defaults to ``false``:

.. code-block:: yaml

   profile:
     spectrumX:
       enable: true
       spcxVersion: "RA2.4"
       multiplaneMode: hwplb
       numberOfPlanes: 4
       useDRA: true

The key is honoured by RA2.2, RA2.3, and RA2.4 profiles. On ``RA2.1`` it is accepted but has no effect --- that profile carries no DRA templates, and Launch Kit does not report an error.

What changes in the generated manifests
----------------------------------------

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - **File**
     - **Difference when DRA is enabled**
   * - ``values.yaml``
     - Adds the SR-IOV Network Operator feature gate ``dynamicResourceAllocation: true``. The Spectrum-X profiles already set ``enableInjector: false``, which DRA also requires.
   * - ``80-spectrumxrailpoolconfig.yaml``
     - ``spec.draEnabled: true``. Launch Kit always renders this field explicitly, so with ``useDRA: false`` it writes ``false`` and overrides the CRD default of ``true``.
   * - ``85-resourceclaimtemplate.yaml``
     - New file, generated only when ``useDRA`` is ``true``. Holds one ``resource.k8s.io/v1`` ``ResourceClaimTemplate`` per rail (``none`` and ``hwplb``) or per rail-plane (``swplb``), rendered into the network namespace.
   * - ``90-example-daemonset.yaml``
     - The example workload references the generated templates through pod-level ``spec.resourceClaims`` and container-level ``resources.claims`` instead of ``nvidia.com/rail*`` requests and limits.

Each claim template requests a GPU from ``gpu.nvidia.com`` and VF resources from ``sriovnetwork.k8snetworkplumbingwg.io`` selected by the rail endpoint's resource name. RA2.4 VR uses one claim per logical rail with a VF request for each of its two NIC endpoints.

Prerequisites
--------------

- **Kubernetes 1.34 or later.** The generated templates use ``resource.k8s.io/v1``, which is only served from 1.34. Launch Kit does not check the cluster version, so on an older cluster the file is generated and then rejected on apply.
- **The DRA Driver for SR-IOV**, which publishes the ``sriovnetwork.k8snetworkplumbingwg.io`` device class. It is a Tech Preview feature, supported only on upstream Kubernetes with the SR-IOV Network Operator --- not on Red Hat OpenShift. See :doc:`DRA SR-IOV Driver <../../dra-sriov-driver/dra-sriov-driver>`.
- **The NVIDIA DRA Driver for GPUs**, which publishes the ``gpu.nvidia.com`` device class. Neither Launch Kit nor the Network Operator installs it; without it, the ``gpu`` request in every generated claim is unallocatable.
- **No SR-IOV device plugin.** DRA and the SR-IOV device plugin cannot run on the same cluster. Changing an existing device-plugin deployment to DRA requires a reviewed migration of its policies and workloads; generation does not perform that migration.

Limitations
------------

- **A rail is the smallest unit of sharing.** ``SpectrumXRailPoolConfig`` and ``NicConfigurationTemplate`` both render ``numVfs: 1`` --- ``spectrumXOptimized`` is rejected by the API for any other value --- so several workloads on one node must take different rails; they cannot share a rail.
- **The generated example workload still claims every rail.** Running several workloads on a node means authoring a workload that references only the subset of ``ResourceClaimTemplate`` resources it needs.
- **No automatic GPU-to-rail mapping.** Each template names one rail, fixed at generation time. The scheduler is not asked to choose the rail closest to the allocated GPU.
- **Topology selectors depend on inventory and driver attributes.** Claim templates can emit absolute ``pcieRoot`` selectors from saved GPU/PF PCI data; they do not emit a relative ``constraints`` / ``matchAttribute`` block. Verify the driver advertises the required attributes and that the selected topology is supported.
- **Not all target platforms are supported by the driver.** On NVIDIA GB300 NVL72, Vera Rubin NVL72, and HGX Rubin NVL8 systems the PCIe root used to match a NIC to a GPU is the root of the NIC's Data Direct sub-interface, and the DRA SR-IOV driver does not currently support that topology. Generated DRA YAML does not establish driver support for those topologies; confirm the driver's platform limitations before choosing DRA.

================================================================================
Pinning to RA2.1
================================================================================

To target Network Operator 26.1, pass ``RA2.1`` to ``--spectrum-x``. ``--spectrum-x-config`` does not apply --- RA2.1 carries its Spectrum-X settings in the CRDs themselves.

.. code-block:: bash

   l8k generate --spectrum-x RA2.1 \
       --network-operator-release 26.1 \
       --topology-scheme 2-tier --topology-file ./topology.json \
       --multiplane-mode swplb --number-of-planes 2

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Spectrum-X Configuration <../../spectrum-x/spectrum-x-configuration>` --- background and CRD details
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``spectrumX`` config section
- :doc:`DRA SR-IOV Driver <../../dra-sriov-driver/dra-sriov-driver>` --- driver installation, prerequisites, and limitations for ``useDRA``
