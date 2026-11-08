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
.. include:: ../../common/vars.rst

******************
Validate Workflow
******************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

``l8k validate`` compares generated resources with the live cluster, runs selected data-plane checks, and writes an HTML acceptance report. Validate the same complete bundle used for deployment:

.. code-block:: bash

   l8k validate --deployment-files ./deployment --wait 10m

Unless ``--user-config`` is supplied, validation prefers the bundle's ``.l8k/resolved-config.yaml``. This preserves the release, namespace, profile, groups, and validation decisions used during generation. See :doc:`Configuration Reference <../reference/config>` for the lookup order.

================================================================================
What It Checks
================================================================================

Static checks cover the operator release (Helm on Kubernetes, OLM CSV on OpenShift), Helm values when managed, component versions, stray resources, certified-preset deviations, and manifest readiness. Objects are classified as ``READY``, ``IN-PROGRESS``, ``ERROR``, or ``MISSING``; kind-specific checks inspect worker and device coverage as well as controller status.

Files matching ``*example*`` are validation workloads, excluded from static manifest checks. When the operational resources are ready, validation applies the example DaemonSets, waits for usable pods, and runs configured source-bound tests on their secondary networks. The default families are ``icmp``, ``rping``, and ``ib_write_bw``. ``validation.mode`` (``quick``, ``full``, or ``strict``) controls coverage and cross-rail expectations. Workloads are removed afterwards unless ``--keep`` is set.

Connectivity requires resolved generation metadata or a user-owned configuration with explicit ``profile.routing`` and ``validation.gpuDirect.enabled`` decisions. GPUDirect also requires worker and rail topology when bandwidth testing is selected. Embedded defaults alone do not satisfy this input requirement.

A directory containing only valid ``*example*.yaml`` DaemonSets selects connectivity-only validation. Pass ``--connectivity=false`` for static checks without test workload creation.

================================================================================
Acceptance Criteria
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Mode**
     - **Exit and coverage behavior**
   * - Full Kubernetes validation
     - Failed static gates or gating connectivity tests return ``4``. In-progress manifests can return ``0`` with warnings and skip connectivity. A skipped or incomplete matrix does not independently fail this mode.
   * - Connectivity-only validation
     - Every selected test family must produce a gating test, and every gating test must pass. Skipped, empty, or incomplete coverage returns ``4``.
   * - OpenShift with connectivity enabled
     - Requires the same per-family coverage; in-progress manifests preventing connectivity return ``4``.
   * - ``--connectivity=false``
     - Supplies static evidence only; no data-plane checks run.

Missing or errored manifests, release/values/component mismatches, stray resources, and certified-preset deviations fail full validation. Malformed or missing test DaemonSets are input errors (exit ``2``) when connectivity is requested. ``validation.checks: []`` disables test families and establishes no connectivity evidence.

Before accepting a deployment, inspect the report for the intended workers and rails, ready resources, completed static gates, and completed gating tests for every required family. Review skipped and unverified checks separately. On Kubernetes, exhausting ``--wait`` alone does not turn an in-progress warning into a failure.

External Multus/CNI installer checks can be reported as ``UNVERIFIED`` when API evidence is absent or incomplete. This is not a successful host-networking check. On OpenShift these components are platform-owned; their installer health is not inspected, but ownership conflicts remain errors.

================================================================================
Reports and Automation
================================================================================

The default HTML report is ``<deployment-files>/k8s-launch-kit-validation-report.html``, at the bundle root even when resources are in ``network-operator/``. It contains environment/profile details, topology, release/preflight checks, live resource YAML, connectivity matrices, and warnings, and can be opened offline.

.. code-block:: bash

   l8k validate --report-path ./reports/validation.html
   l8k validate --report-path=-
   l8k validate --junit-path ./reports/validation.xml

``--report-path=-`` disables HTML output; ``--junit-path`` independently requests JUnit XML. Always retain the process status as well as reports.

JSON mode emits separate objects for static results, connectivity, and the report path, not a single combined document. Preserve stderr and the command's exit status before parsing:

.. code-block:: bash

   status=0
   l8k validate --deployment-files ./deployment --output json \
       >validation.jsonl 2>validation.log || status=$?
   if [ "$status" -ne 0 ]; then
       cat validation.log >&2
       exit "$status"
   fi
   jq -s . validation.jsonl

================================================================================
Useful Flags
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - **Flag**
     - **Purpose**
   * - ``--validation-checks icmp,rping,ib_write_bw``
     - Select test families; overrides ``validation.checks``.
   * - ``--validation-mode quick|full|strict``
     - Select coverage and cross-rail expectations.
   * - ``--connectivity-timeout <duration>``
     - Bound workload setup and execution. Default ``0`` computes the budget from the matrix plan.
   * - ``--rdma-rping-iterations <int>``
     - Set RDMA ping iterations.
   * - ``--rdma-ib-write-size <int>``
     - Set the bandwidth test message size.
   * - ``--rdma-ib-write-min-bandwidth-gbps <number>``
     - Set minimum peak bandwidth; ``0`` disables bandwidth gating.
   * - ``--wait <duration>``
     - Poll in-progress resources; default ``0`` takes one snapshot.
   * - ``--keep``
     - Retain test DaemonSets for debugging.

See ``l8k validate --help`` for the complete flag list.

================================================================================
See Also
================================================================================

- :doc:`Deploy Workflow <deploy>` --- apply the reviewed bundle
- :doc:`Troubleshooting <../troubleshooting>` --- inspect failed or incomplete checks
- :doc:`Automation and CI/CD <../automation>` --- output contracts and exit status
