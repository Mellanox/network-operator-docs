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
.. include:: ./common/vars.rst

****************
Platform Support
****************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none

========
Overview
========

Use this page to confirm that your hardware, operating system, and Kubernetes platform are supported by **NVIDIA Network Operator** before deployment.

Support terms used on this page:

* **Supported** — A configuration that NVIDIA maintains and backs for this release.
* **Validated** — A hardware or software configuration that NVIDIA has tested with this release.
* **GA** (Generally Available) — Production-ready support tier.
* **Tech Preview** — Limited testing; not recommended for production deployments.

========================
Versioning and Lifecycle
========================

**NVIDIA Network Operator** uses calendar versioning in the form ``YY.MM.PP`` (for example, 26.7.0). The first two fields identify the major version and release timeframe; the third field identifies the patch version, used for critical bug and CVE fixes.

When a new major version is released, the previous major version enters a **Deprecated** state and receives only patch updates for critical fixes. Earlier major versions reach **End of Support** and no longer receive updates.

.. list-table::
   :header-rows: 1

   * - Network Operator Version
     - Status
   * - |current-ga-version|
     - Supported
   * - |current-maintenance-version|
     - Deprecated
   * - |current-eol-version| and lower
     - End of Support

Upgrades are supported within a major release, or to the next major release. For the full support-status table, upgrade procedures, and operational guidance, see :doc:`Life Cycle Management <life-cycle-management>`.

.. note::

   The product lifecycle and versioning are subject to change in future releases.

=====================
Important Limitations
=====================

Review the following limitations before deployment:

* **Firmware reset on BMC-controlled platforms** — NVIDIA DGX/HGX GB200 NVL72, B200, and B300 systems require additional configuration so that firmware updates apply without a reboot loop. See :ref:`fw-reset-external-bmc`.
* **Precompiled DOCA-OFED driver containers are currently unsigned.**
* **Precompiled DOCA-OFED kernel-flavor support** — Only the Ubuntu ``generic`` kernel flavor is GA. The ``nvidia``, ``aws``, ``azure``, and ``oracle`` flavors are Tech Preview.
* For per-release known issues, see the :doc:`release-notes`.

=============
Prerequisites
=============

.. list-table::
   :header-rows: 1

   * - Component
     - Version
     - Notes
   * - Kubernetes
     - >=1.32 and <=1.36
     -
   * - Helm
     - v3.5+
     - For installation methods, refer to the official `Helm website <https://helm.sh/>`_.
   * - Node Feature Discovery
     - >=0.15.6 and <=0.17.0
     - When deploying the Network Operator and GPU Operator on the same cluster, ensure only one instance of Node Feature Discovery (NFD) is installed. We recommend using the version included with the GPU Operator.


===================
System Requirements
===================

* **RDMA-capable NVIDIA network adapters**
   * NVIDIA ConnectX NICs and SuperNICs
   * NVIDIA BlueField Networking Platforms
* **NVIDIA GPU Operator |gpu-operator-version-min| or newer** – required for workloads that use NVIDIA GPUs and GPUDirect RDMA. See `Support for GPUDirect RDMA`_.

=================================
Supported NVIDIA Network Adapters
=================================
The following adapters have been tested and validated with **NVIDIA Network Operator**:

.. list-table::
   :header-rows: 1

   * - Product Family
     - Ethernet
     - InfiniBand
     - Max Port Speed
     - Validated Protocols / Modes
     - Notes
   * - NVIDIA ConnectX-6 NIC
     - Yes
     - Yes
     - 200 Gb/s
     - IB RDMA, RoCE
     - —
   * - NVIDIA ConnectX-6 Dx NIC
     - Yes
     - No
     - 200 Gb/s
     - RoCE
     - —
   * - NVIDIA ConnectX-7 NIC
     - Yes
     - Yes
     - 400 Gb/s
     - IB RDMA, RoCE
     - —
   * - NVIDIA ConnectX-8 SuperNIC
     - Yes
     - Yes
     - 800 Gb/s
     - IB RDMA, RoCE
     - —
   * - NVIDIA ConnectX-9 SuperNIC
     - Yes
     - Yes
     - 800 Gb/s
     - IB RDMA, RoCE
     - —
   * - NVIDIA BlueField-3 DPU
     - Yes
     - No
     - 200 Gb/s
     - RoCE
     - NIC mode only
   * - NVIDIA BlueField-3 SuperNIC
     - Yes
     - No
     - 400 Gb/s
     - RoCE
     - NIC mode only

