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
Heterogeneous Clusters with NicNodePolicy
**********************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

By default, the NVIDIA Network Operator uses a single NicClusterPolicy (NCP) resource to manage all NIC-related components cluster-wide.
In heterogeneous clusters, where different groups of nodes require different DOCA-OFED driver versions or device plugin configurations, this single-policy model is not sufficient.
NicNodePolicy (NNP) addresses this by allowing you to create multiple per-node-group policies, each targeting specific nodes via ``nodeSelector`` labels.

.. warning::

   NicNodePolicy is recommended for **new deployments only**. There is no automated migration path
   to transition an existing NicClusterPolicy-only deployment to use NicNodePolicies. Migrating
   an existing cluster requires manually removing per-node sections from NicClusterPolicy and
   creating corresponding NicNodePolicy resources, which causes temporary disruption to affected
   components.

===========================
When to Use NicNodePolicy
===========================

For new deployments, NicNodePolicy is the **recommended** approach for managing per-node NIC components (DOCA-OFED driver, RDMA shared device plugin, SR-IOV device plugin), even in homogeneous clusters. Using NicNodePolicy from the start provides a consistent deployment model and makes it straightforward to support heterogeneous configurations in the future without re-architecting your policies.

NicNodePolicy is especially valuable when:

- Different groups of nodes need different DOCA-OFED driver versions (e.g., GPU nodes on the latest DOCA release, storage nodes on an LTS release).
- Different node groups need different SR-IOV device plugin configurations.
- Different node groups need different RDMA shared device plugin configurations.
- You need independent DOCA-OFED driver upgrade schedules per node group.

NicClusterPolicy alone is sufficient when you have an existing deployment that already manages per-node components through NCP and does not require heterogeneous configurations. Cluster-wide components such as Multus, NV-IPAM, and NIC Configuration Operator are always managed exclusively by NicClusterPolicy regardless of whether NicNodePolicy is used.

========================================================
How NicClusterPolicy and NicNodePolicy Work Together
========================================================

Overview
--------

NicClusterPolicy is a singleton resource (always named ``nic-cluster-policy``) that manages up to 12 component types cluster-wide.
NicNodePolicy allows creating multiple instances, each targeting a specific set of nodes via ``nodeSelector``, but only for a subset of 3 components.

The following table shows which components can be managed by each policy type.
See the :ref:`NicClusterPolicySpec <NicClusterPolicySpec>` and :ref:`NicNodePolicySpec <NicNodePolicySpec>` API references for full field details.

.. list-table:: Component Ownership
   :header-rows: 1
   :widths: 60 20 20

   * - **Component**
     - **NCP**
     - **NNP**
   * - `DOCA-OFED Driver <crds.html#ofeddriverspec>`__
     - |dot|
     - |dot|
   * - `RDMA Shared Device Plugin <crds.html#devicepluginspec>`__
     - |dot|
     - |dot|
   * - `SR-IOV Device Plugin <crds.html#devicepluginspec>`__
     - |dot|
     - |dot|
   * - `Multus CNI <crds.html#secondarynetworkspec>`__
     - |dot|
     -
   * - `CNI Plugins <crds.html#secondarynetworkspec>`__
     - |dot|
     -
   * - `IPoIB CNI <crds.html#secondarynetworkspec>`__
     - |dot|
     -
   * - `NV-IPAM <crds.html#nvipamspec>`__
     - |dot|
     -
   * - `NIC Configuration Operator <crds.html#nicconfigurationoperatorspec>`__
     - |dot|
     -
   * - `DOCA Telemetry Service <crds.html#docatelemetryservicespec>`__
     - |dot|
     -
   * - `Spectrum-X Operator <crds.html#spectrumxoperatorspec>`__
     - |dot|
     -
   * - `IB Kubernetes <crds.html#ibkubernetesspec>`__
     - |dot|
     -
   * - `NIC Feature Discovery <crds.html#nicfeaturediscoveryspec>`__
     - |dot|
     -

.. |dot| unicode:: U+2022

Cluster-wide infrastructure components (Multus, NV-IPAM, NIC Configuration Operator, etc.) always remain in NicClusterPolicy.
Per-node components (DOCA-OFED driver and device plugins) can be moved to NicNodePolicy instances to support heterogeneous configurations.

NCP-Only Deployment Flow
-------------------------

In a homogeneous cluster, NicClusterPolicy manages everything. All nodes run the same DOCA-OFED driver version and device plugin configuration:

