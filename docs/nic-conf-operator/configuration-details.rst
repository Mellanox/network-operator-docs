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

==========================================
Configuration Details
==========================================


Configuration details
^^^^^^^^^^^^^^^^^^^^^

- ``numVFs``: if provided, configure SR-IOV VFs via nvconfig.

  - This is a mandatory parameter.
  - E.g: if ``numVFs=2`` then ``SRIOV_EN=1`` and ``SRIOV_NUM_OF_VFS=2``.
  - If ``numVFs=0`` then ``SRIOV_EN=0`` and ``SRIOV_NUM_OF_VFS=0``.

- ``linkType``: if provided configure ``linkType`` for the NIC for all NIC ports.

  - This is a mandatory parameter.
  - E.g ``linkType = Infiniband`` then set ``LINK_TYPE_P1=IB`` and ``LINK_TYPE_P2=IB`` if second PCI function is present

- ``pciPerformanceOptimized``: performs PCI performance optimizations. If enabled then by default the following will happen:

  - Set PCI max read request size for each PF to ``4096`` (note: this is a runtime config and is not persistent)
  - Users can override the runtime value via ``maxReadRequest``

- ``roceOptimized``: performs RoCE related optimizations. If enabled performs the following by default:

  - Nvconfig set for both ports (can be applied from PF0)

    - Conditionally applied for second port if present

      - ``ROCE_CC_PRIO_MASK_P1=255``, ``ROCE_CC_PRIO_MASK_P2=255``
      - ``CNP_DSCP_P1=4``, ``CNP_DSCP_P2=4``
      - ``CNP_802P_PRIO_P1=6``, ``CNP_802P_PRIO_P2=6``

  - Configure pfc (Priority Flow Control) for priority 3, set trust to dscp on each PF, set ToS (Type of Service) to 0.

    - Non-persistent (need to be applied after each boot)
    - Users can override values via ``trust``, ``pfc`` and ``tos`` parameters

  - Can only be enabled with ``linkType=Ethernet``

- ``gpuDirectOptimized``: performs gpu direct optimizations. ATM only optimizations for Baremetal environment are supported. If enabled perform the following:

  - Set nvconfig ``ATS_ENABLED=0``
  - Can only be enabled when ``pciPerformanceOptimized`` is enabled
  - Both the numeric values and their string aliases, supported by NVConfig, are allowed (e.g. ``REAL_TIME_CLOCK_ENABLE=False``, ``REAL_TIME_CLOCK_ENABLE=0``).
  - For per port parameters (suffix ``_P1``, ``_P2``) parameters with ``_P2`` suffix are ignored if the device is single port.

- ``spectrumXOptimized``: enables Spectrum-X specific NIC optimizations. When enabled:

  - Requires ``linkType=Ethernet`` and ``numVfs=1``
  - Cannot be combined with ``roceOptimized`` (RoCE settings are included automatically)
  - Native NVConfig precedence is ``rawNvConfig`` > template-derived parameters > doSPCX. Validation uses DMS GET ``_nvconfig`` metadata to recognize overridden typed leaves and checks their native current/next-boot values, so intentional overrides converge after reboot
  - Requires a DMS build containing NVConfig GET mapping metadata support (DOCA change 1508833) when native parameters accompany typed intent. Missing mappings fail validation before apply, including with ``force``. For ``/nvidia/link/type/value`` and indexed breakout ``planes`` only, the operator reuses the current mapping when the pending mapping is absent to support DMS builds missing that declaration; conflicting mappings still fail validation
  - Raw ``MODULE_SPLIT_*`` assignments cannot be combined with typed breakout lane operations: DMS does not yet expose composite lane ownership
  - Temporarily cannot be combined with ``networkBay``; complete native ownership is required to place the system profile below typed doSPCX intent
  - Only supported on ConnectX-7 (``nicType: 1021``), ConnectX-8 (``nicType: 1023``), ConnectX-9 (``nicType: 1025``) and BlueField-3 SuperNIC (``nicType: a2dc``)
  - ``version``: Required. Spectrum-X architecture version passed to the doSPCX planner
  - ``platformType``: Required. doSPCX platform identifier defined by the supplied Blueprints profile
  - ``overlay``: Optional, default ``none``. Set to ``l3`` for L3 EVPN overlay
  - ``multiplaneMode``: Optional, default ``none``. Options: ``none``, ``swplb``, ``hwplb``
  - ``numberOfPlanes``: Optional, default ``1``. Options: ``1``, ``2``, or ``4``

- If a configuration is not set in spec, its non-volatile configuration parameters (if any) should be set to device default.

Spectrum-X Configuration
^^^^^^^^^^^^^^^^^^^^^^^^

The planner profile is selected from ``platformType`` and ``multiplaneMode``:

