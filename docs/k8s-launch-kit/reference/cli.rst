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

The Launch Kit binary is invoked as ``l8k`` and exposes a set of subcommands. ``l8k --help`` and ``l8k <subcommand> --help`` show the complete flag set for the installed version. This page covers the host networking workflow.

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
   * - ``--log-level <string>``
     - Log level: ``trace``, ``debug``, ``info``, ``warn``, ``error``.
   * - ``--log-file <string>``
     - Write logs to file instead of stderr.
   * - ``-h, --help``
     - Show help.

``--yes`` and ``--quiet`` are root-pipeline flags. Use ``--output json`` to auto-confirm lifecycle subcommands. Host workflow commands also accept ``--config-dir`` for config/preset overrides and ``--flavor k8s|ocp`` for operator integration.

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
     - Pin discovery to a Network Operator release line. Supported: ``26.1``, ``26.4``, ``26.7``, ``26.10``.
   * - ``--spectrum-x <RA-version>``
     - Enable Spectrum-X for discovery. Accepted values are ``RA2.1``, ``RA2.2``, ``RA2.3``, ``RA2.4``, and ``RA3.1``; see the :doc:`version matrix <../profiles/spectrum-x>`. Required before any of the Spectrum-X flags below --- passing one without it is a validation error.
   * - ``--multiplane-mode <string>``
     - Multiplane mode override: ``none``, ``swplb``, or ``hwplb``. Requires ``--spectrum-x``.
   * - ``--number-of-planes <int>``
     - Plane count override: ``1``, ``2``, ``4``, or ``8`` (eight-plane generation requires RA2.4/RA3.1 VR HWPLB). Requires ``--spectrum-x``.
   * - ``--topology-scheme <string>``
     - Topology scheme for Spectrum-X IP allocation: ``2-tier`` or ``3-tier``. Requires ``--spectrum-x``. Persisted to ``profile.spectrumX.topologyType`` in the saved cluster configuration, so a later ``l8k generate`` does not need the flag.
   * - ``--ip-version <string>``
     - IP version for Spectrum-X address allocation: ``ipv4`` (default) or ``ipv6``. Requires ``--spectrum-x``.
   * - ``--topology-file <string>``
     - Path to a spcx-gen/reference-generator or NVIDIA AIR topology JSON, used to generate Spectrum-X ``CIDRPool`` resources. Requires ``--spectrum-x``. Persisted alongside the other Spectrum-X settings.
   * - ``--spectrum-x-config <string>``
     - Spectrum-X input: full doSPCX ConfigMap for RA2.4/RA3.1; full legacy ConfigMap or raw ``data.profile`` YAML for RA2.3. See :doc:`../profiles/spectrum-x`.
   * - ``--spectrum-x-configmap-name <string>``
     - Name for the generated profile ConfigMap. Requires ``--spectrum-x``. Needed only when ``--spectrum-x-config`` holds raw ``data.profile`` YAML; with a full ConfigMap manifest the name is taken from ``metadata.name``.
   * - ``--node-selector <string>``
     - Saved deployment selector; does not limit discovery scheduling. Default: ``feature.node.kubernetes.io/pci-15b3.present=true`` (Mellanox NICs).
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
     - Fabric type: ``ethernet`` or ``infiniband``. Auto-defaults from the cluster's unanimous ``linkType`` when not supplied.
   * - ``--deployment-type <string>``
     - Deployment type: ``sriov``, ``rdma_shared``, or ``host_device``. Auto-defaults to ``sriov`` when not supplied.
   * - ``--multirail``
     - Enable multirail deployment. Auto-defaults to ``true``. Opt out with ``--multirail=false`` (or set ``profile.multirail: false`` in YAML).
   * - ``--spectrum-x <RA-version>``
     - Enable Spectrum-X. Accepted values are ``RA2.1``, ``RA2.2``, ``RA2.3``, ``RA2.4``, and ``RA3.1``; see the :doc:`version matrix <../profiles/spectrum-x>`. Implies ethernet fabric, sriov deployment, and multirail.
   * - ``--multiplane-mode <string>``
     - Multiplane mode: ``none``, ``swplb``, or ``hwplb``. Required with ``--spectrum-x``; auto-defaulted from the east-west NIC and GPU platform when omitted --- ConnectX-7 NIC and BlueField-3 SuperNIC use ``none``, ConnectX-9 SuperNIC uses ``hwplb``, and ConnectX-8 SuperNIC uses ``none`` on H100 / H200 / B200 / GB200 and ``swplb`` on B300 / GB300 or any unrecognised platform. Select ``hwplb`` explicitly when required by the validated fabric topology. RTX with ConnectX-8 also defaults to ``none``. ``none`` requires ``--number-of-planes 1``.
   * - ``--number-of-planes <int>``
     - Number of planes: ``1``, ``2``, ``4``, or ``8`` (eight-plane generation requires RA2.4/RA3.1 VR HWPLB). Required with ``--spectrum-x``; auto-defaulted from the east-west NIC and GPU platform (ConnectX-7, BlueField-3 SuperNIC, and ConnectX-8 SuperNIC on single-plane platforms → ``1``; ConnectX-8 SuperNIC on B300 / GB300 → ``2``; ConnectX-9 SuperNIC → ``4``, or ``8`` for VR HWPLB with RA2.4/RA3.1). Pass ``4`` explicitly for a quad-plane B300 / GB300 topology.
   * - ``--topology-scheme <string>``
     - Topology scheme for Spectrum-X IP allocation: ``2-tier`` or ``3-tier``. **Required** with ``--spectrum-x`` --- Launch Kit does not default it. May instead be carried in the cluster configuration as ``profile.spectrumX.topologyType``, which ``l8k discover --topology-scheme`` persists; a later ``l8k generate`` then needs no flag.
   * - ``--ip-version <string>``
     - IP version for Spectrum-X address allocation: ``ipv4`` (default) or ``ipv6``.
   * - ``--topology-file <string>``
     - Path to a spcx-gen/reference-generator or NVIDIA AIR topology JSON. **Required** with ``--spectrum-x`` --- the Spectrum-X profiles always render ``CIDRPool`` resources and generation aborts without a topology file. May instead be carried in the cluster configuration as ``profile.spectrumX.topologyFile``.
   * - ``--spectrum-x-config <string>``
     - Required profile input for RA2.3/RA2.4/RA3.1. RA2.4/RA3.1 require a full doSPCX ConfigMap and set the NIC template version to the RA; RA2.3 accepts raw legacy YAML and uses the ConfigMap name as its version. See :doc:`../profiles/spectrum-x`.
   * - ``--spectrum-x-configmap-name <string>``
     - Name for the generated profile ConfigMap. Required only when ``--spectrum-x-config`` holds raw ``data.profile`` YAML; with a full ConfigMap manifest the name is taken from ``metadata.name``.
   * - ``--network-operator-release <string>``
     - Pin to a Network Operator release line. Supported: ``26.1``, ``26.4``, ``26.7``, ``26.10``. Auto-defaulted under ``--spectrum-x``: RA2.4/RA3.1 → 26.10, RA2.3 → 26.7, RA2.2 → 26.4, RA2.1 → 26.1. See :doc:`../overview`.
   * - ``--groups <a,b,...>``
     - Restrict output to the named source groups (comma-separated, matched case-sensitively against ``clusterConfig[].identifier``). Mutually exclusive with ``--gpu-type``. Empty match is a validation error. See :doc:`../heterogeneous-clusters`.
   * - ``--gpu-type <string>``
     - Restrict output to source groups whose ``gpuType`` matches (case-insensitive). Mutually exclusive with ``--groups``. See :doc:`../heterogeneous-clusters`.
   * - ``--node-selector <string>``
     - Node selector for the synthesized ``clusterConfig`` when ``--for`` is used (e.g., ``key=value,key2=value2``). Required with ``--for``.

