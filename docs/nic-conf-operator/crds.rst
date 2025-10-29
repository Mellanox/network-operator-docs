Network Operator API reference v1alpha1
=======================================

Packages:

- :ref:`configuration.net.nvidia.com/v1alpha1 <configuration.net.nvidia.com/v1alpha1>`

.. _configuration.net.nvidia.com/v1alpha1:

configuration.net.nvidia.com/v1alpha1
-------------------------------------

Package v1alpha1 contains API Schema definitions for the configuration.net v1alpha1 API group

Resource Types:

.. _ConfigurationTemplateSpec:

ConfigurationTemplateSpec
~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicConfigurationTemplateSpec <NicConfigurationTemplateSpec>`, :ref:`NicDeviceConfigurationSpec <NicDeviceConfigurationSpec>`)

ConfigurationTemplateSpec is a set of configurations for the NICs

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``numVfs``                                                                                        | Number of VFs to be configured                                                                    |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``linkType``                                                                                      | LinkType to be configured, Ethernet|Infiniband                                                    |
      | :ref:`LinkTypeEnum <LinkTypeEnum>`                                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pciPerformanceOptimized``                                                                       | PCI performance optimization settings                                                             |
      | :ref:`PciPerformanceOptimizedSpec <PciPerformanceOptimizedSpec>`                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``roceOptimized``                                                                                 | RoCE optimization settings                                                                        |
      | :ref:`RoceOptimizedSpec <RoceOptimizedSpec>`                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``gpuDirectOptimized``                                                                            | GPU Direct optimization settings                                                                  |
      | :ref:`GpuDirectOptimizedSpec <GpuDirectOptimizedSpec>`                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spectrumXOptimized``                                                                            | Spectrum-X optimization settings. Works only with linkType==Ethernet && numVfs==0. Other          |
      | :ref:`SpectrumXOptimizedSpec <SpectrumXOptimizedSpec>`                                            | optimizations must be skipped or disabled. RawNvConfig must be empty.                             |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``rawNvConfig``                                                                                   | List of arbitrary nv config parameters                                                            |
      | :ref:`[]NvConfigParam <NvConfigParam>`                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _FirmwareTemplateSpec:

FirmwareTemplateSpec
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicDeviceSpec <NicDeviceSpec>`, :ref:`NicFirmwareTemplateSpec <NicFirmwareTemplateSpec>`)

FirmwareTemplateSpec specifies a FW update policy for a given FW source ref

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nicFirmwareSourceRef``                                                                          | NicFirmwareSourceRef refers to existing NicFirmwareSource CR on where to get the FW from          |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``updatePolicy``                                                                                  | UpdatePolicy indicates whether the operator needs to validate installed FW or upgrade it          |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _GpuDirectOptimizedSpec:

GpuDirectOptimizedSpec
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

GpuDirectOptimizedSpec specifies GPU Direct optimization settings

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enabled``                                                                                       | Optimize GPU Direct                                                                               |
      | bool                                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``env``                                                                                           | GPU direct environment, e.g. Baremetal                                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _LinkTypeEnum:

LinkTypeEnum (``string`` alias)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

LinkTypeEnum described the link type (Ethernet / Infiniband)

.. _NicConfigurationTemplate:

NicConfigurationTemplate
~~~~~~~~~~~~~~~~~~~~~~~~

NicConfigurationTemplate is the Schema for the nicconfigurationtemplates API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                                           | Description                                                                                       |
      +=================================================================================================================+===================================================================================================+
      | ``metadata``                                                                                                    | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                                     |                                                                                                   |
      | meta/v1.ObjectMeta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                                        | Defines the desired state of NICs                                                                 |
      | :ref:`NicConfigurationTemplateSpec <NicConfigurationTemplateSpec>`                                              |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                                      | Defines the observed state of NicConfigurationTemplate                                            |
      | :ref:`NicTemplateStatus <NicTemplateStatus>`                                                                    |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicConfigurationTemplateSpec:

NicConfigurationTemplateSpec
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicConfigurationTemplate <NicConfigurationTemplate>`)

NicConfigurationTemplateSpec defines the desired state of NicConfigurationTemplate

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nodeSelector``                                                                                  | NodeSelector contains labels required on the node. When empty, the template will be applied to    |
      | map[string]string                                                                                 | matching devices on all nodes.                                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nicSelector``                                                                                   | NIC selector configuration                                                                        |
      | :ref:`NicSelectorSpec <NicSelectorSpec>`                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``resetToDefault``                                                                                | *(Optional)*                                                                                      |
      | bool                                                                                              | ResetToDefault specifies whether node agent needs to perform a reset flow The following           |
      |                                                                                                   | operations will be performed: \* Nvconfig reset of all non-volatile configurations - Mstconfig -d |
      |                                                                                                   | reset for each PF - Mstconfig -d set ADVANCED_PCI_SETTINGS=1 \* Node reboot - Applies new NIC NV  |
      |                                                                                                   | config - Will undo any runtime configuration previously performed for the device/driver           |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``template``                                                                                      | Configuration template to be applied to matching devices                                          |
      | :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicDevice:

NicDevice
~~~~~~~~~

NicDevice is the Schema for the nicdevices API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                                           | Description                                                                                       |
      +=================================================================================================================+===================================================================================================+
      | ``metadata``                                                                                                    | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                                     |                                                                                                   |
      | meta/v1.ObjectMeta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                                        |                                                                                                   |
      | :ref:`NicDeviceSpec <NicDeviceSpec>`                                                                            |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                                      |                                                                                                   |
      | :ref:`NicDeviceStatus <NicDeviceStatus>`                                                                        |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicDeviceConfigurationSpec:

NicDeviceConfigurationSpec
~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicDeviceSpec <NicDeviceSpec>`)

NicDeviceConfigurationSpec contains desired configuration of the NIC

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``resetToDefault``                                                                                | ResetToDefault specifies whether node agent needs to perform a reset flow. The following          |
      | bool                                                                                              | operations will be performed: \* Nvconfig reset of all non-volatile configurations - Mstconfig -d |
      |                                                                                                   | reset for each PF - Mstconfig -d set ADVANCED_PCI_SETTINGS=1 \* Node reboot - Applies new NIC NV  |
      |                                                                                                   | config - Will undo any runtime configuration previously performed for the device/driver           |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``template``                                                                                      | Configuration template applied from the NicConfigurationTemplate CR                               |
      | :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicDevicePortSpec:

NicDevicePortSpec
~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicDeviceStatus <NicDeviceStatus>`)

NicDevicePortSpec describes the ports of the NIC

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``pci``                                                                                           | PCI is a PCI address of the port, e.g. 0000:3b:00.0                                               |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``networkInterface``                                                                              | NetworkInterface is the name of the network interface for this port, e.g. eth1                    |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``rdmaInterface``                                                                                 | RdmaInterface is the name of the rdma interface for this port, e.g. mlx5_1                        |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicDeviceSpec:

NicDeviceSpec
~~~~~~~~~~~~~

(*Appears on:* :ref:`NicDevice <NicDevice>`)

NicDeviceSpec defines the desired state of NicDevice

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``configuration``                                                                                 | Configuration specifies the configuration requested by NicConfigurationTemplate                   |
      | :ref:`NicDeviceConfigurationSpec <NicDeviceConfigurationSpec>`                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``firmware``                                                                                      | Firmware specifies the fw upgrade policy requested by NicFirmwareTemplate                         |
      | :ref:`FirmwareTemplateSpec <FirmwareTemplateSpec>`                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicDeviceStatus:

NicDeviceStatus
~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicDevice <NicDevice>`)

