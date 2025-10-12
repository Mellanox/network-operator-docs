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

.. _ncp-cr-example:

****************************************
NicClusterPolicy Custom Resource Example
****************************************

The following NIC Cluster Policy example contains all the sub-components that NVIDA Network Operator can deploy.
This example should serve as a reference, it is not recommended to apply it as is to your cluster.

**NOTE:** Edit the example to contain only the required components for the target environment.

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: |doca-driver-repository|
        version: |doca-driver-version|
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
        repository: |k8s-rdma-shared-dev-plugin-repository|
        version: |k8s-rdma-shared-dev-plugin-version|
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
        repository: |sriov-device-plugin-repository|
        version: |sriov-device-plugin-version|
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
          repository: |cni-plugins-repository|
          version: |cni-plugins-version|
        ipoib:
          image: ipoib-cni
          repository: |ipoib-cni-repository|
          version: |ipoib-cni-version|
        multus:
          image: multus-cni
          repository: |multus-repository|
          version: |multus-version|
      nvIpam:
        image: nvidia-k8s-ipam
        repository: |nvidia-ipam-repository|
        version: |nvidia-ipam-version|
        enableWebhook: false
      ibKubernetes:
        image: ib-kubernetes
        repository: |ib-kubernetes-repository|
        version: |ib-kubernetes-version|
        pKeyGUIDPoolRangeStart: "02:00:00:00:00:00:00:00"
        pKeyGUIDPoolRangeEnd: "02:FF:FF:FF:FF:FF:FF:FF"
        ufmSecret: ufm-secret
      nicFeatureDiscovery:
        image: nic-feature-discovery
        repository: |nic-feature-discovery-repository|
        version: |nic-feature-discovery-version|
      docaTelemetryService:
        image: doca_telemetry
        repository: |doca-telemetry-repository|
        version: |doca-telemetry-version|
      spectrumXOperator:
        image: spectrum-x-operator
        repository: |spectrumxop-repository|
        version: |spectrumxop-version|
      nicConfigurationOperator:
        operator:
          image: nic-configuration-operator
          repository: |nic-configuration-operator-repository|
          version: |nic-configuration-operator-version|
        configurationDaemon:
          image: nic-configuration-operator-daemon
          repository: |nic-configuration-operator-repository|
          version: |nic-configuration-operator-version|
        nicFirmwareStorage:
          create: true
          pvcName: nic-fw-storage-pvc
          storageClassName: nic-fw-storage-class
          availableStorageSize: 1Gi
        logLevel: info