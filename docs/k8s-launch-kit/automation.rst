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

************************
Automation and CI/CD
************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Use this when:** you are wiring Launch Kit into a CI/CD pipeline, an automation framework, or an AI agent that needs structured output and exit-code-driven retry logic.

Launch Kit is designed for both interactive use and automated pipelines. Every subcommand supports a JSON output mode, well-defined exit codes, and a programmatic capability discovery endpoint.

================================================================================
JSON Output Mode
================================================================================

Use ``--output json`` for machine-readable output. In JSON mode, structured data goes to stdout and human-readable logs go to stderr:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --output json --yes 2>/dev/null | jq .

================================================================================
Non-Interactive Flags
================================================================================

- ``--yes`` / ``-y`` --- auto-confirm all prompts (implied by ``--output json``)
- ``--quiet`` / ``-q`` --- suppress informational output

================================================================================
Exit Codes
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 15 85

   * - **Code**
     - **Meaning**
   * - 0
     - Success.
   * - 1
     - General error.
   * - 2
     - Validation error (invalid flags or configuration).
   * - 3
     - Cluster error (API unreachable, discovery failed).
   * - 4
     - Deployment error (apply failed).
   * - 5
     - Partial success (discovery completed but deployment failed).

================================================================================
Structured Errors
================================================================================

In JSON mode, errors include structured fields (``code``, ``category``, ``transient``, ``suggestion``) to help automation decide whether to retry or fix input. ``transient: true`` indicates a temporary condition (e.g., API unreachable) where retry is appropriate; ``transient: false`` indicates a permanent failure (e.g., invalid flag) requiring input changes.

================================================================================
Schema Discovery
================================================================================

AI agents and automation tools can programmatically discover Launch Kit's capabilities:

.. code-block:: bash

   l8k schema

Outputs a JSON description of available commands, phases, fabrics, deployment types, flags, exit codes, and output formats. Tools that need to know what l8k can do (without parsing ``--help`` text) use this endpoint.

================================================================================
See Also
================================================================================

- :doc:`AI Skills <../ai-skills>` --- driving ``l8k`` from Claude Code, Cursor, Codex CLI, or any agent
- :doc:`CLI Reference <reference/cli>` --- complete flag reference
- :doc:`Troubleshooting <troubleshooting>` --- diagnosing failed pipelines