====================================
Supported NVIDIA Data Center Systems
====================================
The following NVIDIA Data Center systems have been tested and validated with **NVIDIA Network Operator**. For the supported versions of each operating system, see `Supported Operating Systems and Kubernetes Platforms`_. On Arm-based systems, only the Arm64 builds of the listed distributions are validated; not every operating system version in that table is available for Arm64.

.. list-table::
   :header-rows: 1

   * - System
     - CPU Architecture
     - GPU Architecture
     - Network Adapter(s)
     - Operating System(s)
     - Notes
   * - NVIDIA Grace ARM Server
     - Arm (NVIDIA Grace)
     - NVIDIA Hopper
     - BlueField-3 (NIC Mode)
     - Ubuntu / Red Hat OpenShift / SUSE Linux Enterprise Server
     - GA (RoCE only, without GPUDirect RDMA)
   * - NVIDIA IGX Orin
     - Arm (NVIDIA Orin)
     - NVIDIA Ampere
     - ConnectX-7
     - Ubuntu
     - GA (RoCE only, without GPUDirect RDMA)
   * - NVIDIA RTX PRO 6000 Blackwell Server
     - x86
     - NVIDIA Blackwell
     - BlueField-3 SuperNIC (NIC mode) / ConnectX-8
     - Ubuntu 22.04 / 24.04 (x86) / Red Hat OpenShift
     - GA
   * - NVIDIA DGX/HGX B200
     - x86
     - NVIDIA Blackwell
     - BlueField-3 SuperNIC (NIC mode) / ConnectX-7
     - Ubuntu 22.04 / 24.04 (x86) / Red Hat OpenShift
     - GA. Firmware reset required (see :ref:`fw-reset-external-bmc`)
   * - NVIDIA DGX/HGX B300
     - x86
     - NVIDIA Blackwell
     - ConnectX-8 SuperNIC
     - Ubuntu 22.04 / 24.04 (x86) / Red Hat OpenShift
     - GA. Firmware reset required (see :ref:`fw-reset-external-bmc`)
   * - NVIDIA DGX/HGX GB200 NVL72
     - Arm (NVIDIA Grace)
     - NVIDIA Blackwell
     - ConnectX-7
     - Ubuntu 24.04 (Arm64) / Red Hat OpenShift
     - GA. Firmware reset required (see :ref:`fw-reset-external-bmc`)
   * - NVIDIA DGX/HGX GB300 NVL72
     - Arm (NVIDIA Grace)
     - NVIDIA Blackwell
     - ConnectX-8
     - Ubuntu 24.04 (Arm64) / Red Hat OpenShift
     - GA. Firmware reset required (see :ref:`fw-reset-external-bmc`)
   * - NVIDIA DGX GB300 Workstation
     - Arm (NVIDIA Grace)
     - NVIDIA Blackwell
     - ConnectX-8 SuperNIC
     - Ubuntu 24.04, 22.04 (Arm64)
     - GA (RoCE only, without InfiniBand)
   * - NVIDIA Vera Rubin NVL72
     - Arm (NVIDIA Vera)
     - NVIDIA Rubin
     - ConnectX-9 SuperNIC
     - Ubuntu 24.04, 22.04 (Arm64)
     - Tech Preview — system validation is in progress. Uses ConnectX-9 SuperNIC, which is generally available for RoCE and InfiniBand workloads; see `Supported NVIDIA Network Adapters`_. Firmware reset required (see :ref:`fw-reset-external-bmc`)

