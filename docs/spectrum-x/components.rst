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

*************************************************
Spectrum-X Kubernetes Architecture and Components
*************************************************

A Spectrum-X Kubernetes deployment is a layered stack split across two
distinct domains:

- **Host Layer** — operating-system prerequisites, firmware settings,
  kernel drivers, and the host virtual switch. Owned by an automated
  provisioning stack (or by manual / scripted operator action) and **out
  of Network Operator scope**.
- **Kubernetes Layer** — Kubernetes-native operators, CNIs, IPAM, and
  discovery components. Deployed and reconciled by **NVIDIA Network
  Operator** on top of a working Kubernetes cluster.

This page maps each component to its role, dependencies, and
default-enabled state in Network Operator 26.4.0. For exact image versions,
see the software components table in :doc:`Platform Support
<../platform-support>`. For end-to-end walkthroughs, see :doc:`Spectrum-X
Kubernetes Quick Start <quick-start>`.

====================
Deployment ownership
====================

Spectrum-X K8s deployments are split across three phases. Host-side
provisioning (Day 0) is owned outside Network Operator scope; Day 1 and
Day 2 are reconciled by Network Operator.

.. list-table::
   :header-rows: 1
   :widths: 15 55 30

   * - Phase
     - Scope
     - Owner
   * - **Day 0** (pre-K8s)
     - Host OS bootstrap, PCIe / SR-IOV firmware, switch fabric, SuperNIC
       firmware floor, hugepages, RDMA exclusive mode, DOCA-Host /
       OVS-DOCA install.
     - Automated provisioning stack or manual / scripted.
   * - **Day 1** (cluster bring-up)
     - Driver, operator, and CNI deployment on top of a working Kubernetes
       cluster; Spectrum-X CRD reconciliation.
     - NVIDIA Network Operator.
   * - **Day 2** (workload)
     - Pod connectivity (secondary networks), rail / plane IP allocation,
       VF / representor lifecycle.
     - NVIDIA Network Operator (CNI + IPAM).

==============
Stack overview
==============

**Host Layer** *(Day 0 — outside Network Operator scope)*:

- **OS prerequisites** — SR-IOV BIOS + firmware; hugepages; RDMA namespace
  exclusive mode.
- **Driver** — DOCA-Host (NVIDIA OFED kernel modules + DOCA tooling).
- **Virtual switch** — OVS-DOCA (hardware-accelerated Open vSwitch,
  bundled with DOCA-Host).

**Kubernetes Layer** *(Day 1 / Day 2 — owned by Network Operator)*:

- **Discovery** — Node Feature Discovery (NFD); NIC Feature Discovery.
- **Driver** *(alternative to host-installed DOCA-Host)* — DOCA-OFED
  driver container.
- **Operator** — Network Operator (umbrella); SR-IOV Network Operator;
  NIC Configuration Operator; Spectrum-X Operator; Maintenance Operator.
- **CNI / data-plane** — Multus; OVS-CNI; SR-IOV Network Device Plugin;
  SR-IOV CNI; RDMA-CNI; NV-IPAM; Spectrum-X flow-controller DaemonSet.
- **Optional / tech preview** — DOCA xPlane (Hardware Multiplane only);
  SR-IOV DRA driver; NicNodePolicy CRD; DOCA Telemetry Service.

==========
Host Layer
==========

The Host Layer is the foundation: operating-system prerequisites, firmware
settings, kernel drivers, and the host virtual switch that exist on each
node **before** Kubernetes is installed. These components are typically
owned by an automated provisioning stack or by manual / scripted operator
action, and are **not** managed by Network Operator.

OS prerequisites
----------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Component
     - Role
   * - **SR-IOV BIOS + firmware**
       (``SRIOV_EN=True``, ``NUM_OF_VFS=1``)
     - BIOS and NIC firmware settings that enable Virtual Function
       creation on each SuperNIC.
   * - **Hugepages**
     - Memory backing for OVS-DOCA. 400 MB per SuperNIC from DOCA 3.4
       onwards (1 GB on earlier DOCA).
   * - **RDMA namespace exclusive mode**
       (``options ib_core netns_mode=0``)
     - Per-namespace RDMA device isolation, required to assign RDMA
       devices into pod network namespaces.

.. _host-driver:

Driver
------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Component
     - Role
   * - **DOCA-Host**
     - Host-installed NVIDIA OFED kernel modules and DOCA tooling.
       Includes OVS-DOCA (see :ref:`host-virtual-switch` below). Default
       driver path for Spectrum-X RA 2.1 (Tech Preview on 26.4.x) deployments.

