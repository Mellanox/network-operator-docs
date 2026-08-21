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

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none


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
default-enabled state in Network Operator 26.7.0. For exact image versions,
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

**Host Layer** *(Day 0 — outside Network Operator scope)* — operating-system
prerequisites, the DOCA-Host driver, and the OVS-DOCA virtual switch.

**Kubernetes Layer** *(Day 1 / Day 2 — owned by Network Operator)* — node
discovery, the containerized driver, the operator stack, the CNI and
data-plane components, and the Spectrum-X profile ConfigMap that feeds NIC
configuration.

Each layer is broken out in the sections below.

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
   * - **SR-IOV enabled in BIOS/UEFI**
     - Platform firmware setting that permits Virtual Function creation.
       The NIC-side nvconfig (``SRIOV_EN``, ``SRIOV_NUM_OF_VFS``, and the
       multiplane parameters) is **not** set here — the NIC Configuration
       Operator derives it from ``numVfs`` and the Spectrum-X profile. See
       :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.
   * - **Hugepages**
     - Memory backing for OVS-DOCA: 400 MB per SuperNIC from DOCA 3.4
       onwards (1 GB on earlier DOCA), reserved on the kernel command
       line. **Hardware Multiplane needs a second reservation** for DOCA
       xPlane — at least 150 × 2 MB pages per SuperNIC, provisioned with
       ``doca-hugepages config --app doca-xplane``.
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
       driver path for Spectrum-X RA 2.3 validated deployments.

.. important::

   **DOCA-Host (host-installed)** and the **containerized DOCA-OFED
   driver** (deployed via Network Operator — see
   :ref:`k8s-driver-layer`) are **mutually exclusive**. Choose one per
   node; do not deploy both. Spectrum-X RA 2.3 validated deployments
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

Driver (containerized)
----------------------

.. list-table::
   :header-rows: 1
   :widths: 24 46 16 14

   * - Component
     - Role
     - Default
     - Spectrum-X relevance
   * - **DOCA-OFED driver container** (``doca-driver``)
     - Containerized NVIDIA DOCA-OFED kernel driver, loaded on the node by
       Network Operator. Mutually exclusive with host-installed
       :ref:`DOCA-Host <host-driver>` — choose one per node. On
       **immutable operating systems** such as Red Hat CoreOS, where host
       packages cannot be installed, this is the **only** way to deliver
       DOCA kernel drivers for ConnectX and BlueField hardware, and it
       keeps the driver on the same cloud-native lifecycle as the rest of
       the stack.
     - Opt-in via ``ofedDriver`` on ``NicClusterPolicy``.
     - Optional by default; required on immutable hosts.

Operator
--------

**NVIDIA Network Operator is the only networking operator you install.**
It is the entry point for all NVIDIA networking on Kubernetes — RDMA and
RoCE, InfiniBand, and Spectrum-X alike — and it owns the
``NicClusterPolicy`` and ``NicNodePolicy`` APIs through which everything
else is configured. (GPU workloads additionally use NVIDIA GPU Operator,
which is installed separately.)

Everything in the table below is a **sub-operator**: packaged in the
Network Operator Helm chart, switched on through ``NicClusterPolicy``,
and version-pinned and reconciled by Network Operator. None of them is
installed, upgraded, or configured on its own — Spectrum-X is enabled by
turning the right sub-operators on, not by adding another operator
alongside Network Operator.

