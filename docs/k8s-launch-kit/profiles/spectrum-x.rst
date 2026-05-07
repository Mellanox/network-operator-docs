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

************
Spectrum-X
************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Use Case
================================================================================

NVIDIA Spectrum-X multi-rail AI interconnect for Ethernet fabrics. Combines SR-IOV with multiplane load balancing to scale GPU-to-GPU bandwidth across switch tiers.

Two reference architectures are supported, selected by Network Operator release:

- **RA2.2** (current) --- requires ``--network-operator-release 26.4``. Uses ``SpectrumXRailPoolConfig`` (v1alpha2 CRD).
- **RA2.1** (previous) --- requires ``--network-operator-release 26.1``. Uses ``SriovNetworkPoolConfig`` + ``SriovNetworkNodePolicy`` + ``OVSNetwork`` with NV-IPAM glue.

For deeper Spectrum-X background, see :doc:`Spectrum-X Configuration <../../nic-conf-operator/spectrum-x-configuration>`.

================================================================================
Multiplane Modes
================================================================================

The ``--multiplane-mode`` flag selects how planes are mapped onto NICs. ``--spectrum-x`` takes the SPC-X RA version as its value (``RA2.1`` or ``RA2.2``); ``--multiplane-mode``, ``--number-of-planes``, and ``--network-operator-release`` are all required alongside it. ``--spectrum-x`` implies ethernet fabric, sriov deployment, and multirail.

HWPLB
------

Hardware Plane Load Balancing for larger-scale clusters with 2-tier or 3-tier switch topologies:

.. code-block:: bash

   l8k generate --spectrum-x RA2.2 \
       --network-operator-release 26.4 \
       --multiplane-mode hwplb --number-of-planes 4

SWPLB
------

Software Plane Load Balancing for smaller-scale Spectrum-X clusters. Generates separate resources per-rail per-plane:

.. code-block:: bash

   l8k generate --spectrum-x RA2.2 \
       --network-operator-release 26.4 \
       --multiplane-mode swplb --number-of-planes 2

Uniplane
---------

Unified plane mode with no plane separation. Use with ``--number-of-planes 1``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.2 \
       --network-operator-release 26.4 \
       --multiplane-mode uniplane --number-of-planes 1

None (Single Plane)
--------------------

No multiplane separation. Use with BlueField-3 SuperNIC or simple topologies. ``none`` requires ``--number-of-planes 1``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.2 \
       --network-operator-release 26.4 \
       --multiplane-mode none --number-of-planes 1

Side-by-side comparison of the four modes:

.. mermaid::

   flowchart TB
       subgraph HWPLB[HWPLB - hardware load balancing]
           H_NIC[NIC]
           H_NIC -->|HW LB| H_P1[Plane 1]
           H_NIC -->|HW LB| H_P2[Plane 2]
           H_NIC -->|HW LB| H_P3[Plane 3]
       end
       subgraph SWPLB[SWPLB - software load balancing]
           S_NIC[NIC] --> S_OVS[OVS]
           S_OVS -->|SW LB| S_P1[Plane 1]
           S_OVS -->|SW LB| S_P2[Plane 2]
           S_OVS -->|SW LB| S_P3[Plane 3]
       end
       subgraph UNI[Uniplane]
           U_NIC[NIC] --> U_P[Single plane]
       end
       subgraph NONE[None]
           N_NIC[NIC] --> N_NET[Standard network]
       end

================================================================================
NIC Type Constraints
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 30 15 55

   * - **NIC Type**
     - **Device ID**
     - **Supported Modes**
   * - ConnectX-8
     - ``1023``
     - ``swplb``, ``hwplb``, ``uniplane``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none`` only

================================================================================
Pinning to RA2.1
================================================================================

For Network Operator 26.1 deployments, select the Spectrum-X RA2.1 profile by passing ``RA2.1`` as the value of ``--spectrum-x``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.1 \
       --network-operator-release 26.1 \
       --multiplane-mode swplb --number-of-planes 2

If the release and Spectrum-X version are mismatched (for example, ``--spectrum-x RA2.1`` with ``--network-operator-release 26.4``), Launch Kit errors out with an explicit message.

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Spectrum-X Configuration <../../nic-conf-operator/spectrum-x-configuration>` --- background and CRD details
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``spectrumX`` config section
