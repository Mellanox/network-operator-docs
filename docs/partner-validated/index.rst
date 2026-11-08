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

********************************
Partner-Validated Configurations
********************************

Independent software vendors (ISVs) can use NVIDIA Kubernetes Launch Kit
(``l8k``) to validate NVIDIA Network Operator with their Kubernetes-based
platforms. A partner configuration describes the tested software and hardware,
how to deploy it, the checks that passed, and where users can get help.

Validation applies to the versions, networking profiles, and hardware recorded
in each configuration. See :doc:`../platform-support` for NVIDIA Network Operator
support; a contributed validation result does not extend that support matrix.

.. toctree::
   :maxdepth: 1

   Red Hat OpenShift <openshift>
   Partner Configuration Template <template>

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

Before You Start
================

* Choose the platform version, Network Operator release, NVIDIA NICs, and
  networking profile to validate. Use the
  `Launch Kit profile guide <https://nvidia.github.io/k8s-launch-kit/user/profiles/>`_
  to select a profile supported by your hardware and platform.
* Prepare at least two Ready, schedulable workers for inter-node testing. Confirm
  switch configuration, NIC firmware, RDMA prerequisites, available VF capacity
  for SR-IOV, and access to the required container images.
* Obtain a kubeconfig with permission to discover hardware, deploy networking
  resources, and run validation workloads. Discovery and deployment change the
  cluster; use a test environment or an agreed maintenance window.
* Select unused network addresses, MTU, routing, and a maintenance budget suitable
  for the test cluster. Establish the required bandwidth threshold and worker/rail
  coverage before testing.
* Follow the `Launch Kit installation guide
  <https://nvidia.github.io/k8s-launch-kit/user/installation/>`_ to install a
  specific published version. Retain that version with your results and use its
  matching documentation when reproducing a run.

The following example validates SR-IOV Ethernet RDMA on Kubernetes. For OpenShift,
complete the :doc:`OpenShift prerequisites and deployment procedure <openshift>`
first, then use the validation and submission steps below.

Discover and Deploy
===================

#. Set ``KUBECONFIG`` to your cluster's kubeconfig file. Confirm the context and
   record the Launch Kit version:

   .. code-block:: bash

      kubectl config current-context
      kubectl get nodes -o wide
      l8k version
      l8k schema

#. Select a Network Operator release recognized by ``l8k schema`` and suitable for
   your platform. Replace ``<release>`` with that release line, then discover the
   hardware:

   .. code-block:: bash

      l8k discover --kubeconfig "$KUBECONFIG" \
        --network-operator-release <release> \
        --save-cluster-config ./cluster-config.yaml

#. Review ``cluster-config.yaml``. Confirm the intended workers, NICs, rails,
   network namespaces, IP ranges, routing, driver settings, and maintenance
   limits. Set ``validation.gpuDirect.enabled`` explicitly: use ``false`` for
   host-memory RDMA validation; enable it only when GPU/RDMA prerequisites and
   NIC-to-GPU mappings are ready for GPUDirect testing.

#. Generate the deployment files in a new directory:

   .. code-block:: bash

      l8k generate --user-config ./cluster-config.yaml \
        --fabric ethernet --deployment-type sriov --multirail \
        --save-deployment-files ./deployment

   Review the generated policies, worker selectors, addresses, VF allocations,
   and Helm values. Keep the complete ``deployment`` directory, including its
   hidden ``.l8k`` directory; deploy and validate use the saved configuration.
   If your platform already manages the Network Operator Helm release, follow
   the `external ownership instructions
   <https://nvidia.github.io/k8s-launch-kit/user/profiles/#choose-a-platform-and-operating-model>`_
   before generating the files.

