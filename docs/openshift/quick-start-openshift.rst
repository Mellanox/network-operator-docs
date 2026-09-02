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


*******************************
Quick Start Guide for OpenShift
*******************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Draft for review.** Several details on this page are pending confirmation from the
   Network Operator development and QA teams — they are marked inline with *Pending review*.
   Do not treat this page as published guidance until those are resolved.

================
Before You Begin
================

This guide covers a **connected** OpenShift cluster. For a cluster without registry access,
see :doc:`Deployment in Disconnected OpenShift <disconnected-openshift>`. To attach Virtual
Functions to virtual machines rather than to pods, see
:doc:`OpenShift Virtualization with SR-IOV <ocp-kubevirt>`.

Prerequisites
=============

#. **OpenShift cluster**: A running Red Hat OpenShift cluster (4.17–4.22) on ``amd64`` or
   ``arm64``, with at least two worker nodes carrying NVIDIA NICs.

#. **CLI access**: ``oc`` installed and logged in as a user with ``cluster-admin``.

#. **Node Feature Discovery**: NFD must be running so that nodes are labelled with the NIC
   features the Network Operator selects on. On OpenShift it is usually supplied by Red Hat's
   NFD Operator or by the GPU Operator. Check before installing:

   .. code-block:: bash

      oc get nodes -l feature.node.kubernetes.io/pci-15b3.present=true

   If no nodes are returned, install NFD first — see
   :doc:`Deployment Guide with OpenShift <deployment-guide-openshift>`.

===================================
Install the Network Operator (OLM)
===================================

On OpenShift the Network Operator is installed from the certified operator catalog through
Operator Lifecycle Manager.

Create the namespace and an OperatorGroup:

.. code-block:: bash

   oc create namespace nvidia-network-operator

.. code-block:: yaml

   apiVersion: operators.coreos.com/v1
   kind: OperatorGroup
   metadata:
     name: nvidia-network-operator
     namespace: nvidia-network-operator
   spec:
     targetNamespaces:
     - nvidia-network-operator

.. important::

   The OperatorGroup is required. The Network Operator ClusterServiceVersion supports the
   ``OwnNamespace`` and ``SingleNamespace`` install modes only. It cannot be installed into
   ``openshift-operators``, which uses a cluster-wide OperatorGroup — the ClusterServiceVersion
   will remain in a failed state with no OperatorGroup found.

Create the Subscription:

.. code-block:: yaml

   apiVersion: operators.coreos.com/v1alpha1
   kind: Subscription
   metadata:
     name: nvidia-network-operator
     namespace: nvidia-network-operator
   spec:
     channel: stable
     name: nvidia-network-operator
     source: certified-operators
     sourceNamespace: openshift-marketplace
     installPlanApproval: Automatic

Wait for the operator to become ready:

.. code-block:: bash

   oc -n nvidia-network-operator get csv
   oc -n nvidia-network-operator get pods

The ClusterServiceVersion should report ``Succeeded`` and the controller pod should be
``Running``. The operator deploys nothing further until you create a ``NicClusterPolicy``,
which the mode pages below do.

==========================
Choose a Networking Mode
==========================

Pick one. Each page installs a ``NicClusterPolicy``, creates the network resources, deploys two
test pods on different nodes, and finishes with an RDMA test between them.

.. toctree::
   :hidden:
   :maxdepth: 1
   :caption: OpenShift Quick Start

   Host Device Network <quick-start-host-device>
   RDMA Shared Device with MacVLAN <quick-start-rdma-shared>
   SR-IOV Network with RDMA <quick-start-sriov-rdma>

.. list-table::
   :widths: 26 34 40
   :header-rows: 1

   * - **Mode**
     - **What a pod gets**
     - **Use when**
   * - :doc:`Host Device Network <quick-start-host-device>`
     - A whole PCI network device, exclusively.
     - You want the simplest path, or Kubernetes runs inside a virtual machine and the
       hypervisor has passed through a NIC or a Virtual Function. Requires no operator beyond
       the Network Operator.
   * - :doc:`RDMA Shared Device with MacVLAN <quick-start-rdma-shared>`
     - A MacVLAN interface plus shared access to the host's RDMA device.
     - You want many pods per NIC and do not need device isolation. Requires no operator beyond
       the Network Operator.
   * - :doc:`SR-IOV Network with RDMA <quick-start-sriov-rdma>`
     - A dedicated Virtual Function with its own RDMA device.
     - You need isolation between workloads and can accept VF creation, which drains and
       reboots nodes. Requires Red Hat's SR-IOV Network Operator.

These three cover the most common deployments, but they are not everything the Network Operator
supports on OpenShift. For IP over InfiniBand, DPDK, and other configurations, see the
:doc:`Deployment Guide with OpenShift <deployment-guide-openshift>`.

-------------------------------
Which modes apply to your setup
-------------------------------

.. list-table::
   :widths: 34 22 14 14 16
   :header-rows: 1

   * - **Deployment**
     - **Operator runs**
     - **Host Device**
     - **Shared RDMA**
     - **SR-IOV VF**
   * - Bare metal — nodes are physical hosts
     - On the host
     - Yes
     - Yes
     - Yes
   * - OpenShift inside a virtual machine, with a NIC or VF passed through by the hypervisor
     - Inside the virtual machine
     - Yes
     - Yes
     - No
   * - OpenShift Virtualization — virtual machines are the workload
     - On the host
     - No
     - No
     - Yes, see :doc:`OpenShift Virtualization with SR-IOV <ocp-kubevirt>`

Inside a virtual machine the guest consumes the device the hypervisor passed to it; it does not
subdivide it further. Creating Virtual Functions from inside a virtual machine is not supported.

============
NIC Firmware
============

The :doc:`NIC Configuration Operator <../nic-conf-operator/nic-fw-configuration>` can manage NIC
firmware settings — VF capacity, RoCE tuning, PCI performance — declaratively. It is optional
and is not required by any mode on this page.

.. note::

   *Pending review.* ``roceOptimized`` behaviour on Red Hat CoreOS with the containerized
   DOCA-OFED driver is being confirmed. Until then, configure RoCE quality-of-service settings
   through your existing host tooling rather than through ``NicConfigurationTemplate``.