+-----------------------+----------------------------------+-----------------------------------------------------------+
| Platform              | Mode                             | doSPCX profile                                            |
+=======================+==================================+===========================================================+
| ``rtx``               | ``none`` (or omitted)            | ``rtx``                                                   |
+-----------------------+----------------------------------+-----------------------------------------------------------+
| ``vr``                | ``swplb``                        | ``vr-SPX_NetPlugin``                                      |
+-----------------------+----------------------------------+-----------------------------------------------------------+
| ``vr``                | ``hwplb``                        | ``vr-SPX_Multiplane``                                     |
+-----------------------+----------------------------------+-----------------------------------------------------------+
| Other platforms       | ``none`` / ``swplb`` / ``hwplb`` | ``single-plane`` / ``SPX_NetPlugin`` / ``SPX_Multiplane`` |
+-----------------------+----------------------------------+-----------------------------------------------------------+

RTX rejects multiplane modes; VR rejects single-plane mode. The supplied data bundle must contain the selected profile and support the requested hardware. VR profile selection alone does not provide complete VR support: target-map construction still lacks the two-NIC-per-rail layout and ``nic_index_in_rail``, and the CRD does not yet allow eight planes for VR hardware multiplane.

Spectrum-X configuration is compiled from the doSPCX data bundle published by the ``dospcx-data`` repository. The labeled ConfigMap contains a versioned format marker and a gzip-compressed archive of the complete doSPCX data tree:

.. code:: yaml

   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: doscpx-data-main
     labels:
       network.nvidia.com/operator.nic-configuration.spectrum-x-profile: ""
   data:
     format: dospcx-data.tar.gz/v1
   binaryData:
     dospcx-data.tar.gz: <base64-encoded-archive>

The Kubernetes API decodes ``binaryData`` before it reaches the daemon. The daemon validates and extracts the archive with the Go standard library, then replaces ``/opt/mellanox/doca/services/dms/doSpcx/data`` with the restored ``data/`` tree. Archive paths must remain under ``data/``; links, special files, path traversal, oversized archives, and incomplete doSPCX layouts are rejected. A failed update leaves the previous valid tree in place. Exactly one labeled doSPCX data bundle may exist cluster-wide; multiple bundles are rejected instead of selecting one based on reconciliation order, and manager-installed data is deactivated while the conflict exists. Removing the active bundle removes the data installed from it and invalidates plans cached with its digest.

Select the architecture and platform inputs in a ``NicConfigurationTemplate``:

.. code:: yaml

   spectrumXOptimized:
     enabled: true
     version: "ra2.2"
     platformType: "gb300"
     overlay: "none"
     multiplaneMode: "none"
     numberOfPlanes: 1

Supported NIC types for Spectrum-X: \* ConnectX-7 (device ID ``1021``) – supports ``none`` only (single-plane) \* ConnectX-8 (device ID ``1023``) – supports ``none``, ``swplb``, and ``hwplb`` \* ConnectX-9 (device ID ``1025``) – supports ``none``, ``swplb``, and ``hwplb`` \* BlueField-3 SuperNIC (device ID ``a2dc``) – supports ``none`` and ``swplb``

doSPCX profiles can configure NICs with multiple data planes. Available modes:

+-----------+-------------------------------+--------------------------------------------------+------------+
| Mode      | Description                   | Supported NICs                                   | Planes     |
+===========+===============================+==================================================+============+
| ``none``  | Single plane (default)        | ConnectX-7, ConnectX-8, ConnectX-9, BF3 SuperNIC | 1          |
+-----------+-------------------------------+--------------------------------------------------+------------+
| ``swplb`` | Software Plane Load Balancing | ConnectX-8, ConnectX-9, BF3 SuperNIC             | 2, 4       |
+-----------+-------------------------------+--------------------------------------------------+------------+
| ``hwplb`` | Hardware Plane Load Balancing | ConnectX-8, ConnectX-9 only                      | 2, 4       |
+-----------+-------------------------------+--------------------------------------------------+------------+

``spectrumx.SpectrumXManager`` includes the ``spectrumx.PlanManager`` interface. Before the controller starts its existing concurrent per-device NV apply, it calls ``PreparePlan`` once for the node’s Spectrum-X device group with the ``prepare`` stage. It does the same with the ``configure`` stage before the existing concurrent runtime apply. Plan preparation itself never executes generated plan operations. ``PreparePlan`` parses the host-k8s ``plan.semantic.groups`` contract once and caches a homogeneous configuration plan in memory. The compiled form contains only three execution inputs: ordered ``breakout`` and ``post-breakout`` XPath operation slices for the prepare stage, and ordered runtime operation groups for the configure stage. Device targeting remains the responsibility of the configuration manager when it consumes the plan. ``GetPreparedPlan`` validates the requesting device’s inputs and membership against the cache; it does not reread or reparse files for every per-device apply. During NV validation, the configuration manager separately queries the existing template-derived native parameter map and the active doSPCX XPath phase. During NV apply, it sends both inputs in one DMS action per discovered PCI function, using local port 1 consistently with validation. Each batch includes that function’s supported native overrides. Breakout must match current and pending state on all device ports before post-breakout is considered. ``force`` applies the complete breakout plus post-breakout intent immediately; after the breakout barrier, ``with-default`` also resends both phases so default filling cannot undo breakout. Semantic group references are authoritative, and an omitted operation kind means ``set``, matching DMS. Configure groups ``eswitch`` and ``vf-lifecycle`` are intentionally omitted from the compiled plan; unknown groups fail closed. Plan compilation remains execution-free.

