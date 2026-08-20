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


`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ in Network Operator **26.4.x** supports Spectrum-X **RA 2.1** as **Tech Preview (non-GA)** — available for early evaluation of new configuration flows and capabilities, but not a validated or production-ready solution. The validated, generally available Spectrum-X RA 2.1 solution is **Network Operator 26.1.x** (see the `NVIDIA Spectrum-X Validated Solution Stack <https://networking-docs.nvidia.com/software/spectrumx-solution-stack>`_). The ``spectrumXOptimized.version`` CRD field also accepts **RA 1.3** and **RA 2.0** for legacy or mixed-version configurations. RA 2.1 introduced multiplane mode support for enhanced network performance with multiple data planes.

For the Network Operator Spectrum-X RA support matrix and validated hardware, operating system, and Kubernetes combinations, see :doc:`Platform Support <../platform-support>`.

.. note::

   Currently, ConnectX-7 NIC (device ID ``1021``), ConnectX-8 SuperNIC (device ID ``1023``), and BlueField-3 SuperNIC (device ID ``a2dc``) devices are supported for Spectrum-X configuration. Hardware Plane Load Balancing (``hwplb``) is **tech preview**, planned for a future Spectrum-X Reference Architecture — it is not part of the current validated Spectrum-X Reference Architecture.


====================================================
Install and Configure the NIC Configuration Operator
====================================================

To install the operator and for more information on the CRDs, see :doc:`NIC Firmware Configuration <../nic-conf-operator/nic-fw-configuration>` and :doc:`Configuration Details <../nic-conf-operator/configuration-details>`.

.. note::

   The NIC Configuration Operator reference describes the operator's full CRD
   capability surface and may list NIC types (for example, ConnectX-9) or
   multiplane modes (for example, ``hwplb``) that are not part of a given
   validated Spectrum-X Reference Architecture. For the NIC types and modes
   validated for Spectrum-X RA 2.1, use the tables on this page together with the
   `NVIDIA Spectrum-X Validated Solution Stack <https://networking-docs.nvidia.com/software/spectrumx-solution-stack>`_.

=============================================
Provision the DOCA SPC-X CC Algorithm Package
=============================================

.. note::

   For Spectrum-X RA2.1 and later, the DOCA SPC-X CC algorithm package is included in the operator image and does not need to be deployed separately. For RA2.0 and earlier, the package must be deployed manually using the example below.

To enable the DOCA SPC-X CC algorithm on NIC devices, the DOCA SPC-X CC .deb package for ubuntu 22.04 is required. This configuration step will be removed in the future, once the DOCA SPC-X CC algorithm is publicly available.
To access the package, contact your NVIDIA CPM.
The package should be available in the cluster and then its URL should be provided in the packageUrlSource field of the SpectrumXOperator CR.

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaresource-spectrum-x-cc-only.yaml
    :language: yaml
    :lines: 18-

Firmware Upgrade
----------------

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

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicconfigurationtemplate-spectrum-x.yaml
    :language: yaml
    :lines: 18-


RA2.1 configuration with multiplane support
----------------------------------------------------

Reference Architecture 2.1 introduced multiplane mode support, allowing NICs to be configured with multiple data planes for enhanced network performance. It is the latest supported version.

.. note::
   It is recommended to perform a NIC configuration reset before applying or switching between multiplane configurations to ensure a clean and consistent initial state. See :doc:`Reset NIC Configuration to Default <../nic-conf-operator/nic-fw-configuration>` for details.

To enable multiplane support, set ``spectrumXOptimized.version`` to ``RA2.1`` and configure the ``multiplaneMode`` and ``numberOfPlanes`` fields.

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicconfigurationtemplate-spectrum-x-multiplane.yaml
    :language: yaml
    :lines: 18-

Multiplane modes
^^^^^^^^^^^^^^^^

The following multiplane modes are available with RA2.1:

