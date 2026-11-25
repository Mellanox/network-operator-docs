---
title: Network Operator API reference v1alpha1
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

Packages:

- [mellanox.com/v1alpha1](#mellanoxcomv1alpha1)

## mellanox.com/v1alpha1

Package v1alpha1 contains API Schema definitions for the mellanox.com v1alpha1 API group

Resource Types:

### AppliedState

(*Appears on:* [HostDeviceNetworkStatus](#hostdevicenetworkstatus), [NicClusterPolicyStatus](#nicclusterpolicystatus), [NicNodePolicyStatus](#nicnodepolicystatus))

AppliedState defines a finer-grained view of the observed state of NicClusterPolicy

| Field | Description |
| --- | --- |
| `name`<br /> string | Name of the deployed component this state refers to |
| `state`<br /> [State](#state-string-alias) | The state of the deployed component. (“ready”, “notReady”, “ignore”, “error”) |
| `message`<br /> string | Message is a human readable message indicating details about why the state is in this condition |

### ConditionHolder

ConditionHolder is implemented by CRDs that carry a status.conditions array. NicClusterPolicy and NicNodePolicy implement this interface.

### ConfigMapNameReference

(*Appears on:* [NicConfigurationOperatorSpec](#nicconfigurationoperatorspec), [OFEDDriverSpec](#ofeddriverspec))

ConfigMapNameReference references a config map in a specific namespace. The namespace must be specified at the point of use.

| Field | Description |
| --- | --- |
| `name`<br /> string | Name of the ConfigMap |

### DOCATelemetryServiceConfig

(*Appears on:* [DOCATelemetryServiceSpec](#docatelemetryservicespec))

DOCATelemetryServiceConfig contains configuration for the DOCATelemetryService.

| Field | Description |
| --- | --- |
| `fromConfigMap`<br /> string | *(Optional)* <br />FromConfigMap sets the configMap the DOCATelemetryService gets its configuration from. The ConfigMap must be in the same namespace as the NICClusterPolicy. |

### DOCATelemetryServiceSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

DOCATelemetryServiceSpec is the configuration for DOCA Telemetry Service.

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for DOCA Telemetry Service |
| `config`<br /> [DOCATelemetryServiceConfig](#docatelemetryserviceconfig) | *(Optional)* <br />Config contains custom config for the DOCATelemetryService. If set no default config will be deployed. |
| `shareHostSharedMemory`<br /> bool | *(Optional)* <br />ShareHostSharedMemory backs the shared memory used for IPC with the host’s whole /dev/shm, which is what IPC clients running directly on the node require. When false the shared memory is confined to /dev/shm/telemetry on the host, which containerized IPC clients can mount while the rest of the host’s shared memory stays isolated. |

### DevicePluginSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec), [NicNodePolicySpec](#nicnodepolicyspec))

DevicePluginSpec describes configuration options for device plugin 1. Image information for device plugin 2. Device plugin configuration

| Field | Description |
| --- | --- |
| `ImageSpecWithConfig`<br /> [ImageSpecWithConfig](#imagespecwithconfig) | Image information for the device plugin and optional configuration |
| `useCdi`<br /> bool | Enables use of container device interface (CDI) NOTE: NVIDIA Network Operator does not configure container runtime to enable CDI. |

### DrainSpec

(*Appears on:* [DriverUpgradePolicySpec](#driverupgradepolicyspec))

DrainSpec describes configuration for node drain during automatic upgrade

| Field | Description |
| --- | --- |
| `enable`<br /> bool | *(Optional)* <br />Enable indicates if node draining is allowed during upgrade |
| `force`<br /> bool | *(Optional)* <br />Force indicates if force draining is allowed |
| `podSelector`<br /> string | *(Optional)* <br />PodSelector specifies a label selector to filter pods on the node that need to be drained For more details on label selectors, see: [https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors) |
| `timeoutSeconds`<br /> int | *(Optional)* <br />TimeoutSecond specifies the length of time in seconds to wait before giving up drain, zero means infinite |
| `deleteEmptyDir`<br /> bool | *(Optional)* <br />DeleteEmptyDir indicates if should continue even if there are pods using emptyDir (local data that will be deleted when the node is drained) |

### DriverUpgradePolicySpec

(*Appears on:* [OFEDDriverSpec](#ofeddriverspec))

DriverUpgradePolicySpec describes policy configuration for automatic upgrades

| Field | Description |
| --- | --- |
| `autoUpgrade`<br /> bool | *(Optional)* <br />AutoUpgrade is a global switch for automatic upgrade feature if set to false all other options are ignored |
| `maxParallelUpgrades`<br /> int | *(Optional)* <br />MaxParallelUpgrades indicates how many nodes can be upgraded in parallel 0 means no limit, all nodes will be upgraded in parallel |
| `waitForCompletion`<br /> [WaitForCompletionSpec](#waitforcompletionspec) | The configuration for waiting on pods completions |
| `drain`<br /> [DrainSpec](#drainspec) | The configuration for node drain during automatic upgrade |
| `safeLoad`<br /> bool | *(Optional)* <br />SafeLoad turn on safe driver loading (cordon and drain the node before loading the driver) |

### GlobalConfig

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

GlobalConfig contains global configuration for all components

| Field | Description |
| --- | --- |
| `repository`<br /> string | *(Optional)* <br />Repository is the default container image repository for all components |
| `version`<br /> string | *(Optional)* <br />Version is the default version tag for all component images |
| `imagePullSecrets`<br /> \[\]string | *(Optional)* <br />ImagePullSecrets is a list of secret names for pulling component images |

### HostDeviceNetwork

HostDeviceNetwork is the Schema for the hostdevicenetworks API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [HostDeviceNetworkSpec](#hostdevicenetworkspec) | Defines the desired state of HostDeviceNetwork |
| `status`<br /> [HostDeviceNetworkStatus](#hostdevicenetworkstatus) | Defines the observed state of HostDeviceNetwork |

### HostDeviceNetworkSpec

(*Appears on:* [HostDeviceNetwork](#hostdevicenetwork))

HostDeviceNetworkSpec defines the desired state of HostDeviceNetwork

| Field | Description |
| --- | --- |
| `networkNamespace`<br /> string | Namespace of the NetworkAttachmentDefinition custom resource |
| `resourceName`<br /> string | Host device resource pool name |
| `ipam`<br /> string | IPAM configuration to be used for this network |
| `metaPlugins`<br /> string | MetaPluginsConfig contains a raw, comma-separated sequence of CNI plugin objects without enclosing array brackets to chain after the host-device plugin. |

### HostDeviceNetworkStatus

(*Appears on:* [HostDeviceNetwork](#hostdevicenetwork))

HostDeviceNetworkStatus defines the observed state of HostDeviceNetwork

| Field | Description |
| --- | --- |
| `state`<br /> [State](#state-string-alias) | Reflects the state of the HostDeviceNetwork |
| `hostDeviceNetworkAttachmentDef`<br /> string | Network attachment definition generated from HostDeviceNetworkSpec |
| `reason`<br /> string | Informative string in case the observed state is error |
| `appliedStates`<br /> [\[\]AppliedState](#appliedstate) | AppliedStates provide a finer view of the observed state |

### IBKubernetesSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

IBKubernetesSpec describes configuration options for ib-kubernetes

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for ib-kubernetes |
| `periodicUpdateSeconds`<br /> int | *(Optional)* <br />Interval of updates in seconds |
| `pKeyGUIDPoolRangeStart`<br /> string | The first guid in the pool |
| `pKeyGUIDPoolRangeEnd`<br /> string | The last guid in the pool |
| `ufmSecret`<br /> string | Secret containing credentials to UFM service |

### IPoIBNetwork

IPoIBNetwork is the Schema for the ipoibnetworks API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [IPoIBNetworkSpec](#ipoibnetworkspec) | Defines the desired state of IPoIBNetwork |
| `status`<br /> [IPoIBNetworkStatus](#ipoibnetworkstatus) | Defines the observed state of IPoIBNetwork |

### IPoIBNetworkSpec

(*Appears on:* [IPoIBNetwork](#ipoibnetwork))

IPoIBNetworkSpec defines the desired state of IPoIBNetwork

| Field | Description |
| --- | --- |
| `networkNamespace`<br /> string | Namespace of the NetworkAttachmentDefinition custom resource |
| `master`<br /> string | Name of the host interface to enslave. Defaults to default route interface |
| `mtu`<br /> int | MTU of the IPoIB child interface. If 0 (default), MTU is not set and the child keeps the kernel/fabric default, which may differ from the master’s MTU. Set an explicit value to match the master’s MTU. |
| `ipam`<br /> string | IPAM configuration to be used for this network. |

### IPoIBNetworkStatus

(*Appears on:* [IPoIBNetwork](#ipoibnetwork))

IPoIBNetworkStatus defines the observed state of IPoIBNetwork

| Field | Description |
| --- | --- |
| `state`<br /> [State](#state-string-alias) | Reflects the state of the IPoIBNetwork |
| `ipoibNetworkAttachmentDef`<br /> string | Network attachment definition generated from IPoIBNetworkSpec |
| `reason`<br /> string | Informative string in case the observed state is error |

### ImageSpec

(*Appears on:* [DOCATelemetryServiceSpec](#docatelemetryservicespec), [IBKubernetesSpec](#ibkubernetesspec), [ImageSpecWithConfig](#imagespecwithconfig), [NICFeatureDiscoverySpec](#nicfeaturediscoveryspec), [NVIPAMSpec](#nvipamspec), [NicConfigurationOperatorSpec](#nicconfigurationoperatorspec), [OFEDDriverSpec](#ofeddriverspec), [SecondaryNetworkSpec](#secondarynetworkspec), [SpectrumXOperatorSpec](#spectrumxoperatorspec))

ImageSpec Contains container image specifications

| Field | Description |
| --- | --- |
| `image`<br /> string | Name of the image |
| `repository`<br /> string | *(Optional)* <br />Address of the registry that stores the image |
| `version`<br /> string | *(Optional)* <br />Version of the image to use |
| `imagePullSecrets`<br /> \[\]string | *(Optional)* <br />ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling the image |
| `containerResources`<br /> [\[\]ResourceRequirements](#resourcerequirements) | ResourceRequirements describes the compute resource requirements |

### ImageSpecWithConfig

(*Appears on:* [DevicePluginSpec](#devicepluginspec), [MultusSpec](#multusspec))

ImageSpecWithConfig Contains ImageSpec and optional configuration

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for the component |
| `config`<br /> string | Configuration for the component as a string |

### MacvlanNetwork

MacvlanNetwork is the Schema for the macvlannetworks API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [MacvlanNetworkSpec](#macvlannetworkspec) | Defines the desired state of MacvlanNetworkSpec |
| `status`<br /> [MacvlanNetworkStatus](#macvlannetworkstatus) | Defines the observed state of MacvlanNetwork |

### MacvlanNetworkSpec

(*Appears on:* [MacvlanNetwork](#macvlannetwork))

MacvlanNetworkSpec defines the desired state of MacvlanNetwork

| Field | Description |
| --- | --- |
| `networkNamespace`<br /> string | Namespace of the NetworkAttachmentDefinition custom resource |
| `master`<br /> string | Name of the host interface to enslave. Defaults to default route interface |
| `mode`<br /> string | Mode of interface one of “bridge”, “private”, “vepa”, “passthru” |
| `mtu`<br /> int | MTU of interface to the specified value. 0 for master’s MTU |
| `ipam`<br /> string | IPAM configuration to be used for this network. |
| `metaPlugins`<br /> string | MetaPluginsConfig contains a raw, comma-separated sequence of CNI plugin objects without enclosing array brackets to chain after the macvlan plugin. |

### MacvlanNetworkStatus

(*Appears on:* [MacvlanNetwork](#macvlannetwork))

MacvlanNetworkStatus defines the observed state of MacvlanNetwork

| Field | Description |
| --- | --- |
| `state`<br /> [State](#state-string-alias) | Reflects the state of the MacvlanNetwork |
| `macvlanNetworkAttachmentDef`<br /> string | Network attachment definition generated from MacvlanNetworkSpec |
| `reason`<br /> string | Informative string in case the observed state is error |

### MultusDeploymentType (`string` alias)

(*Appears on:* [MultusSpec](#multusspec))

MultusDeploymentType defines the Multus CNI deployment variant.

### MultusSpec

(*Appears on:* [SecondaryNetworkSpec](#secondarynetworkspec))

MultusSpec describes configuration options for Multus CNI 1. Image information for Multus CNI 2. Multus CNI config if config is missing or empty then multus config will be automatically generated from the CNI configuration file of the master plugin (the first file in lexicographical order in cni-conf-dir)

| Field | Description |
| --- | --- |
| `ImageSpecWithConfig`<br /> [ImageSpecWithConfig](#imagespecwithconfig) | Image information for Multus and optional configuration |
| `deploymentType`<br /> [MultusDeploymentType](#multusdeploymenttype-string-alias) | *(Optional)* <br />DeploymentType selects the Multus deployment variant. “thin” (default): Multus runs as an in-process CNI plugin. The config field, if set, provides the Multus CNI configuration file content. “thick”: Multus runs as a privileged daemon; CNI calls are proxied via a Unix socket shim. The config field, if set, configures the daemon (daemon-config.json). |

### NICFeatureDiscoverySpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

NICFeatureDiscoverySpec describes configuration options for nic-feature-discovery

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for nic-feature-discovery |

### NVIPAMSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

NVIPAMSpec describes configuration options for nv-ipam 1. Image information for nv-ipam 2. Configuration for nv-ipam

| Field | Description |
| --- | --- |
| `enableWebhook`<br /> bool | Enable deployment of the validation webhook |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for nv-ipam |

### NicClusterPolicy

NicClusterPolicy is the Schema for the nicclusterpolicies API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicClusterPolicySpec](#nicclusterpolicyspec) | Defines the desired state of NicClusterPolicy |
| `status`<br /> [NicClusterPolicyStatus](#nicclusterpolicystatus) | Defines the observed state of NicClusterPolicy |

### NicClusterPolicySpec

(*Appears on:* [NicClusterPolicy](#nicclusterpolicy))

NicClusterPolicySpec defines the desired state of NicClusterPolicy

| Field | Description |
| --- | --- |
| `global`<br /> [GlobalConfig](#globalconfig) | *(Optional)* <br />Global contains global configuration for all components |
| `ofedDriver`<br /> [OFEDDriverSpec](#ofeddriverspec) | OFEDDriver is a specialized driver for NVIDIA NICs which can replace the inbox driver that comes with an OS. See [https://network.nvidia.com/support/mlnx-ofed-matrix/](https://network.nvidia.com/support/mlnx-ofed-matrix/) |
| `rdmaSharedDevicePlugin`<br /> [DevicePluginSpec](#devicepluginspec) | RdmaSharedDevicePlugin manages support IB and RoCE HCAs through the Kubernetes device plugin framework. The config field is a json representation of the RDMA shared device plugin configuration. See [https://github.com/Mellanox/k8s-rdma-shared-dev-plugin](https://github.com/Mellanox/k8s-rdma-shared-dev-plugin) |
| `sriovDevicePlugin`<br /> [DevicePluginSpec](#devicepluginspec) | SriovDevicePlugin manages SRIOV through the Kubernetes device plugin framework. The config field is a json representation of the RDMA shared device plugin configuration. See [https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin](https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin) |
| `ibKubernetes`<br /> [IBKubernetesSpec](#ibkubernetesspec) | IBKubernetes provides a daemon that works in conjunction with the SR-IOV Network Device Plugin. It acts on Kubernetes pod object changes and reads the pod’s network annotation. From there it fetches the corresponding network CRD and reads the PKey. This is done in order to add the newly generated GUID or the predefined GUID in the GUID field of the CRD. This is then passed in cni-args to that PKey for pods with mellanox.infiniband.app annotation. See: [https://github.com/Mellanox/ib-kubernetes](https://github.com/Mellanox/ib-kubernetes) |
| `secondaryNetwork`<br /> [SecondaryNetworkSpec](#secondarynetworkspec) | SecondaryNetwork Specifies components to deploy in order to facilitate a secondary network in Kubernetes. It consists of the following optionally deployed components: - Multus-CNI: Delegate CNI plugin to support secondary networks in Kubernetes - CNI plugins: Currently only containernetworking-plugins is supported - IPoIB CNI: Allows the user to create IPoIB child link and move it to the pod |
| `nvIpam`<br /> [NVIPAMSpec](#nvipamspec) | NvIpam is an IPAM provider that dynamically assigns IP addresses with speed and performance in mind. Note: NvIPam requires certificate management e.g. cert-manager or OpenShift cert management. See [https://github.com/Mellanox/nvidia-k8s-ipam](https://github.com/Mellanox/nvidia-k8s-ipam) |
| `nicFeatureDiscovery`<br /> [NICFeatureDiscoverySpec](#nicfeaturediscoveryspec) | NicFeatureDiscovery works with NodeFeatureDiscovery to expose information about NVIDIA NICs. [https://github.com/Mellanox/nic-feature-discovery](https://github.com/Mellanox/nic-feature-discovery) |
| `docaTelemetryService`<br /> [DOCATelemetryServiceSpec](#docatelemetryservicespec) | DOCATelemetryService exposes telemetry from NVIDIA networking components to prometheus. See: [https://docs.nvidia.com/doca/sdk/doca+telemetry+service+guide/index.html](https://docs.nvidia.com/doca/sdk/doca+telemetry+service+guide/index.html) |
| `nicConfigurationOperator`<br /> [NicConfigurationOperatorSpec](#nicconfigurationoperatorspec) | NicConfigurationOperator provides Kubernetes CRD API to allow FW configuration on NVIDIA NICs in a coordinated manner See: [https://github.com/Mellanox/nic-configuration-operator](https://github.com/Mellanox/nic-configuration-operator) |
| `spectrumXOperator`<br /> [SpectrumXOperatorSpec](#spectrumxoperatorspec) | SpectrumXOperator exposes NVIDIA Spectrum-X Operator. See: [https://github.com/Mellanox/spectrum-x-operator/](https://github.com/Mellanox/spectrum-x-operator/) |
| `nodeAffinity`<br /> [Kubernetes core/v1.NodeAffinity](https://godoc.org/k8s.io/api/core/v1#NodeAffinity) | NodeAffinity rules to inject to the DaemonSets objects that are managed by the operator |
| `tolerations`<br /> [\[\]Kubernetes core/v1.Toleration](https://godoc.org/k8s.io/api/core/v1#Toleration) | Tolerations to inject to the DaemonSets objects that are managed by the operator |
| `deploymentNodeAffinity`<br /> [Kubernetes core/v1.NodeAffinity](https://godoc.org/k8s.io/api/core/v1#NodeAffinity) | NodeAffinity rules to inject to the Deployments objects that are managed by the operator |
| `deploymentTolerations`<br /> [\[\]Kubernetes core/v1.Toleration](https://godoc.org/k8s.io/api/core/v1#Toleration) | Tolerations to inject to the Deployments objects that are managed by the operator |

### NicClusterPolicyStatus

(*Appears on:* [NicClusterPolicy](#nicclusterpolicy))

NicClusterPolicyStatus defines the observed state of NicClusterPolicy

| Field | Description |
| --- | --- |
| `state`<br /> [State](#state-string-alias) | Reflects the current state of the cluster policy |
| `reason`<br /> string | Informative string in case the observed state is error |
| `appliedStates`<br /> [\[\]AppliedState](#appliedstate) | AppliedStates provide a finer view of the observed state |
| `conditions`<br /> [\[\]Kubernetes meta/v1.Condition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#condition-v1-meta) | *(Optional)* <br />Conditions is a list of conditions describing the state of the NicClusterPolicy. Each enabled component exposes a Ready condition, and the aggregate Ready condition summarizes the overall policy health. |

### NicConfigurationOperatorSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

NicConfigurationOperatorSpec is the configuration for NIC Configuration Operator

| Field | Description |
| --- | --- |
| `operator`<br /> [ImageSpec](#imagespec) | Image information for nic-configuration-operator |
| `configurationDaemon`<br /> [ImageSpec](#imagespec) | Image information for nic-configuration-daemon |
| `env`<br /> [\[\]Kubernetes core/v1.EnvVar](https://godoc.org/k8s.io/api/core/v1#EnvVar) | List of environment variables to set in the NIC Configuration Operator and NIC Configuration Daemon containers. |
| `nicFirmwareStorage`<br /> [NicFirmwareStorageSpec](#nicfirmwarestoragespec) | NicFirmwareStorage contains configuration for the NIC firmware storage. If not provided, the NIC firmware storage will not be configured. |
| `logLevel`<br /> string | LogLevel sets the verbosity level of the logs. info\|debug |
| `certConfig`<br /> [ConfigMapNameReference](#configmapnamereference) | Optional: Custom TLS certificates configuration for NIC Configuration Operator container |

### NicFirmwareStorageSpec

(*Appears on:* [NicConfigurationOperatorSpec](#nicconfigurationoperatorspec))

NicFirmwareStorageSpec contains configuration for the NIC firmware storage

| Field | Description |
| --- | --- |
| `create`<br /> bool | Create specifies whether to create a new PVC or use an existing one If create == false, the existing PVC with the name specified in pvcName should be located in the same namespace as the operator |
| `pvcName`<br /> string | PVCName is the name of the PVC to mount as NIC Firmware storage. Default value: “nic-fw-storage-pvc” |
| `storageClassName`<br /> string | StorageClassName is the name of a storage class to be used to store NIC FW binaries during NIC FW upgrade. If not provided, the cluster-default storage class will be used |
| `availableStorageSize`<br /> string | AvailableStorageSize is storage size for the NIC Configuration Operator to request. Only applies if nicFirmwareStorage.create == true. Default value: 1Gi |
| `accessMode`<br /> string | AccessMode is the access mode of the PVC to create. Only applies if nicFirmwareStorage.create == true. ReadWriteMany is required on multi-node clusters, where the firmware storage is mounted by the configuration daemon on every node. ReadWriteOnce is only valid on single-node clusters (e.g. Single Node OpenShift with storage that does not support ReadWriteMany). Default value: ReadWriteMany |

### NicNodePolicy

NicNodePolicy is the Schema for the NicNodePolicies API

| Field | Description |
| --- | --- |
| `metadata`<br /> [Kubernetes meta/v1.ObjectMeta](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#objectmeta-v1-meta) | Refer to the Kubernetes API documentation for the fields of the `metadata` field. |
| `spec`<br /> [NicNodePolicySpec](#nicnodepolicyspec) | Defines the desired state of NicNodePolicy |
| `status`<br /> [NicNodePolicyStatus](#nicnodepolicystatus) | Defines the observed state of NicNodePolicy |

### NicNodePolicySpec

(*Appears on:* [NicNodePolicy](#nicnodepolicy))

NicNodePolicySpec defines the desired state of NIC drivers and device plugin

| Field | Description |
| --- | --- |
| `ofedDriver`<br /> [OFEDDriverSpec](#ofeddriverspec) | OFEDDriver is a specialized driver for NVIDIA NICs which can replace the inbox driver that comes with an OS. See [https://network.nvidia.com/support/mlnx-ofed-matrix/](https://network.nvidia.com/support/mlnx-ofed-matrix/) |
| `rdmaSharedDevicePlugin`<br /> [DevicePluginSpec](#devicepluginspec) | RdmaSharedDevicePlugin manages support IB and RoCE HCAs through the Kubernetes device plugin framework. The config field is a json representation of the RDMA shared device plugin configuration. See [https://github.com/Mellanox/k8s-rdma-shared-dev-plugin](https://github.com/Mellanox/k8s-rdma-shared-dev-plugin) |
| `sriovDevicePlugin`<br /> [DevicePluginSpec](#devicepluginspec) | SriovDevicePlugin manages SRIOV through the Kubernetes device plugin framework. The config field is a json representation of the RDMA shared device plugin configuration. See [https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin](https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin) |
| `nodeSelector`<br /> map\[string\]string | NodeSelector specifies a selector for the nodes this policy applies to |
| `labels`<br /> map\[string\]string | Optional: Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. |
| `annotations`<br /> map\[string\]string | Optional: Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. |
| `tolerations`<br /> [\[\]Kubernetes core/v1.Toleration](https://godoc.org/k8s.io/api/core/v1#Toleration) | Optional: Set tolerations |

### NicNodePolicyStatus

(*Appears on:* [NicNodePolicy](#nicnodepolicy))

NicNodePolicyStatus defines the observed state of NicNodePolicy

| Field | Description |
| --- | --- |
| `state`<br /> [State](#state-string-alias) | Reflects the current state of the cluster policy |
| `reason`<br /> string | Informative string in case the observed state is error |
| `appliedStates`<br /> [\[\]AppliedState](#appliedstate) | AppliedStates provide a finer view of the observed state |
| `conditions`<br /> [\[\]Kubernetes meta/v1.Condition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.31/#condition-v1-meta) | *(Optional)* <br />Conditions is a list of conditions describing the state of the NicNodePolicy. Each enabled component exposes a Ready condition, and the aggregate Ready condition summarizes the overall policy health. |

### NicPolicyCR

NicPolicyCR is the common interface satisfied by NicClusterPolicy and NicNodePolicy. State sync methods use it to access the desired NIC configuration and set owner references without depending on a concrete CRD type.

### OFEDDriverSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec), [NicNodePolicySpec](#nicnodepolicyspec))

OFEDDriverSpec describes configuration options for DOCA-OFED Driver Container

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for DOCA-OFED driver container |
| `startupProbe`<br /> [PodProbeSpec](#podprobespec) | Pod startup probe settings |
| `livenessProbe`<br /> [PodProbeSpec](#podprobespec) | Pod liveness probe settings |
| `readinessProbe`<br /> [PodProbeSpec](#podprobespec) | Pod readiness probe settings |
| `env`<br /> [\[\]Kubernetes core/v1.EnvVar](https://godoc.org/k8s.io/api/core/v1#EnvVar) | List of environment variables to set in the DOCA-OFED driver container. |
| `upgradePolicy`<br /> [DriverUpgradePolicySpec](#driverupgradepolicyspec) | DOCA-OFED driver auto-upgrade settings |
| `certConfig`<br /> [ConfigMapNameReference](#configmapnamereference) | Optional: Custom TLS certificates configuration for DOCA-OFED driver container |
| `repoConfig`<br /> [ConfigMapNameReference](#configmapnamereference) | Optional: Custom package repository configuration for DOCA-OFED driver container |
| `terminationGracePeriodSeconds`<br /> int64 | *(Optional)* <br />TerminationGracePeriodSeconds specifies the length of time in seconds to wait before killing the DOCA-OFED driver container pod on termination |
| `forcePrecompiled`<br /> bool | *(Optional)* <br />ForcePrecompiled specifies if only DOCA-OFED driver precompiled images are allowed If set to false and precompiled image does not exists, DOCA-OFED driver will be compiled on Nodes If set to true and precompiled image does not exists, OFED state will be Error. |

### PodProbeSpec

(*Appears on:* [OFEDDriverSpec](#ofeddriverspec))

PodProbeSpec describes a pod probe.

| Field | Description |
| --- | --- |
| `initialDelaySeconds`<br /> int | Number of seconds after the container has started before the probe is initiated |
| `periodSeconds`<br /> int | How often (in seconds) to perform the probe |
| `failureThreshold`<br /> int | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| `timeoutSeconds`<br /> int | Number of seconds after which the probe times out |

### ResourceRequirements

(*Appears on:* [ImageSpec](#imagespec))

ResourceRequirements describes the compute resource requirements.

| Field | Description |
| --- | --- |
| `name`<br /> string | Name of the container the requirements are set for |
| `limits`<br /> [Kubernetes core/v1.ResourceList](https://godoc.org/k8s.io/api/core/v1#ResourceList) | *(Optional)* <br />Limits describes the maximum amount of compute resources allowed. More info: [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| `requests`<br /> [Kubernetes core/v1.ResourceList](https://godoc.org/k8s.io/api/core/v1#ResourceList) | *(Optional)* <br />Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. Requests cannot exceed Limits. More info: [https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |

### SecondaryNetworkSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

SecondaryNetworkSpec describes configuration options for secondary network

| Field | Description |
| --- | --- |
| `multus`<br /> [MultusSpec](#multusspec) | Image and configuration information for multus |
| `cniPlugins`<br /> [ImageSpec](#imagespec) | Image information for CNI plugins |
| `ipoib`<br /> [ImageSpec](#imagespec) | Image information for IPoIB CNI |

### SpectrumXOperatorSpec

(*Appears on:* [NicClusterPolicySpec](#nicclusterpolicyspec))

SpectrumXOperatorSpec describes configuration options for NVIDIA Spectrum-X Operator

| Field | Description |
| --- | --- |
| `ImageSpec`<br /> [ImageSpec](#imagespec) | Image information for NVIDIA Spectrum-X Operator |
| `xPlane`<br /> [ImageSpec](#imagespec) | *(Optional)* |

### State (`string` alias)

(*Appears on:* [AppliedState](#appliedstate), [HostDeviceNetworkStatus](#hostdevicenetworkstatus), [IPoIBNetworkStatus](#ipoibnetworkstatus), [MacvlanNetworkStatus](#macvlannetworkstatus), [NicClusterPolicyStatus](#nicclusterpolicystatus), [NicNodePolicyStatus](#nicnodepolicystatus))

State represents reconcile state of the system.

### WaitForCompletionSpec

(*Appears on:* [DriverUpgradePolicySpec](#driverupgradepolicyspec))

WaitForCompletionSpec describes the configuration for waiting on pods completions

| Field | Description |
| --- | --- |
| `podSelector`<br /> string | *(Optional)* <br />PodSelector specifies a label selector for the pods to wait for completion For more details on label selectors, see: [https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors) |
| `timeoutSeconds`<br /> int | *(Optional)* <br />TimeoutSecond specifies the length of time in seconds to wait before giving up on pod termination, zero means infinite |