.. important::

   **DOCA-Host (host-installed)** and the **containerized DOCA-OFED
   driver** (deployed via Network Operator — see
   :ref:`k8s-driver-layer`) are **mutually exclusive**. Choose one per
   node; do not deploy both. Spectrum-X RA 2.1 (Tech Preview on 26.4.x) deployments
   typically use host-installed DOCA-Host.

.. _host-virtual-switch:

Virtual switch
--------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Component
     - Role
   * - **OVS-DOCA**
     - Hardware-accelerated Open vSwitch, bundled with DOCA-Host. Provides
       the per-rail OVS bridges into which the Kubernetes Layer's
       **OVS-CNI** plugs SR-IOV VFs at pod creation time.

================
Kubernetes Layer
================

The Kubernetes Layer is what NVIDIA Network Operator deploys and
reconciles on top of a working Kubernetes cluster. It includes
Kubernetes-native operators, CNIs, IPAM, and discovery components.
Configuration is driven through the Spectrum-X CRDs documented in
:doc:`Spectrum-X CRDs and API Reference <crds>`.

Discovery
---------

.. list-table::
   :header-rows: 1
   :widths: 30 50 20

   * - Component
     - Role
     - Default
   * - **Node Feature Discovery (NFD)**
     - Labels nodes with PCI / RDMA / GPU features so SR-IOV Network
       Operator and the scheduler can target the right hosts.
     - On by default.
   * - **NIC Feature Discovery**
     - NFD extension that exposes NIC-specific capabilities (link type,
       device IDs) as node labels.
     - Opt-in.

.. _k8s-driver-layer:

Driver (alternative to host-installed DOCA-Host)
------------------------------------------------

.. list-table::
   :header-rows: 1
   :widths: 30 50 20

   * - Component
     - Role
     - Default
   * - **DOCA-OFED driver container** (``doca-driver``)
     - Containerized NVIDIA OFED kernel driver. Used **only** when the
       host does not have DOCA-Host installed. See the host
       :ref:`Driver <host-driver>` section for the mutual-exclusion rule.
     - Opt-in via ``ofedDriver`` on ``NicClusterPolicy``.

Operator
--------

The operator sub-layer is what Network Operator deploys and reconciles
when you enable the Spectrum-X bits in ``NicClusterPolicy``.

.. list-table::
   :header-rows: 1
   :widths: 22 45 18 15

   * - Component
     - Role
     - Default
     - Spectrum-X relevance
   * - **Network Operator** (umbrella)
     - Reconciles ``NicClusterPolicy`` (and ``NicNodePolicy``);
       orchestrates all sub-operators, CNIs, and driver lifecycle.
     - Always on.
     - Essential.
   * - **SR-IOV Network Operator** (sub-chart)
     - Owns ``SriovNetworkNodePolicy`` and ``OVSNetwork``; manages VF
       creation, switchdev mode, and ships **OVS-CNI**, **SR-IOV CNI**,
       **RDMA-CNI**, the SR-IOV Device Plugin, and the DRA driver.
     - Off by default; **on for Spectrum-X**.
     - Essential.
   * - **NIC Configuration Operator**
     - Owns ``NicConfigurationTemplate``, ``NicFirmwareTemplate``, and
       ``NicInterfaceNameTemplate``; applies firmware and rail-name
       templates to each SuperNIC.
     - Opt-in.
     - Recommended.
   * - **Spectrum-X Operator**
     - Owns ``SpectrumXRailPoolConfig`` and deploys the
       **flow-controller DaemonSet** that programs per-rail OVS flows on
       each host (writing into the OVS-DOCA bridges from the Host Layer).
       Essential for any Spectrum-X mode (single-plane, ``swplb``,
       ``hwplb``).
     - Opt-in via ``spectrumXOperator``.
     - Essential.
   * - **Maintenance Operator**
     - Orchestrates node-maintenance windows (drain / cordon) for safe
       firmware updates and OFED driver upgrades.
     - Opt-in.
     - Optional.

CNI / data-plane
----------------

The CNI / data-plane sub-layer is what actually plugs Virtual Functions
into pods and routes traffic across rails and planes. Most components are
deployed by the SR-IOV Network Operator sub-chart but are listed
individually here because they play distinct roles.

