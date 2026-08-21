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


`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ in Network Operator 26.7.0 applies Spectrum-X NIC tuning from a **Spectrum-X profile** — a versioned YAML document published for each Reference Architecture and supplied to the cluster as a labeled ConfigMap. The ``spectrumXOptimized.version`` field names that ConfigMap.

This replaces the fixed RA-version enum used in earlier releases. In Network Operator 26.4.0 and earlier, ``version`` accepted only the built-in values ``RA1.3``, ``RA2.0``, and ``RA2.1``, and the tuning tables shipped inside the operator image. From 26.7.0, the operator carries no built-in profiles: every Spectrum-X deployment must apply a profile ConfigMap first, and NIC tuning can be revised without a new operator release.

For the Network Operator Spectrum-X RA support matrix and validated hardware, operating system, and Kubernetes combinations, see :doc:`Platform Support <../platform-support>`.

Spectrum-X configuration applies to ConnectX-7 NIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC, and BlueField-3 SuperNIC; Hardware Plane Load Balancing (``hwplb``) additionally requires ConnectX-8 SuperNIC or ConnectX-9 SuperNIC. Device IDs and the modes each NIC accepts are listed under `NIC type constraints`_.

.. note::

   **ConnectX-9 SuperNIC support for Spectrum-X is Tech Preview.** The NIC
   Configuration Operator API accepts ConnectX-9 SuperNIC and applies Spectrum-X
   settings to it, but ConnectX-9 SuperNIC is **not part of Spectrum-X RA 2.3**
   and is not covered by an RA-validated configuration. Use it for evaluation
   only.

   Configuring ConnectX-9 SuperNIC additionally requires a Spectrum-X profile
   that carries ``mlxConfig`` tuning for device ID ``1025``. A profile that omits
   it applies **no** Spectrum-X parameters to those NICs and reports no error.
   Contact NVIDIA Support or your NVIDIA CPM for a profile that covers
   ConnectX-9 SuperNIC. Hardware Multiplane on ConnectX-9 SuperNIC also depends
   on DOCA xPlane support for that NIC — see :doc:`Architecture and Components
   <components>`.

   ConnectX-9 SuperNIC remains fully supported by Network Operator for general
   RoCE and InfiniBand workloads — see :doc:`Platform Support
   <../platform-support>`.

.. important::

   Upgrading from Network Operator 26.4.x or earlier is not a drop-in change. A ``NicConfigurationTemplate`` that carries ``version: "RA2.1"`` no longer resolves to a built-in profile — it now resolves to a ConfigMap named ``RA2.1``, and Spectrum-X configuration will not be applied until a matching profile ConfigMap exists. Apply the profile ConfigMap for your Reference Architecture before or together with the upgrade.


====================================================
Install and Configure the NIC Configuration Operator
====================================================

To install the operator and for more information on the CRDs, see :doc:`NIC Firmware Configuration <../nic-conf-operator/nic-fw-configuration>` and :doc:`Configuration Details <../nic-conf-operator/configuration-details>`.

===============================
Apply the Spectrum-X Profile
===============================

A Spectrum-X profile holds the NIC tuning for one Reference Architecture: the non-volatile ``mlxConfig`` parameters applied per multiplane mode and device ID, the ``runtimeConfig`` parameters for RoCE, adaptive routing, congestion control and inter-packet gap, and the congestion-control settings ``docaCCVersion`` and ``useSoftwareCCAlgorithm``.

Download the profile published for your Reference Architecture from the NVOnline portal, or contact your NVIDIA CPM. Apply it **as-is** — the published file already carries the ``network.nvidia.com/operator.nic-configuration.spectrum-x-profile`` label and the complete ``data.profile`` body:

.. code-block:: bash

   kubectl apply -f spectrum-x-profile-configmap.yaml

The ConfigMap **name** is the value you reference from ``spectrumXOptimized.version``. Profiles are keyed by name and not by namespace, so use unique profile names across every namespace the operator watches.

For the full profile ConfigMap format, the label rules, and a complete annotated example, see :doc:`Configuration Details <../nic-conf-operator/configuration-details>`.

.. note::

   ``version`` is a free-form name and is not validated against existing ConfigMaps, so a template that references a missing profile is accepted by the API and only fails when it is applied. For that and the other profile failure signatures, see :doc:`Verify and Troubleshoot <verify-and-troubleshoot>`.

=============================================
Provision the DOCA SPC-X CC Algorithm Package
=============================================

.. note::

   For Spectrum-X RA 2.1 and later, the DOCA SPC-X CC algorithm package is included in the operator image and does not need to be deployed separately. For RA 2.0 and earlier, the package must be deployed manually using the example below.

   Whether the software congestion-control algorithm is used, and which version the operator runs, is declared by the ``useSoftwareCCAlgorithm`` and ``docaCCVersion`` keys of the Spectrum-X profile rather than configured on the ``NicConfigurationTemplate``.

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

Reference the profile ConfigMap by name from ``spectrumXOptimized.version``. Spectrum-X optimizations require ``linkType: Ethernet`` and ``numVfs: 1``.

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
       nicType: a2dc # BlueField-3 SuperNIC. Use "1023" for ConnectX-8 SuperNIC, or "1025" for ConnectX-9 SuperNIC (tech preview)
     template:
       numVfs: 1
       linkType: Ethernet
       spectrumXOptimized:
         enabled: true
         version: "spectrum-x-ra2.3-profile" # name of the Spectrum-X profile ConfigMap
         overlay: "none" # For an L3 EVPN overlay, use "l3"

Multiplane configuration
------------------------

Multiplane modes let a NIC drive multiple data planes on the same rail. Set ``multiplaneMode`` and ``numberOfPlanes`` alongside the profile reference.

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
         version: "spectrum-x-ra2.3-profile"
         overlay: "none"
         multiplaneMode: "hwplb" # Hardware Plane Load Balancing
         numberOfPlanes: 4

The profile must contain tuning for the multiplane mode and device ID you select. A profile that has no ``mlxConfig`` entry for the requested mode leaves those parameters at their device defaults.

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
     - Hardware Plane Load Balancing. Uses hardware LAG resource allocation and NIC-level plane configuration to distribute packets across planes in the NIC hardware. The planes are hidden from the workload, which sees a single interface per rail. **The default mode on multiplane platforms.**
     - ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 2, 4
   * - ``swplb``
     - Software Plane Load Balancing. The NIC port is split into multiple PFs, each assigned to a separate data plane; the software stack distributes packets across planes. Each plane is exposed to the workload as its own interface.
     - BlueField-3 SuperNIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 2, 4
   * - ``uniplane``
     - Uniplane mode. Single-plane physical topology that uses the Spectrum-X multiplane software stack and IP schema — multiple PFs all connect to the **same** ToR/plane (rather than separate planes as in ``swplb`` / ``hwplb``). **Not part of Spectrum-X RA 2.3.** The API accepts the value, but it takes effect only if the Spectrum-X profile you apply carries a ``uniplane`` section; published profiles do not. For production deployments use ``none`` for Single-Plane, or ``hwplb`` / ``swplb`` for Dual-Plane / Quad-Plane.
     - BlueField-3 SuperNIC, ConnectX-8 SuperNIC, ConnectX-9 SuperNIC
     - 2

.. note::

   On multiplane platforms, ``hwplb`` is the default mode — select ``swplb`` only for a software-based multiplane deployment, for example when each plane must be visible to the workload as a separate interface, or on NICs that do not support ``hwplb``. Note that this is a deployment default, not an API default: the ``multiplaneMode`` field itself defaults to ``none``, so multiplane deployments must set it explicitly.

   The modes a given deployment can actually use are additionally bounded by the Spectrum-X profile: a mode is configurable only if the profile carries ``mlxConfig`` tuning for that mode and device ID.

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
   * - ConnectX-9 SuperNIC *(tech preview)*
     - ``1025``
     - ``none``, ``swplb``, ``hwplb``, ``uniplane``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none``, ``swplb``, ``uniplane``

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
- Spectrum-X optimizations can only be enabled for ConnectX-7 NIC (``nicType: 1021``), ConnectX-8 SuperNIC (``nicType: 1023``), ConnectX-9 SuperNIC (``nicType: 1025``), or BlueField-3 SuperNIC (``nicType: a2dc``).
- When Spectrum-X optimizations are enabled, ``roceOptimized`` must not be enabled (RoCE settings are included in the Spectrum-X configuration).
- ``version`` is required and is not validated against existing ConfigMaps — any name is accepted.
- When ``multiplaneMode`` is ``none``, ``numberOfPlanes`` must be ``1``.
- When ``multiplaneMode`` is not ``none``, ``numberOfPlanes`` must not be ``1``.
- The ``hwplb`` multiplane mode can only be enabled for ConnectX-8 SuperNIC (``nicType: 1023``) or ConnectX-9 SuperNIC (``nicType: 1025``).

``rawNvConfig`` may be combined with Spectrum-X optimizations: the raw parameters are merged as overrides on top of the parameters calculated from the Spectrum-X profile. Parameter names must not use index-range syntax such as ``NAME[0..3]`` — list each index explicitly.
