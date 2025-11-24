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

`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ provides Kubernetes API (Custom Resource Definition) to allow Firmware update and configuration on NVIDIA NICs in a coordinated manner. It deploys a configuration daemon on each of the desired nodes to configure NVIDIA NICs there. NVIDIA NIC Configuration Operator uses `Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_ to prepare a node for maintenance before the actual configuration.

.. warning::
   NVIDIA NIC Configuration Operator does not support FW reset flow for DPU mode. Check :doc:`limitations <../release-notes>`.

.. warning::
   NVIDIA Networking NIC Configuration Operator doesn't support Socket Direct Adapters.

For more information about the CRD API, refer to :doc:`CRD API Reference <crds>`.

=======================================================================
Use of NIC Configuration Operator together with SR-IOV Network Operator
=======================================================================

NIC Configuration Operator can be used together with SR-IOV Network Operator to configure SR-IOV VFs on NVIDIA NICs. In this scenario, NIC Configuration Operator takes on the NIC FW Configuration, while SR-IOV Network Operator configures the SR-IOV VFs.

There are two requirements for the SR-IOV Network Operator to work together with NIC Configuration Operator:

1. `NodeSelector <https://github.com/k8snetworkplumbingwg/sriov-network-operator/tree/master/deployment/sriov-network-operator-chart#sr-iov-operator-configuration-parameters>`_ for the SR-IOV Config Daemon should include the ``network.nvidia.com/operator.nic-configuration.wait: "false"`` label. It's managed by the NIC Configuration Operator and ensures that the SR-IOV Config Daemon is not started before the NIC Configuration is complete and ready.

  .. note::
    When the SR-IOV Network Operator is deployed via the Network Operator Helm chart, the Node Selector should be configured via the `Network Operator Helm chart values <../customizations/helm.html#sr-iov-network-operator>`_.

  ``values.yaml``:

  .. code-block:: yaml

      nfd:
        enabled: true
      maintenanceOperator:
        enabled: true
      sriovNetworkOperator:
        enabled: true
      sriov-network-operator:
        sriovOperatorConfig:
          configDaemonNodeSelector:
            beta.kubernetes.io/os: "linux"
            network.nvidia.com/operator.mofed.wait: "false"
            # Enable when using together with NIC Configuration Operator to wait until
            # all required FW parameters are successfully applied before configuring SR-IOV
            network.nvidia.com/operator.nic-configuration.wait: "false"

2. ``mellanox`` plugin `should be disabled <https://github.com/k8snetworkplumbingwg/sriov-network-operator/tree/master?tab=readme-ov-file#disabling-sr-iov-config-daemon-plugins>`_ in the `SriovOperatorConfig` CR.

  .. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n nvidia-network-operator default --patch '{ "spec": { "disablePlugins": ["mellanox"]} }' --type='merge'

.. warning::
   SR-IOV Network Operator can work together with the NIC Configuration Operator only in ``daemon`` configuration mode. ``systemd`` configuration mode is not supported with this scenario.

=============================================================================
Install the NIC Configuration Operator and observe NIC devices in the cluster
=============================================================================

.. note::
    To perform Firmware validation and update on NIC devices, NIC Configuration Operator requires a persistent storage set up in the cluster.
    To set up a persistent NFS storage in the cluster, the `example from the CSI NFS Driver repository <https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/deploy/example/nfs-provisioner/README.md>`_ might be used.
    After deploying the NFS server and NFS CSI driver, the `storage class <https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/deploy/example/storageclass-nfs.yaml>`_ should become available in the cluster. The name of the storage class should then be passed when configuring the NIC Configuration Operator.
    To disable the Firmware upgrade and validation logic, do not define the ``nicFirmwareStorage`` section in the NicClusterPolicy CR.

.. note::
    On some DGX servers, the configuration update is not successfully applied after the warm reboot. In this case, it is recommended to explicitly reset the NIC's Firmware before the reboot and after updating its non-volatile configuration. This can be achieved by specifying the ``FW_RESET_AFTER_CONFIG_UPDATE`` environment variable in the NicClusterPolicy CR. Please see the commented section in the example below.