NicDeviceStatus defines the observed state of NicDevice

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                                         | Description                                                                                       |
      +===============================================================================================================+===================================================================================================+
      | ``node``                                                                                                      | Node where the device is located                                                                  |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``type``                                                                                                      | Type of device, e.g. ConnectX7                                                                    |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``serialNumber``                                                                                              | Serial number of the device, e.g. MT2116X09299                                                    |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``partNumber``                                                                                                | Part number of the device, e.g. MCX713106AEHEA_QP1                                                |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``psid``                                                                                                      | Product Serial ID of the device, e.g. MT_0000000221                                               |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``firmwareVersion``                                                                                           | Firmware version currently installed on the device, e.g. 22.31.1014                               |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``dpu``                                                                                                       | DPU indicates if the device is a BlueField in DPU mode                                            |
      | bool                                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``modelName``                                                                                                 | ModelName is the model name of the device, e.g. ConnectX-6 or BlueField-3                         |
      | string                                                                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``superNIC``                                                                                                  | SuperNIC indicates if the device is a SuperNIC                                                    |
      | bool                                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ports``                                                                                                     | List of ports for the device                                                                      |
      | :ref:`[]NicDevicePortSpec <NicDevicePortSpec>`                                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``conditions``                                                                                                | List of conditions observed for the device                                                        |
      | `[]Kubernetes                                                                                                 |                                                                                                   |
      | meta/v1.Condition <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#condition-v1-meta>`__ |                                                                                                   |
      +---------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicFirmwareSource:

NicFirmwareSource
~~~~~~~~~~~~~~~~~

NicFirmwareSource is the Schema for the nicfirmwaresources API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                                           | Description                                                                                       |
      +=================================================================================================================+===================================================================================================+
      | ``metadata``                                                                                                    | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                                     |                                                                                                   |
      | meta/v1.ObjectMeta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                                        |                                                                                                   |
      | :ref:`NicFirmwareSourceSpec <NicFirmwareSourceSpec>`                                                            |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                                      |                                                                                                   |
      | :ref:`NicFirmwareSourceStatus <NicFirmwareSourceStatus>`                                                        |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicFirmwareSourceSpec:

NicFirmwareSourceSpec
~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicFirmwareSource <NicFirmwareSource>`)

NicFirmwareSourceSpec represents a list of url sources for FW

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``binUrlSources``                                                                                 | *(Optional)*                                                                                      |
      | []string                                                                                          | BinUrlSources represents a list of url sources for ConnectX Firmware                              |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``bfbUrlSource``                                                                                  | *(Optional)*                                                                                      |
      | string                                                                                            | BFBUrlSource represents a url source for BlueField Bundle                                         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``docaSpcXCCUrlSource``                                                                           | *(Optional)*                                                                                      |
      | string                                                                                            | DocaSpcXCCUrlSource represents a url source for DOCA SPC-X CC .deb package for ubuntu 22.04 Will  |
      |                                                                                                   | be removed in the future, once Doca SPC-X CC algorithm will be publicly available                 |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicFirmwareSourceStatus:

NicFirmwareSourceStatus
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicFirmwareSource <NicFirmwareSource>`)

NicFirmwareSourceStatus represents the status of the FW from given sources, e.g. version available for PSIDs

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | State represents the firmware processing state                                                    |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Reason shows an error message if occurred                                                         |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``binaryVersions``                                                                                | Versions is a map of available FW binaries versions to PSIDs a PSID should have only a single FW  |
      | map[string][]string                                                                               | version available for it                                                                          |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``bfbVersions``                                                                                   | BFBVersions represents the FW versions available in the provided BFB bundle                       |
      | map[string]string                                                                                 |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``docaSpcXCCVersion``                                                                             | DocaSpcXCCVersion represents the FW versions available in the provided DOCA SPC-X CC .deb package |
      | string                                                                                            | for ubuntu 22.04                                                                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicFirmwareTemplate:

NicFirmwareTemplate
~~~~~~~~~~~~~~~~~~~

NicFirmwareTemplate is the Schema for the nicfirmwaretemplates API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                                           | Description                                                                                       |
      +=================================================================================================================+===================================================================================================+
      | ``metadata``                                                                                                    | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                                     |                                                                                                   |
      | meta/v1.ObjectMeta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                                        |                                                                                                   |
      | :ref:`NicFirmwareTemplateSpec <NicFirmwareTemplateSpec>`                                                        |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                                      |                                                                                                   |
      | :ref:`NicTemplateStatus <NicTemplateStatus>`                                                                    |                                                                                                   |
      +-----------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicFirmwareTemplateSpec:

NicFirmwareTemplateSpec
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicFirmwareTemplate <NicFirmwareTemplate>`)

NicFirmwareTemplateSpec defines the FW templates and node/nic selectors for it

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nodeSelector``                                                                                  | NodeSelector contains labels required on the node. When empty, the template will be applied to    |
      | map[string]string                                                                                 | matching devices on all nodes.                                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nicSelector``                                                                                   | NIC selector configuration                                                                        |
      | :ref:`NicSelectorSpec <NicSelectorSpec>`                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``template``                                                                                      | Firmware update template                                                                          |
      | :ref:`FirmwareTemplateSpec <FirmwareTemplateSpec>`                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicSelectorSpec:

NicSelectorSpec
~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicConfigurationTemplateSpec <NicConfigurationTemplateSpec>`, :ref:`NicFirmwareTemplateSpec <NicFirmwareTemplateSpec>`)

NicSelectorSpec is a desired configuration for NICs

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nicType``                                                                                       | Type of the NIC to be selected, e.g. 101d,1015,a2d6 etc.                                          |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pciAddresses``                                                                                  | Array of PCI addresses to be selected, e.g. “0000:03:00.0”                                        |
      | []string                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``serialNumbers``                                                                                 | Serial numbers of the NICs to be selected, e.g. MT2116X09299                                      |
      | []string                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicTemplateStatus:

NicTemplateStatus
~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicConfigurationTemplate <NicConfigurationTemplate>`, :ref:`NicFirmwareTemplate <NicFirmwareTemplate>`)

NicTemplateStatus defines the observed state of NicConfigurationTemplate and NicFirmwareTemplate

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nicDevices``                                                                                    | NicDevice CRs matching this configuration / firmware template                                     |
      | []string                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NvConfigParam:

NvConfigParam
~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the arbitrary nvconfig parameter                                                          |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``value``                                                                                         | Value of the arbitrary nvconfig parameter                                                         |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _PciPerformanceOptimizedSpec:

PciPerformanceOptimizedSpec
~~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

PciPerformanceOptimizedSpec specifies PCI performance optimization settings

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enabled``                                                                                       | Specifies whether to enable PCI performance optimization                                          |
      | bool                                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``maxAccOutRead``                                                                                 | Specifies the PCIe Max Accumulative Outstanding read bytes                                        |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``maxReadRequest``                                                                                | Specifies the size of a single PCI read request in bytes                                          |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _QosSpec:

QosSpec
~~~~~~~

(*Appears on:* :ref:`RoceOptimizedSpec <RoceOptimizedSpec>`)

QosSpec specifies Quality of Service settings

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``trust``                                                                                         | Trust mode for QoS settings, e.g. trust-dscp                                                      |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pfc``                                                                                           | Priority-based Flow Control configuration, e.g. “0,0,0,1,0,0,0,0”                                 |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``tos``                                                                                           | 8-bit value for type of service                                                                   |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _RoceOptimizedSpec:

RoceOptimizedSpec
~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

RoceOptimizedSpec specifies RoCE optimization settings

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enabled``                                                                                       | Optimize RoCE                                                                                     |
      | bool                                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``qos``                                                                                           | Quality of Service settings                                                                       |
      | :ref:`QosSpec <QosSpec>`                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _SpectrumXOptimizedSpec:

SpectrumXOptimizedSpec
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ConfigurationTemplateSpec <ConfigurationTemplateSpec>`)

SpectrumXOptimizedSpec enables Spectrum-X specific optimizations

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enabled``                                                                                       | Optimize Spectrum X                                                                               |
      | bool                                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``version``                                                                                       | Version of the Spectrum-X architecture to optimize for                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``overlay``                                                                                       | *(Optional)*                                                                                      |
      | string                                                                                            | Overlay mode to be configured Can be “l3” or “none”                                               |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
