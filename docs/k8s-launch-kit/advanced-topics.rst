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

*****************
Advanced Topics
*****************

.. toctree::
   :maxdepth: 1
   :titlesonly:

   Heterogeneous Clusters <heterogeneous-clusters>
   Cluster Topology Presets <presets>
   Automation and CI/CD <automation>
   Troubleshooting <troubleshooting>

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Topic**
     - **When to use**
   * - :doc:`Heterogeneous Clusters <heterogeneous-clusters>`
     - Multiple node types --- different GPU SKUs, NIC SKUs, or OFED requirements.
   * - :doc:`Cluster Topology Presets <presets>`
     - Generate manifests offline against a known machine type, or use ``l8k preset list`` / ``l8k preset update``.
   * - :doc:`Automation and CI/CD <automation>`
     - Wire ``l8k`` into a CI/CD pipeline or AI agent --- JSON output, exit codes, ``l8k schema``.
   * - :doc:`Troubleshooting <troubleshooting>`
     - Collect a sosreport and diagnose common failures.

For AI agent integration, see the top-level :doc:`AI Skills <../ai-skills>` page.
