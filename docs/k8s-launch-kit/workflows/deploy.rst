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

****************
Deploy Workflow
****************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Use this when:** you have generated manifests (from :doc:`generate`) and want to apply them to the cluster, or preview what would be applied.

================================================================================
Deploy to Cluster
================================================================================

Apply the generated manifests:

.. code-block:: bash

   l8k deploy

By default, ``l8k deploy`` reads the manifests in ``./deployment/`` (the output of ``l8k generate``) and uses ``$KUBECONFIG`` for cluster access.

You can also fold the deploy into the generate step by adding ``--deploy`` to ``l8k generate``:

.. code-block:: bash

   l8k generate --fabric ethernet --deployment-type sriov --multirail --deploy

================================================================================
Deployment Ordering
================================================================================

Launch Kit applies manifests in the following order to ensure dependencies are satisfied:

#. ``NicClusterPolicy`` (cluster-wide components: Multus, CNI, NV-IPAM, operators). Wait for readiness.
#. ``NicNodePolicy`` per group (OFED driver, device plugins). Wait for readiness.
#. Remaining manifests --- network resources (``SriovNetwork``, ``HostDeviceNetwork``, etc.), IP pools, and example workloads.

================================================================================
Dry-Run Mode
================================================================================

Preview what would be deployed without making changes:

.. code-block:: bash

   l8k deploy --dry-run

Dry-run mode is recommended before any first deployment and before production changes.

================================================================================
Verifying the Deployment
================================================================================

After deploying, verify that operator pods, OFED driver pods, and example workloads are running:

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods
   kubectl get nicclusterpolicy
   kubectl get nicnodepolicy

Per-group ``NicNodePolicy`` resources have names matching the group identifier (e.g., ``nicnodepolicy-group-0``). Each should reach the ``Ready`` state before workloads are applied.

If a deployment fails or stalls, see :doc:`../troubleshooting`.

================================================================================
See Also
================================================================================

- :doc:`Generate Workflow <generate>` --- producing the manifests
- :doc:`Heterogeneous Clusters <../heterogeneous-clusters>` --- per-group rollout strategies
- :doc:`Troubleshooting <../troubleshooting>` --- diagnosing failed deployments
- :doc:`Automation and CI/CD <../automation>` --- exit codes and JSON output for CI