#. Preview the changes, resolve any conflicts, and deploy the reviewed files:

   .. code-block:: bash

      l8k deploy --kubeconfig "$KUBECONFIG" \
        --deployment-files ./deployment --dry-run
      l8k deploy --kubeconfig "$KUBECONFIG" \
        --deployment-files ./deployment

   A dry run checks the proposed resources; live deployment and validation are
   still required. For a complete walkthrough, see the
   `Launch Kit SR-IOV Ethernet guide
   <https://nvidia.github.io/k8s-launch-kit/user/quick-start/>`_.

.. _partner-run-validation:

Run and Assess Validation
=========================

Run validation against the same deployment directory. Replace ``<minimum-gbps>``
with the bandwidth threshold agreed for your configuration. For OpenShift, use
``--flavor ocp`` and the OpenShift deployment directory.

.. code-block:: bash

   mkdir -p ./validation-results
   l8k validate --kubeconfig "$KUBECONFIG" \
     --deployment-files ./deployment \
     --wait 10m --connectivity --validation-mode strict \
     --validation-checks icmp,rping,ib_write_bw \
     --rdma-ib-write-min-bandwidth-gbps <minimum-gbps> \
     --report-path ./validation-results/validation.html

This checks resource readiness, IP connectivity, RDMA communication, and
host-memory RDMA bandwidth. GPUDirect bandwidth is also tested when enabled in
the generated configuration. For other profiles, choose applicable checks using
the `Launch Kit validation guide <https://nvidia.github.io/k8s-launch-kit/user/validation/>`_.

Open ``validation-results/validation.html`` and accept a configuration only when:

* The intended networking resources are ready and required component/version
  checks have completed successfully.
* All intended workers and rails appear in the connectivity results, and every
  required test family has executed tests that contribute to the pass/fail result.
* Required connectivity tests meet the routing expectations and bandwidth
  threshold. In strict mode, cross-rail expectations follow the selected routing
  mode; expected isolation is not a connectivity failure.
* Skipped or unverified checks are explained, with separate evidence for any
  required prerequisite that Launch Kit does not check.

A zero exit status alone is insufficient: Kubernetes validation can succeed
with warnings while connectivity is skipped or resources are still reconciling.
A dry run, static-only check, or empty test selection does not validate traffic.
Review the `validation acceptance outcomes
<https://nvidia.github.io/k8s-launch-kit/user/validation/#acceptance-outcomes>`_
and investigate failures before repeating the run.

For automated runs, add ``--output json`` and redirect stdout and stderr to
separate files, preserving the command's exit status. Add ``--junit-path`` when
your Launch Kit version supports JUnit output. Retain the HTML report in either
case. Run your platform's application tests on the validated network as well;
Launch Kit networking tests do not establish application compatibility.

.. _partner-submit-results:

Contribute a Configuration
==========================

#. Copy the :doc:`partner configuration template <template>` and replace its
   guidance with your tested configuration and reproducible instructions.
   Record exact versions, the validation date, hardware, profile, tested scope,
   limitations, and a partner support contact. Revalidate each additional version
   or profile before adding it to the documented results.
#. Retain the input configuration, complete deployment directory, Launch Kit
   version, validation command and exit status, HTML report, and any JSON/JUnit
   results. Include application-test outcomes and explanations for skipped checks.
   For failures, collect diagnostics using :doc:`../troubleshooting/sosreport`.
#. Review reports and configurations before sharing: remove credentials and
   confidential cluster details. Share sanitized results or a reference to an
   agreed evidence location; do not commit kubeconfigs or secrets.
#. Open a pull request in the `Network Operator documentation repository
   <https://github.com/Mellanox/network-operator-docs>`_ with the partner page and
   a link from this section. Include validation evidence and a GitHub contact for
   review questions in the PR description.

Getting Support
===============

Use the support contact listed in the partner's configuration for platform-specific
issues. Include the tested version combination, profile, reproduction steps, and
sanitized validation report. For Network Operator diagnostics, start with
:doc:`../troubleshooting/troubleshooting`; report reproducible operator issues in
the `Network Operator issue tracker <https://github.com/Mellanox/network-operator/issues>`_.
