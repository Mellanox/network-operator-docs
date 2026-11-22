---
title: "NicClusterPolicy Custom Resource Example"
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

The following NIC Cluster Policy example contains all the sub-components that NVIDA Network Operator can deploy.
This example should serve as a reference, it is not recommended to apply it as is to your cluster.

**NOTE:** Edit the example to contain only the required components for the target environment.

```yaml
apiVersion: mellanox.com/v1alpha1
kind: NicClusterPolicy
metadata:
  name: nic-cluster-policy
spec:
  ofedDriver:
    image: doca-driver
    repository: ${doca_driver_repository}
    version: ${doca_driver_version}
    upgradePolicy:
      autoUpgrade: true
      drain:
        deleteEmptyDir: true
        enable: true
        force: true
        timeoutSeconds: 300
      maxParallelUpgrades: 1
    startupProbe:
      initialDelaySeconds: 10
      periodSeconds: 10
    livenessProbe:
      initialDelaySeconds: 30
      periodSeconds: 30
    readinessProbe:
      initialDelaySeconds: 10
      periodSeconds: 30
  rdmaSharedDevicePlugin:
    image: k8s-rdma-shared-dev-plugin
    repository: ${k8s_rdma_shared_dev_plugin_repository}
    version: ${k8s_rdma_shared_dev_plugin_version}
    # The config below directly propagates to k8s-rdma-shared-device-plugin configuration.
    # Replace 'devices' with your (RDMA capable) netdevice name.
    config: |
      {
        "configList": [
          {
            "resourceName": "rdma_shared_device_a",
            "rdmaHcaMax": 63,
            "selectors": {
              "vendors": ["15b3"],
              "deviceIDs": ["101b"]
            }
          }
        ]
      }
  sriovDevicePlugin:
    image: sriov-network-device-plugin
    repository: ${sriov_device_plugin_repository}
    version: ${sriov_device_plugin_version}
    config: |
      {
        "resourceList": [
          {
            "resourcePrefix": "nvidia.com",
            "resourceName": "hostdev",
            "selectors": {
              "vendors": ["15b3"],
              "isRdma": true
            }
          }
        ]
      }
   secondaryNetwork:
     cniPlugins:
       image: plugins
       repository: ${cni_plugins_repository}
       version: ${cni_plugins_version}
     ipoib:
       image: ipoib-cni
       repository: ${ipoib_cni_repository}
       version: ${ipoib_cni_version}
     multus:
       image: multus-cni
       repository: ${multus_repository}
       version: ${multus_version}
   nvIpam:
     image: nvidia-k8s-ipam
     repository: ${nvidia_ipam_repository}
     version: ${nvidia_ipam_version}
     enableWebhook: false
   ibKubernetes:
     image: ib-kubernetes
     repository: ${ib_kubernetes_repository}
     version: ${ib_kubernetes_version}
     pKeyGUIDPoolRangeStart: "02:00:00:00:00:00:00:00"
     pKeyGUIDPoolRangeEnd: "02:FF:FF:FF:FF:FF:FF:FF"
     ufmSecret: ufm-secret
   nicFeatureDiscovery:
     image: nic-feature-discovery
     repository: ${nic_feature_discovery_repository}
     version: ${nic_feature_discovery_version}
   docaTelemetryService:
     image: doca_telemetry
     repository: ${doca_telemetry_repository}
     version: ${doca_telemetry_version}
   spectrumXOperator:
     image: spectrum-x-operator
     repository: ${spectrumxop_repository}
     version: ${spectrumxop_version}
   nicConfigurationOperator:
     operator:
       image: nic-configuration-operator
       repository: ${nic_configuration_operator_repository}
       version: ${nic_configuration_operator_version}
     configurationDaemon:
       image: nic-configuration-operator-daemon
       repository: ${nic_configuration_operator_repository}
       version: ${nic_configuration_operator_version}
     nicFirmwareStorage:
       create: true
       pvcName: nic-fw-storage-pvc
       storageClassName: nic-fw-storage-class
       availableStorageSize: 1Gi
     logLevel: info
```

<Note>
For heterogeneous clusters where different node groups require different DOCA-OFED driver
versions or device plugin configurations, see [Heterogeneous Clusters with NicNodePolicy](/customizations/nic-node-policy).
</Note>
