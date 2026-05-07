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

*************
Quick Start
*************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

This walkthrough takes you from a freshly prepared cluster to a running NVIDIA networking deployment using the **SR-IOV Ethernet** profile --- the most common starting point. For other profiles, see the :doc:`Deployment Profiles <profiles/profiles>` decision matrix.

.. note::

   **Use this when:** you have the Network Operator Helm chart installed (per :doc:`Installation <installation>`), the ``l8k`` binary on your PATH, and ``$KUBECONFIG`` set or your default kubeconfig at ``~/.kube/config``.

================================================================================
Step 1 --- Discover
================================================================================

Probe the cluster's network hardware. Output is written to ``./cluster-config.yaml`` by default.

.. code-block:: bash

   l8k discover

Discovery deploys a minimal probe profile, examines NICs and OFED-dependent kernel modules on each node, and groups nodes by PCI topology.

================================================================================
Step 2 --- Generate
================================================================================

Generate Kubernetes manifests for an SR-IOV Ethernet deployment. Launch Kit auto-reads ``./cluster-config.yaml`` and writes manifests to ``./deployment/``.

.. code-block:: bash

   l8k generate --fabric ethernet --deployment-type sriov --multirail

See :doc:`workflows/generate` for the output file layout.

================================================================================
Step 3 --- Deploy
================================================================================

Apply the generated manifests in dependency order (NicClusterPolicy first, then per-group NicNodePolicy, then networks and workloads):

.. code-block:: bash

   l8k deploy

================================================================================
Step 4 --- Verify
================================================================================

Check that operator pods, OFED driver pods, and example workloads are running:

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods
   kubectl get nicclusterpolicy
   kubectl get nicnodepolicy

================================================================================
Next Steps
================================================================================

- Picking a different profile? :doc:`Deployment Profiles <profiles/profiles>`
- Cluster has mixed GPU/NIC types? :doc:`Heterogeneous Clusters <heterogeneous-clusters>`
- Generating manifests without cluster access? :doc:`Cluster Topology Presets <presets>`
- Wiring l8k into CI/CD? :doc:`Automation and CI/CD <automation>`
- Something didn't work? :doc:`Troubleshooting <troubleshooting>`

================================================================================
See Also
================================================================================

- :doc:`Overview <overview>` --- the discover/generate/deploy mental model
- :doc:`CLI Reference <reference/cli>` --- every flag
- :doc:`Configuration Reference <reference/config>` --- ``cluster-config.yaml`` schema