Ownership and Routing
----------------------

- ``--skip-network-operator-helm`` disables Launch Kit Helm management; external operators remain prerequisites.
- ``--routing destination-based|source-based`` selects secondary-network routing.
- ``--ignore-arp`` controls the standard-profile ARP tuning policy.
- ``--overwrite-existing`` permits preflight convergence, including deleting reported stray CRs. It can affect omitted groups; see :doc:`../workflows/deploy`.

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
   * - ``--network-namespaces <strings>``
     - Comma-separated namespaces for secondary-network resources and example workloads.
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``).

================================================================================
l8k deploy
================================================================================

Loads the saved bundle, manages Helm when enabled, checks preflight drift, then applies custom resources in four phases: NicClusterPolicy first (await ready), per-group NicNodePolicy (await each), all remaining CRs in one batch (controllers reconcile concurrently), then verify every manifest reached a terminal state. Example workload manifests (``*example*``) are skipped here --- they're applied by ``l8k validate --connectivity`` as part of the data-plane phase. See :doc:`../workflows/deploy` for the full deployment-ordering description.

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
   * - ``--dry-run``
     - Preview what would be applied without changing the cluster.

================================================================================
l8k validate
================================================================================

Checks release and component versions, Helm values when managed, stray resources, certified-preset deviations, manifest readiness, and configured connectivity families. Writes ``<deployment-files>/k8s-launch-kit-validation-report.html`` by default. See :doc:`../workflows/validate` for coverage and exit-code semantics.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``).
   * - ``--user-config <string>``
     - Explicit source configuration override. When omitted, the bundle sidecar is preferred; see :doc:`config` for lookup order.
   * - ``--deployment-files <string>``
     - Directory containing the manifests to verify (default: ``./deployment``).
   * - ``--connectivity``
     - Run the data-plane ping matrix. Default ``true``. Pass ``--connectivity=false`` to limit validate to the static manifest + Helm-release-version checks.
   * - ``--connectivity-timeout <duration>``
     - Wall-clock budget for workload setup and connectivity. Default ``0`` derives the budget from the matrix plan.
   * - ``--validation-checks <strings>``
     - Select ``icmp``, ``rping``, and/or ``ib_write_bw``.
   * - ``--validation-mode <string>``
     - Coverage and cross-rail expectations: ``quick``, ``full``, or ``strict``.
   * - ``--junit-path <string>``
     - Optional JUnit XML report, independent of HTML output.
   * - ``--keep``
     - Leave the test DaemonSet running after ``--connectivity`` completes (useful for follow-up debugging).
   * - ``--wait <duration>``
     - Block validate up to this duration waiting for in-progress manifests to reach a terminal state. ``0`` (default) returns immediately on the first snapshot. Re-polls the cluster every 10 s.
   * - ``--report-path <string>``
     - Write the HTML report to this path. Empty (default) writes to ``<deployment-files>/k8s-launch-kit-validation-report.html``. Pass ``-`` to skip the report file entirely.

