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

***************
Troubleshooting
***************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
SOS-Report Collection
================================================================================

The ``l8k sosreport`` command collects diagnostic data from the cluster, including pod logs, CRD statuses, OFED diagnostics, and node information:

.. code-block:: bash

   l8k sosreport --kubeconfig ~/.kube/config

The output is saved to a directory (default: ``./sosreport``) that can be shared for offline analysis.

For the broader Network Operator sosreport workflow (parsing, web UI, what to look for), see :doc:`Troubleshooting --- SOS Report <../troubleshooting/sosreport>`.

================================================================================
Troubleshooting with AI Skills
================================================================================

The ``k8s-launch-kit-troubleshoot`` skill (see :doc:`AI Skills <../ai-skills>`) can analyze sosreport data when invoked from any AI agent (Claude Code, Cursor, Codex CLI, or other agents that load Markdown context). Collect a sosreport and then ask the agent to investigate issues such as OFED driver crashes, SR-IOV VF allocation failures, pods stuck in ``ContainerCreating``, or NIC configuration errors.

================================================================================
Common Failures
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **Symptom**
     - **Likely Cause**
     - **Where to look**
   * - ``l8k discover`` exits with code 3
     - API server unreachable or RBAC missing
     - ``kubectl auth can-i`` and the kubeconfig
   * - Discovery completes with empty ``clusterConfig``
     - Default ``--node-selector`` excludes all nodes
     - Pass ``--node-selector`` matching a label on your nodes (see :doc:`workflows/discover`)
   * - Generation fails with "RA2.1 requires --network-operator-release in [26.1]"
     - Spectrum-X version and Network Operator release mismatch
     - Set ``--network-operator-release`` to match the Spectrum-X version (see :doc:`profiles/spectrum-x`)
   * - ``l8k generate --deploy`` exits with code 4
     - Apply failed; an earlier resource is not Ready
     - Inspect ``kubectl get nicclusterpolicy`` and ``kubectl get nicnodepolicy``; collect a sosreport
   * - OFED driver pods CrashLoopBackOff after deploy
     - Storage or third-party RDMA modules block driver reload
     - Verify ``unloadStorageModules`` / ``unloadThirdPartyRDMAModules`` settings in your config (see :doc:`workflows/discover`)
   * - SR-IOV pods stuck in ``ContainerCreating``
     - VF allocation failure or device plugin not ready
     - ``kubectl describe pod`` and SR-IOV operator logs

================================================================================
See Also
================================================================================

- :doc:`Troubleshooting --- SOS Report <../troubleshooting/sosreport>` --- the upstream sosreport workflow for the Network Operator
- :doc:`AI Skills <../ai-skills>` --- the ``k8s-launch-kit-troubleshoot`` skill
- :doc:`Automation and CI/CD <automation>` --- exit codes and structured errors
