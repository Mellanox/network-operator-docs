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
Cluster Topology Presets
************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

.. note::

   **Use this when:** you want to generate manifests without running discovery against a live cluster --- for offline manifest generation, CI pipelines, or known machine types where the topology is fixed.

A **preset** is a pre-recorded hardware topology for a known machine type (e.g., ``ThinkSystem-SR680a-V3``, ``PowerEdge-XE9680``). Each preset records expected PCI addresses, traffic class, NUMA affinity, and rail assignments for a specific machine + GPU pairing.

Launch Kit uses presets in two ways:

- **Discovery overlay** --- when discovery detects a matching machine type, the preset's topology is overlaid for consistency.
- **Offline generation** --- ``l8k generate --for <preset>`` skips discovery entirely.

================================================================================
Listing Presets
================================================================================

.. code-block:: bash

   l8k preset list

Lists every preset known to the local installation.

================================================================================
Updating Presets
================================================================================

Download the latest presets from a Git repository:

.. code-block:: bash

   l8k preset update

Optional flags:

- ``--repo <url>`` --- override the repository URL.
- ``--branch <name>`` --- fetch from a specific branch or tag.
- ``--dir <path>`` --- subdirectory within the repo containing presets.

Presets are optional. Discovery and ``--for`` generation work without them; presets simply add machine-specific topology defaults.

================================================================================
Offline Manifest Generation
================================================================================

Generate manifests for a known preset without cluster access:

.. code-block:: bash

   l8k generate --for ThinkSystem-SR680a-V3 \
       --node-selector "nvidia.com/gpu.product=NVIDIA-H200" \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

The generated manifests will target nodes matching the supplied selector when applied. This is the recommended path for CI pipelines that produce deployment artefacts ahead of cluster availability.

================================================================================
Discovery Overlay
================================================================================

When ``l8k discover`` detects a machine type that matches a known preset, the preset's PCI topology, NUMA affinity, and rail assignments are overlaid on the discovery output. This ensures consistent rail numbering and PCI ordering across discovery runs.

If no preset matches, discovery proceeds with the values it derives directly from hardware --- see :doc:`workflows/discover`.

================================================================================
Validation and Deviations
================================================================================

When a matched preset's PFs don't exactly match the discovered hardware, Launch Kit **records the deviations** instead of refusing to apply the preset. There are no fatal validation errors --- every discrepancy is soft:

- **PF count mismatch** --- the preset and the cluster expose different numbers of PFs.
- **PCI address drift** --- a PCI address present in the preset is missing on the cluster, or vice versa.
- **Device-ID drift** --- the device ID at a matching PCI address differs from the preset.

Whenever any of these is detected, the matched preset is still applied on a best-effort basis (so rail/NUMA/GPU-affinity fields populate for whichever PFs do line up), and the discrepancies are written to ``ClusterConfig.presetDeviation`` in ``cluster-config.yaml``. Whenever a config with non-empty ``presetDeviation`` is loaded by any l8k subcommand, a warning is re-emitted listing each deviation. The deployment proceeds, but the operator is reminded each run that the cluster differs from the matched preset.

Part numbers and PSIDs are not strict criteria (firmware variants are expected) so they're not checked.

Example ``presetDeviation`` block in ``cluster-config.yaml``:

.. code-block:: yaml

   clusterConfig:
   - identifier: "group-0"
     machineType: "PowerEdge-XE9680"
     gpuType: "NVIDIA-H200"
     presetDeviation:
     - field: pfCount
       expected: "10"
       got: "9"
       detail: "PF count differs from preset"
     - field: pciAddress
       got: "0000:bd:00.0"
       detail: "discovered PCI address not present in preset"
     - field: deviceID
       expected: "a2dc@0000:5e:00.0"
       got: "1023@0000:5e:00.0"
       detail: "device ID at PCI address differs from preset"

================================================================================
See Also
================================================================================

- :doc:`Generate Workflow <workflows/generate>` --- ``--for`` flag in context
- :doc:`Discover Workflow <workflows/discover>` --- discovery without presets
- :doc:`CLI Reference <reference/cli>` --- ``l8k preset list`` / ``l8k preset update``