.. _supported-deployment-options:

============================
Supported Deployment Options
============================

**NVIDIA Network Operator** supports the deployment models below, and supports
the DOCA-OFED driver being either pre-installed on the host or deployed as a
container.

-------------------------
Cluster Deployment Models
-------------------------

.. list-table::
   :header-rows: 1
   :widths: 26 48 26

   * - Deployment Model
     - Description
     - Guide
   * - **Bare metal**
     - Worker nodes run directly on physical hosts. Network Operator manages the NICs on those hosts.
     - :doc:`Getting Started with Kubernetes <getting-started-with-kubernetes>`
   * - **Virtual machine with PCIe passthrough**
     - A full NIC or an individual Virtual Function is passed through to the virtual machine. Network Operator runs **inside** the virtual machine and manages the passed-through device.
     - :doc:`Host Device Network with RDMA <quick-start/host-device-rdma>`
   * - **Virtual machine with SR-IOV**
     - Network Operator runs in the **host** cluster and allocates Virtual Functions to KubeVirt or Red Hat OpenShift Virtualization virtual machines through VFIO PCI passthrough.
     - :doc:`KubeVirt SR-IOV Integration <kubevirt>` and :doc:`OpenShift Virtualization SR-IOV Integration <openshift/ocp-kubevirt>`

-------------------------
DOCA-OFED Driver Delivery
-------------------------

Every **NVIDIA Network Operator** release supports both the latest DOCA-OFED **GA** driver and the latest DOCA-OFED **LTS** driver. For this release those are |doca-driver-version| (GA) and |doca-driver-version-lts| (LTS).

Both delivery methods are equally supported. The DOCA-OFED driver may be **pre-installed on the host** from the DOCA-Host package, or deployed as the **containerized DOCA-OFED driver** by Network Operator.

.. list-table::
   :header-rows: 1
   :widths: 24 40 36

   * - Delivery Method
     - Installed and Upgraded By
     - Supported Operating Systems
   * - **DOCA-Host** (pre-installed)
     - The host provisioning process, **before** Kubernetes and Network Operator are installed. Outside Network Operator scope — see the `NVIDIA DOCA Installation Guide for Linux <https://networking-docs.nvidia.com/doca/sdk/doca-installation-guide-for-linux>`_.
     - See *Supported Host OS per DOCA-Host Installation Profile* in the `NVIDIA DOCA documentation <https://networking-docs.nvidia.com/doca/sdk/doca-installation-guide-for-linux>`_.
   * - **DOCA-OFED driver container** (``doca-driver``)
     - Network Operator, through ``ofedDriver`` on ``NicClusterPolicy`` or :doc:`NicNodePolicy <customizations/nic-node-policy>`. See :doc:`DOCA-OFED Driver Container <advanced/doca-drivers>`.
     - `Supported Operating Systems and Kubernetes Platforms`_ on this page.

.. important::

   **DOCA-Host (host-installed)** and the **containerized DOCA-OFED driver** are **mutually exclusive**. Choose one per node; do not deploy both.

Recommended delivery method by host operating system type:

.. list-table::
   :header-rows: 1
   :widths: 24 24 52

   * - Host OS Type
     - Recommended
     - Rationale
   * - **Mutable** — Ubuntu, Red Hat Enterprise Linux, SUSE Linux Enterprise Server
     - Either
     - Choose **DOCA-Host** to install and version drivers separately from the cluster; it is a prerequisite completed before Kubernetes and Network Operator are installed. Choose the **driver container** for a cloud-native workflow that keeps the driver on the same lifecycle as the rest of the stack.
   * - **Immutable** — Red Hat CoreOS with Red Hat OpenShift
     - **Driver container**
     - Host packages cannot be installed, so DOCA-Host is not directly available. The driver container is the only way to deliver DOCA kernel drivers.

