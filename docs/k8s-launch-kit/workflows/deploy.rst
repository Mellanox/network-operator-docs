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

By default, ``l8k deploy`` reads the bundle in ``./deployment/`` and automatically selects its ``network-operator/`` subdirectory. It loads ``.l8k/resolved-config.yaml`` unless ``--user-config`` explicitly selects another configuration. Cluster credentials resolve from ``--kubeconfig``, ``$KUBECONFIG``, then ``~/.kube/config``.

You can also fold the deploy into the generate step by adding ``--deploy`` to ``l8k generate``:

.. code-block:: bash

   l8k generate --fabric ethernet --deployment-type sriov --multirail --deploy

================================================================================
Deployment Ordering
================================================================================

When enabled, Launch Kit first installs the selected Helm chart, or compares an existing release with the generated chart version and values. A mismatch stops deployment unless ``--overwrite-existing`` is explicitly set. Set ``networkOperator.skipHelmChart: true`` before generation, or pass ``--skip-network-operator-helm``, when another system owns Helm.

After Helm management and before applying custom resources, general preflight checks component versions and stray resources. Helm may already have changed the cluster if this later preflight stops deployment; those changes are not rolled back. ``--overwrite-existing`` may delete networking CRs absent from the bundle, including manually created resources and resources from omitted groups. Review the entire reported inventory; ``--groups`` is not an ownership boundary. Multus/CNI ownership conflicts remain blocking and cannot be bypassed by overwrite.

Launch Kit then applies manifests in four phases. The first two block on reconciliation because everything else depends on them; the last two batch the remaining manifests so controllers reconcile concurrently:

#. **NicClusterPolicy** --- applied first, then awaited until the controller reports ``READY``. Per-component ``appliedStates[]`` are surfaced in the progress output ("ready: 7/12; pending: state-OFED, state-multus-cni, …") so an operator sees exactly which component is the laggard.
#. **NicNodePolicy** --- applied per group, awaited per policy (OFED driver, device plugins land here).
#. **Remaining manifests** --- every other CR (``SriovNetwork``, ``HostDeviceNetwork``, ``CIDRPool``, ``SpectrumXRailPoolConfig``, …) is applied in a single pass without per-manifest waits, so controllers reconcile concurrently.
#. **Verify** --- each manifest from phase 3 is polled until it reaches a terminal state. The four-state classification (READY / IN-PROGRESS / ERROR / MISSING) and per-Kind cross-checks (e.g., the SR-IOV silent-failure case where ``syncStatus=Succeeded`` but ``pfNames`` matched zero interfaces) are shared with :doc:`l8k validate <validate>`.

.. note::

   Example workload manifests (filenames matching ``*example*``) are **not** applied by ``l8k deploy``. They are validation workloads consumed by ``l8k validate --connectivity`` and are deployed only during its connectivity checks, including the selected ICMP and RDMA test families.

================================================================================
Deploy-wide Timeout
================================================================================

``l8k deploy`` generally has no per-manifest deadline. Interface naming is an exception: after a name mismatch is observed, it allows five minutes for udev names to settle before failing. Pass ``--deploy-timeout <duration>`` to bound the whole apply + reconciliation phase end-to-end (e.g., ``45m``, ``2h``). Without the flag, deploy polls until every manifest reaches a terminal state or the user cancels --- the right default for SR-IOV configuration on large clusters where a single ``SriovNetworkNodePolicy`` reconciliation can outlast any small per-manifest budget.

.. code-block:: bash

   l8k deploy --deploy-timeout 90m

================================================================================
Dry-Run Mode
================================================================================

Validate proposed operations through Helm and server-side dry-run without persisting them. This requires cluster access and installed compatible APIs; it does not prove controller reconciliation or data-plane readiness:

.. code-block:: bash

   l8k deploy --dry-run

Dry-run mode is recommended before any first deployment and before production changes.

================================================================================
End-to-End Verification
================================================================================

After deployment, run validation explicitly against the same bundle:

.. code-block:: bash

   l8k deploy --deployment-files ./deployment
   l8k validate --deployment-files ./deployment --wait 10m

Validation checks configured ICMP and RDMA families as well as static readiness. Its exit status and coverage report are separate from apply success. Use ``l8k validate --keep`` to retain test workloads for debugging.

================================================================================
Manual Verification
================================================================================

You can also inspect the deployment manually:

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