.. code-block:: yaml
   :substitutions:

   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     ofedDriver:
       image: doca-driver
       repository: |doca-driver-repository|
       version: |doca-driver-version|
       upgradePolicy:
         autoUpgrade: true
         maxParallelUpgrades: 1
     rdmaSharedDevicePlugin:
       image: k8s-rdma-shared-dev-plugin
       repository: |k8s-rdma-shared-dev-plugin-repository|
       version: |k8s-rdma-shared-dev-plugin-version|
       config: |
         {
           "configList": [
             {
               "resourceName": "rdma_shared_device_a",
               "rdmaHcaMax": 63,
               "selectors": {
                 "vendors": ["15b3"]
               }
             }
           ]
         }
     secondaryNetwork:
       multus:
         image: multus-cni
         repository: |multus-repository|
         version: |multus-version|
     nvIpam:
       image: nvidia-k8s-ipam
       repository: |nvidia-ipam-repository|
       version: |nvidia-ipam-version|

NCP + NNP Deployment Flow
--------------------------

In a heterogeneous cluster, NicClusterPolicy retains only cluster-wide components.
Per-node components move to NicNodePolicy instances, each targeting a specific node group:

.. code-block:: yaml
   :substitutions:

   # Cluster-wide components only
   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     secondaryNetwork:
       multus:
         image: multus-cni
         repository: |multus-repository|
         version: |multus-version|
     nvIpam:
       image: nvidia-k8s-ipam
       repository: |nvidia-ipam-repository|
       version: |nvidia-ipam-version|
   ---
   # GPU nodes: latest DOCA driver with RDMA
   apiVersion: mellanox.com/v1alpha1
   kind: NicNodePolicy
   metadata:
     name: gpu-nodes
   spec:
     nodeSelector:
       node-role.kubernetes.io/gpu: ""
     ofedDriver:
       image: doca-driver
       repository: |doca-driver-repository|
       version: |doca-driver-version|
       upgradePolicy:
         autoUpgrade: true
         maxParallelUpgrades: 1
     rdmaSharedDevicePlugin:
       image: k8s-rdma-shared-dev-plugin
       repository: |k8s-rdma-shared-dev-plugin-repository|
       version: |k8s-rdma-shared-dev-plugin-version|
       config: |
         {
           "configList": [
             {
               "resourceName": "rdma_shared_device_a",
               "rdmaHcaMax": 63,
               "selectors": {
                 "vendors": ["15b3"]
               }
             }
           ]
         }
   ---
   # Storage nodes: LTS DOCA driver with SR-IOV
   apiVersion: mellanox.com/v1alpha1
   kind: NicNodePolicy
   metadata:
     name: storage-nodes
   spec:
     nodeSelector:
       node-role.kubernetes.io/storage: ""
     ofedDriver:
       image: doca-driver
       repository: |doca-driver-repository|
       version: |doca-driver-version-lts|
       upgradePolicy:
         autoUpgrade: true
         maxParallelUpgrades: 2
     sriovDevicePlugin:
       image: sriov-network-device-plugin
       repository: |sriov-device-plugin-repository|
       version: |sriov-device-plugin-version|
       config: |
         {
           "resourceList": [
             {
               "resourcePrefix": "nvidia.com",
               "resourceName": "sriov_rdma",
               "selectors": {
                 "vendors": ["15b3"],
                 "isRdma": true
               }
             }
           ]
         }

Notice that the ``ofedDriver`` section is absent from NicClusterPolicy and present in both NicNodePolicy instances.
Each NNP targets a distinct set of nodes with different DOCA-OFED versions and device plugin types.

============================================
DOCA-OFED Driver Upgrades with NicNodePolicy
============================================

Each NicNodePolicy with an ``ofedDriver`` section gets its own independent upgrade state manager.
Upgrading the DOCA-OFED driver on one node group does not affect other node groups.

Key behaviors:

- Each NicNodePolicy has a separate ``maxParallelUpgrades`` setting.
- In maintenance-operator mode, each NicNodePolicy creates its own ``NodeMaintenance`` custom resources with a policy-specific requestor ID.
- Upgrade progress is tracked independently per policy via the ``nvidia.com/ofed-driver-upgrade-state`` node label.

.. note::

   For general DOCA-OFED driver upgrade configuration, see the
   `Automatic DOCA-OFED Driver Upgrade <../life-cycle-management.html#automatic-doca-ofed-driver-upgrade>`_
   section in the Life Cycle Management page.

