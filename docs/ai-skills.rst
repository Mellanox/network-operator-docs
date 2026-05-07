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
.. include:: ./common/vars.rst

***********
AI Skills
***********

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

NVIDIA ships a set of **AI agent skills** that drive Network Operator configuration on Kubernetes through the deterministic ``l8k`` CLI (Kubernetes Launch Kit). The skills are plain Markdown files with light YAML frontmatter --- agent-agnostic by design. They give an LLM agent the vocabulary, decision tree, and command idioms to discover cluster hardware, pick a deployment profile, render manifests, deploy them, and triage failures, without the operator having to memorize ``l8k`` flags or NVIDIA networking conventions.

Skills do not embed an LLM. ``l8k`` itself remains a self-contained binary --- it is fully usable without any AI agent. The skills are an *interface layer* that lets agents call ``l8k`` correctly.

================================================================================
What Skills Provide
================================================================================

Each skill is a self-contained Markdown document in the `k8s-launch-kit repository <https://github.com/NVIDIA/k8s-launch-kit>`_ under ``skills/``. The bundled set:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Skill**
     - **Purpose**
   * - ``k8s-network-engineer``
     - Top-level persona. Embodies a senior NVIDIA networking engineer; activates on any Kubernetes networking question (SR-IOV, RDMA, Spectrum-X, BlueField, ConnectX, DOCA, multirail). Loads every utility skill below.
   * - ``k8s-launch-kit-shared``
     - Shared CLI patterns: install paths, global flags, output modes, exit-code semantics. Required by every other skill.
   * - ``k8s-launch-kit-discover``
     - Wraps ``l8k discover``: cluster hardware probing, label patching, ``cluster-config.yaml`` interpretation.
   * - ``k8s-launch-kit-config``
     - Reads / explains / edits ``cluster-config.yaml`` and ``l8k-config.yaml`` --- profile fields, group identifiers, OFED module lists.
   * - ``k8s-launch-kit-generate``
     - Wraps ``l8k generate``: profile selection (fabric × deployment-type), Spectrum-X cohort flags, group filters, hardware-derived defaults.
   * - ``k8s-launch-kit-dryrun``
     - Wraps ``l8k generate --dry-run``: previews what would land on the cluster without applying.
   * - ``k8s-launch-kit-deploy``
     - Wraps ``l8k deploy``: applies pre-generated manifests in dependency order.
   * - ``k8s-launch-kit-validate``
     - Wraps ``l8k validate``: confirms the deployed Network Operator matches the selected release and every rendered manifest is present.
   * - ``k8s-launch-kit-pipeline``
     - End-to-end orchestration (discover → generate → deploy) for greenfield clusters.
   * - ``k8s-launch-kit-troubleshoot``
     - Wraps ``l8k sosreport`` plus a triage checklist for OFED crashes, SR-IOV VF allocation failures, ``ContainerCreating``-stuck pods, and NIC firmware misconfiguration.

The skills know which ``l8k`` flags exist on which subcommand, when ``--dry-run`` is required, when ``--multirail`` should auto-default, which Spectrum-X RA pairs with which Network Operator release, and how to interpret a sosreport. They tell the agent to **start every deployment task with** ``l8k discover`` **and every troubleshooting task with** ``l8k sosreport`` --- not with raw ``kubectl``.

================================================================================
Installation
================================================================================

The skills are agent-agnostic Markdown. The right install location depends on which AI agent you're using.

All paths assume the repository has been cloned:

.. code-block:: bash

   git clone https://github.com/NVIDIA/k8s-launch-kit.git
   cd k8s-launch-kit

Claude Code
------------

Claude Code discovers skills under ``~/.claude/skills/`` (user-scoped) or ``<project>/.claude/skills/`` (project-scoped):

.. code-block:: bash

   # User-scoped (available in every Claude Code session)
   mkdir -p ~/.claude/skills
   ln -s "$(pwd)/skills/"k8s-launch-kit-* ~/.claude/skills/
   ln -s "$(pwd)/skills/k8s-network-engineer" ~/.claude/skills/

   # Or project-scoped (available only in this project)
   mkdir -p .claude/skills
   ln -s "$(pwd)/skills/"k8s-launch-kit-* .claude/skills/
   ln -s "$(pwd)/skills/k8s-network-engineer" .claude/skills/

