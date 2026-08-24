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
     - Pin discovery to a Network Operator release line. Supported: ``26.1``, ``26.4``, ``26.7``.
   * - ``--topology-scheme <string>``
     - Topology scheme for Spectrum-X IP allocation: ``2-tier`` or ``3-tier``. Persisted to ``profile.spectrumX.topologyType`` in the saved cluster configuration, so a later ``l8k generate`` does not need the flag.
   * - ``--ip-version <string>``
     - IP version for Spectrum-X address allocation: ``ipv4`` (default) or ``ipv6``.
   * - ``--topology-file <string>``
     - Path to a spcx-gen/reference-generator or NVIDIA AIR topology JSON, used to generate Spectrum-X ``CIDRPool`` resources.
   * - ``--spectrum-x-config <string>``
     - Path to the Spectrum-X profile ConfigMap YAML, or to the raw ``data.profile`` YAML it wraps. Required for ``RA2.3``.
   * - ``--spectrum-x-configmap-name <string>``
     - Name for the generated profile ConfigMap. Required only when ``--spectrum-x-config`` holds raw ``data.profile`` YAML; with a full ConfigMap manifest the name is taken from ``metadata.name``.
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
     - Enable Spectrum-X. Value is the SPC-X RA version: ``RA2.3``, or ``RA2.1`` for Network Operator 26.1. Implies ethernet fabric, sriov deployment, and multirail.
   * - ``--multiplane-mode <string>``
     - Multiplane mode: ``none``, ``swplb``, or ``hwplb``. Required with ``--spectrum-x``; auto-defaulted from the GPU platform and east-west NIC when omitted --- H100 / H200 / B200 / GB200 use ``none``, B300 / GB300 use ``swplb``. These are Launch Kit's generator defaults; Spectrum-X RA 2.3 recommends ``hwplb`` on multiplane platforms, so pass it explicitly to follow the RA. ``none`` requires ``--number-of-planes 1``.
   * - ``--number-of-planes <int>``
     - Number of planes: ``1``, ``2``, or ``4``. Required with ``--spectrum-x``; auto-defaulted from the GPU platform (single-plane platforms → ``1``, B300 / GB300 → ``2``). Pass ``4`` explicitly for a quad-plane B300 / GB300 topology.
   * - ``--topology-scheme <string>``
     - Topology scheme for Spectrum-X IP allocation: ``2-tier`` or ``3-tier``. **Required** with ``--spectrum-x`` --- Launch Kit does not default it. May instead be carried in the cluster configuration as ``profile.spectrumX.topologyType``, which ``l8k discover --topology-scheme`` persists; a later ``l8k generate`` then needs no flag.
   * - ``--ip-version <string>``
     - IP version for Spectrum-X address allocation: ``ipv4`` (default) or ``ipv6``.
   * - ``--topology-file <string>``
     - Path to a spcx-gen/reference-generator or NVIDIA AIR topology JSON, used to generate Spectrum-X ``CIDRPool`` resources. Optional; without it, addresses come from the scheme's built-in allocation.
   * - ``--spectrum-x-config <string>``
     - Path to the Spectrum-X profile ConfigMap YAML, or to the raw ``data.profile`` YAML it wraps. Required for ``RA2.3``. Launch Kit renders the ConfigMap into the Network Operator namespace with the label the NIC Configuration Operator watches, and points ``spectrumXOptimized.version`` at it. See :doc:`../profiles/spectrum-x`.
   * - ``--spectrum-x-configmap-name <string>``
     - Name for the generated profile ConfigMap. Required only when ``--spectrum-x-config`` holds raw ``data.profile`` YAML; with a full ConfigMap manifest the name is taken from ``metadata.name``.
   * - ``--network-operator-release <string>``
     - Pin to a Network Operator release line. Supported: ``26.1``, ``26.4``, ``26.7``. Auto-defaulted under ``--spectrum-x`` (``RA2.3`` → ``26.7``; ``RA2.1`` → ``26.1``). See :doc:`../overview`.
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

Applies previously generated manifests to the cluster in four phases: NicClusterPolicy first (await ready), per-group NicNodePolicy (await each), all remaining CRs in one batch (controllers reconcile concurrently), then verify every manifest reached a terminal state. Example workload manifests (``*example*``) are skipped here --- they're applied by ``l8k validate --connectivity`` / ``l8k deploy --verify`` as part of the data-plane phase. See :doc:`../workflows/deploy` for the full deployment-ordering description.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--deployment-files <string>``
     - Directory containing the manifests to apply (default: ``./deployment``).
   * - ``--deploy-timeout <duration>``
     - End-to-end wall-clock budget for the apply + reconciliation phase (e.g., ``45m``, ``2h``). ``0`` (default) means no deadline; polls until every manifest reaches a terminal state. Useful for matching a maintenance window when SR-IOV reconciliation on a large cluster can take an hour or more.
   * - ``--verify``
     - After a successful apply, chain the connectivity matrix (same flow as ``l8k validate --connectivity``): apply the example DaemonSet, wait for it to roll out, run a ping matrix across every rail and pod pair, then clean up.
   * - ``--dry-run``
     - Preview what would be applied without changing the cluster.

================================================================================
l8k validate
================================================================================

Verifies a deployment by running four checks back-to-back: Network Operator Helm release version (compared against ``networkOperator.selectedRelease`` in ``cluster-config.yaml``); per-component version cross-check that walks the live ``NicClusterPolicy`` + ``NicNodePolicy`` and confirms each section's ``.version`` field matches the catalog (catches out-of-band edits and partial upgrades the Helm check misses); per-manifest state classification (READY / IN-PROGRESS / ERROR / MISSING via the per-Kind validator registry); and a data-plane connectivity matrix (apply the example DaemonSet, ping every rail across every pod pair). Writes a self-contained HTML report to ``<deployment-files>/verify-report.html`` by default. Exits 4 on any missing/error manifest, Helm-version mismatch, component-version mismatch, or connectivity-matrix failure. See :doc:`../workflows/validate` for full details.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--user-config <string>``
     - Cluster config file. Lookup order: explicit path → ``./cluster-config.yaml`` → ``<deployment-files>/../cluster-config.yaml`` → ``<deployment-files>/cluster-config.yaml``. Read for ``networkOperator.selectedRelease`` and operator namespace.
   * - ``--deployment-files <string>``
     - Directory containing the manifests to verify (default: ``./deployment``).
   * - ``--connectivity``
     - Run the data-plane ping matrix. Default ``true``. Pass ``--connectivity=false`` to limit validate to the static manifest + Helm-release-version checks.
   * - ``--connectivity-timeout <duration>``
     - Wall-clock budget for the connectivity phase (default: ``5m``).
   * - ``--ping-count <int>``
     - Number of ICMP echoes per ``src → dst`` pair (``ping -c N``). Default ``3``.
   * - ``--keep``
     - Leave the test DaemonSet running after ``--connectivity`` completes (useful for follow-up debugging).
   * - ``--wait <duration>``
     - Block validate up to this duration waiting for in-progress manifests to reach a terminal state. ``0`` (default) returns immediately on the first snapshot. Re-polls the cluster every 10 s.
   * - ``--report-path <string>``
     - Write the HTML report to this path. Empty (default) writes to ``<deployment-files>/verify-report.html``. Pass ``-`` to skip the report file entirely.

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
