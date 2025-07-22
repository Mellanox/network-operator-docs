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

**************************
NIC Firmware Configuration
**************************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none


===========================================================================
Configure NIC Firmware using the NIC Configuration Operator
===========================================================================
`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ provides Kubernetes API (Custom Resource Definition) to allow Firmware update and configuration on NVIDIA NICs in a coordinated manner. It deploys a configuration daemon on each of the desired nodes to configure NVIDIA NICs there. NVIDIA NIC Configuration Operator uses `Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_ to prepare a node for maintenance before the actual configuration.

.. warning:: NVIDIA NIC Configuration Operator does not support FW reset flow for DPU mode. Check :doc:`limitations <../release-notes>`.

.. note::
    To perform Firmware validation and update on NIC devices, NIC Configuration Operator requires a persistent storage set up in the cluster.
    To set up a persistent NFS storage in the cluster, the `example from the CSI NFS Driver repository <https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/deploy/example/nfs-provisioner/README.md>`_ might be used.
    After deploying the NFS server and NFS CSI driver, the `storage class <https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/deploy/example/storageclass-nfs.yaml>`_ should become available in the cluster. The name of the storage class should then be passed when configuring the NIC Configuration Operator.

First install the Network Operator helm chart with the Maintenance Operator enabled and deploy a NIC Cluster Policy CRD with NIC Configuration Operator enabled:

``values.yaml``:

.. code-block:: yaml

    maintenanceOperator:
      enabled: true

``nicclusterpolicy.yaml``:

.. code-block:: yaml
    :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
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
          # Name of the storage class is provided by the user
          storageClassName: nfs-csi
          availableStorageSize: 1Gi

Observe the NicDevice CRs detected in the cluster. The name of the CR is composed from the node name, NIC type and its serial number:

.. code:: bash

    > kubectl get nicdevices -n nvidia-network-operator

    NAME                      AGE
    node1-1015-mt1627x08307   1m
    node1-101d-mt1952x03330   1m
    node2-1015-mt1627x08305   1m
    node2-101d-mt1952x03327   1m

Discover more information about a specific device:

.. code:: bash

    kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o yaml

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicDevice
    metadata:
      creationTimestamp: "2024-09-21T08:43:08Z"
      generation: 1
      name: node1-101d-mt1952x03327
      namespace: nvidia-network-operator
      ownerReferences:
      - apiVersion: v1
        kind: Node
        name: node1
        uid: 25c4f4e2-f7ba-4ba9-9a87-8056313ffc79
      resourceVersion: "1177095"
      uid: ac6763bf-67c6-4af5-81f8-1aad5da929bf
    spec: {}
    status:
      conditions:
      - type: FirmwareUpdateInProgress
        status: "False"
        reason: DeviceFirmwareSpecEmpty
        message: Device firmware spec is empty, cannot update or validate firmware
        lastTransitionTime: "2024-09-21T08:43:04Z"
      - type: ConfigUpdateInProgress
        status: "False"
        reason: DeviceConfigSpecEmpty
        message: Device configuration spec is empty, cannot update configuration
        lastTransitionTime: "2024-09-21T08:43:08Z"
    firmwareVersion: 22.39.1015
    node: cloud-dev-41
    partNumber: mcx623106ac-cdat
    ports:
    - networkInterface: enp3s0f0np0
      pci: "0000:03:00.0"
      rdmaInterface: mlx5_0
    - networkInterface: enp3s0f1np1
      pci: "0000:03:00.1"
      rdmaInterface: mlx5_1
    psid: mt_0000000436
    serialNumber: mt1952x03327
    type: 101d

Configure and apply the NICFirmwareSource CR:

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicFirmwareSource
    metadata:
      name: connectx6-dx-firmware-22-44-1036
      namespace: nvidia-network-operator
      finalizers:
        - configuration.net.nvidia.com/nic-configuration-operator
    spec:
      # a list of firmware binaries zip archives from the Mellanox website, can point to any url accessible from the cluster
      binUrlSources:
        - https://www.mellanox.com/downloads/firmware/fw-ConnectX6Dx-rel-22_44_1036-MCX623106AC-CDA_Ax-UEFI-14.37.14-FlexBoot-3.7.500.signed.bin.zip

Observe the NICFirmwareSource status:

.. code:: bash

    > kubectl get nicfirmwaresource -n nvidia-network-operator connectx6-dx-firmware-22-44-1036 -o yaml

    ...
    status:
      state: Success
      versions:
        22.44.1036:
        - mt_0000000436