.. note::

   Precompiled driver container images are available for a subset of operating systems and kernel flavors — see `Supported Precompiled Container Images for DOCA-OFED Drivers`_.

====================================================
Supported Operating Systems and Kubernetes Platforms
====================================================
**NVIDIA Network Operator** has been validated on the following OS and platform combinations for Ethernet (RoCE) and InfiniBand (IB RDMA):

.. note::

   Kubernetes support for the NVIDIA Spectrum-X Reference Architecture (RA) is limited to a subset of OS and platform combinations. For details, refer to the `NVIDIA Spectrum-X documentation <https://www.nvidia.com/en-us/networking/spectrumx/>`_.

.. list-table::
   :header-rows: 1

   * - Operating System
     - Upstream Kubernetes
     - Red Hat OpenShift
     - Rancher RKE2
     - Canonical MicroK8s
     - Nutanix NKP
     - Container Runtime
     - Notes
   * - Ubuntu 26.04 LTS
     - 1.32–1.36
     - —
     - —
     - 1.32–1.36
     - 2.12–2.15
     - Containerd
     - —
   * - Ubuntu 24.04 LTS
     - 1.32–1.36
     - —
     - —
     - 1.32–1.36
     - 2.12–2.15
     - Containerd
     - —
   * - Ubuntu 22.04 LTS
     - 1.32–1.36
     - —
     - —
     - 1.32–1.36
     - 2.12–2.15
     - Containerd
     - RT kernel support
   * - Red Hat CoreOS
     - —
     - 4.17–4.22
     - —
     - —
     - —
     - CRI-O
     - RT kernel support
   * - Red Hat Enterprise Linux 10.2 / 10.0 / 9.8 / 9.6 / 9.4
     - 1.32–1.36
     - —
     - —
     - —
     - —
     - Containerd, CRI-O
     - RT kernel support
   * - Red Hat Enterprise Linux 8.10 / 8.8
     - 1.32–1.36
     - —
     - —
     - —
     - —
     - Containerd, CRI-O
     - RT kernel support
   * - SUSE Linux Enterprise Server 15 SP7
     - 1.32–1.36
     - —
     - 1.32–1.36
     - —
     - —
     - Containerd
     - Supported for Kubernetes and Rancher deployments


=============================
Supported Container Runtimes
=============================
**NVIDIA Network Operator** has been validated in the following scenarios:

.. list-table::
   :header-rows: 1

   * - Operating System
     - Containerd
     - CRI-O
     - Notes
   * - Ubuntu 26.04 LTS
     - Yes
     - No
     - 
   * - Ubuntu 24.04 LTS
     - Yes
     - No
     - 
   * - Ubuntu 22.04 LTS
     - Yes
     - No
     - 
   * - Red Hat CoreOS
     - No
     - Yes
     -
   * - Red Hat Enterprise Linux 9
     - Yes
     - Yes
     - 
   * - Red Hat Enterprise Linux 8
     - Yes
     - Yes
     -
   * - Red Hat Enterprise Linux 10
     - Yes
     - Yes
     -
   * - SUSE Linux Enterprise Server 15 SP7
     - Yes
     - No
     - 


==============================================
NVIDIA Spectrum-X Ethernet Networking Platform
==============================================
**NVIDIA Network Operator** has been validated with the following NVIDIA Spectrum-X Reference Architecture (RA) versions:

.. note::

   For details on supported topologies, NIC hardware, software components, and version-specific notes, refer to the `NVIDIA Spectrum-X documentation <https://www.nvidia.com/en-us/networking/spectrumx/>`_.

