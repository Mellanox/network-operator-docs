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

**********************************************
NVIDIA Spectrum-X Ethernet Networking Platform
**********************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none


.. note::

   This section covers **NVIDIA Network Operator configuration** to enable
   NVIDIA Spectrum-X NIC setup in Kubernetes deployments. For the full
   Spectrum-X platform documentation — supported topologies, NIC hardware,
   software components, and version-specific notes — refer to the
   `NVIDIA Spectrum-X documentation <https://www.nvidia.com/en-us/networking/spectrumx/>`_.

NVIDIA Spectrum-X is an AI-optimized Ethernet networking platform that combines
NVIDIA Spectrum switches with the BlueField-3 SuperNIC, ConnectX-7 NIC, and
ConnectX-8 SuperNIC families to deliver high-bandwidth, lossless RoCE for the
GPU-to-GPU compute (east-west) network. NVIDIA Network Operator provides the
Kubernetes side: discovering the NICs, configuring rails, and exposing them
to pods as schedulable resources.

==================================
How Spectrum-X works on Kubernetes
==================================

Spectrum-X Multiplane is the Spectrum-X capability
that splits each SuperNIC across two or more independent network planes —
enabling Ethernet to scale from thousands to hundreds of thousands of GPUs in
a flat, two-tier topology, with improved performance and resiliency over
single-plane networks. Network Operator exposes it through the
``multiplaneMode`` field on ``NicConfigurationTemplate``, with
**Hardware Multiplane** (``hwplb``) and **Software Multiplane** (``swplb``)
variants alongside the single-plane mode (``none``). On multiplane platforms,
Hardware Multiplane is recommended for new multiplane deployments; select
Software Multiplane when the deployment requires a separate workload
interface for each plane. Match the mode to the supplied RA2.4 profile and
switch fabric configuration.

**Hardware Multiplane requires DOCA xPlane** to manage plane failover inside
OVS-DOCA. Software Multiplane and single-plane deployments do not use
DOCA xPlane. See
:doc:`Architecture and Components <components>`.

Spectrum-X Kubernetes deployments fall
into three network architectures, distinguished by the number of planes per
rail and the load-balancing mechanism. The table describes configuration
layouts; use the release-specific qualification guidance below when
selecting a platform:

.. list-table::
   :header-rows: 1
   :widths: 20 30 25 25

   * - Architecture
     - NICs
     - GPU platforms
     - Multiplane mode
   * - Single-Plane
     - BlueField-3 SuperNIC, ConnectX-7 NIC, ConnectX-8 SuperNIC
     - H100/H200/B200, GB200
     - ``none`` (1 plane)
   * - Dual-Plane
     - ConnectX-8 SuperNIC
     - B300, GB300
     - | ``hwplb`` (2 planes)
       | ``swplb`` (2 planes)
   * - Quad-Plane
     - ConnectX-8 SuperNIC
     - B300, GB300
     - | ``hwplb`` (4 planes)
       | ``swplb`` (4 planes)

.. note::

   ConnectX-8 SuperNIC is listed in the Single-Plane row because it also
   supports single-plane (``none``) configuration. Typical Single-Plane
   deployments use BlueField-3 SuperNIC (HGX H100/H200/B200) or ConnectX-7
   NIC (GB200).

===================================
Supported Reference Architectures
===================================

This section documents the **RA2.4 configuration workflow** for Network
Operator 26.10. Use the matching doSPCX profile ConfigMap and CRDs. The
release mapping below distinguishes this workflow from earlier releases;
see :doc:`Platform Support <../platform-support>` for qualification
requirements and validation of earlier releases.

.. list-table::
   :header-rows: 1
   :widths: 34 33 33

   * - Spectrum-X RA Version
     - NVIDIA Network Operator Release
     - Configuration contract
   * - Spectrum-X RA 2.4
     - 26.10.x
     - doSPCX data-bundle ConfigMap; architecture version and platform type
   * - Spectrum-X RA 2.3
     - 26.7.x
     - Legacy ``data.profile`` ConfigMap; version selects the ConfigMap
   * - Spectrum-X RA 2.1
     - 26.4.x
     - Earlier reference-architecture workflow
   * - Spectrum-X RA 2.1
     - 26.1.x
     - Earlier reference-architecture workflow

==================
What you configure
==================

Network Operator drives Spectrum-X setup through a small set of resources.
Each one is documented on the page that owns it:

.. list-table::
   :header-rows: 1
   :widths: 34 44 22

   * - Resource
     - Purpose
     - Reference
   * - **Network Operator Helm values**
     - Enable SR-IOV Network Operator and Maintenance Operator and configure
       their coordination.
     - :doc:`Quick Start <quick-start>`
   * - ``NicClusterPolicy``
     - Cluster-wide Network Operator configuration: enables the Spectrum-X
       Operator, NIC Configuration Operator, NV-IPAM, and Multus.
     - :doc:`Architecture and Components <components>`
   * - **Spectrum-X profile ConfigMap**
     - Cluster-wide Spectrum-X configuration data. Exactly one
       current-format profile may be selected.
     - :doc:`NIC Configuration <spectrum-x-configuration>`
   * - ``NicConfigurationTemplate``
     - NIC-level firmware and PF configuration: link type, ``numVfs``,
       multiplane mode, architecture version, and platform type.
     - :doc:`NIC Configuration <spectrum-x-configuration>`
   * - ``NicInterfaceNameTemplate``
     - Predictable rail and plane based interface names, applied by udev.
     - :doc:`NIC Configuration <spectrum-x-configuration>`
   * - ``SpectrumXRailPoolConfig``
     - Rail topology, PF selection, IPAM binding, and rail resource
       exposure.
     - :doc:`CRD API Reference <crds>`
   * - ``CIDRPool``
     - Per-rail IP allocation, or per rail-plane in ``swplb``.
     - :doc:`CRD API Reference <crds>`

For Dynamic Resource Allocation workflows, the upstream Kubernetes
``ResourceClaimTemplate`` binds Pod requests to specific GPU and VF
combinations --- see :doc:`DRA SR-IOV Driver <../dra-sriov-driver/dra-sriov-driver>`.

==============
Where to start
==============

.. list-table::
   :header-rows: 1
   :widths: 34 66

   * - Page
     - Read it when
   * - :doc:`Quick Start <quick-start>`
     - You are deploying. Nine steps, from node preparation to a test Pod.
   * - :doc:`Architecture and Components <components>`
     - You want to know what gets deployed and which operator owns what.
   * - :doc:`NIC Configuration <spectrum-x-configuration>`
     - You are applying the profile ConfigMap or writing NIC templates.
   * - :doc:`Verify and Troubleshoot <verify-and-troubleshoot>`
     - The cluster is up and you need to confirm it, or something failed.
   * - :doc:`CRD API Reference <crds>`
     - You need field-level detail for a Spectrum-X CRD.

For supported platforms, NICs, switches, and OS combinations, see the
`NVIDIA Spectrum-X Solution Stack documentation
<https://docs.nvidia.com/networking/software/spectrumx-solution-stack/index.html>`_.
For the Kubernetes and OS matrix and component versions, see
:doc:`Platform Support <../platform-support>`.

.. toctree::
   :maxdepth: 1
   :titlesonly:
   :hidden:

   Quick Start <quick-start.rst>
   Architecture and Components <components.rst>
   Spectrum-X NIC Configuration <spectrum-x-configuration.rst>
   Verify and Troubleshoot <verify-and-troubleshoot.rst>
   CRD API Reference <crds.rst>