================================================================================
l8k clean
================================================================================

Removes Network Operator resources and, by default, its Helm release. This is a cluster mutation with no dry-run mode. Inspect the target kubeconfig and namespace first. ``--keep-helm-chart`` retains Helm; ``networkOperator.skipHelmChart`` also preserves externally managed Helm. The namespace and CRDs are preserved. OpenShift cleanup is unsupported. See ``l8k clean --help`` for the current removal scope and flags.

================================================================================
OpenShift Integration
================================================================================

Use ``--flavor ocp`` or ``flavor: ocp`` with separately installed certified Network Operator, SR-IOV Operator, Maintenance Operator, and NFD prerequisites. Multus and reference CNI plugins remain platform-owned. See :doc:`Getting Started with OpenShift <../../getting-started-with-openshift>` and the `Launch Kit OpenShift guide <https://github.com/NVIDIA/k8s-launch-kit/blob/v26.10.0-rc.7/docs/user/openshift.md>`_ for ownership and namespace configuration.

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
     - GitHub repository in ``owner/repository`` form.
   * - ``--branch <string>``
     - Branch or tag to fetch from (default: ``main``).
   * - ``--dir <string>``
     - Local destination directory for downloaded presets.

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
     - Deployment or validation gate failure.
   * - 5
     - Partial success (discovery completed but deployment failed).

================================================================================
See Also
================================================================================

- :doc:`Configuration Reference <config>` --- ``l8k-config.yaml`` schema
- :doc:`Automation and CI/CD <../automation>` --- JSON output and exit-code-driven retries
- :doc:`Overview <../overview>` --- the meaning behind the flags
