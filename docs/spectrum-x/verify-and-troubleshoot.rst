.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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

**********************************
Verify and Troubleshoot Spectrum-X
**********************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

Work through the checks in the order below: each layer depends on the one
before it, so the first failing check is where to start debugging. The
examples assume the Network Operator is installed in the
``nvidia-network-operator`` namespace.

=================================
Step 1: The profile was loaded
=================================

Profile ConfigMaps are watched and loaded by the NIC configuration
**daemon**, which runs on every node — not by the operator Pod. It logs a
line for each profile it picks up:

.. code-block:: bash

   kubectl -n nvidia-network-operator logs \
     -l app.kubernetes.io/name=nic-configuration-daemon \
     | grep "Loaded Spectrum-X profile"

If nothing matches, confirm the ConfigMap carries the watch label:

.. code-block:: bash

   kubectl get configmap -A \
     -l network.nvidia.com/operator.nic-configuration.spectrum-x-profile

The label value is ignored — only the key must be present. The ConfigMap
**name** is what ``spectrumXOptimized.version`` must match, character for
character.

=======================================
Step 2: NIC configuration was applied
=======================================

Each SuperNIC appears as a ``NicDevice``. Check the conditions:

.. code-block:: bash

   kubectl -n nvidia-network-operator get nicdevices
   kubectl -n nvidia-network-operator get nicdevice <name> -o jsonpath='{.status.conditions}' | jq

Reasons you may see on the ``ConfigUpdateInProgress`` condition:

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - Reason
     - Meaning
   * - ``UpdateSuccessful``
     - Configuration applied. This is the target state.
   * - ``UpdateStarted``, ``PendingReboot``, ``PendingNodeMaintenance``
     - In progress. ``PendingReboot`` and ``PendingNodeMaintenance`` wait
       for a maintenance window — check the Maintenance Operator if they
       persist.
   * - ``PendingFirmwareUpdate``
     - Waiting on a firmware update, either on this device or on another
       device on the same node.
   * - ``PartiallyApplied``
     - Some parameters were skipped as unsupported on this device. The
       message lists them: *configuration partially applied; the following
       spec params are not supported on this device and were skipped: …*
   * - ``IncorrectSpec``, ``SpecValidationFailed``
     - The template is invalid for this device — check ``nicType``,
       ``linkType``, ``numVfs``, and the multiplane mode against
       :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.
   * - ``NonVolatileConfigUpdateFailed``, ``RuntimeConfigUpdateFailed``,
       ``FirmwareError``
     - The apply itself failed. Check the daemon logs on the affected
       node: ``kubectl -n nvidia-network-operator logs -l
       app.kubernetes.io/name=nic-configuration-daemon --field-selector
       spec.nodeName=<node>``.

=================================
Step 3: Rails are configured
=================================

``SpectrumXRailPoolConfig`` reports an aggregate status and a per-node
breakdown:

.. code-block:: bash

   kubectl -n nvidia-network-operator get spectrumxrailpoolconfig <name> \
     -o jsonpath='{.status.syncStatus}'

   kubectl -n nvidia-network-operator get spectrumxrailpoolconfig <name> \
     -o jsonpath='{.status.nodeStates}' | jq

``syncStatus`` is one of ``Unknown``, ``InProgress``, ``Failed``, or
``Succeeded``. When it is not ``Succeeded``, ``nodeStates[]`` identifies
which nodes are affected and carries a ``message`` for each.

Confirm the operator generated the downstream resources — one per rail, or
one per rail-plane in ``swplb``:

.. code-block:: bash

   kubectl -n nvidia-network-operator get ovsnetwork
   kubectl -n nvidia-network-operator get sriovnetworknodepolicy

.. _verify-plane-health:

===========================================
Step 4: Plane health (Hardware Multiplane)
===========================================

With ``hwplb`` the planes are hidden from the workload: a Pod sees one
interface per rail whether every plane is healthy or only one is. A
degraded plane is therefore **invisible from inside the Pod**, and DOCA
xPlane is the only place to see it.

The xPlane DaemonSet runs as ``xplane-ds``:

.. code-block:: bash

   kubectl -n nvidia-network-operator get ds xplane-ds
   kubectl -n nvidia-network-operator logs -l app=xplane

