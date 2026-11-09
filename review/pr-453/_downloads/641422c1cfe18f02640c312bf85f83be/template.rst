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

******************************
Partner Configuration Template
******************************

Copy the :download:`RST source of this template <template.rst>` to a new partner
page. Replace the title and the guidance below with your results; remove this
introductory paragraph. Follow :ref:`partner-submit-results` to submit the page.

About the Platform
==================

Describe your product, the networking use case, and how users benefit from
running it with NVIDIA Network Operator. Link to your product documentation.

Validated Configuration
=======================

Record one entry for each tested combination. Use exact versions from the test
run; do not substitute the latest release or infer coverage of other versions.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Item
     - Tested value
   * - Partner product and Kubernetes distribution
     - Product name and version; Kubernetes version
   * - Operating system and container runtime
     - OS, kernel, and runtime names and versions
   * - NVIDIA Network Operator
     - Installed version and installation method (Helm or OperatorHub/OLM); installer version or channel as applicable
   * - Networking components
     - DOCA driver and relevant device plugin, CNI, SR-IOV operator, NFD, and Maintenance Operator versions
   * - Launch Kit
     - Exact ``l8k version`` output and selected Network Operator release line
   * - Hardware
     - Server model, worker count, NVIDIA NIC model and firmware; GPU model and driver when testing GPUDirect
   * - Network
     - Fabric and switch software, speed, MTU, rail count, routing, and applicable VLAN or InfiniBand partition settings
   * - Launch Kit profile
     - Platform flavor, fabric, deployment type, and profile options
   * - Validation date
     - Date the recorded tests completed

Prerequisites
=============

List the software, hardware, permissions, network configuration, and image access
users need. Link to installation instructions for externally managed operators.
Call out any platform-specific preparation before running Launch Kit.

Deployment Procedure
====================

Provide the tested discovery, generation, preview, and deployment commands, with
sanitized configuration examples. Identify values users must change for their
own site. Reference :doc:`index` for shared steps and describe platform-specific
differences. Explain how to remove the deployment without removing shared
platform services.

Validation Results
==================

Provide the exact validation command, test date, exit status, and a link to the
sanitized HTML report or agreed evidence location. Include:

* Workers and rails tested, test families, routing expectations, bandwidth
  threshold, and observed results.
* Whether GPUDirect was tested, with its prerequisites and results.
* Skipped, unverified, or failed checks and their impact on the supported use case.
* Application tests and results, plus any deployment or networking limitations.

Separate live tests from rendering or dry-run checks. List only the configuration
combinations that completed the required validation.

Getting Support
===============

Provide the partner's support URL or contact, the information users should
include in a support request, and a GitHub user name for documentation follow-up.
Explain the scope of support for the platform and any partner-provided components.

Related Information
===================

Link to product documentation, release notes, known issues, and relevant
Network Operator and Launch Kit guides.
