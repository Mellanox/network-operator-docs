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

.. note::

   **Use this when:** you've applied a deployment and want to confirm the cluster matches the configuration that produced it. Three things are reported: Network Operator Helm release version, per-manifest presence in the cluster, and any preset deviations recorded in ``cluster-config.yaml``.

================================================================================
Run Validation
================================================================================

.. code-block:: bash

   l8k validate

No flags required when defaults apply. ``l8k validate`` reads ``./cluster-config.yaml`` for ``networkOperator.selectedRelease`` and the operator namespace, then checks ``./deployment/`` against the cluster reachable via ``$KUBECONFIG``.

.. code-block:: bash

   l8k validate --user-config ./cluster-config.yaml \
       --deployment-files ./deployment \
       --kubeconfig ~/.kube/config

================================================================================
What It Checks
================================================================================

Network Operator Helm release version
--------------------------------------

Launch Kit reads any Helm release Secret in the operator namespace whose release name contains ``network-operator`` (Secret name format ``sh.helm.release.v1.<release>.v<N>``, type ``helm.sh/release.v1``), parses the chart's ``appVersion``, and compares it against the version expected for ``networkOperator.selectedRelease`` in the user's config (looked up in the embedded release catalog).

The check is **skipped** (with a clear reason in the output) when:

- ``cluster-config.yaml`` is missing or doesn't declare ``networkOperator.selectedRelease``.
- The selected release is not in the embedded catalog.
- No matching Helm release Secret is found in the operator namespace (e.g., the operator was installed via Argo CD or kubectl rather than Helm).

Manifest presence
-----------------

Every YAML document under ``--deployment-files`` is fetched from the cluster via the Kubernetes API. Each document is reported:

- ``FOUND`` — the named object exists in the cluster.
- ``MISSING`` — the named object is not present.
- ``ERROR`` — the API returned a non-NotFound error (RBAC, transient connectivity, …).

Files matching ``*example*`` (e.g., ``50-example-daemonset.yaml``) are skipped — those are demo workloads, not part of the operator surface.

Preset deviations
-----------------

If ``cluster-config.yaml`` records preset deviations (any group has a non-empty ``presetDeviation`` list), they're surfaced under a "Preset deviations" section. Each entry shows the field (``pfCount`` / ``pciAddress`` / ``deviceID``), the expected value, the discovered value, and a short detail. Deviations are reported for visibility — they do **not** affect the exit code, since the deployment can still run correctly while diverging from the matched preset. See :doc:`../presets` "Validation and Deviations".

================================================================================
Exit Codes
================================================================================

- **0** — every manifest is FOUND and the version check matched (or was skipped).
- **4** — at least one manifest is MISSING or ERROR, or the deployed Helm release version doesn't match the selected release.
- Other codes — see :doc:`../reference/cli` "Exit Codes".

================================================================================
Sample Output
================================================================================

.. code-block:: text

   Network Operator release
     selectedRelease: 26.4
     expected version: v26.4.0-beta.6
     deployed: network-operator (chart=26.4.0-beta.6 app=v26.4.0-beta.6 rev=3 status=deployed)
     result: MATCH

   Manifests
     [FOUND] NicClusterPolicy/nic-cluster-policy in (cluster-scoped)
     [FOUND] NicNodePolicy/nicnodepolicy-h100 in (cluster-scoped)
     [MISSING] SriovNetwork/sriov-network-rail-0 in default --- not found in cluster

   Preset deviations (cluster differs from matched preset)
     group-0 (PowerEdge-XE9680/NVIDIA-H200) --- 2 deviation(s):
       [pciAddress] expected=- got=0000:bd:00.0 --- discovered PCI address not present in preset
       [deviceID] expected=a2dc@0000:5e:00.0 got=1023@0000:5e:00.0 --- device ID at PCI address differs from preset

   Summary: 12 manifests, 1 missing/error; version: match; preset deviations: 1 group(s)

For programmatic use, ``--output json`` emits a single object on stdout with ``versionCheck``, ``manifests``, ``presetDeviations``, and ``summary`` fields. Logs go to stderr.

==========
See Also
==========

- :doc:`Deploy Workflow <deploy>` --- the writer side of the contract validate checks
- :doc:`Troubleshooting <../troubleshooting>` --- diagnose missing or failing manifests
- :doc:`CLI Reference <../reference/cli>` --- ``l8k validate`` flag reference