.. list-table::
   :header-rows: 1
   :widths: 15 45 20 20

   * - **Mode**
     - **Description**
     - **Supported NICs**
     - **Planes**
   * - ``none``
     - Single plane mode (no multiplane). This is the default.
     - BlueField-3 SuperNIC, ConnectX-7 NIC, ConnectX-8 SuperNIC
     - 1
   * - ``swplb``
     - Software Plane Load Balancing. The NIC port is split into multiple PFs, each assigned to a separate data plane; the software stack distributes packets across planes.
     - ConnectX-8 SuperNIC
     - 2, 4
   * - ``hwplb`` *(tech preview)*
     - Hardware Plane Load Balancing. Uses hardware LAG resource allocation and NIC-level plane configuration to distribute packets across planes in the NIC hardware. **Tech preview; planned for a future Spectrum-X Reference Architecture and not part of the current validated Reference Architecture.**
     - ConnectX-8 SuperNIC
     - 2, 4
   * - ``uniplane``
     - Uniplane mode. Single-plane physical topology that uses the Spectrum-X multi-plane software stack and IP schema — multiple PFs all connect to the **same** ToR/plane (rather than separate planes as in ``swplb`` / ``hwplb``). Specialized configuration for compatibility or regression scenarios; for production deployments, use ``none`` for Single-Plane or ``swplb`` / ``hwplb`` for Dual-Plane / Quad-Plane. Verify its availability and applicability against the NVIDIA Spectrum-X Reference Architecture documentation before use.
     - ConnectX-8 SuperNIC
     - 2

.. note::

   Multiplane modes (``swplb``, ``hwplb``, ``uniplane``) are only supported with RA2.1. For RA1.3 and RA2.0, ``multiplaneMode`` must be ``none`` and ``numberOfPlanes`` must be ``1``.

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
     - ``none``, ``swplb``, ``hwplb``, ``uniplane``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none``

.. warning::

   The ``hwplb`` multiplane mode is **tech preview**, planned for a future Spectrum-X Reference Architecture, and is not part of the current validated Reference Architecture. It is supported only on ConnectX-8 SuperNIC (device ID ``1023``); attempting to configure ``hwplb`` on BlueField-3 SuperNIC or ConnectX-7 NIC will be rejected by the API validation.

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

The ``railPciAddresses`` field defines the PCI address to rail mapping. The first dimension is the rail index and the second dimension is the list of PCI addresses of the NICs in that rail.

Generated udev rules
^^^^^^^^^^^^^^^^^^^^^

The operator generates udev rules based on the template and writes them to the host. The rules are written to two separate files.

Example generated udev rules for net devices (``/etc/udev/rules.d/10-nic-net-interface-naming.rules``):

.. code-block:: text

   # Auto-generated by nic-configuration-operator
   # Do not edit manually

   SUBSYSTEM=="net", ACTION=="add", KERNELS=="0000:1a:00.0", NAME="net_0_0_0"
   SUBSYSTEM=="net", ACTION=="add", KERNELS=="0000:1a:00.1", NAME="net_0_1_0"
   SUBSYSTEM=="net", ACTION=="add", KERNELS=="0000:3a:00.0", NAME="net_1_0_1"
   SUBSYSTEM=="net", ACTION=="add", KERNELS=="0000:3a:00.1", NAME="net_1_1_1"

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

- Spectrum-X optimizations can only be enabled when ``linkType`` is ``Ethernet`` and ``numVfs`` is ``1``.
- Spectrum-X optimizations can only be enabled for ConnectX-7 NIC (``nicType: 1021``), ConnectX-8 SuperNIC (``nicType: 1023``), or BlueField-3 SuperNIC (``nicType: a2dc``).
- When Spectrum-X optimizations are enabled, ``roceOptimized`` must not be enabled (RoCE settings are included in the Spectrum-X configuration).
- When Spectrum-X optimizations are enabled, ``rawNvConfig`` must be empty.
- When ``multiplaneMode`` is ``none``, ``numberOfPlanes`` must be ``1``.
- When ``multiplaneMode`` is not ``none``, ``numberOfPlanes`` must not be ``1``.
- When ``version`` is ``RA1.3`` or ``RA2.0``, ``multiplaneMode`` must be ``none`` and ``numberOfPlanes`` must be ``1``.
- The ``hwplb`` multiplane mode can only be enabled for ConnectX-8 SuperNIC (``nicType: 1023``). ``hwplb`` is tech preview, planned for a future Spectrum-X Reference Architecture, and is not part of the current validated Reference Architecture.
