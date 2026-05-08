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
Installation
***************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Prerequisites
================================================================================

Before using Kubernetes Launch Kit, ensure the following:

- **Kubernetes cluster** with the NVIDIA Network Operator Helm chart installed, including the SR-IOV Network Operator, Maintenance Operator, and Node Feature Discovery (NFD). For installation instructions, see :doc:`Getting Started with Kubernetes <../getting-started-with-kubernetes>`.
- ``kubectl`` configured with access to the target cluster.
- Docker or Podman on the machine where you will run ``l8k`` (only for the container scenario).

================================================================================
Install
================================================================================

Choose one of the methods below. The script and Homebrew methods install a binary plus profile templates and presets to a local prefix; the container method runs ``l8k`` from a published image and writes nothing outside your working directory.

Script
-------

Downloads the latest release from GitHub and installs the ``l8k`` binary, profile templates, and presets to ``/usr/local``:

.. code-block:: bash

   curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh

Pin a specific version or install to a custom directory:

.. code-block:: bash

   L8K_VERSION=v1.0.0 sh scripts/install.sh
   curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh -s -- -d ~/local

Homebrew
---------

For macOS and Linux systems with Homebrew:

.. code-block:: bash

   brew tap nvidia/l8k https://github.com/nvidia/k8s-launch-kit
   brew install l8k

Container
----------

Run ``l8k`` directly from the published container image without copying any binary or assets to the host filesystem. The image stays in the local Docker cache; everything else (kubeconfig, output directory) is mounted at runtime.

Pull the image once:

.. code-block:: bash
   :substitutions:

   docker pull |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version|

Define a shell alias so ``l8k`` invokes the container with kubeconfig + working directory mounted:

.. code-block:: bash
   :substitutions:

   alias l8k='docker run --rm --net=host \
       -v ~/.kube:/kube:ro \
       -v $(pwd):/work -w /work \
       |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version|'

Add the line to your ``~/.bashrc`` or ``~/.zshrc`` to make it persistent. With this alias in place, every ``l8k <subcommand> ...`` invocation creates a fresh container, runs the command, and removes the container --- nothing is written outside the current working directory.

.. note::

   ``--net=host`` is required so the container can reach the Kubernetes API server. The ``--rm`` flag ensures no stopped containers accumulate. Mount the kubeconfig directory read-only.

================================================================================
Verify
================================================================================

The same command works for all installation methods:

.. code-block:: bash

   l8k version

================================================================================
Uninstall
================================================================================

Use the method that matches how you installed.

Script
-------

.. code-block:: bash

   curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh -s -- --uninstall

Homebrew
---------

.. code-block:: bash

   brew uninstall l8k
   brew untap nvidia/l8k

Container
----------

Drop the alias and remove the cached image:

.. code-block:: bash
   :substitutions:

   unalias l8k
   docker image rm |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version|

Also remove the alias line from your shell rc file if you added it.

================================================================================
Layout (Script and Homebrew)
================================================================================

The script and Homebrew methods install the following under the install prefix (default: ``/usr/local``):

- ``<prefix>/bin/l8k`` --- CLI binary
- ``<prefix>/share/l8k/profiles/`` --- profile templates
- ``<prefix>/share/l8k/presets/`` --- cluster topology presets
- ``<prefix>/share/l8k/l8k-config.yaml`` --- default configuration

The container method does not write anything outside your working directory; profiles, presets, and the default config are baked into the image.

================================================================================
See Also
================================================================================

- :doc:`Quick Start <quick-start>` --- end-to-end walkthrough using ``l8k``
- :doc:`CLI Reference <reference/cli>` --- full flag reference