.. list-table::
   :header-rows: 1
   :widths: 25 50 15 10

   * - Component
     - Role
     - Default
     - Spectrum-X relevance
   * - **Multus CNI**
     - Meta-CNI that allows pods to attach to multiple networks (one per
       rail / plane).
     - Opt-in via ``secondaryNetwork.multus``.
     - Essential.
   * - **OVS-CNI**
     - Plugs SR-IOV VFs into the per-rail OVS bridge (provided by
       :ref:`OVS-DOCA <host-virtual-switch>` in the Host Layer) and chains
       with NV-IPAM for address allocation. Shipped under the SR-IOV
       Network Operator sub-chart.
     - With SR-IOV Op.
     - Essential.
   * - **SR-IOV Network Device Plugin**
     - Advertises VFs to kubelet as schedulable ``nvidia.com/...``
       resources.
     - With SR-IOV Op.
     - Essential.
   * - **SR-IOV CNI**
     - Standard SR-IOV CNI binary. OVS-CNI is the typical Spectrum-X
       data path; SR-IOV CNI is available for non-OVS deployments.
     - With SR-IOV Op.
     - Alternative.
   * - **RDMA-CNI**
     - Moves RDMA devices into the pod network namespace (requires RDMA
       exclusive mode on the host).
     - With SR-IOV Op.
     - Optional.
   * - **NV-IPAM**
     - Rail / plane-aware IP allocation for pods. Consumes ``CIDRPool``
       CRDs and assigns IPs to VFs on pod creation.
     - Opt-in via ``nvIpam``.
     - Essential.
   * - **Spectrum-X flow-controller DaemonSet**
     - Programs OVS flows on each host so packets are forwarded onto the
       correct rail / plane uplink. Not a separately versioned CNI;
       deployed by Spectrum-X Operator.
     - With Spectrum-X Op.
     - Essential.

Optional / tech preview
-----------------------

These components are either tech preview in 26.4.0 or strictly optional
for a Spectrum-X K8s deployment.

.. list-table::
   :header-rows: 1
   :widths: 25 55 20

   * - Component
     - Role
     - Status
   * - **DOCA xPlane** sidecar
     - DOCA control-plane container used by the Spectrum-X flow controller
       for **Hardware Multiplane** (``hwplb``) deployments. Not required
       for single-plane (``none``) or **Software Multiplane** (``swplb``).
       Deployed via the ``spectrumXOperator.xPlane`` sub-spec on
       ``NicClusterPolicy``.
     - **Tech preview** in 26.4.0; planned GA in 26.7.0 alongside
       ``hwplb`` GA.
   * - **SR-IOV DRA driver** (``dra-driver-sriov``)
     - Dynamic Resource Allocation driver for SR-IOV (Kubernetes 1.32+
       DRA API). Enables fine-grained VF claims via ``ResourceClaim`` and
       ``ResourceClaimTemplate`` objects.
     - **Tech preview** in 26.4.0.
   * - **NicNodePolicy** CRD
     - Per-node-group DOCA-OFED driver management — supersedes the
       cluster-wide ``ofedDriver`` setting for heterogeneous clusters.
     - New in 26.4.0.
   * - **DOCA Telemetry Service**
     - Host telemetry exporter for OVS, RDMA, and SuperNIC statistics.
     - Opt-in.

=========================
Dependencies and ordering
=========================

The following dependencies are enforced by Network Operator's
reconciliation loop and validated by CRD webhooks where applicable:

- **Spectrum-X Operator** requires SR-IOV Network Operator (for OVS-CNI
  and the SR-IOV Device Plugin), NIC Configuration Operator (for firmware
  and rail-name templates), NV-IPAM (for rail / plane IP allocation), and
  Multus (for secondary network attachment). It will not function
  standalone.
- **SR-IOV Network Operator** requires NFD labels on nodes and SR-IOV
  enabled in the host BIOS / firmware (Host Layer). It is off by default
  in ``NicClusterPolicy`` and must be explicitly enabled for Spectrum-X.
- **DOCA-OFED driver container** (Kubernetes Layer) and host-installed
  **DOCA-Host** (Host Layer) are alternatives, not additive. Choose one
  per node; do not deploy both.
- **OVS-CNI** (Kubernetes Layer) plugs VFs into OVS bridges provided by
  **OVS-DOCA** (Host Layer). OVS-DOCA must be present on each node before
  the Kubernetes Layer can program rail / plane flows.
- **DOCA xPlane** is required only when ``multiplaneMode: hwplb`` is set
  on the ``NicConfigurationTemplate``. For single-plane and Software
  Multiplane deployments, the flow controller runs without xPlane.

===============
Further reading
===============

- **Image versions and supported platforms**: see the software components
  table in :doc:`Platform Support <../platform-support>`.
- **Spectrum-X CRDs and API reference**: see
  :doc:`Spectrum-X CRDs and API Reference <crds>`.
- **NIC firmware and rail-name configuration**: see
  :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.
- **End-to-end deployment walkthroughs**: see
  :doc:`Spectrum-X Kubernetes Quick Start <quick-start>`.