.. list-table::
   :header-rows: 1
   :widths: 22 45 18 15

   * - Sub-operator
     - Role
     - Default
     - Spectrum-X relevance
   * - **SR-IOV Network Operator**
     - Owns ``SriovNetworkNodePolicy`` and ``OVSNetwork``; manages VF
       creation and switchdev mode, and ships the components the
       Spectrum-X data path uses — **OVS-CNI**, **RDMA-CNI**, the SR-IOV
       Device Plugin, and the DRA driver.
     - Off by default; **on for Spectrum-X**.
     - Essential.
   * - **NIC Configuration Operator**
     - Owns ``NicConfigurationTemplate``, ``NicFirmwareTemplate``, and
       ``NicInterfaceNameTemplate``; applies firmware and rail-name
       templates to each SuperNIC. Reads NIC tuning from the Spectrum-X
       profile ConfigMap named by ``spectrumXOptimized.version`` — see
       :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.
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
     - Recommended. Enabled in the Spectrum-X reference values
       (``maintenanceOperator.enabled: true``).

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
     - Plugs SR-IOV VFs into the rail's OVS bridge and chains with NV-IPAM
       for address allocation. The bridge itself is created by an operator
       — per-PF by the SR-IOV Network Operator for ``swplb`` / ``none``,
       or ``br-xplane`` by the Spectrum-X Operator for ``hwplb`` — on top
       of the :ref:`OVS-DOCA <host-virtual-switch>` switch from the Host
       Layer. Shipped under the SR-IOV Network Operator sub-chart.
     - With SR-IOV Op.
     - Essential.
   * - **SR-IOV Network Device Plugin**
     - Advertises VFs to kubelet as schedulable ``nvidia.com/...``
       resources.
     - With SR-IOV Op.
     - Essential.
   * - **RDMA-CNI**
     - Moves RDMA devices into the pod network namespace (requires RDMA
       exclusive mode on the host) and applies the RDMA QoS values the
       Spectrum-X Operator sets on the generated ``OVSNetwork``. Every
       Spectrum-X rail chains it, so it is not optional in practice.
     - With SR-IOV Op.
     - Essential.
   * - **NV-IPAM**
     - Rail / plane-aware IP allocation for pods. Consumes ``CIDRPool``
       CRDs and assigns IPs to VFs on pod creation. Rails normally point
       at a pool with ``cidrPoolRef``; ``railTopology[].ipam`` is an
       advanced alternative for supplying the NV-IPAM block by hand.
     - Opt-in via ``nvIpam``.
     - Essential.
   * - **Spectrum-X flow-controller DaemonSet**
     - Programs OVS flows on each host so packets are forwarded onto the
       correct rail / plane uplink. Not a separately versioned CNI;
       deployed by Spectrum-X Operator.
     - With Spectrum-X Op.
     - Essential.
   * - **DOCA xPlane**
     - DaemonSet that manages local and remote plane failover inside
       OVS-DOCA: consumes route-availability updates from the Spectrum-X
       fabric, programs the OpenFlow rules that divert traffic away from a
       failed plane, and exposes gRPC telemetry. Deployed by the
       Spectrum-X Operator; its image tag follows the **DOCA** release,
       not the Network Operator version. Currently requires ConnectX-8
       SuperNIC with firmware 40.48.1000 or later. See
       :ref:`when-xplane-is-deployed`.
     - With Spectrum-X Op.
     - **Required for Hardware Multiplane.**

Optional and tech preview
-------------------------

These components are optional for a Spectrum-X Kubernetes deployment, or
are still tech preview.

.. list-table::
   :header-rows: 1
   :widths: 25 55 20

   * - Component
     - Role
     - Status
   * - **SR-IOV DRA driver** (``dra-driver-sriov``)
     - Dynamic Resource Allocation driver for SR-IOV. Enables fine-grained
       VF claims via ``ResourceClaim`` and ``ResourceClaimTemplate``
       objects, and pairs a VF with the GPU behind the same PCIe root.
       Requires the Kubernetes 1.32+ DRA API; Spectrum-X RA 2.3 requires
       Kubernetes 1.35 or later — see :doc:`Platform Support
       <../platform-support>`. See :doc:`DRA SR-IOV Driver
       <../dra-sriov-driver/dra-sriov-driver>`.
     - **Tech preview**.
   * - **NicNodePolicy** CRD
     - Per-node-group DOCA-OFED driver management — supersedes the
       cluster-wide ``ofedDriver`` setting. Use it when one cluster mixes
       node types with different NIC hardware, driver versions, or
       configurations. Spectrum-X reference-architecture deployments are
       homogeneous, so a single ``NicClusterPolicy`` is sufficient; check
       the Spectrum-X documentation for your Reference Architecture before
       mixing node types. See :doc:`NicNodePolicy
       <../customizations/nic-node-policy>`.
     - **GA.** Optional for Spectrum-X.
   * - **DOCA Telemetry Service**
     - Host telemetry exporter for OVS, RDMA, and SuperNIC statistics.
     - Opt-in.

