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

*********************************
Spectrum-X Kubernetes Quick Start
*********************************

.. note::

   These walkthroughs target **Spectrum-X RA 2.1** on **Network Operator 26.4.x**,
   where the Spectrum-X configuration workflow is **Tech Preview**. The fully
   generally available (GA) Spectrum-X RA 2.1 workflow is provided in
   **Network Operator 26.1.x**. The 26.4.x workflow shown here is DRA-based
   (``SpectrumXRailPoolConfig`` ``v1alpha2``); the GA 26.1.x workflow uses the
   SR-IOV Network Operator with ``OVSNetwork`` and ``SpectrumXRailPoolConfig``
   ``v1alpha1``. For the RA-to-release mapping and other RAs, see
   :doc:`NVIDIA Spectrum-X <spectrum-x>`. For supported platforms (operating
   systems, Kubernetes distributions, NIC hardware), see
   :doc:`Platform Support <../platform-support>`.

   On Network Operator 26.4.x, **Single-Plane** and **Software Multiplane**
   (``swplb``) Spectrum-X deployments (RA 2.1) are **Tech Preview** — intended
   for early evaluation, not production use. **Hardware Multiplane**
   (``hwplb``) is tech preview only and is not part of the validated Spectrum-X Reference
   Architecture. For background on the operators and CNIs each walkthrough
   relies on, see :doc:`Architecture and Components <components>`.

.. tip::

   The configuration in each walkthrough can be automated end-to-end with
   NVIDIA Kubernetes Launch Kit — see
   :doc:`Configuration Assistance with Kubernetes Launch Kit <../k8s-launch-kit/k8s-launch-kit>`.

Pick the walkthrough that matches your hardware and target topology. Each one
installs Network Operator via Helm, applies the Spectrum-X CRDs, and deploys a
test pod — adapted to the chosen multiplane mode and NIC family.

.. list-table::
   :header-rows: 1
   :widths: 22 12 20 22 24

   * - Walkthrough
     - Multiplane mode
     - NICs
     - GPU platforms
     - Use when
   * - :doc:`Single Plane <quick-start-single-plane>`
     - ``none``
     - BlueField-3 SuperNIC, ConnectX-7 NIC, ConnectX-8 SuperNIC
     - H100/H200/B200 (BlueField-3 SuperNIC), GB200 (ConnectX-7 NIC)
     - One PF per rail. Simplest setup. ConnectX-8 SuperNIC also supports single-plane configuration.
   * - :doc:`Software Multiplane <quick-start-swplb>`
     - ``swplb``
     - ConnectX-8 SuperNIC
     - B300, GB300
     - Software Plane Load Balancing across planes. Set ``numberOfPlanes: 2`` (Dual-Plane) or ``4`` (Quad-Plane, B300 only).
   * - :doc:`Hardware Multiplane <quick-start-hwplb>` *(tech preview)*
     - ``hwplb``
     - ConnectX-8 SuperNIC
     - B300, GB300
     - Same as ``swplb`` but Plane Load Balancing happens in the NIC hardware. **Tech preview; not RA-validated.**

.. toctree::
   :maxdepth: 1
   :titlesonly:
   :hidden:

   Single Plane <quick-start-single-plane.rst>
   Software Multiplane <quick-start-swplb.rst>
   Hardware Multiplane <quick-start-hwplb.rst>
