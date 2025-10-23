.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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

**************************************************
[TECH PREVIEW] NVIDIA Spectrum-X NIC Configuration
**************************************************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none


`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ offers NVIDIA Spectrum-X-specific NIC configuration for different versions of the Reference Architecture.

.. note:: Currently, only ConnectX-8 (device ID 1023) and BlueField-3 SuperNIC (device ID a2dc) devices are supported for this configuration.

.. warning:: Tech Preview feature.

====================================================
Install and configure the NIC Configuration Operator
====================================================

To install the operator and for more information about the CRDs follow the `NIC FW Configuration <nic-fw-configuration.rst>`_ and `Configuration Details <configuration-details.rst>`_ doc articles.

=============================================
Provision the DOCA SPC-X CC algorithm package
=============================================

To enable the DOCA SPC-X CC algorithm on NIC devices, the DOCA SPC-X CC .deb package for ubuntu 22.04 is required. This configuration step will be removed in the future, once the DOCA SPC-X CC algorithm will be publicly available.
To access the package, contact your NVIDIA CPM.
The package should be made available in the cluster and then its URL should be provided in the packageUrlSource field of the SpectrumXOperator CR.

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaresource-spectrum-x-cc-only.yaml
    :language: yaml
    :lines: 18-

If firmware on the devices also needs to be updated, extend the NicFirmwareSource CR with fields for ConnectX and BlueField firmware. Please, use the correct firmware for your devices.

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaresource-spectrum-x-full.yaml
    :language: yaml
    :lines: 18-

Configure and apply the NicFirmwareTemplate CR:

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicfirmwaretemplate-spectrum-x.yaml
    :language: yaml
    :lines: 18-

======================================
Enable SPC-X optimizations for devices
======================================

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/spectrum-x/example-nicconfigurationtemplate-spectrum-x.yaml
    :language: yaml
    :lines: 18-

---------------------
Configuration details
---------------------

Following configuration parameters are applied with spectrumXOptimized.enabled == true and spectrumXOptimized.version == "RA2.0":

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/bindata/spectrum-x/RA2.0.yaml
    :language: yaml
    :lines: 17-