Verify by typing ``/skills`` in a Claude Code session --- the ``k8s-launch-kit-*`` and ``k8s-network-engineer`` entries should appear.

Cursor
-------

Cursor reads project-scoped rule files from ``.cursor/rules/``. Symlink the skill directories or copy the ``SKILL.md`` files into ``.mdc`` rules:

.. code-block:: bash

   # In your Kubernetes / l8k project
   mkdir -p .cursor/rules
   for skill in <path-to-k8s-launch-kit>/skills/*/SKILL.md; do
       name=$(basename "$(dirname "$skill")")
       cp "$skill" ".cursor/rules/${name}.mdc"
   done

The YAML frontmatter on each ``SKILL.md`` is compatible with Cursor's rule metadata (``description``, ``alwaysApply``-equivalent semantics handled by activation prompts). For user-wide rules, place them under ``~/.cursor/rules/`` instead.

OpenAI Codex CLI
-----------------

Codex CLI loads project-level instructions from an ``AGENTS.md`` file at the repository root. Concatenate the persona skill plus its dependencies into ``AGENTS.md``:

.. code-block:: bash

   # In your Kubernetes / l8k project
   {
       echo "# Agent Instructions"
       echo
       cat <path-to-k8s-launch-kit>/skills/k8s-network-engineer/SKILL.md
       for skill in <path-to-k8s-launch-kit>/skills/k8s-launch-kit-*/SKILL.md; do
           echo
           echo "---"
           echo
           cat "$skill"
       done
   } > AGENTS.md

For machine-wide instructions, write to ``~/.codex/AGENTS.md`` instead. Codex CLI will pick up the file automatically on each ``codex`` invocation.

Other Agents
-------------

Any agent that supports loading external Markdown context (Continue.dev, Aider, custom MCP servers, etc.) can use the skills. Two integration patterns work:

- **As a system / project prompt**: concatenate ``skills/k8s-network-engineer/SKILL.md`` plus the ``k8s-launch-kit-*/SKILL.md`` files into the agent's persistent context.
- **As MCP server resources**: serve the ``skills/`` directory through any filesystem MCP server; the agent reads the relevant skill on demand.

The skill content is the contract. Frontmatter (``name``, ``description``, ``metadata.requires``) is metadata for skill-aware agents and is safely ignored by agents that don't parse it.

================================================================================
Real-World Scenarios
================================================================================

The examples below show prompts an operator would type in any of the agents above, plus the actions the skills would orchestrate.

Discovery on a Heterogeneous Cluster
-------------------------------------

**Operator prompt:**

   *"I have a new cluster with mixed DGX-B200 and Lenovo ThinkSystem nodes, both running H100 GPUs. The GPU operator is installed. Help me discover the network topology and tell me what I'm working with."*

**Skill-driven flow:**

1. ``k8s-network-engineer`` activates and loads the discovery skills.
2. The agent runs ``l8k discover --output json 2>/dev/null`` and parses the result.
3. ``k8s-launch-kit-config`` interprets the resulting ``cluster-config.yaml``: identifies two source groups (``dgx-b200-nvidia-h100-nvl`` and ``thinksystem-sr680a-v3-nvidia-h100-nvl``), confirms east-west PFs are ConnectX-7 (deviceID ``1021``), counts 8 rails per node, and notes that both groups share a ``railNumber`` --- so ``--multirail`` will auto-default to true.
4. The agent reports back: GPU type, NIC topology, fabric verdict (``linkType: Ethernet`` confirmed via active port + ``link_layer``), discovered OFED-dependent kernel modules (any storage modules trigger an "unloadStorageModules will be enabled" warning), and any preset deviations.
5. The agent suggests the next step: *"Both groups share GPU type and rail count, so a single ``l8k generate`` will produce one combined bundle covering both. Want me to render manifests for SR-IOV Ethernet?"*

The operator never reads ``cluster-config.yaml`` directly --- the skill explains the contents in natural language and surfaces the decisions that matter.

Choosing a Deployment Profile (Spectrum-X)
-------------------------------------------

**Operator prompt:**

   *"This cluster is going to run a Spectrum-X AI cloud. We have ConnectX-8 east-west NICs and we're targeting Network Operator 26.4. Generate the manifests."*