====================================
Deployment Rules and Restrictions
====================================

Section Exclusivity
--------------------

A given section (``ofedDriver``, ``rdmaSharedDevicePlugin``, ``sriovDevicePlugin``) can exist in **either** NicClusterPolicy or NicNodePolicy instances, but **not both simultaneously**.
This rule is enforced by the admission webhook and prevents conflicting configurations.

For example:

.. code-block:: text

   VALID configuration:
     NicClusterPolicy:  secondaryNetwork, nvIpam
     NicNodePolicy "gpu-nodes":      ofedDriver, rdmaSharedDevicePlugin
     NicNodePolicy "storage-nodes":  ofedDriver, sriovDevicePlugin

   INVALID configuration (rejected by webhook):
     NicClusterPolicy:  ofedDriver            <-- conflict
     NicNodePolicy "gpu-nodes":  ofedDriver   <-- same section in both

.. note::

   Section exclusivity is enforced per section, not per NicNodePolicy instance. If **any** NicNodePolicy
   defines ``ofedDriver``, then NicClusterPolicy must **not** define ``ofedDriver``, and vice versa.

Node Selector Overlap Prevention
---------------------------------

Two NicNodePolicy instances must not select overlapping sets of nodes. This is validated at two points:

#. **At admission time** -- the validating webhook resolves node selectors against actual cluster nodes and checks for intersection. If overlap is found, the create or update request is rejected.

#. **At runtime** -- the NicNodePolicy controller re-checks for overlap on every reconciliation to catch cases where nodes are re-labeled after the initial admission check. If overlap is detected, the affected NicNodePolicy status is set to ``Error`` with a message describing which nodes overlap, and no DaemonSet changes are applied until the overlap is resolved.

.. code-block:: yaml

   # VALID: non-overlapping node selectors
   ---
   # NicNodePolicy "gpu-nodes"
   spec:
     nodeSelector:
       node-role.kubernetes.io/gpu: ""
   ---
   # NicNodePolicy "storage-nodes"
   spec:
     nodeSelector:
       node-role.kubernetes.io/storage: ""

.. code-block:: yaml

   # INVALID: if any node has BOTH labels, overlap is detected
   ---
   # NicNodePolicy "pool-a"
   spec:
     nodeSelector:
       datacenter: us-east
   ---
   # NicNodePolicy "pool-b"
   spec:
     nodeSelector:
       rack: row-1

.. note::

   The overlap check resolves selectors against the actual nodes in the cluster. Two NicNodePolicies
   with different label keys can still overlap if any node happens to match both selectors.

Naming Requirements
--------------------

NicNodePolicy names must be **at most 30 characters** long. This limit exists because derived resource names (such as DaemonSet names and label values) incorporate the policy name and must stay within the Kubernetes 63-character label value limit.

Kubernetes short names for NicNodePolicy: ``nicnode``, ``nnp``.

Each NicNodePolicy creates uniquely-named DaemonSets by appending the policy name as a suffix:

.. list-table:: DaemonSet Naming
   :header-rows: 1
   :widths: 40 60

   * - **Policy**
     - **DaemonSet Name Pattern**
   * - NicClusterPolicy
     - ``mofed-<os><version>-<hash>-ds``
   * - NicNodePolicy ``gpu-nodes``
     - ``mofed-<os><version>-<hash>-gpu-nodes-ds``

Prerequisites
--------------

The admission controller must be enabled for the section exclusivity and node overlap validation rules to be enforced.
Set ``operator.admissionController.enabled`` to ``true`` in the Helm chart values.
See :doc:`../advanced/advanced-configurations` for admission controller deployment details.

===========================
Verifying the Deployment
===========================

List all NicNodePolicy resources:

.. code-block:: bash

   kubectl get nicnodepolicies

Check the status of a specific NicNodePolicy:

.. code-block:: bash

   kubectl get nnp gpu-nodes -o yaml

A ``state: ready`` status indicates that the NicNodePolicy has been successfully applied.
An ``state: error`` status with a ``reason`` field indicates a problem, such as a node selector overlap.

Verify the DaemonSets created by a NicNodePolicy:

.. code-block:: bash

   kubectl get ds -n nvidia-network-operator -l nvidia.com/ofed-driver=

Check for policy errors across all NicNodePolicies:

.. code-block:: bash

   kubectl get nnp -o custom-columns=NAME:.metadata.name,STATE:.status.state,REASON:.status.reason
