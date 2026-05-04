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

***********
Workflows
***********

.. toctree::
   :maxdepth: 1
   :titlesonly:

   Discover <discover>
   Generate <generate>
   Deploy <deploy>
   Validate <validate>

Launch Kit operates in distinct phases. Each has a dedicated CLI subcommand and a focused how-to page.

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - **Workflow**
     - **What it does**
   * - :doc:`Discover <discover>`
     - Probe the cluster's network hardware and write ``cluster-config.yaml``.
   * - :doc:`Generate <generate>`
     - Render Kubernetes manifests from a cluster config and a profile selection.
   * - :doc:`Deploy <deploy>`
     - Apply generated manifests to the cluster, with optional dry-run.
   * - :doc:`Validate <validate>`
     - Verify the deployment matches the selected release: Helm chart version + manifest presence.
