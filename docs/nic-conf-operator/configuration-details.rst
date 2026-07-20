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

==========================================
Configuration Details
==========================================


Configuration details
^^^^^^^^^^^^^^^^^^^^^

- ``numVFs``: if provided, configure SR-IOV VFs via nvconfig.

  - This is a mandatory parameter.
  - E.g: if ``numVFs=2`` then ``SRIOV_EN=1`` and ``SRIOV_NUM_OF_VFS=2``.
  - If ``numVFs=0`` then ``SRIOV_EN=0`` and ``SRIOV_NUM_OF_VFS=0``.

- ``linkType``: if provided configure ``linkType`` for the NIC for all NIC ports.

  - This is a mandatory parameter.
  - E.g ``linkType = Infiniband`` then set ``LINK_TYPE_P1=IB`` and ``LINK_TYPE_P2=IB`` if second PCI function is present

- ``pciPerformanceOptimized``: performs PCI performance optimizations. If enabled then by default the following will happen:

  - Set PCI max read request size for each PF to ``4096`` (note: this is a runtime config and is not persistent)
  - Users can override the runtime value via ``maxReadRequest``
  - ``maxAccOutRead`` is deprecated and ignored; use ``rawNvConfig`` for explicit ``MAX_ACC_OUT_READ`` management if needed.

- ``roceOptimized``: performs RoCE related optimizations. If enabled performs the following by default:

  - Nvconfig set for both ports (can be applied from PF0)

    - Conditionally applied for second port if present

      - ``ROCE_CC_PRIO_MASK_P1=255``, ``ROCE_CC_PRIO_MASK_P2=255``
      - ``CNP_DSCP_P1=4``, ``CNP_DSCP_P2=4``
      - ``CNP_802P_PRIO_P1=6``, ``CNP_802P_PRIO_P2=6``

  - Configure pfc (Priority Flow Control) for priority 3, set trust to dscp on each PF, set ToS (Type of Service) to 0.

    - Non-persistent (need to be applied after each boot)
    - Users can override values via ``trust``, ``pfc`` and ``tos`` parameters

  - Can only be enabled with ``linkType=Ethernet``

- ``gpuDirectOptimized``: performs gpu direct optimizations. ATM only optimizations for Baremetal environment are supported. If enabled perform the following:

  - Set nvconfig ``ATS_ENABLED=0``
  - Can only be enabled when ``pciPerformanceOptimized`` is enabled
  - Both the numeric values and their string aliases, supported by NVConfig, are allowed (e.g. ``REAL_TIME_CLOCK_ENABLE=False``, ``REAL_TIME_CLOCK_ENABLE=0``).
  - For per port parameters (suffix ``_P1``, ``_P2``) parameters with ``_P2`` suffix are ignored if the device is single port.

- ``spectrumXOptimized``: enables Spectrum-X specific NIC optimizations. When enabled:

  - Requires ``linkType=Ethernet`` and ``numVfs=1``
  - Cannot be combined with ``roceOptimized`` (RoCE settings are included automatically)
  - Can be combined with ``rawNvConfig`` — raw params are merged as overrides on top of Spectrum-X calculated params
  - Only supported on ConnectX-8 (``nicType: 1023``), ConnectX-9 (``nicType: 1025``) and BlueField-3 SuperNIC (``nicType: a2dc``)
  - ``version``: Required. Must match the name of a Spectrum-X profile ConfigMap
  - ``overlay``: Optional, default ``none``. Set to ``l3`` for L3 EVPN overlay
  - ``multiplaneMode``: Optional, default ``none``. Options: ``none``, ``swplb``, ``hwplb``, ``uniplane``
  - ``numberOfPlanes``: Optional, default ``1``. Options: ``1``, ``2``, or ``4``

- If a configuration is not set in spec, its non-volatile configuration parameters (if any) should be set to device default.

Spectrum-X Configuration
^^^^^^^^^^^^^^^^^^^^^^^^

The NIC Configuration Operator supports Spectrum-X-specific NIC configuration through Spectrum-X profile ConfigMaps. A profile ConfigMap contains the Spectrum-X YAML profile consumed by the daemon at runtime.

To create a Spectrum-X profile ConfigMap:

1. Create one ConfigMap per profile.
2. Set the ConfigMap name to the value that will be used in ``template.spectrumXOptimized.version``.
3. Add the label ``network.nvidia.com/operator.nic-configuration.spectrum-x-profile``. The label value is ignored; only the label key must be present.
4. Put the complete Spectrum-X profile YAML under ``data.profile``.