.. list-table::
   :header-rows: 1

   * - Spectrum-X RA Version
     - Topologies and NIC Hardware
     - Kubernetes Versions
     - Operating Systems
     - Notes
   * - 2.2
     - * Single-Plane (ConnectX-7 or BlueField-3 SuperNIC)
       * Dual- or Quad-plane (NVIDIA ConnectX-8 SuperNIC)
     - Upstream Kubernetes (1.32–1.36)
     - * Ubuntu 24.04 LTS
       * Ubuntu 22.04 LTS
     - Small RA, Software Multi-Plane
   * - 2.1
     - * Single-Plane (ConnectX-7 or BlueField-3 SuperNIC)
       * Dual- or Quad-plane (NVIDIA ConnectX-8 SuperNIC)
     - Upstream Kubernetes (1.32–1.36)
     - * Ubuntu 24.04 LTS
       * Ubuntu 22.04 LTS
     - Small RA, Software Multi-Plane

=======================================
Support for KubeVirt SR-IOV Passthrough
=======================================

**NVIDIA Network Operator** supports attaching SR-IOV Virtual Functions (VFs) to KubeVirt and Red Hat OpenShift Virtualization virtual machines via VFIO PCI passthrough. For deployment instructions, see :doc:`KubeVirt SR-IOV Integration <kubevirt>` on upstream Kubernetes, or :doc:`OpenShift Virtualization SR-IOV Integration <openshift/ocp-kubevirt>` on Red Hat OpenShift.

.. list-table::
   :header-rows: 1

   * - Operating System
     - Kubernetes
     - KubeVirt
     - Red Hat OpenShift Virtualization
   * - Ubuntu 26.04 LTS
     - 1.32–1.36
     - v1.8.2+
     - —
   * - Ubuntu 24.04 LTS
     - 1.32–1.36
     - v1.8.2+
     - —
   * - Ubuntu 22.04 LTS
     - 1.32–1.36
     - v1.8.2+
     - —
   * - Red Hat CoreOS
     - —
     - —
     - 4.17–4.22

Key limitations:

* VFIO passthrough requires IOMMU-capable hardware (Intel VT-d or AMD-Vi) with IOMMU enabled at boot.
* Live migration is not supported for VMs that use SR-IOV VFIO passthrough.
* Host-side RDMA is not available for VFIO-passed VFs; RDMA inside the guest is provided by the ``mlx5_core`` driver shipped with the guest image.

==========================
Support for GPUDirect RDMA
==========================

**NVIDIA Network Operator** enables GPUDirect RDMA between NVIDIA GPUs and supported NICs/SuperNICs when deployed together with **NVIDIA GPU Operator**. For deployment instructions, see :doc:`Network Operator Deployment for GPUDirect Workloads <deployment-guide-kubernetes>`. For GPU Operator-side support details, see `NVIDIA GPU Operator Platform Support — Support for GPUDirect RDMA <https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/platform-support.html#support-for-gpudirect-rdma>`_.

Requirements:

* NVIDIA GPU Operator |gpu-operator-version-min| or newer
* NVIDIA DOCA-OFED Driver |doca-driver-version-min| or newer
* ``nvidia_peermem`` kernel module (auto-loaded by recent NVIDIA GPU drivers)
* Supported NVIDIA GPU (Ampere, Hopper, Blackwell, or Rubin)
* Supported NVIDIA NICs (NVIDIA ConnectX or BlueField)

.. list-table::
   :header-rows: 1

   * - Operating System
     - Kubernetes
   * - Ubuntu 26.04 LTS
     - 1.32–1.36
   * - Ubuntu 24.04 LTS
     - 1.32–1.36
   * - Ubuntu 22.04 LTS
     - 1.32–1.36
   * - Red Hat Enterprise Linux 10.2 / 10.0 / 9.8 / 9.6 / 9.4
     - 1.32–1.36
   * - Red Hat Enterprise Linux 8.10 / 8.8
     - 1.32–1.36
   * - Red Hat CoreOS
     - OpenShift 4.17–4.22

For background on the underlying technology, see the `NVIDIA GPUDirect RDMA documentation <https://docs.nvidia.com/cuda/gpudirect-rdma/>`_.

