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

Two reference architectures are supported. The RA version is the value of ``--spectrum-x``, and each one pins to a Network Operator release line:

.. list-table::
   :header-rows: 1
   :widths: 14 22 30 34

   * - **RA**
     - **Release**
     - **Profile directory**
     - **Notes**
   * - ``RA2.3``
     - ``26.7``
     - ``spectrum-x``
     - Current. Adds the Spectrum-X profile ConfigMap (see below) and requires ``--spectrum-x-config``.
   * - ``RA2.1``
     - ``26.1``
     - ``spectrum-x-ra2.1``
     - Uses ``SriovNetworkPoolConfig`` + ``SriovNetworkNodePolicy`` + ``OVSNetwork`` with NV-IPAM glue.

If the release and RA version are mismatched (for example, ``--spectrum-x RA2.1`` with ``--network-operator-release 26.7``), Launch Kit errors out with an explicit message. Omitting ``--network-operator-release`` picks the matching line automatically.

For deeper Spectrum-X background, see :doc:`Spectrum-X Configuration <../../spectrum-x/spectrum-x-configuration>`.

================================================================================
The RA2.3 Profile ConfigMap
================================================================================

RA2.3 moves the Spectrum-X tuning knobs out of the CRD and into a ConfigMap that the NIC Configuration Operator reads. Pass its contents with ``--spectrum-x-config``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.3 \
       --spectrum-x-config ./spectrum-x-profile.yaml \
       --topology-scheme 2-tier \
       --multiplane-mode swplb --number-of-planes 2

The file may be either a full ConfigMap manifest or just the YAML that belongs under its ``data.profile`` key. With raw ``data.profile`` YAML, also pass ``--spectrum-x-configmap-name`` to name the generated ConfigMap; with a full manifest, the name comes from ``metadata.name``.

Launch Kit renders the ConfigMap into the Network Operator namespace with the label the NIC Configuration Operator watches, and sets ``spectrumXOptimized.version`` on the generated ``NicConfigurationTemplate`` to the ConfigMap's name.

================================================================================
Multiplane Modes
================================================================================

The ``--multiplane-mode`` flag selects how planes are mapped onto NICs. ``--spectrum-x`` implies ethernet fabric, sriov deployment, and multirail.

``--multiplane-mode`` and ``--number-of-planes`` are defaulted from the discovered GPU platform and east-west NIC when omitted --- H100 / H200 / B200 / GB200 get ``none`` and 1 plane, B300 / GB300 get ``swplb`` and 2 planes. Note that these are Launch Kit's generator defaults, not the Reference Architecture's recommendation: Spectrum-X RA 2.3 recommends ``hwplb`` on multiplane platforms, so pass ``--multiplane-mode hwplb`` to follow the RA. Launch Kit skips the default and warns if the cluster's node groups would need different values.

HWPLB
------

Hardware Plane Load Balancing for larger-scale clusters with 2-tier or 3-tier switch topologies. Supported on ConnectX-8 SuperNIC:

.. code-block:: bash

   l8k generate --spectrum-x RA2.3 \
       --spectrum-x-config ./spectrum-x-profile.yaml \
       --topology-scheme 2-tier \
       --multiplane-mode hwplb --number-of-planes 4

SWPLB
------

Software Plane Load Balancing for smaller-scale Spectrum-X clusters. Generates separate resources per-rail per-plane:

.. code-block:: bash

   l8k generate --spectrum-x RA2.3 \
       --spectrum-x-config ./spectrum-x-profile.yaml \
       --topology-scheme 2-tier \
       --multiplane-mode swplb --number-of-planes 2

None (Single Plane)
--------------------

No multiplane separation. Use with ConnectX-7 NIC, BlueField-3 SuperNIC, or simple topologies. ``none`` requires ``--number-of-planes 1``:

.. code-block:: bash

   l8k generate --spectrum-x RA2.3 \
       --spectrum-x-config ./spectrum-x-profile.yaml \
       --topology-scheme 2-tier \
       --multiplane-mode none --number-of-planes 1

Side-by-side comparison of the three modes:

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
       subgraph NONE[None - single plane]
           N_NIC[NIC] --> N_NET[Standard network]
       end

================================================================================
NIC Types, Defaults, and Accepted Modes
================================================================================

.. list-table::
   :header-rows: 1
   :widths: 26 12 28 34

   * - **NIC Type**
     - **Device ID**
     - **Hardware default**
     - **Modes accepted**
   * - ConnectX-7 NIC
     - ``1021``
     - ``none``, 1 plane
     - ``none``
   * - BlueField-3 SuperNIC
     - ``a2dc``
     - ``none``, 1 plane
     - ``none``, ``swplb``
   * - ConnectX-8 SuperNIC
     - ``1023``
     - platform-dependent --- see above
     - ``none``, ``swplb``, ``hwplb``
   * - ConnectX-9 SuperNIC *(tech preview)*
     - ``1025``
     - ``hwplb``, 4 planes
     - ``none``, ``swplb``, ``hwplb``

**Hardware default** is the mode and plane count Launch Kit picks when
``--multiplane-mode`` and ``--number-of-planes`` are omitted.

**Modes accepted** is what the generated manifests will pass. Launch Kit itself
does not restrict modes per NIC --- ``--multiplane-mode`` takes ``none``,
``swplb``, or ``hwplb`` for any NIC --- but the ``NicConfigurationTemplate`` API
rejects ``hwplb`` on anything other than ConnectX-8 SuperNIC or ConnectX-9
SuperNIC. Passing a mode outside this column generates manifests the cluster
will refuse.

.. note::

   **ConnectX-9 SuperNIC support for Spectrum-X is Tech Preview in Network
   Operator 26.7.0.** Launch Kit accepts ConnectX-9 SuperNIC and defaults it to
   ``hwplb`` with 4 planes --- the one NIC for which ``hwplb`` is the hardware
   default --- but the resulting configuration is not validated against any
   Spectrum-X Reference Architecture. Use it for evaluation only.

   ConnectX-9 SuperNIC additionally requires a Spectrum-X profile that carries
   ``mlxConfig`` tuning for device ID ``1025``. A profile that omits it applies
   **no** Spectrum-X parameters to those NICs and reports no error. Contact
   NVIDIA Support or your NVIDIA CPM for a profile that covers ConnectX-9
   SuperNIC.

   ConnectX-9 SuperNIC remains fully supported by Network Operator for general
   RoCE and InfiniBand workloads --- see :doc:`Platform Support
   <../../platform-support>`.

================================================================================
Pinning to RA2.1
================================================================================

To target Network Operator 26.1, pass ``RA2.1`` to ``--spectrum-x``. ``--spectrum-x-config`` does not apply --- RA2.1 carries its Spectrum-X settings in the CRDs themselves.

.. code-block:: bash

   l8k generate --spectrum-x RA2.1 \
       --topology-scheme 2-tier \
       --multiplane-mode swplb --number-of-planes 2

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Spectrum-X Configuration <../../spectrum-x/spectrum-x-configuration>` --- background and CRD details
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``spectrumX`` config section