First install the Network Operator helm chart with the Maintenance Operator enabled and deploy a NIC Cluster Policy CRD with NIC Configuration Operator and DOCA-OFED Driver enabled:

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
        # Uncomment to explicitely reset the NIC's Firmware before the reboot and after updating its non-volatile configuration.
        # Might be required on DGX servers where configuration update is not successfully applied after the warm reboot.
        # env:
        # - name: "FW_RESET_AFTER_CONFIG_UPDATE"
        #   value: "true"
        nicFirmwareStorage:
          create: true
          pvcName: nic-fw-storage-pvc
          # Name of the storage class is provided by the user
          storageClassName: nfs-csi
          availableStorageSize: 1Gi
      ofedDriver:
        image: doca-driver
        repository: |doca-driver-repository|
        version: |doca-driver-version|
        forcePrecompiled: false
        imagePullSecrets: []
        terminationGracePeriodSeconds: 300
        startupProbe:
          initialDelaySeconds: 10
          periodSeconds: 20
        livenessProbe:
          initialDelaySeconds: 30
          periodSeconds: 30
        readinessProbe:
          initialDelaySeconds: 10
          periodSeconds: 30
        upgradePolicy:
          autoUpgrade: true
          maxParallelUpgrades: 1
          safeLoad: false
          drain:
            enable: true
            force: true
            podSelector: ""
            timeoutSeconds: 300
            deleteEmptyDir: true

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

========================================================
Update NIC Firmware using the NIC Configuration Operator
========================================================
--------------------------------------------
Configure and apply the NICFirmwareSource CR
--------------------------------------------

Deploy the NICFirmwareSource CR:

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/example-nicfwsource-connectx6dx.yaml
    :language: yaml
    :lines: 18-

.. note::
    The ConnectX firmware binaries can be downloaded from the `NVIDIA Networking Firmware Downloads page <https://network.nvidia.com/support/firmware/firmware-downloads/>`_.
    The URLs of the firmware binaries from the website can be directly provided in the binUrlSources field of the NicFirmwareSource CR.

.. note::
    BlueField Bundle (BFB) can be downloaded from the `NVIDIA DOCA Downloads page <https://developer.nvidia.com/doca-downloads?deployment_platform=BlueField&deployment_package=BF-FW-Bundle&installer_type=BFB>`_.
    The file should first be made available in the cluster and then its URL should be provided in the bfbUrlSource field of the NicFirmwareSource CR.

Observe the NICFirmwareSource status:

.. code:: bash

    > kubectl get nicfirmwaresource -n nvidia-network-operator connectx6-dx-firmware-22-44-1036 -o yaml

    ...
    status:
      state: Success
      versions:
        22.44.1036:
        - mt_0000000436

----------------------------------------------
Configure and apply the NicFirmwareTemplate CR
----------------------------------------------

Configure and apply the NicFirmwareTemplate CR:

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/example-nicfirmwaretemplate-connectx6-dx.yaml
    :language: yaml
    :lines: 18-

Spec of the NicDevice CR is updated in accordance with the NICFirmwareTemplate and NicConfigurationTemplate CRs matching the device

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.spec}' | yq -P

    template:
      firmware:
          nicFirmwareSourceRef: connectx6dx-firmware-22-44-1036
          updatePolicy: Update

Status conditions of the NicDevice CR reflect the status of the firmware update and indicate any errors that might occur during the process

.. code-block:: bash

    > kubectl get nicdevice -n nvidia-network-operator node1-101d-mt1952x03327 -o jsonpath='{.status.conditions}' | yq -P

    - type: FirmwareUpdateInProgress
      status: "False"
      reason: DeviceFirmwareConfigMatch
      message: Firmware matches the requested version
      observedGeneration: 4
      lastTransitionTime: "2024-09-21T08:42:23Z"

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


===========================================================
Configure NIC Firmware using the NIC Configuration Operator
===========================================================

---------------------------------------------------
Configure and apply the NicConfigurationTemplate CR
---------------------------------------------------

.. rli:: https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-|network-operator-version|/docs/examples/example-nicconfigurationtemplate-connectx6dx.yaml
    :language: yaml
    :lines: 18-

.. note:: It's not possible to apply more than one template of each kind (NICFirmwareTemplate or NICConfigurationTemplate) to a single device. In this case, no template will be applied and an error event will be emitted for the corresponding NicDevice CR.

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

----------------------------------------------
Observe the status of the configuration update
----------------------------------------------

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

.. note:: If both Firmware update and configuration are applied to a single device, the firmware update should be performed first. The configuration update will be applied after the firmware update is completed.