Configure and apply the NicFirmwareTemplate CR:

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicFirmwareTemplate
    metadata:
      name: connectx6dx-config
      namespace: nvidia-network-operator
    spec:
      nodeSelector:
        kubernetes.io/hostname: node1
      nicSelector:
        nicType: "101d"
      template:
        nicFirmwareSourceRef: connectx6dx-firmware-22-44-1036
        updatePolicy: Update

Configure and apply the NicConfigurationTemplate CR:

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicConfigurationTemplate
    metadata:
       name: connectx6-config
       namespace: nvidia-network-operator
    spec:
       nodeSelector:
          feature.node.kubernetes.io/network-sriov.capable: "true"
       nicSelector:
          # nicType selector is mandatory the rest are optional. Only a single type can be specified.
          nicType: 101d
          pciAddresses:
             - "0000:03:00.0"
             - “0000:04:00.0”
          serialNumbers:
             - "mt1952x03327"
       resetToDefault: false # if set, template is ignored, device configuration should reset
       template:
          # numVfs and linkType fields are mandatory, the rest are optional
          numVfs: 2
          linkType: Ethernet
          pciPerformanceOptimized:
             enabled: true
             maxReadRequest: 4096
          roceOptimized:
             enabled: true
             qos:
                trust: dscp
                pfc: "0,0,0,1,0,0,0,0"
          gpuDirectOptimized:
             enabled: true
             env: Baremetal

.. note:: It's not possible to apply more than one template of each kind (NICFirmwareTemplate or NICConfigurationTemplate) to a single device. In this case, no template will be applied and an error event will be emitted for the corresponding NicDevice CR.

.. note:: To use the NIC Configuration Operator functionality together with SR-IOV Network Operator, "mellanox" `plugin should be disabled <https://github.com/k8snetworkplumbingwg/sriov-network-operator/tree/master?tab=readme-ov-file#disabling-sr-iov-config-daemon-plugins>`_ in the SR-IOV Network Operator.

For more information about the CRD API, refer to :doc:`CRD API Reference <crds>`.
For detailed information about firmware parameters and configuration settings, refer to :doc:`Configuration Details <configuration-details>`.

Spec of the NicDevice CR is updated in accordance with the NICFirmwareTemplate and NicConfigurationTemplate CRs matching the device

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.spec}' | yq -P

    template:
      firmware:
          nicFirmwareSourceRef: connectx6dx-firmware-22-44-1036
          updatePolicy: Update
      configuration:
          numVfs: 2
          linkType: Ethernet
          pciPerformanceOptimized:
            enabled: true
          roceOptimized:
            enabled: true
            qos:
                trust: dscp
                pfc: "0,0,0,1,0,0,0,0"
          gpuDirectOptimized:
            enabled: true
            env: Baremetal


Status conditions of the NicDevice CR reflect the status of the configuration update and indicate any errors that might occur during the process

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.status.conditions}' | yq -P

    - type: FirmwareUpdateInProgress
      status: "False"
      reason: DeviceFirmwareConfigMatch
      message: Firmware matches the requested version
      observedGeneration: 4
      lastTransitionTime: "2024-09-21T08:42:23Z"
    - type: ConfigUpdateInProgress
      status: "True"
      reason: UpdateStarted
      message: ""
      lastTransitionTime: "2024-09-21T08:43:08Z"

----------------------------------
NIC Firmware Mismatch Notification
----------------------------------

NIC Configuration Operator updates status conditions of the NicDevice CR to set `FirmwareConfigMatch` condition based on a current NIC firmware:

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.status.conditions}' | yq -P

    - type: FirmwareConfigMatch
      status: "True"
      reason: DeviceFirmwareConfigMatch
      message: Device firmware '20.42.1000' matches to recommended version '20.42.1000'
      lastTransitionTime: "2024-09-21T08:43:10Z"

`FirmwareConfigMatch` condition status is set to `Unknown` if DOCA-OFED Driver is not installed otherwise it notifies if current NIC firmware is recommended or not recommended by DOCA-OFED Driver. E.g.:

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.status.conditions}' | yq -P

   - type: FirmwareConfigMatch
     status: "True"
     reason: DeviceFirmwareConfigMatch
     message: Device firmware '20.42.1000' matches to recommended version '20.42.1000'
     lastTransitionTime: "2024-11-08T09:19:41Z"