=============================
Support for GPUDirect Storage
=============================

**NVIDIA Network Operator** provides the RDMA networking fabric (RoCE and InfiniBand) required by **GPUDirect Storage (GDS)**. GDS-compatible storage clients operate over the RDMA fabric provisioned by Network Operator.

.. warning::

   With the DOCA-OFED **driver container** and ``ENABLE_NFSRDMA=true``, host-side NVMe-over-RDMA cannot run concurrently — DOCA-OFED's ``ib_core`` conflicts with the inbox ``nvme_rdma`` module. The **DOCA-Host package** install path is unaffected, as is local-NVMe storage.

For configuration details (including the ``ENABLE_NFSRDMA`` setting and the NVMe inbox kernel module workaround), see :doc:`DOCA-OFED Driver Container <advanced/doca-drivers>`. For background on the underlying technology and the list of GDS-compatible storage clients and version requirements, see the `NVIDIA GPUDirect Storage documentation <https://docs.nvidia.com/gpudirect-storage/>`_.

============================================================
Supported Precompiled Container Images for DOCA-OFED Drivers
============================================================

--------
Overview
--------

To save startup time and operational effort, precompiled DOCA-OFED driver container images are available for common OS/flavor/kernel/architecture variants.

The container image tag pattern used for common variants is: **driver_ver-container_ver-kernel_ver-flavor-os-arch**. For example: ``24.07-0.6.1.0-0-6.8.0-49-generic-ubuntu24.04-amd64``

.. note::

   For the ``generic`` flavor of Ubuntu, the default kernel version is used for precompiling (for example, ``6.8.0-31`` for Ubuntu 24.04). For all other flavors, the latest kernel version available at the time of DOCA packaging and release is used.

---------------------------
Supported Operating Systems
---------------------------

Currently precompiled DOCA-OFED driver container images are provided for the following operating systems:

- Ubuntu 24.04 (amd64/arm64)
- Ubuntu 22.04 (amd64/arm64)

-----------
Limitations
-----------

- NVIDIA supports precompiled driver containers for the most recently released DOCA-OFED GA drivers.
- NVIDIA builds precompiled driver containers for ``generic``, ``nvidia``, ``aws``, ``azure``, and ``oracle`` kernel flavors.
- Precompiled driver containers are currently unsigned.
- If your hosts use a different kernel variant, you can create a custom precompiled driver container and host it in your own container registry. Please refer to the :ref:`Precompiled Container Build Instructions for NVIDIA DOCA-OFED Driver Container <precompiled-container-build-instructions-for-nvidia-doca-ofed-driver-container>` section.

.. warning::
   - Only ``generic`` kernel variant is tested and supported as a GA.
   - ``nvidia``, ``aws``, ``azure``, and ``oracle`` kernel variants are supported as a Tech Preview and have limited testing.

===========================================
Additional Supported Tools and Integrations
===========================================

Container management tools:

* `Helm v3 <https://helm.sh/>`_
* `Red Hat Operator Lifecycle Manager (OLM) <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/operators/understanding-operators#operator-lifecycle-manager-olm>`_

Deployment tooling:

* `NVIDIA Kubernetes Launch Kit <https://github.com/NVIDIA/k8s-launch-kit>`_ — CLI that discovers cluster hardware and generates Network Operator manifests. See :doc:`NVIDIA Kubernetes Launch Kit <k8s-launch-kit/k8s-launch-kit>`.

Orchestration & resource scheduling:

* `Run:ai <https://run-ai-docs.nvidia.com/>`_

.. note::

   Run:ai requires the NVIDIA Network Operator as a prerequisite. To configure NVIDIA Network Operator refer to the Run:ai `cluster requirements documentation <https://run-ai-docs.nvidia.com/self-hosted/getting-started/installation/install-using-helm/system-requirements#nvidia-network-operator>`_ for more information.

.. _network-operator-component-matrix:

=================================
Network Operator Component Matrix
=================================