At runtime, the configuration manager validates the final desired value of every operation group on each applicable PCI function. Repeated writes remain ordered during apply, while validation compares the last write for each path and leaf across all scope and target-class batches that apply to that function. Validation keeps different scope and target-class pairs in separate DMS commands. Generic runtime configuration is applied first and doSPCX groups are applied last in semantic order. The ``cc`` group starts ``doca_spcx_cc`` before its XPath operations; in HWPLB mode it uses the first function of each NIC because the functions share one RDMA device. Other groups are applied to every discovered function. Indexed XPath queries are issued individually until DMS preserves indexed keys in batched JSON responses.

The NIC Configuration Daemon image must contain the executable at ``/opt/mellanox/doca/tools/doca_spcx_cc``; the STIG daemon images install the ``doca-spcx-cc`` package during their build. The deprecated ``NicFirmwareSource.spec.docaSpcXCCUrlSource`` field does not install or select the runtime executable. When migrating to doSPCX plans, remove that field from firmware sources and ensure any custom daemon image provides the binary.

NCO translates its CRD multiplane modes to the public profiles supplied by the doSPCX data bundle: ``none`` selects ``single-plane``, ``swplb`` selects ``SPX_NetPlugin``, and ``hwplb`` selects ``SPX_Multiplane``.

The manager creates its command executor internally. The executable DMS planner remains part of the daemon base image and resolves its authored catalog from the native DMS location where the labeled doSPCX data ConfigMap restores it: ``/opt/mellanox/doca/services/dms/doSpcx/data``. When ``PreparePlan`` is called, files are written to:

.. code:: text

   /var/lib/blueprints/target-maps/nco-<node>-spcx.json
   /var/lib/blueprints/plans/nco-<node>-spcx-prepare/plan.json
   /var/lib/blueprints/plans/nco-<node>-spcx-prepare/metadata.json
   /var/lib/blueprints/plans/nco-<node>-spcx-configure/plan.json
   /var/lib/blueprints/plans/nco-<node>-spcx-configure/metadata.json

NICs are sorted by function-zero BDF and assigned deterministic target-map rail IDs. NCO writes the doSPCX schema-v1 target-map contract: every pre-breakout target has an ID, function-zero BDF, hexadecimal device ID, ``ew`` role, and rail. The same pre-breakout target map is passed to both stages; during ``configure``, doSPCX resolves the post-breakout inventory after NVConfig is active. The planner does not read ``interfaceNameTemplate``; interface naming remains an independent NCO capability.

Each stage stores a flat metadata document containing only the planner inputs, including the platform, Spectrum-X settings, planner parameters, doSPCX data archive digest, and target-map digest. Repeated calls in the same process reuse the in-memory plan. After a process restart, ``PreparePlan`` loads and compiles the saved plan once when that metadata still matches, the target-map digest is unchanged, and the semantic operations compile under NCO’s execution policy. Any input change or invalid saved artifact regenerates the plan through ``dms-cli``. Before applying an individual Spectrum-X device, the configuration manager calls ``GetPreparedPlan`` and fails without changing the device if the stage-specific plan is missing, stale, or its target map does not contain that device.

Set ``BLUEPRINTS_STATE_DIR`` to override ``/var/lib/blueprints``.

`Example Spectrum-X NicConfigurationTemplate with multiplane <docs/examples/spectrum-x/example-nicconfigurationtemplate-spectrum-x-multiplane.yaml>`__:
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. code:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicConfigurationTemplate
   metadata:
     name: spectrum-x-multiplane-configuration
     namespace: nvidia-network-operator
   spec:
     nodeSelector:
         feature.node.kubernetes.io/network-sriov.capable: "true"
     nicSelector:
         nicType: "1023" # ConnectX-8. Use "1025" for ConnectX-9, or "a2dc" for BlueField-3 SuperNIC (hwplb not supported on BF3). ConnectX-7 (`1021`) is single-plane only.
         # partNumbers:
         #   - "MCX713106AEHEA_QP1"
     template:
         numVfs: 1
         linkType: Ethernet
         spectrumXOptimized:
             enabled: true
             version: "ra2.2"
             overlay: "none"
             multiplaneMode: "hwplb" # Hardware Plane Load Balancing, ConnectX-8, ConnectX-9 only
             numberOfPlanes: 4
