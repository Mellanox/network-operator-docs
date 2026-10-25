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

***********************************
NVIDIA Spectrum-X NIC Configuration
***********************************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none


`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ in Network Operator 26.10 applies Spectrum-X settings from a **profile ConfigMap**. The ``spectrumXOptimized.version`` field selects the architecture version, and ``platformType`` selects the hardware platform. Neither field names the ConfigMap.

The examples on this page target the component versions shipped with Network Operator |network-operator-version|.

For the Network Operator Spectrum-X RA support matrix and validated hardware, operating system, and Kubernetes combinations, see :doc:`Platform Support <../platform-support>`.

Spectrum-X configuration applies to ConnectX-7 NIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC, and BlueField-3 SuperNIC; Hardware Plane Load Balancing (``hwplb``) additionally requires ConnectX-8 SuperNIC or ConnectX-9 SuperNIC. Device IDs and the modes each NIC accepts are listed under `NIC type constraints`_.

.. note::

   **ConnectX-9 SuperNIC support for Spectrum-X is Tech Preview.** The NIC
   Configuration Operator API accepts ConnectX-9 SuperNIC and applies Spectrum-X
   settings to it, but ConnectX-9 SuperNIC is **not part of Spectrum-X RA 2.3**
   and is not covered by an RA-validated configuration. Use it for evaluation
   only.

   ConnectX-9 SuperNIC remains fully supported by Network Operator for general
   RoCE and InfiniBand workloads — see :doc:`Platform Support
   <../platform-support>`.

====================================================
Install and Configure the NIC Configuration Operator
====================================================

To install the operator and for more information on the CRDs, see :doc:`NIC Firmware Configuration <../nic-conf-operator/nic-fw-configuration>` and :doc:`Configuration Details <../nic-conf-operator/configuration-details>`.

======================================
Apply the Spectrum-X Profile ConfigMap
======================================

Obtain the profile ConfigMap published for your deployment, or contact your NVIDIA CPM. Apply the complete ConfigMap as supplied, including its labels, annotations, and contents.

The following shows the required API format. Use the published ConfigMap rather than applying this placeholder example:

.. code-block:: yaml

   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: spectrum-x-profile
     namespace: nvidia-network-operator
     labels:
       network.nvidia.com/operator.nic-configuration.spectrum-x-profile: ""
   data:
     format: dospcx-data.tar.gz/v1
   binaryData:
     dospcx-data.tar.gz: <base64-encoded-archive>

.. code-block:: bash

   kubectl apply -f spectrum-x-profile-configmap.yaml

.. note::

   Admission checks the template fields, but does not establish that the profile supports the architecture, platform, and NIC combination. Check ``NicDevice`` conditions as described in :doc:`Verify and Troubleshoot <verify-and-troubleshoot>`.

================
Firmware Upgrade
================

If the firmware on the devices needs to be updated, extend the NicFirmwareSource CR with fields for ConnectX and BlueField firmware. Make sure to use the correct firmware for your devices.

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaresource-spectrum-x-full.yaml
    :language: yaml
    :lines: 18-

Configure and apply the NicFirmwareTemplate CR:

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaretemplate-spectrum-x.yaml
    :language: yaml
    :lines: 18-

======================================
Enable SPC-X Optimizations for Devices
======================================

.. _spectrum-x-platform-configuration:

Platform configuration values
-----------------------------

``PLATFORM_TYPE`` maps to
``spec.template.spectrumXOptimized.platformType``, ``NIC_TYPE`` to
``spec.nicSelector.nicType``, ``MP_MODE`` to
``spec.template.spectrumXOptimized.multiplaneMode``, and ``NUM_PLANES`` to
``spec.template.spectrumXOptimized.numberOfPlanes``.

PF and VF totals describe the east-west NICs on one worker node in the
reference platform layout, excluding north-south NICs. For HGX H100 use
``h100``; for HGX H200 use ``h200``. Select the row matching your NIC and
physical plane configuration.

.. list-table:: Platform configuration by worker node
   :header-rows: 1
   :widths: 18 22 16 14 15 15

   * - | Platform type
       | (``PLATFORM_TYPE``)
     - | NIC type ID
       | (``NIC_TYPE``)
     - | Multi-plane mode
       | (``MP_MODE``)
     - | Number of planes
       | (``NUM_PLANES``)
     - Total PFs per platform
     - Total VFs per platform
   * - ``h100`` / ``h200``
     - ``a2dc`` (BlueField-3)
     - ``none``
     - 1
     - 8
     - 8
   * - ``b200``
     - ``a2dc`` (BlueField-3)
     - ``none``
     - 1
     - 8
     - 8
   * - ``b200``
     - ``1021`` (ConnectX-7)
     - ``none``
     - 1
     - 8
     - 8
   * - ``gb200``
     - ``1021`` (ConnectX-7)
     - ``none``
     - 1
     - 4
     - 4
   * - ``rtx`` (RTX PRO 6000)
     - ``1023`` (ConnectX-8)
     - ``none``
     - 1
     - 8 (2 x 4)
     - 8
   * - ``b300``
     - ``1023`` (ConnectX-8)
     - ``hwplb``
     - 2
     - 16 (2 x 8)
     - 8
   * - ``b300``
     - ``1023`` (ConnectX-8)
     - ``hwplb``
     - 4
     - 32 (4 x 8)
     - 8
   * - ``b300``
     - ``1023`` (ConnectX-8)
     - ``swplb``
     - 2
     - 16 (2 x 8)
     - 16
   * - ``b300``
     - ``1023`` (ConnectX-8)
     - ``swplb``
     - 4
     - 32 (4 x 8)
     - 32
   * - ``gb300``
     - ``1023`` (ConnectX-8)
     - ``hwplb``
     - 2
     - 8 (2 x 4)
     - 4
   * - ``gb300``
     - ``1023`` (ConnectX-8)
     - ``hwplb``
     - 4
     - 16 (4 x 4)
     - 4
   * - ``gb300``
     - ``1023`` (ConnectX-8)
     - ``swplb``
     - 2
     - 8 (2 x 4)
     - 8
   * - ``gb300``
     - ``1023`` (ConnectX-8)
     - ``swplb``
     - 4
     - 16 (4 x 4)
     - 16

In ``hwplb``, each rail exposes one VF regardless of the number of planes.
In ``swplb``, each PF exposes a VF, so the VF count increases with the
number of planes. The totals above are platform-wide counts, not values
for ``template.numVfs``; the NIC configuration template still uses
``numVfs: 1``.

Single-plane configuration
--------------------------

Set the architecture version and the platform identifier supported by the profile. Spectrum-X optimizations require ``linkType: Ethernet`` and ``numVfs: 1``. This example selects a GB200 single-plane deployment:

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
       nicType: "1021" # ConnectX-7 NIC on GB200
     template:
       numVfs: 1
       linkType: Ethernet
       spectrumXOptimized:
         enabled: true
         version: "RA2.4"
         platformType: "gb200"
         overlay: "none" # For an L3 EVPN overlay, use "l3"

Multiplane configuration
------------------------

Multiplane modes let a NIC drive multiple data planes on the same rail. Set ``multiplaneMode`` and ``numberOfPlanes`` alongside the architecture and platform fields.

.. note::
   It is recommended to perform a NIC configuration reset before applying or switching between multiplane configurations to ensure a clean and consistent initial state. See :doc:`Reset NIC Configuration to Default <../nic-conf-operator/nic-fw-configuration>` for details.

.. code-block:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicConfigurationTemplate
   metadata:
     name: spectrum-x-multiplane-configuration
     namespace: nvidia-network-operator
   spec:
     nodeSelector:
       feature.node.kubernetes.io/network-sriov.capable: "true"
     nicSelector:
       nicType: "1023" # ConnectX-8 SuperNIC. Use "1025" for ConnectX-9 SuperNIC (tech preview)
     template:
       numVfs: 1
       linkType: Ethernet
       spectrumXOptimized:
         enabled: true
         version: "RA2.4"
         platformType: "gb300"
         overlay: "none"
         multiplaneMode: "hwplb" # Hardware Plane Load Balancing
         numberOfPlanes: 2

The profile must support the requested architecture, platform, mode, and NIC. ``platformType: rtx`` permits only ``multiplaneMode: none``. ``platformType: vr`` requires ``swplb`` or ``hwplb``.

Multiplane modes
^^^^^^^^^^^^^^^^

The following multiplane modes are available:

.. list-table::
   :header-rows: 1
   :widths: 15 45 20 20

   * - **Mode**
     - **Description**
     - **Supported NICs**
     - **Planes**
   * - ``none``
     - Single plane mode (no multiplane). This is the default.
     - BlueField-3 SuperNIC, ConnectX-7 NIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 1
   * - ``hwplb``
     - Hardware Plane Load Balancing. Uses hardware LAG resource allocation and NIC-level plane configuration to distribute packets across planes in the NIC hardware. The planes are hidden from the workload, which sees a single interface per rail. **The recommended mode on multiplane platforms.**
     - ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 2, 4
   * - ``swplb``
     - Software Plane Load Balancing. The NIC port is split into multiple PFs, each assigned to a separate data plane; the software stack distributes packets across planes. Each plane is exposed to the workload as its own interface.
     - BlueField-3 SuperNIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 2, 4

.. note::

   On multiplane platforms, ``hwplb`` is the mode Spectrum-X RA 2.3 recommends — select ``swplb`` only for a software-based multiplane deployment, for example when each plane must be visible to the workload as a separate interface, or on NICs that do not support ``hwplb``. This is a Reference Architecture recommendation, not an API default: the ``multiplaneMode`` field itself defaults to ``none``, so multiplane deployments must set it explicitly.

NIC type constraints
^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **NIC Type**
     - **Device ID**
     - **Supported Multiplane Modes**
   * - ConnectX-7 NIC
     - ``1021``
     - ``none``
   * - ConnectX-8 SuperNIC
     - ``1023``
     - ``none``, ``swplb``, ``hwplb``
   * - ConnectX-9 SuperNIC *(tech preview)*
     - ``1025``
     - ``none``, ``swplb``, ``hwplb``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none``, ``swplb``

.. warning::

   The ``hwplb`` multiplane mode requires ConnectX-8 SuperNIC (device ID ``1023``) or ConnectX-9 SuperNIC (device ID ``1025``). Attempting to configure ``hwplb`` on BlueField-3 SuperNIC or ConnectX-7 NIC is rejected by the API validation.

Configure custom interface names
---------------------------------

The ``NicInterfaceNameTemplate`` CRD allows you to define custom naming patterns for RDMA and network device interfaces on Spectrum-X NICs. This is useful in multiplane and multi-rail deployments where predictable interface naming is required.

The operator deploys udev rules to the host to rename network and RDMA interfaces according to the specified naming template.

The template uses the following placeholders for device name construction:

- ``%nic_id%``: The index of the NIC in the flattened list of NICs
- ``%plane_id%``: The index of the plane of the specific NIC
- ``%rail_id%``: The index of the rail where the given NIC belongs to

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicinterfacenametemplate-spectrum-x.yaml
    :language: yaml
    :lines: 18-

The ``railPciAddresses`` field defines the PCI address to rail mapping. The first dimension is the rail index and the second dimension lists one PCI address per ``NicDevice`` in that rail. ``pfsPerNic`` determines how many PF rules are generated for each device; do not list each PF of the same device as another NIC.

Generated udev rules
^^^^^^^^^^^^^^^^^^^^^

The operator generates udev rules based on the template and writes them to the host. The rules are written to two separate files.

Example generated udev rules for one PF's net device (``/etc/udev/rules.d/10-nic-net-interface-naming.rules``):

.. code-block:: text

   # Auto-generated by nic-configuration-operator
   # Do not edit manually

   SUBSYSTEM=="net", ACTION=="add", ATTR{phys_port_name}=="p[0-9]*", KERNELS=="0000:1a:00.0", NAME="net_0_0_0"
   SUBSYSTEM=="net", ACTION=="add", ATTR{phys_port_name}=="", KERNELS=="0000:1a:00.0", NAME="net_0_0_0"
   SUBSYSTEM=="net", ACTION=="add", TEST!="phys_port_name", KERNELS=="0000:1a:00.0", NAME="net_0_0_0"

The physical-port match prevents VF and SF representors from taking the PF name. The other rules cover hosts where ``phys_port_name`` is empty or absent.

Example generated udev rules for RDMA devices (``/etc/udev/rules.d/10-nic-rdma-interface-naming.rules``):

.. code-block:: text

   # Auto-generated by nic-configuration-operator
   # Do not edit manually

   ACTION=="add", KERNELS=="0000:1a:00.0", SUBSYSTEM=="infiniband", RUN+="/usr/bin/rdma dev set %k name rdma_0_0_0"
   ACTION=="add", KERNELS=="0000:1a:00.1", SUBSYSTEM=="infiniband", RUN+="/usr/bin/rdma dev set %k name rdma_0_1_0"
   ACTION=="add", KERNELS=="0000:3a:00.0", SUBSYSTEM=="infiniband", RUN+="/usr/bin/rdma dev set %k name rdma_1_0_1"
   ACTION=="add", KERNELS=="0000:3a:00.1", SUBSYSTEM=="infiniband", RUN+="/usr/bin/rdma dev set %k name rdma_1_1_1"

.. note::

   The actual generated names depend on the ``netDevicePrefix`` /
   ``rdmaDevicePrefix`` you set on the ``NicInterfaceNameTemplate`` — see
   the Quick-Start walkthroughs for the recommended rail / plane-based
   naming (for example, ``net_rail0_plane0``).

================
Validation rules
================

The following validation rules are enforced by the API:

- Spectrum-X optimizations require ``numVfs: 1`` and ``linkType: Ethernet``. When ``networkBay`` is configured, omit ``linkType`` because the system profile governs it.
- Spectrum-X optimizations can only be enabled for ConnectX-7 NIC (``nicType: 1021``), ConnectX-8 SuperNIC (``nicType: 1023``), ConnectX-9 SuperNIC (``nicType: 1025``), or BlueField-3 SuperNIC (``nicType: a2dc``).
- When Spectrum-X optimizations are enabled, ``roceOptimized`` must not be enabled (RoCE settings are included in the Spectrum-X configuration).
- ``version`` and ``platformType`` are required for enabled Spectrum-X configuration. Their values must be supported by the supplied profile; ``version`` is not a ConfigMap reference.
- ``multiplaneMode`` must be ``none``, ``swplb``, or ``hwplb``; ``numberOfPlanes`` must be ``1``, ``2``, or ``4``.
- When ``multiplaneMode`` is ``none``, ``numberOfPlanes`` must be ``1``.
- When ``multiplaneMode`` is not ``none``, ``numberOfPlanes`` must not be ``1``.
- The ``hwplb`` multiplane mode can only be enabled for ConnectX-8 SuperNIC (``nicType: 1023``) or ConnectX-9 SuperNIC (``nicType: 1025``).

``rawNvConfig`` may be combined with Spectrum-X optimizations. Values in ``rawNvConfig`` override explicit template settings, which override Spectrum-X profile settings. Parameter names must not use index-range syntax such as ``NAME[0..3]`` — list each index explicitly.

ConnectX-9 Network Bay configuration can combine ``networkBay.conf`` with Spectrum-X. Select both ASICs of the card, omit ``linkType``, and use a system profile supported by the firmware. Spectrum-X profile settings override the Network Bay system-profile defaults; explicit template settings and ``rawNvConfig`` override both. See :doc:`Configuration Details <../nic-conf-operator/configuration-details>` for Network Bay pairing and validation requirements.