Query plane state with the bundled client:

.. code-block:: bash

   kubectl -n nvidia-network-operator exec ds/xplane-ds -- \
     doca-xplane-client get-status

   kubectl -n nvidia-network-operator exec ds/xplane-ds -- \
     doca-xplane-client get-planes-summary

``get-status`` reports an ``overallState`` and counts local versus remote
failures. When a plane is ``DEGRADED``, narrow it down:

.. code-block:: bash

   # Local failures — link down on this host
   doca-xplane-client get-plane-failures-local --plane_id 0

   # Remote failures — route withdrawn by the fabric
   doca-xplane-client get-plane-failures-remote --plane_id 0

   # How much traffic was diverted away from this plane
   doca-xplane-client get-plane-traffic-summary --plane_id 0

.. note::

   ``local`` failures are host-side (a down link on this node);
   ``remote`` failures are learned from fabric route-availability updates.
   Diverted traffic counters confirm failover is working rather than
   traffic being dropped.

===============================
Step 5: The workload sees rails
===============================

Deploy the test Pod from your walkthrough and confirm one RDMA device per
rail:

.. code-block:: bash

   kubectl exec -it spectrum-x-test -- rdma link

On IPv6 rails the Spectrum-X Operator places each rail in its own VRF,
named after the rail topology entry, so routes are not in the main table:

.. code-block:: bash

   kubectl exec -it spectrum-x-test -- ip -6 route show vrf rail0

.. important::

   RDMA-CM is not VRF-aware. Traffic tests that use RDMA-CM (for example
   ``ib_write_bw -R``) must be run inside the VRF context:

   .. code-block:: bash

      ip vrf exec rail0 ib_write_bw -R ...

   Workloads that need ``ip vrf exec`` require the ``IPC_LOCK``,
   ``NET_ADMIN``, ``DAC_OVERRIDE``, and ``BPF`` capabilities.

=====================
Common failure modes
=====================

.. list-table::
   :header-rows: 1
   :widths: 34 66

   * - Symptom
     - Cause and fix
   * - ``spectrum-x config version <name> not found``
     - ``spectrumXOptimized.version`` names a profile ConfigMap that does
       not exist, or exists without the watch label. The field is not
       validated against existing ConfigMaps, so the template is accepted
       and only the apply fails. Check the name matches exactly.
   * - Spectrum-X parameters silently not applied, no error
     - The profile loaded, but carries no ``mlxConfig`` entry for this
       device ID or multiplane mode, so those parameters were skipped and
       the device left at its defaults. Confirm the profile covers every
       NIC model and mode in the cluster.
   * - Two profiles, unpredictable results
     - Profiles are keyed by ConfigMap **name**, not namespace. Two
       labeled ConfigMaps sharing a name define the same profile key and
       the most recently reconciled one wins, with no error. Use unique
       names across every watched namespace.
   * - Configuration flaps between two states
     - The SR-IOV Network Operator's ``mellanox`` plugin is still enabled
       and is configuring the same NIC state as the NIC Configuration
       Operator. Set ``disablePlugins: [mellanox]`` — see
       :doc:`Architecture and Components <components>`.
   * - No OVS bridge, VFs never attach
     - The ``manageSoftwareBridges`` feature gate is not set on the SR-IOV
       Network Operator, so it cannot create the per-PF bridge.
   * - RDMA devices from other Pods are visible
     - RDMA subsystem namespace awareness is not enabled. Set
       ``options ib_core netns_mode=0`` and reboot the node.
   * - OVS starts with uplinks missing after a reboot
     - Expected on Hardware Multiplane: the operator installs an
       ``ExecStartPre`` hook that removes xPlane uplinks whose PF has not
       yet entered switchdev mode. Check
       ``/var/log/xplane-ovs-pre.log`` — the ports are re-added once the
       PFs are ready.

===============
Further reading
===============

- **Configuration reference and validation rules**: see
  :doc:`Spectrum-X NIC Configuration <spectrum-x-configuration>`.
- **What the operator configures on your behalf**: see
  :doc:`Architecture and Components <components>`.
- **CRD field reference**: see :doc:`Spectrum-X CRDs and API Reference <crds>`.
- **Log collection for support**: see
  :doc:`SOS Report <../troubleshooting/sosreport>`.
