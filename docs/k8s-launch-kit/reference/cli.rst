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

***************
CLI Reference
***************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

The Launch Kit binary is invoked as ``l8k`` and exposes a set of subcommands. ``l8k --help`` and ``l8k <subcommand> --help`` print labelled flag groups identical to the sections below.

================================================================================
Global Flags
================================================================================

Available on all subcommands:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--output <string>``
     - Output format: ``text`` (default, human-readable) or ``json`` (structured for automation, see :doc:`../automation`).
   * - ``-y, --yes``
     - Auto-confirm all prompts. Implied by ``--output json``.
   * - ``-q, --quiet``
     - Suppress informational output.
   * - ``--log-level <string>``
     - Log level: ``debug``, ``info``, ``warn``, ``error``.
   * - ``--log-file <string>``
     - Write logs to file instead of stderr.
   * - ``-h, --help``
     - Show help.

================================================================================
l8k discover
================================================================================

Probes cluster hardware and writes a ``cluster-config.yaml``.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig file (falls back to ``$KUBECONFIG``).
   * - ``--user-config <string>``
     - Base config to merge with discovered hardware. If ``--save-cluster-config`` is omitted, the file is updated in place.
   * - ``--save-cluster-config <string>``
     - Output path for the discovered cluster configuration. Defaults to ``--user-config`` if set, otherwise ``./cluster-config.yaml``.
   * - ``--network-operator-namespace <string>``
     - Override the Network Operator namespace (default: ``nvidia-network-operator``).
   * - ``--network-operator-release <string>``
     - Pin discovery to a Network Operator release line. Supported: ``25.10``, ``26.1``, ``26.4``.
   * - ``--node-selector <string>``
     - Filter nodes for discovery by label. Default: ``feature.node.kubernetes.io/pci-15b3.present=true`` (Mellanox NICs).
   * - ``--image-pull-secrets <strings>``
     - Image pull secret names for NicClusterPolicy (comma-separated).
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``).

================================================================================
l8k generate
================================================================================

Renders Kubernetes manifests from a cluster configuration and a profile selection. Optionally deploys them.

Profile Selection
------------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--user-config <string>``
     - Cluster configuration file. Auto-detected from ``./cluster-config.yaml`` (or the installed default) if omitted.
   * - ``--for <preset>``
     - Generate for a hardware preset without running discovery. Requires ``--node-selector``. See :doc:`../presets`.
   * - ``--fabric <string>``
     - Fabric type: ``ethernet`` or ``infiniband``. Auto-defaults from the cluster's unanimous ``linkType`` (Unit 5 fabric probe) when not supplied.
   * - ``--deployment-type <string>``
     - Deployment type: ``sriov``, ``rdma_shared``, or ``host_device``. Auto-defaults to ``sriov`` when not supplied.
   * - ``--multirail``
     - Enable multirail deployment. Auto-defaults to ``true``. Opt out with ``--multirail=false`` (YAML cannot express explicit-false).
   * - ``--spectrum-x <RA-version>``
     - Enable Spectrum-X. Value is the SPC-X RA version: ``RA2.1`` or ``RA2.2``. Implies ethernet fabric, sriov deployment, and multirail.
   * - ``--multiplane-mode <string>``
     - Multiplane mode: ``swplb``, ``hwplb``, ``uniplane``, or ``none``. Required with ``--spectrum-x``; auto-defaulted from east-west PF deviceID when omitted (CX7/BF3 → ``uniplane``, CX8 → ``swplb``, CX9 → ``hwplb``). ``none`` requires ``--number-of-planes 1``.
   * - ``--number-of-planes <int>``
     - Number of planes: ``1``, ``2``, or ``4``. Required with ``--spectrum-x``; auto-defaulted from deviceID (CX7/BF3 → 1, CX8 → 2, CX9 → 4).
   * - ``--network-operator-release <string>``
     - Pin to a Network Operator release line. Supported: ``25.10``, ``26.1``, ``26.4``. Auto-defaulted under ``--spectrum-x`` (``RA2.1`` → ``26.1``; ``RA2.2`` → ``26.4``). See :doc:`../overview`.
   * - ``--groups <a,b,...>``
     - Restrict output to the named source groups (comma-separated, matched case-sensitively against ``clusterConfig[].identifier``). Mutually exclusive with ``--gpu-type``. Empty match is a validation error. See :doc:`../heterogeneous-clusters`.
   * - ``--gpu-type <string>``
     - Restrict output to source groups whose ``gpuType`` matches (case-insensitive). Mutually exclusive with ``--groups``. See :doc:`../heterogeneous-clusters`.
   * - ``--node-selector <string>``
     - Node selector for the synthesized ``clusterConfig`` when ``--for`` is used (e.g., ``key=value,key2=value2``). Required with ``--for``.

