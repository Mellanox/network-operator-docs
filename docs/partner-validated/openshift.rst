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

***********************************************
NVIDIA Network Operator with Red Hat OpenShift
***********************************************

Use Launch Kit to configure NVIDIA networking for workloads on Red Hat OpenShift
and verify inter-node connectivity. Install the OpenShift operators
first; Launch Kit configures those installations and validates the resulting
network.

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

Validated Profiles
==================

The following standard Launch Kit profiles are validated for OpenShift. Choose
one for your fabric and workload requirements. Pass ``--flavor ocp`` when
using these profiles.

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - Profile
     - Networking use case
   * - SR-IOV Ethernet RDMA
     - Dedicated virtual functions for Ethernet and RoCE workloads.
   * - SR-IOV InfiniBand RDMA
     - Dedicated virtual functions for InfiniBand workloads.
   * - Host-device RDMA
     - Direct access to a NIC from a workload.
   * - MacVLAN with RDMA shared devices
     - Ethernet networking with shared RDMA device access.
   * - IPoIB with RDMA shared devices
     - IP over InfiniBand networking with shared RDMA device access.

Consult :doc:`../platform-support` when selecting an OpenShift and Network Operator
version combination. Record exact software versions, hardware, and test scope
when validating your site. Spectrum-X has no OpenShift profile.

SR-IOV Ethernet Validation Example
----------------------------------

A `published Launch Kit validation run
<https://github.com/NVIDIA/k8s-launch-kit/pull/267>`_ on two OpenShift 4.22.5 workers
reported 9/9 resources ready and 6/6 connectivity tests passed: two ICMP, two
RDMA ping, and two RDMA bandwidth tests. Strict validation used an 80 Gbps minimum
bandwidth threshold and measured 84.7 and 83.9 Gbps. These measurements apply to
that test setup; select thresholds appropriate to your hardware.

Prerequisites
=============

* Follow :doc:`../openshift/deployment-guide-openshift` to install the certified
  NVIDIA Network Operator and Node Feature Discovery, plus the Red Hat SR-IOV
  Network Operator for SR-IOV profiles.
* Install NVIDIA Maintenance Operator through OperatorHub/OLM in the namespace
  you will configure in Launch Kit. Follow Red Hat's `operator installation
  instructions <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/operators/administrator-tasks>`_.
  Confirm that the required operators have successful ClusterServiceVersions
  (CSVs) and their APIs are available before proceeding.
* Prepare at least two Ready workers with NVIDIA NICs and a configured fabric
  for the selected profile. The SR-IOV Ethernet example below requires
  SR-IOV-capable Ethernet NICs, a RoCE fabric, image access, and sufficient VF
  capacity. InfiniBand profiles require a subnet manager and appropriate
  partition membership.
* Confirm cluster permissions for discovery and deployment, and for temporary
  validation namespaces and security context constraints (SCCs). Validation also
  needs access to the network attachments and image pull secrets it uses.
* Install a pinned Launch Kit release. Set ``KUBECONFIG`` and agree on worker/NIC
  selection, IP ranges, MTU, routing, and maintenance limits as described in
  :doc:`index`.

Check the environment before making changes:

.. code-block:: bash

   oc config current-context
   oc get nodes -o wide
   oc get csv -A
   l8k version
   l8k schema

Configure and Deploy
====================

The procedure below uses SR-IOV Ethernet RDMA. For another validated profile,
choose its fabric and deployment type from the `Launch Kit profile guide
<https://nvidia.github.io/k8s-launch-kit/user/profiles/>`_ during generation.

#. Prepare ``cluster-config.yaml`` using the seed configuration in the
   `Launch Kit OpenShift walkthrough
   <https://nvidia.github.io/k8s-launch-kit/user/openshift/#1-discover-the-intended-workers>`_.
   Set ``flavor: ocp``, the selected Network Operator release, actual operator
   namespaces, workload namespace, and intended worker names.

#. Discover hardware into a separate file, preserving your seed configuration:

   .. code-block:: bash

      l8k discover --flavor ocp --kubeconfig "$KUBECONFIG" \
        --user-config ./cluster-config.yaml \
        --save-cluster-config ./discovered-cluster-config.yaml

   Review the discovered workers, NICs, rails, and profile. Set site-specific
   addresses, routing, maintenance limits, and GPUDirect validation settings
   before generation.

#. Generate the SR-IOV Ethernet deployment:

   .. code-block:: bash

      l8k generate --flavor ocp \
        --user-config ./discovered-cluster-config.yaml \
        --fabric ethernet --deployment-type sriov \
        --save-deployment-files ./ocp-deployment

   Review the policies, namespaces, VF resources, and IP pools. Keep the complete
   directory, including ``.l8k``. OpenShift uses the preinstalled operators and
   platform-managed Multus/CNI plugins; do not install the Kubernetes Helm bundle.

#. Preview the changes and deploy after resolving admission or configuration
   conflicts:

   .. code-block:: bash

      l8k deploy --flavor ocp --kubeconfig "$KUBECONFIG" \
        --deployment-files ./ocp-deployment --dry-run
      l8k deploy --flavor ocp --kubeconfig "$KUBECONFIG" \
        --deployment-files ./ocp-deployment

Validate and Record Results
===========================

Follow :ref:`partner-run-validation` using ``--flavor ocp`` and
``--deployment-files ./ocp-deployment``. Require results for both intended
workers and all intended rails. OpenShift's platform-managed Multus and CNI
installer checks are reported as unverified; use platform health checks and the
connectivity results to assess those prerequisites.

Launch Kit normally removes its temporary validation resources. Use ``--keep``
only when they are needed to investigate a failure. After testing, follow the
`OpenShift resource-removal procedure
<https://nvidia.github.io/k8s-launch-kit/user/openshift/#remove-the-intended-resources>`_
to remove the intended test deployment while preserving shared operators.
``l8k clean`` does not support OpenShift.

Use :ref:`partner-submit-results` to document your exact versions, hardware,
thresholds, reports, and any additional application tests.

Getting Support
===============

For OpenShift platform issues, use the `Red Hat Customer Portal
<https://access.redhat.com/support/>`_. For Network Operator issues, use
:doc:`../troubleshooting/troubleshooting` and the
`Network Operator issue tracker <https://github.com/Mellanox/network-operator/issues>`_.
Include the OpenShift and operator versions and a sanitized validation report.
