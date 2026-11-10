---
title: Network Operator API reference v1alpha1
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

Packages:

- [configuration.net.nvidia.com/v1alpha1](#configurationnetnvidiacomv1alpha1)

## configuration.net.nvidia.com/v1alpha1

Package v1alpha1 contains API Schema definitions for the configuration.net v1alpha1 API group

Resource Types:

### ConfigurationTemplateSpec

(*Appears on:* [NicConfigurationTemplateSpec](#nicconfigurationtemplatespec), [NicDeviceConfigurationSpec](#nicdeviceconfigurationspec))

ConfigurationTemplateSpec is a set of configurations for the NICs

| Field | Description |
| --- | --- |
| `numVfs`<br /> int | Number of VFs to be configured |
| `linkType`<br /> [LinkTypeEnum](#linktypeenum-string-alias) | *(Optional)* <br />LinkType to be configured, Ethernet\|Infiniband. Required unless networkBay is configured; for Network Bay the link type is governed by the system configuration and must not be set. |
| `pciPerformanceOptimized`<br /> [PciPerformanceOptimizedSpec](#pciperformanceoptimizedspec) | PCI performance optimization settings |
| `roceOptimized`<br /> [RoceOptimizedSpec](#roceoptimizedspec) | RoCE optimization settings |
| `gpuDirectOptimized`<br /> [GpuDirectOptimizedSpec](#gpudirectoptimizedspec) | GPU Direct optimization settings |
| `runtimePerformanceOptimized`<br /> [RuntimePerformanceOptimizedSpec](#runtimeperformanceoptimizedspec) | Runtime NIC performance tuning (ring buffers, channels, LRO) applied via ethtool |
| `spectrumXOptimized`<br /> [SpectrumXOptimizedSpec](#spectrumxoptimizedspec) | Spectrum-X optimization settings. Works only with linkType==Ethernet && numVfs==1. Temporarily cannot be combined with rawNvConfig or networkBay. |
| `networkBay`<br /> [NetworkBaySpec](#networkbayspec) | *(Optional)* <br />NetworkBay configures a ConnectX-9 Network Bay card from a per-ASIC mlxconfig system profile. Allowed only for ConnectX-9 (nicType 1025). |
| `rawNvConfig`<br /> [\[\]NvConfigParam](#nvconfigparam) | List of arbitrary nv config parameters |
| `force`<br /> bool | *(Optional)* <br />Force passes `--force` to mlxconfig set commands, letting mlxconfig accept a batch it would otherwise refuse due to implicit parameter dependencies. |

### ECNSpec

(*Appears on:* [QosSpec](#qosspec))

ECNSpec specifies Explicit Congestion Notification settings

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Enable ECN on the specified priority |
| `priority`<br /> int | Traffic class / priority to enable ECN on (0-7) |

### FirmwareTemplateSpec

(*Appears on:* [NicDeviceSpec](#nicdevicespec), [NicFirmwareTemplateSpec](#nicfirmwaretemplatespec))

FirmwareTemplateSpec specifies a FW update policy for a given FW source ref

| Field | Description |
| --- | --- |
| `nicFirmwareSourceRef`<br /> string | NicFirmwareSourceRef refers to existing NicFirmwareSource CR on where to get the FW from |
| `updatePolicy`<br /> string | UpdatePolicy indicates whether the operator needs to validate installed FW or upgrade it |

### GpuDirectOptimizedSpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

GpuDirectOptimizedSpec specifies GPU Direct optimization settings

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Optimize GPU Direct |
| `env`<br /> string | GPU direct environment, e.g. Baremetal |

### LinkTypeEnum (`string` alias)

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

LinkTypeEnum described the link type (Ethernet / Infiniband)

### NetworkBaySpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

NetworkBaySpec configures a ConnectX-9 Network Bay (“orchid”) card. A Network Bay card exposes two CX9 ASICs as two PCI endpoints that share a single OSFP cage and must be configured as a pair. Allowed only when nicSelector.nicType == “1025” (ConnectX-9), enforced by CEL on NicConfigurationTemplateSpec.

| Field | Description |
| --- | --- |
| `conf`<br /> string | Conf is the mlxconfig system configuration profile name. The daemon resolves the profile parameters for the device’s detected Network Bay ASIC and manages them through the regular mlxconfig validation and apply flow. |

### NicConfigurationTemplate

NicConfigurationTemplate is the Schema for the nicconfigurationtemplates API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicConfigurationTemplateSpec](#nicconfigurationtemplatespec) | Defines the desired state of NICs |
| `status`<br /> [NicTemplateStatus](#nictemplatestatus) | Defines the observed state of NicConfigurationTemplate |

### NicConfigurationTemplateSpec

(*Appears on:* [NicConfigurationTemplate](#nicconfigurationtemplate))

NicConfigurationTemplateSpec defines the desired state of NicConfigurationTemplate

| Field | Description |
| --- | --- |
| `nodeSelector`<br /> map\[string\]string | NodeSelector contains labels required on the node. When empty, the template will be applied to matching devices on all nodes. |
| `nicSelector`<br /> [NicSelectorSpec](#nicselectorspec) | NIC selector configuration |
| `resetToDefault`<br /> bool | *(Optional)* <br />ResetToDefault specifies whether node agent needs to perform a reset flow The following operations will be performed: \* Nvconfig reset of all non-volatile configurations - Mstconfig -d  reset for each PF - Mstconfig -d  set ADVANCED\_PCI\_SETTINGS=1 \* Node reboot - Applies new NIC NV config - Will undo any runtime configuration previously performed for the device/driver |
| `template`<br /> [ConfigurationTemplateSpec](#configurationtemplatespec) | Configuration template to be applied to matching devices |

### NicDevice

NicDevice is the Schema for the nicdevices API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicDeviceSpec](#nicdevicespec) |  |
| `status`<br /> [NicDeviceStatus](#nicdevicestatus) |  |

### NicDeviceConfigurationSpec

(*Appears on:* [NicDeviceSpec](#nicdevicespec))

NicDeviceConfigurationSpec contains desired configuration of the NIC

| Field | Description |
| --- | --- |
| `resetToDefault`<br /> bool | ResetToDefault specifies whether node agent needs to perform a reset flow. The following operations will be performed: \* Nvconfig reset of all non-volatile configurations - Mstconfig -d  reset for each PF - Mstconfig -d  set ADVANCED\_PCI\_SETTINGS=1 \* Node reboot - Applies new NIC NV config - Will undo any runtime configuration previously performed for the device/driver |
| `template`<br /> [ConfigurationTemplateSpec](#configurationtemplatespec) | Configuration template applied from the NicConfigurationTemplate CR |

### NicDeviceInterfaceNameSpec

(*Appears on:* [NicDeviceSpec](#nicdevicespec))

| Field | Description |
| --- | --- |
| `nicIndex`<br /> int | NicIndex is the index of the NIC in the flattened list of NICs based on the Template |
| `railIndex`<br /> int | RailIndex is the index of the rail where the given NIC belongs to based on the Template |
| `planeIndices`<br /> \[\]int | PlaneIndices is the indices of the planes for the given NIC based on the Template |
| `rdmaDevicePrefix`<br /> string | — Parameters from the NicInterfaceNameTemplate CR — RdmaDevicePrefix specifies the prefix for the rdma device name. Empty means RDMA naming is skipped. |
| `netDevicePrefix`<br /> string | NetDevicePrefix specifies the prefix for the net device name |

### NicDeviceNetworkBayStatus

(*Appears on:* [NicDeviceStatus](#nicdevicestatus))

NicDeviceNetworkBayStatus holds the ConnectX-9 Network Bay identity of a device.

| Field | Description |
| --- | --- |
| `asic`<br /> int | Asic is the orchid ASIC index (0 or 1) inferred from the MGIR.ga register field. |
| `peerPci`<br /> string | *(Optional)* <br />PeerPCI is the PCI address of the sibling ASIC in the same Network Bay card (the other device sharing this device’s serial number). Empty if the peer could not be resolved. |

### NicDevicePortSpec

(*Appears on:* [NicDeviceStatus](#nicdevicestatus))

NicDevicePortSpec describes the ports of the NIC

| Field | Description |
| --- | --- |
| `pci`<br /> string | PCI is a PCI address of the port, e.g. 0000:3b:00.0 |
| `fwctlDevice`<br /> string | *(Optional)* <br />FwctlDevice is the fwctl character device path for this port, e.g. /dev/fwctl/fwctl0. Empty when the host does not expose a fwctl device for this PCI function. |
| `networkInterface`<br /> string | NetworkInterface is the name of the network interface for this port, e.g. eth1 |
| `rdmaInterface`<br /> string | RdmaInterface is the name of the rdma interface for this port, e.g. mlx5\_1 |

### NicDeviceSpec

(*Appears on:* [NicDevice](#nicdevice))

NicDeviceSpec defines the desired state of NicDevice

| Field | Description |
| --- | --- |
| `configuration`<br /> [NicDeviceConfigurationSpec](#nicdeviceconfigurationspec) | Configuration specifies the configuration requested by NicConfigurationTemplate |
| `firmware`<br /> [FirmwareTemplateSpec](#firmwaretemplatespec) | Firmware specifies the fw upgrade policy requested by NicFirmwareTemplate |
| `interfaceNameTemplate`<br /> [NicDeviceInterfaceNameSpec](#nicdeviceinterfacenamespec) | InterfaceNameTemplate specifies the interface name template to be applied to the NIC |

### NicDeviceStatus

(*Appears on:* [NicDevice](#nicdevice))

NicDeviceStatus defines the observed state of NicDevice

| Field | Description |
| --- | --- |
| `node`<br /> string | Node where the device is located |
| `type`<br /> string | Type of device, e.g. ConnectX7 |
| `serialNumber`<br /> string | SerialNumber of the device, e.g. MT2116X09299. Informational only — not guaranteed unique across all cards on a host: on systems with embedded NICs sharing a flashed VPD image (e.g. HGX B300) multiple cards will report the same serial number. The operator identifies NICs uniquely by their PCI device address (the `pci` field on the first entry in `ports`, with the function digit stripped). Empty when the serial number is unavailable from PCI VPD. |
| `partNumber`<br /> string | Part number of the device, e.g. MCX713106AEHEA\_QP1 Empty when the part number is unavailable from PCI VPD. |
| `psid`<br /> string | Product Serial ID of the device, e.g. MT\_0000000221 |
| `firmwareVersion`<br /> string | Firmware version currently installed on the device, e.g. 22.31.1014 |
| `dpu`<br /> bool | DPU indicates if the device is a BlueField in DPU mode |
| `modelName`<br /> string | ModelName is the model name of the device, e.g. ConnectX-6 or BlueField-3 Empty when the model name is unavailable from PCI VPD. |
| `superNIC`<br /> bool | SuperNIC indicates if the device is a SuperNIC False when the PCI VPD model name is unavailable. |
| `ports`<br /> [\[\]NicDevicePortSpec](#nicdeviceportspec) | List of ports for the device |
| `networkBay`<br /> [NicDeviceNetworkBayStatus](#nicdevicenetworkbaystatus) | *(Optional)* <br />NetworkBay holds ConnectX-9 Network Bay (“orchid”) identity for the device. Set only when the device is detected as part of a Network Bay card. |
| `conditions`<br /> [\[\]Kubernetes meta/v1.Condition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#condition-v1-meta) | List of conditions observed for the device |

### NicFirmwareSource

NicFirmwareSource is the Schema for the nicfirmwaresources API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicFirmwareSourceSpec](#nicfirmwaresourcespec) |  |
| `status`<br /> [NicFirmwareSourceStatus](#nicfirmwaresourcestatus) |  |

### NicFirmwareSourceSpec

(*Appears on:* [NicFirmwareSource](#nicfirmwaresource))

NicFirmwareSourceSpec represents a list of url sources for FW

| Field | Description |
| --- | --- |
| `binUrlSources`<br /> \[\]string | *(Optional)* <br />BinUrlSources represents a list of url sources for ConnectX Firmware |
| `bfbUrlSource`<br /> string | *(Optional)* <br />BFBUrlSource represents a url source for BlueField Bundle |
| `docaSpcXCCUrlSource`<br /> string | *(Optional)* <br />DocaSpcXCCUrlSource represents a URL source for a DOCA SPC-X CC .deb package. Deprecated: the doSPCX runtime path launches the doca\_spcx\_cc binary preinstalled in the NIC Configuration Daemon image. A package supplied here is not installed or selected. |

### NicFirmwareSourceStatus

(*Appears on:* [NicFirmwareSource](#nicfirmwaresource))

NicFirmwareSourceStatus represents the status of the FW from given sources, e.g. version available for PSIDs

| Field | Description |
| --- | --- |
| `state`<br /> string | State represents the firmware processing state |
| `reason`<br /> string | Reason shows an error message if occurred |
| `binaryVersions`<br /> map\[string\]\[\]string | Versions is a map of available FW binaries versions to PSIDs a PSID should have only a single FW version available for it |
| `bfbVersions`<br /> map\[string\]string | BFBVersions represents the FW versions available in the provided BFB bundle |
| `docaSpcXCCVersion`<br /> string | DocaSpcXCCVersion represents the version found in a deprecated DocaSpcXCCUrlSource package. Deprecated: this value does not select the doca\_spcx\_cc binary used by doSPCX runtime configuration. |

### NicFirmwareTemplate

NicFirmwareTemplate is the Schema for the nicfirmwaretemplates API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicFirmwareTemplateSpec](#nicfirmwaretemplatespec) |  |
| `status`<br /> [NicTemplateStatus](#nictemplatestatus) |  |

### NicFirmwareTemplateSpec

(*Appears on:* [NicFirmwareTemplate](#nicfirmwaretemplate))

NicFirmwareTemplateSpec defines the FW templates and node/nic selectors for it

| Field | Description |
| --- | --- |
| `nodeSelector`<br /> map\[string\]string | NodeSelector contains labels required on the node. When empty, the template will be applied to matching devices on all nodes. |
| `nicSelector`<br /> [NicSelectorSpec](#nicselectorspec) | NIC selector configuration |
| `template`<br /> [FirmwareTemplateSpec](#firmwaretemplatespec) | Firmware update template |

### NicInterfaceNameTemplate

NicInterfaceNameTemplate is the Schema for the nicinterfacenametemplates API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicInterfaceNameTemplateSpec](#nicinterfacenametemplatespec) |  |
| `status`<br /> [NicInterfaceNameTemplateStatus](#nicinterfacenametemplatestatus) |  |

### NicInterfaceNameTemplateSpec

(*Appears on:* [NicInterfaceNameTemplate](#nicinterfacenametemplate))

NicInterfaceNameTemplateSpec defines the desired state of NicInterfaceNameTemplate

| Field | Description |
| --- | --- |
| `nodeSelector`<br /> map\[string\]string | NodeSelector contains labels required on the node. When empty, the template will be applied to matching devices on all nodes. |
| `pfsPerNic`<br /> int | PfsPerNic specifies the number of PFs per NIC Used to calculate the number of planes per NIC |
| `rdmaDevicePrefix`<br /> string | *(Optional)* <br />RdmaDevicePrefix specifies the prefix for the rdma device name. When empty, no RDMA udev rules are generated and RDMA device naming is skipped. %nic\_id%, %plane\_id% and %rail\_id% placeholders can be used to construct the device name %nic\_id% is the index of the NIC in the flattened list of NICs %plane\_id% is the index of the plane of the specific NIC %rail\_id% is the index of the rail where the given NIC belongs to |
| `netDevicePrefix`<br /> string | NetDevicePrefix specifies the prefix for the net device name %nic\_id%, %plane\_id% and %rail\_id% placeholders can be used to construct the device name %nic\_id% is the index of the NIC in the flattened list of NICs %plane\_id% is the index of the plane of the specific NIC %rail\_id% is the index of the rail where the given NIC belongs to |
| `railPciAddresses`<br /> \[\]string | RailPciAddresses defines the PCI address to rail mapping and order The first dimension is the rail index, the second dimension is the PCI addresses of the NICs in the rail. The PCI addresses must be sorted in the order of the rails. Example: \[\[“0000:1a:00.0”, “0000:2a:00.0”\], \[“0000:3a:00.0”, “0000:4a:00.0”\]\] specifies 2 rails with 2 NICs each. |

### NicInterfaceNameTemplateStatus

(*Appears on:* [NicInterfaceNameTemplate](#nicinterfacenametemplate))

NicInterfaceNameTemplateStatus defines the observed state of NicInterfaceNameTemplate

### NicSelectorSpec

(*Appears on:* [NicConfigurationTemplateSpec](#nicconfigurationtemplatespec), [NicFirmwareTemplateSpec](#nicfirmwaretemplatespec))

NicSelectorSpec is a desired configuration for NICs

| Field | Description |
| --- | --- |
| `nicType`<br /> string | Type of the NIC to be selected, e.g. 101d,1015,a2d6 etc. |
| `pciAddresses`<br /> \[\]string | Array of PCI addresses to be selected, e.g. “0000:03:00.0” |
| `serialNumbers`<br /> \[\]string | Serial numbers of the NICs to be selected, e.g. MT2116X09299. Note: serial numbers are not guaranteed unique — on systems with embedded NICs that share a flashed VPD image (e.g. HGX B300), multiple physical cards report the same serial, and this selector will match all of them. Use `pciAddresses` for precise per-card selection on such systems. |
| `partNumbers`<br /> \[\]string | Part numbers of the NICs to be selected, e.g. MCX713106AEHEA\_QP1 |

### NicTemplateStatus

(*Appears on:* [NicConfigurationTemplate](#nicconfigurationtemplate), [NicFirmwareTemplate](#nicfirmwaretemplate))

NicTemplateStatus defines the observed state of NicConfigurationTemplate and NicFirmwareTemplate

| Field | Description |
| --- | --- |
| `nicDevices`<br /> \[\]string | NicDevice CRs matching this configuration / firmware template |
| `conditions`<br /> [\[\]Kubernetes meta/v1.Condition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#condition-v1-meta) | Conditions observed for this template, e.g. a Network Bay pairing imbalance on a node |

### NvConfigParam

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

| Field | Description |
| --- | --- |
| `name`<br /> string | Name of the arbitrary nvconfig parameter |
| `value`<br /> string | Value of the arbitrary nvconfig parameter |

### PauseFramesSpec

(*Appears on:* [QosSpec](#qosspec))

PauseFramesSpec specifies global pause frame settings

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Enable global pause frames (autoneg, rx, tx). Set to false to disable all pause frames (recommended when PFC is used). |

### PciPerformanceOptimizedSpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

PciPerformanceOptimizedSpec specifies PCI performance optimization settings

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Specifies whether to enable PCI performance optimization |
| `maxReadRequest`<br /> int | Specifies the size of a single PCI read request in bytes |

### QosSpec

(*Appears on:* [RoceOptimizedSpec](#roceoptimizedspec))

QosSpec specifies Quality of Service settings

| Field | Description |
| --- | --- |
| `trust`<br /> string | Trust mode for QoS settings, e.g. dscp |
| `pfc`<br /> string | Priority-based Flow Control configuration, e.g. “0,0,0,1,0,0,0,0” |
| `tos`<br /> int | 8-bit value for type of service |
| `cableLen`<br /> int | Cable length in meters, used for ECN buffer threshold calculation |
| `ecn`<br /> [ECNSpec](#ecnspec) | ECN (Explicit Congestion Notification) settings |
| `pauseFrames`<br /> [PauseFramesSpec](#pauseframesspec) | Global pause frame settings (disable when using PFC) |

### RoceOptimizedSpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

RoceOptimizedSpec specifies RoCE optimization settings

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Optimize RoCE |
| `qos`<br /> [QosSpec](#qosspec) | Quality of Service settings |
| `roceMode`<br /> int | RoCE mode: 1 for RoCE v1, 2 for RoCE v2. Only effective when roceOptimized.enabled is true. |

### RuntimePerformanceOptimizedSpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

RuntimePerformanceOptimizedSpec specifies runtime NIC performance tuning applied via ethtool

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Enable runtime performance optimization |
| `rxRingSize`<br /> int | RX ring buffer size (ethtool -G rx) |
| `txRingSize`<br /> int | TX ring buffer size (ethtool -G tx) |
| `combinedChannels`<br /> int | Number of combined channels (ethtool -L combined) |
| `lro`<br /> bool | Enable Large Receive Offload (ethtool -K lro) |

### SpectrumXOptimizedSpec

(*Appears on:* [ConfigurationTemplateSpec](#configurationtemplatespec))

SpectrumXOptimizedSpec enables Spectrum-X specific optimizations

| Field | Description |
| --- | --- |
| `enabled`<br /> bool | Optimize Spectrum X |
| `version`<br /> string | Version of the Spectrum-X architecture passed to the doSPCX planner. |
| `platformType`<br /> string | *(Optional)* <br />Platform type used by the doSPCX planner to select a recipe from the supplied profile. |
| `overlay`<br /> string | *(Optional)* <br />Overlay mode to be configured Can be “l3” or “none” |
| `multiplaneMode`<br /> string | *(Optional)* <br />Multiplane mode to be configured Can be “none”, “swplb”, or “hwplb” |
| `numberOfPlanes`<br /> int | *(Optional)* <br />Number of planes to be configured |