The profile ConfigMap can be created in any namespace watched by the operator.

   **Warning:** If two labeled ConfigMaps in different namespaces share the same name, they define the same Spectrum-X version key and the latest-reconciled ConfigMap silently wins with no error. To avoid unpredictable behavior, use unique ConfigMap names across all watched namespaces.

`Example Spectrum-X profile ConfigMap <docs/examples/spectrum-x/example-spectrum-x-profile-configmap.yaml>`__:
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. code:: yaml

   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: example-spectrum-x-profile
     namespace: nvidia-network-operator
     labels:
       network.nvidia.com/operator.nic-configuration.spectrum-x-profile: ""
   data:
     profile: |
       useSoftwareCCAlgorithm: true
       docaCCVersion: "example-version"
       mlxConfig:
         none:
           "1023":
             postBreakout:
               EXAMPLE_NVCONFIG_PARAMETER: "example-value"
       runtimeConfig:
         roce:
           - name: Example RoCE runtime parameter
             value: "example-value"
             valueType: string
             dmsPath: "<dms-path-for-runtime-parameter>"
         adaptiveRouting:
           - name: Example mlxreg runtime parameter
             value: "0x00000001"
             mlxreg:
               register: ROCE_ACCL
               field: "<mlxreg-field-to-check>"
               setFields:
                 - name: "<mlxreg-field-to-set>"
                   value: "0x1"
                 - name: "<mlxreg-field-select-to-set>"
                   value: "0x1"

Reference the profile from a ``NicConfigurationTemplate`` by using the ConfigMap name as the Spectrum-X version:

.. code:: yaml

   spectrumXOptimized:
     enabled: true
     version: "example-spectrum-x-profile"
     overlay: "none"
     multiplaneMode: "none"
     numberOfPlanes: 1

Supported NIC types for Spectrum-X: \* ConnectX-8 (device ID ``1023``) – supports all multiplane modes \* ConnectX-9 (device ID ``1025``) – supports all multiplane modes (same configuration as ConnectX-8) \* BlueField-3 SuperNIC (device ID ``a2dc``) – supports all multiplane modes except ``hwplb``

Spectrum-X profiles can configure NICs with multiple data planes. Available modes:

+--------------+--------------------------------+--------------------------------------+------------+
| Mode         | Description                    | Supported NICs                       | Planes     |
+==============+================================+======================================+============+
| ``none``     | Single plane (default)         | ConnectX-8, ConnectX-9, BF3 SuperNIC | 1          |
+--------------+--------------------------------+--------------------------------------+------------+
| ``swplb``    | Software Packet Load Balancing | ConnectX-8, ConnectX-9, BF3 SuperNIC | 2, 4       |
+--------------+--------------------------------+--------------------------------------+------------+
| ``hwplb``    | Hardware Packet Load Balancing | ConnectX-8, ConnectX-9 only          | 2, 4       |
+--------------+--------------------------------+--------------------------------------+------------+
| ``uniplane`` | Uniplane mode                  | ConnectX-8, ConnectX-9, BF3 SuperNIC | 2          |
+--------------+--------------------------------+--------------------------------------+------------+

`Example Spectrum-X NicConfigurationTemplate with multiplane <docs/examples/spectrum-x/example-nicconfigurationtemplate-spectrum-x-multiplane.yaml>`__:
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. code:: yaml

   apiVersion: configuration.net.nvidia.com/v1alpha1
   kind: NicConfigurationTemplate
   metadata:
     name: spectrum-x-multiplane-configuration
     namespace: nvidia-network-operator
   spec:
     nodeSelector:
         feature.node.kubernetes.io/network-sriov.capable: "true"
     nicSelector:
         nicType: "1023" # ConnectX-8. Use "1025" for ConnectX-9, or "a2dc" for BlueField-3 SuperNIC (hwplb not supported on BF3)
         # partNumbers:
         #   - "MCX713106AEHEA_QP1"
     template:
         numVfs: 1
         linkType: Ethernet
         spectrumXOptimized:
             enabled: true
             version: "RA2.1"
             overlay: "none"
             multiplaneMode: "hwplb" # Hardware Packet Load Balancing, ConnectX-8 only
             numberOfPlanes: 4
