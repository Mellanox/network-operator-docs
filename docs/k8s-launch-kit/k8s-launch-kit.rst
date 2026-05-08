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

*****************************
NVIDIA Kubernetes Launch Kit
*****************************

NVIDIA Kubernetes Launch Kit (l8k) is a CLI tool that automates the deployment of NVIDIA cloud-native networking on Kubernetes. It discovers cluster hardware, selects a deployment profile, generates Kubernetes YAML manifests, and optionally deploys them. Launch Kit supports SR-IOV, RDMA, InfiniBand, Host Device, MacVLAN, and Spectrum-X configurations, including heterogeneous clusters with mixed NIC and GPU hardware.

.. note::

   **Who this is for:** operators and platform engineers deploying NVIDIA networking on a Kubernetes cluster. Launch Kit replaces hand-written ``NicClusterPolicy``, ``NicNodePolicy``, and ``SriovNetworkNodePolicy`` manifests with a discover-driven workflow.

.. toctree::
   :hidden:
   :maxdepth: 1

   Overview <overview>
   Installation <installation>
   Quick Start <quick-start>
   Deployment Profiles <profiles/profiles>
   Workflows <workflows/workflows>
   Advanced Topics <advanced-topics>
   Reference <reference/reference>

================================================================================
Install
================================================================================

Install the ``l8k`` binary with the install script:

.. code-block:: bash

   curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh

Or with Homebrew:

.. code-block:: bash

   brew tap nvidia/l8k https://github.com/nvidia/k8s-launch-kit
   brew install l8k

================================================================================
Where to Start
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **I want to...**
     - **Go to**
   * - See all installation options (container, build-from-source, version pinning)
     - :doc:`Installation <installation>`
   * - Get the mental model and core vocabulary
     - :doc:`Overview <overview>`
   * - Run an end-to-end walkthrough on a fresh cluster
     - :doc:`Quick Start <quick-start>`
   * - Pick the right profile for my cluster
     - :doc:`Deployment Profiles <profiles/profiles>`
   * - Run a specific phase --- discover, generate, or deploy
     - :doc:`Workflows <workflows/workflows>`
   * - Configure heterogeneous clusters, presets, CI/CD, AI agents, or troubleshoot
     - :doc:`Advanced Topics <advanced-topics>`
   * - Look up flags or the config schema
     - :doc:`Reference <reference/reference>`