The following components are shipped and versioned with **NVIDIA Network Operator**:


---------
Operators
---------

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `NVIDIA Network Operator <https://github.com/Mellanox/network-operator>`_
     - NVIDIA (OSS)
     - |network-operator-repository|
     - network-operator
     - |network-operator-version|
     - Yes
     - 
   * - `NVIDIA Network Operator <https://github.com/Mellanox/network-operator>`_
     - NVIDIA (OSS)
     - |doca-init-container-repository|
     - network-operator-init-container
     - |doca-init-container-version|
     - Yes
     - 
   * - `NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_
     - NVIDIA (OSS)
     - |nic-configuration-operator-repository|
     - nic-configuration-operator
     - |nic-configuration-operator-version|
     - Yes
     - 
   * - `NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_
     - NVIDIA (OSS)
     - |nic-configuration-operator-repository|
     - nic-configuration-operator-daemon
     - |nic-configuration-operator-version|
     - Yes
     - 
   * - `NVIDIA Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_
     - NVIDIA (OSS)
     - |maintenance-operator-repository|
     - maintenance-operator
     - |maintenance-operator-version|
     - Yes
     - 
   * - `NVIDIA Spectrum-X Operator <https://github.com/Mellanox/spectrum-x-operator>`_
     - NVIDIA (OSS)
     - |spectrumxop-repository|
     - spectrum-x-operator
     - |spectrumxop-version|
     - Yes
     - 
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - |sriovnetop-repository|
     - sriov-network-operator
     - |sriovnetop-version|
     - Yes
     - 
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - |sriovnetop-repository|
     - sriov-network-operator-webhook
     - |sriovnetop-version|
     - Yes
     - 
   * - `SRIOV Network Operator <https://github.com/k8snetworkplumbingwg/sriov-network-operator>`_
     - Community (OSS)
     - |sriovnetop-repository|
     - sriov-network-operator-config-daemon
     - |sriovnetop-version|
     - Yes
     - 

--------------------
Drivers and Services
--------------------

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `DOCA-OFED Driver Container <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/mellanox/containers/doca-driver>`_
     - NVIDIA (EULA)
     - |doca-driver-repository|
     - doca-driver
     - |doca-driver-version|
     - Yes
     - LTS version: |doca-driver-version-lts|
   * - `DOCA xPlane Service <https://catalog.ngc.nvidia.com/orgs/nvidia/doca/containers/xplane>`_
     - NVIDIA (EULA)
     - |xplane-repository|
     - xplane
     - |xplane-version|
     - Yes
     - Deployed for Spectrum-X Hardware Multiplane. The version tracks the DOCA release, not the Network Operator release.
   * - `DOCA Telemetry Service (DTS) <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/doca/containers/doca_telemetry>`_
     - NVIDIA (EULA)
     - |doca-telemetry-repository|
     - doca_telemetry
     - |doca-telemetry-version|
     - Yes
     - 