Output and Deployment
----------------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--save-deployment-files <string>``
     - Output directory for generated YAML files (default: ``./deployment``).
   * - ``--deploy``
     - Apply generated manifests to the cluster.
   * - ``--dry-run``
     - Preview deployment without applying (requires ``--deploy``).
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (required with ``--deploy``; falls back to ``$KUBECONFIG``).

Customization
--------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--enable-doca-driver``
     - Enable DOCA driver deployment.
   * - ``--workload-manifest <string>``
     - Path to a custom workload manifest. Launch Kit patches network annotations, resource requests, and node affinity. See :doc:`../workflows/generate`.
   * - ``--image-pull-secrets <strings>``
     - Image pull secret names for NicClusterPolicy (comma-separated). Propagates to per-group NicNodePolicy sub-specs.
   * - ``--network-operator-namespace <string>``
     - Override the Network Operator namespace.
   * - ``--pod-namespace <string>``
     - Namespace for pods and network resources.
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``).

================================================================================
l8k deploy
================================================================================

Applies previously generated manifests to the cluster in dependency order (NicClusterPolicy first, then per-group NicNodePolicy, then networks and workloads).

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--deployment-files <string>``
     - Directory containing the manifests to apply (default: ``./deployment``).
   * - ``--dry-run``
     - Preview what would be applied without changing the cluster.

================================================================================
l8k validate
================================================================================

Verifies a deployment matches the selected Network Operator release: compares the deployed Helm chart's appVersion with the version expected by ``networkOperator.selectedRelease`` in ``cluster-config.yaml``, then confirms every YAML manifest under ``--deployment-files`` is present in the cluster (skipping example workloads). Exits 4 on any missing manifest or version mismatch. See :doc:`../workflows/validate` for full details.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--user-config <string>``
     - Cluster config file (default: ``./cluster-config.yaml``). Read for ``networkOperator.selectedRelease`` and operator namespace.
   * - ``--deployment-files <string>``
     - Directory containing the manifests to verify (default: ``./deployment``).

================================================================================
l8k preset list
================================================================================

Lists locally available cluster topology presets.

.. code-block:: bash

   l8k preset list

================================================================================
l8k preset update
================================================================================

Downloads the latest presets from a Git repository.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--repo <string>``
     - Git repository URL.
   * - ``--branch <string>``
     - Branch or tag to fetch from (default: ``main``).
   * - ``--dir <string>``
     - Subdirectory within the repo containing presets.

See :doc:`../presets` for usage.

================================================================================
l8k sosreport
================================================================================

Collects diagnostic data from the cluster.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--output-dir <string>``
     - Directory to save the sosreport (default: ``./sosreport``).

See :doc:`../troubleshooting` for analysis guidance.

================================================================================
l8k schema
================================================================================

Outputs a JSON description of l8k's capabilities --- supported commands, fabrics, deployment types, exit codes, and output formats. Used by AI agents and automation tooling to discover ``l8k`` capabilities programmatically. See :doc:`../automation`.

.. code-block:: bash

   l8k schema

================================================================================
l8k version
================================================================================

Prints the version. Supports ``--output json`` for structured output.

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
See Also
================================================================================

- :doc:`Configuration Reference <config>` --- ``l8k-config.yaml`` schema
- :doc:`Automation and CI/CD <../automation>` --- JSON output and exit-code-driven retries
- :doc:`Overview <../overview>` --- the meaning behind the flags