**Skill-driven flow:**

1. ``k8s-launch-kit-generate`` recognizes Spectrum-X intent.
2. The skill verifies the cohort: ConnectX-8 → ``--multiplane-mode swplb`` and ``--number-of-planes 2`` are the hardware defaults; RA2.2 pairs with Network Operator 26.4.
3. Before running ``l8k generate``, the skill asks the operator to confirm the **switch-side** Spectrum-X fabric setup is in place (Spectrum-4 switches with the matching configuration) --- because ``l8k`` does not handle the switch side and a misconfigured fabric is the most common Spectrum-X failure mode.
4. Once confirmed, the agent runs:

   .. code-block:: bash

      l8k generate \
          --spectrum-x RA2.2 \
          --network-operator-release 26.4 \
          --save-deployment-files ./deployments-spectrum-x \
          --output json 2>/dev/null

5. The agent reports the auto-defaulted flags ("``Defaulted --multiplane-mode=swplb (ConnectX-8 deviceID 1023)``", "``Defaulted --number-of-planes=2``") and recommends ``l8k generate --dry-run`` before applying.

The skill knows the per-deviceID multiplane defaults, the RA-to-release pairing, and the switch-side prerequisite --- the operator only needs to state intent.

Triaging a Stuck Deployment
----------------------------

**Operator prompt:**

   *"My OFED driver pods have been stuck in CrashLoopBackOff for the last hour. Some of my GPU workload pods are stuck in ContainerCreating. Figure out what's wrong."*

**Skill-driven flow:**

1. ``k8s-launch-kit-troubleshoot`` activates.
2. The agent runs ``l8k sosreport --output-dir ./sosreport`` first --- one command captures all CRDs, operator logs, per-node NIC info, and module status. The skill explicitly tells the agent **not** to start with raw ``kubectl logs`` until the sosreport bundle is read.
3. The skill walks the triage checklist against the bundle:

   - Is the right Network Operator release installed? (``l8k validate`` against ``cluster-config.yaml``)
   - Are storage / third-party RDMA modules loaded that would block MOFED reload? (``unloadStorageModules`` / ``unloadThirdPartyRDMAModules`` flags)
   - Does the firmware preflight check pass on every node?
   - Are there NicNodePolicy resources for every group, with matching ``nodeSelector``?
   - Are any pods scheduled on nodes that don't carry the ``nvidia.kubernetes-launch-kit.machine`` label?

4. The agent finds the root cause --- e.g. *"The OFED container is being killed by the kernel because ``nvme_rdma`` was loaded by an early-boot service and is holding ``mlx5_ib``. ``unloadStorageModules`` is set to ``false`` in the rendered NicNodePolicy. Re-run ``l8k discover`` to re-detect storage modules and apply, or set ``docaDriver.unloadStorageModules: true`` manually."*

5. The agent offers to apply the fix and watch the rollout.

The skill turns "the cluster is broken" into a structured investigation that always starts from the same evidence baseline (the sosreport).

================================================================================
What Skills Don't Do
================================================================================

- **No autonomous deploys.** Skills are designed to recommend ``--dry-run`` before any ``kubectl apply`` / ``l8k deploy`` and surface the exact command for operator approval. The operator stays in the loop.
- **No switch-side configuration.** Spectrum-X fabric setup, BGP / EVPN, and physical cabling are out of scope. The skills will warn before suggesting Spectrum-X profiles.
- **No replacement for review.** Skills produce the *most likely* configuration based on discovered hardware. For production rollouts, the operator should still inspect the rendered ``./deployments/*.yaml`` and ``cluster-config.yaml`` before applying.

================================================================================
See Also
================================================================================

- :doc:`Configuration Assistance with Kubernetes Launch Kit <k8s-launch-kit/k8s-launch-kit>` --- the underlying CLI
- :doc:`Automation and CI/CD <k8s-launch-kit/automation>` --- using ``l8k`` from scripts and pipelines without an agent
- :doc:`Troubleshooting <k8s-launch-kit/troubleshooting>` --- the underlying ``l8k sosreport`` workflow
- :doc:`Deployment Profiles <k8s-launch-kit/profiles/profiles>` --- the decision matrix the skills consult