------------------
Networking Plugins
------------------

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `Multus CNI <https://github.com/k8snetworkplumbingwg/multus-cni>`_
     - Community (OSS)
     - |multus-repository|
     - multus-cni
     - |multus-version|
     - Yes
     - 
   * - `K8s CNI network plugins <https://github.com/containernetworking/plugins>`_
     - Community (OSS)
     - |cni-plugins-repository|
     - plugins
     - |cni-plugins-version|
     - Yes
     - 
   * - `SR-IOV CNI plugin <https://github.com/k8snetworkplumbingwg/sriov-cni>`_
     - Community (OSS)
     - |sriovnetop-sriov-cni-repository|
     - sriov-cni
     - |sriovnetop-sriov-cni-version|
     - Yes
     - 
   * - `InfiniBand SR-IOV CNI plugin <https://github.com/k8snetworkplumbingwg/ib-sriov-cni>`_
     - Community (OSS)
     - |sriovnetop-ib-sriov-cni-repository|
     - ib-sriov-cni
     - |sriovnetop-ib-sriov-cni-version|
     - Yes
     - 
   * - `IP Over Infiniband (IPoIB) CNI plugin <https://github.com/Mellanox/ipoib-cni>`_
     - NVIDIA (OSS)
     - |ipoib-cni-repository|
     - ipoib-cni
     - |ipoib-cni-version|
     - Yes
     - 
   * - `RDMA CNI plugin <https://github.com/k8snetworkplumbingwg/rdma-cni>`_
     - Community (OSS)
     - |rdma-cni-repository|
     - rdma-cni
     - |rdma-cni-version|
     - Yes
     - 
   * - `Open vSwitch CNI plugin <https://github.com/k8snetworkplumbingwg/ovs-cni>`_
     - Community (OSS)
     - |ovs-cni-repository|
     - ovs-cni-plugin
     - |ovs-cni-version|
     - Yes
     - 
   * - `NVIDIA IPAM Plugin <https://github.com/Mellanox/nvidia-k8s-ipam>`_
     - NVIDIA (OSS)
     - |nvidia-ipam-repository|
     - nvidia-k8s-ipam
     - |nvidia-ipam-version|
     - Yes
     - 
   * - `IB Kubernetes Plugin <https://github.com/Mellanox/ib-kubernetes>`_
     - NVIDIA (OSS)
     - |ib-kubernetes-repository|
     - ib-kubernetes
     - |ib-kubernetes-version|
     - Yes
     - 

--------------------------------------
Device Plugins and Resource Allocation
--------------------------------------

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `RDMA Shared Device Plugin <https://github.com/Mellanox/k8s-rdma-shared-dev-plugin>`_ 
     - NVIDIA (OSS)
     - |k8s-rdma-shared-dev-plugin-repository|
     - k8s-rdma-shared-dev-plugin
     - |k8s-rdma-shared-dev-plugin-version|
     - Yes
     - 
   * - `SR-IOV Network Device Plugin <https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin>`_
     - Community (OSS)
     - |sriovnetop-sriov-device-plugin-repository|
     - sriov-network-device-plugin
     - |sriovnetop-sriov-device-plugin-version|
     - Yes
     - 
   * - `DRA Driver SR-IOV <https://github.com/k8snetworkplumbingwg/dra-driver-sriov>`_
     - Community (OSS)
     - |dra-driver-sriov-repository|
     - dra-driver-sriov
     - |dra-driver-sriov-version|
     - No
     - **Tech Preview.** See :doc:`DRA SR-IOV Driver <dra-sriov-driver/dra-sriov-driver>`.

---------
Discovery
---------

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `NVIDIA NIC Feature Discovery <https://github.com/Mellanox/nic-feature-discovery>`_
     - NVIDIA (OSS)
     - |nic-feature-discovery-repository|
     - nic-feature-discovery
     - |nic-feature-discovery-version|
     - Yes
     - 
   * - `Node Feature Discovery <https://github.com/kubernetes-sigs/node-feature-discovery>`_
     - Community (OSS)
     - |node-feature-discovery-repository|
     - node-feature-discovery
     - |node-feature-discovery-version|
     - Yes
     - Optionally deployed. May already be present in the cluster with proper configuration.

-----
Tools
-----

.. list-table::
   :header-rows: 1

   * - Component
     - Origin
     - Repository
     - Image Name
     - Tag
     - NVAIE
     - Notes
   * - `NVIDIA Kubernetes Launch Kit <https://github.com/NVIDIA/k8s-launch-kit>`_
     - NVIDIA (OSS)
     - |k8s-launch-kit-repository|
     - k8s-launch-kit
     - |k8s-launch-kit-version|
     - Yes
     - CLI tool that generates manifests and installs Network Operator; not deployed by the operator. See :doc:`NVIDIA Kubernetes Launch Kit <k8s-launch-kit/k8s-launch-kit>`.