=======================================
What the Spectrum-X Operator configures
=======================================

Beyond creating CRDs, the Spectrum-X Operator applies SR-IOV and host
settings on your behalf. Do not configure these by hand — the operator
reconciles them, and manual changes are overwritten.

.. list-table::
   :header-rows: 1
   :widths: 26 48 26

   * - Setting
     - What it does
     - Applied when
   * - ``flow_steering_mode=hmfs``
     - devlink parameter enabling hardware-managed flow steering on each
       PF, written through the ``SriovNetworkNodePolicy`` the operator
       generates.
     - Every Spectrum-X rail, all multiplane modes.
   * - ``esw_multiport=true``
     - devlink parameter putting the PF e-switch into multiport mode, so a
       single e-switch spans the rail's planes.
     - Hardware Multiplane only.
   * - eSwitch mode ``switchdev``
     - Required for VF representors and OVS offload.
     - Every Spectrum-X rail.
   * - **OVS bridge**
     - For ``swplb`` and ``none``, a per-PF bridge created by the SR-IOV
       Network Operator (``GroupingPolicy: perPF``, datapath ``netdev``,
       uplink type ``doca``) — this is what the ``manageSoftwareBridges``
       feature gate enables. For ``hwplb``, ``br-xplane``, created by the
       Spectrum-X Operator.
     - Every Spectrum-X rail.
   * - **RDMA QoS meta-plugin**
     - The generated ``OVSNetwork`` chains the RDMA CNI with
       ``rdmaQoS: {tos: 96, tc: 96}`` and names the Pod's RDMA device
       ``rdma_<rail topology name>``.
     - Every Spectrum-X rail.
   * - **VRF meta-plugin**
     - Isolates each rail in its own VRF, named after the rail topology
       entry. Inspect routes with ``ip -6 route show vrf <rail>``.
     - Rails whose ``cidrPoolRef`` resolves to an IPv6 ``CIDRPool``. The
       operator reads the address family from the referenced pool, so a
       rail that supplies its NV-IPAM block inline through
       ``railTopology[].ipam`` does not get a VRF.
   * - **OVS safe-start drop-in**
     - Installs ``/var/lib/spectrum-x/xplane-ovs-safe-start.sh`` and an
       ``ExecStartPre`` drop-in at
       ``/etc/systemd/system/ovs-vswitchd.service.d/20-xplane-safe-start.conf``.
       On OVS start it removes any xPlane uplink whose PF has not yet
       entered switchdev mode, so OVS never comes up with a
       half-configured uplink.
     - Hardware Multiplane only.

.. note::

   The DOCA XPlane Service Guide documents the devlink and eSwitch steps
   as manual ``devlink`` commands for bare-metal hosts. In a Kubernetes
   deployment the Spectrum-X Operator performs them for you — follow this
   page rather than the bare-metal procedure.

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

.. _when-xplane-is-deployed:

When DOCA xPlane is deployed
----------------------------

The Spectrum-X Operator deploys the xPlane DaemonSet **per rail topology
entry that selects more than one PF** — that is, when
``SpectrumXRailPoolConfig.railTopology[].nicSelector.pfNames`` lists two or
more PFs. It does **not** read ``multiplaneMode``: that field lives on
``NicConfigurationTemplate``, which a different operator owns.

.. list-table::
   :header-rows: 1
   :widths: 20 45 35

   * - Mode
     - Rail topology shape
     - DOCA xPlane
   * - ``hwplb``
     - One entry per rail, listing every plane's PF
     - Deployed
   * - ``swplb``
     - One entry per rail-plane, a single PF each
     - Not deployed
   * - ``none``
     - One entry per rail, a single PF
     - Not deployed

Before creating the ``br-xplane`` bridge, the operator waits for the
selected PFs to enter switchdev mode.

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
