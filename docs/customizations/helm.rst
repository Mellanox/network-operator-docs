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

********************************
Helm Chart Customization Options
********************************

There are various customizations you can do to tailor the deployment of the Network Operator to your cluster needs. You
can find those below.

.. contents::
   :depth: 2
   :local:
   :backlinks: none

==================
General Parameters
==================

.. list-table::
   :header-rows: 1

  
   * - Name
     - Type
     - Default
     - Description
   * - deployCR
     - bool
     - `false`
     -
   * - imagePullSecrets
     - list
     - `[]`
     -
   * - nfd.deployNodeFeatureRules
     - bool
     - `true`
     -
   * - nfd.enabled
     - bool
     - `true`
     -
   * - operator.admissionController.enabled
     - bool
     - `false`
     -
   * - operator.admissionController.useCertManager
     - bool
     - `true`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].key
     - string
     - `"node-role.kubernetes.io/master"`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].operator
     - string
     - `"In"`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]
     - string
     - `""`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight
     - int
     - `1`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[1].preference.matchExpressions[0].key
     - string
     - `"node-role.kubernetes.io/control-plane"`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[1].preference.matchExpressions[0].operator
     - string
     - `"In"`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[1].preference.matchExpressions[0].values[0]
     - string
     - `""`
     -
   * - operator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[1].weight
     - int
     - `1`
     -
   * - operator.cniBinDirectory
     - string
     - `"/opt/cni/bin"`
     -
   * - operator.fullnameOverride
     - string
     - `""`
     -
   * - operator.image
     - string
     - `"network-operator"`
     -
   * - operator.nameOverride
     - string
     - `""`
     -
   * - operator.nodeSelector
     - object
     - `{}`
     -
   * - operator.repository
     - string
     - `"nvcr.io/nvidia/cloud-native"`
     -
   * - operator.resources.limits.cpu
     - string
     - `"500m"`
     -
   * - operator.resources.limits.memory
     - string
     - `"128Mi"`
     -
   * - operator.resources.requests.cpu
     - string
     - `"5m"`
     -
   * - operator.resources.requests.memory
     - string
     - `"64Mi"`
     -
   * - operator.tolerations[0].effect
     - string
     - `"NoSchedule"`
     -
   * - operator.tolerations[0].key
     - string
     - `"node-role.kubernetes.io/master"`
     -
   * - operator.tolerations[0].operator
     - string
     - `"Equal"`
     -
   * - operator.tolerations[0].value
     - string
     - `""`
     -
   * - operator.tolerations[1].effect
     - string
     - `"NoSchedule"`
     -
   * - operator.tolerations[1].key
     - string
     - `"node-role.kubernetes.io/control-plane"`
     -
   * - operator.tolerations[1].operator
     - string
     - `"Equal"`
     -
   * - operator.tolerations[1].value
     - string
     - `""`
     -
   * - operator.useDTK
     - bool
     - `true`
     -
   * - sriovNetworkOperator.enabled
     - bool
     - `false`
     -
   * - test.pf
     - string
     - `"ens2f0"`
     -
   * - upgradeCRDs
     - bool
     - `true`
     -

------------------------------
ImagePullSecrets customization
------------------------------

To provide `imagePullSecrets`` object references, you need to specify them using a following structure:

.. code-block:: bash

   imagePullSecrets:
     - image-pull-secret1
     - image-pull-secret2

==========
NFD labels
==========

The NFD labels required by the Network Operator and GPU Operator:

.. list-table::
   :header-rows: 1

   * - Label
     - Location
   * - feature.node.kubernetes.io/pci-15b3.present
     - Nodes containing NVIDIA Networking hardware
   * - feature.node.kubernetes.io/pci-10de.present
     - Nodes containing NVIDIA GPU hardware

=======================
Node Feature Discovery
=======================

Node Feature Discovery Helm chart customization options can be found `here <https://github.com/kubernetes-sigs/node-feature-discovery/blob/master/deployment/helm/node-feature-discovery/values.yaml>`__. Following is a list of overriden values by NVIDIA Operator Helm Chart:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default in NVIDIA Network Operator
     - Notes
   * - node-feature-discovery.enableNodeFeatureApi
     - bool
     - `true`
     -
   * - node-feature-discovery.master.config.extraLabelNs[0]
     - string
     - `"nvidia.com"`
     -
   * - node-feature-discovery.master.serviceAccount.create
     - bool
     - `true`
     -
   * - node-feature-discovery.master.serviceAccount.name
     - string
     - `"node-feature-discovery"`
     -
   * - node-feature-discovery.worker.config.sources.pci.deviceClassWhitelist[0]
     - string
     - `"0300"`
     -
   * - node-feature-discovery.worker.config.sources.pci.deviceClassWhitelist[1]
     - string
     - `"0302"`
     -
   * - node-feature-discovery.worker.config.sources.pci.deviceLabelFields[0]
     - string
     - `"vendor"`
     -
   * - node-feature-discovery.worker.serviceAccount.create
     - bool
     - `false`
     -
   * - node-feature-discovery.worker.serviceAccount.name
     - string
     - `"node-feature-discovery"`
     -
   * - node-feature-discovery.worker.tolerations[0].effect
     - string
     - `"NoSchedule"`
     -
   * - node-feature-discovery.worker.tolerations[0].key
     - string
     - `"node-role.kubernetes.io/master"`
     -
   * - node-feature-discovery.worker.tolerations[0].operator
     - string
     - `"Exists"`
     -
   * - node-feature-discovery.worker.tolerations[1].effect
     - string
     - `"NoSchedule"`
     -
   * - node-feature-discovery.worker.tolerations[1].key
     - string
     - `"node-role.kubernetes.io/control-plane"`
     -
   * - node-feature-discovery.worker.tolerations[1].operator
     - string
     - `"Exists"`
     -
   * - node-feature-discovery.worker.tolerations[2].effect
     - string
     - `"NoSchedule"`
     -
   * - node-feature-discovery.worker.tolerations[2].key
     - string
     - `"nvidia.com/gpu"`
     -
   * - node-feature-discovery.worker.tolerations[2].operator
     - string
     - `"Exists"`
     -

=======================
SR-IOV Network Operator
=======================

SR-IOV Network Operator Helm chart customization options can be found `here <https://github.com/k8snetworkplumbingwg/sriov-network-operator/blob/master/deployment/sriov-network-operator/README.md>`__. Following is a list of overriden values by NVIDIA Operator Helm Chart:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default in NVIDIA Network Operator
     - Notes
   * - sriov-network-operator.images.ibSriovCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/ib-sriov-cni:fc002af57a81855542759d0f77d16dacd7e1aa38"`
     -
   * - sriov-network-operator.images.operator
     - string
     - `"nvcr.io/nvidia/mellanox/sriov-network-operator:network-operator-24.4.1"`
     -
   * - sriov-network-operator.images.ovsCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/ovs-cni-plugin:6f8174b1a47c47657fe9e59fe448f2a452bb6960"`
     -
   * - sriov-network-operator.images.rdmaCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/rdma-cni:v1.1.0"`
     -
   * - sriov-network-operator.images.resourcesInjector
     - string
     - `"ghcr.io/k8snetworkplumbingwg/network-resources-injector:8810e6a127366cc1eb829d3f7cb3f866d096946e"`
     -
   * - sriov-network-operator.images.sriovCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-cni:3e6368077716f6b8368b0e036a1290d1c64cf1fb"`
     -
   * - sriov-network-operator.images.sriovConfigDaemon
     - string
     - `"nvcr.io/nvidia/mellanox/sriov-network-operator-config-daemon:network-operator-24.4.1"`
     -
   * - sriov-network-operator.images.sriovDevicePlugin
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:e6ead1e8f76a407783430ee2666b403db2d76f64"`
     -
   * - sriov-network-operator.images.webhook
     - string
     - `"nvcr.io/nvidia/mellanox/sriov-network-operator-webhook:network-operator-24.4.1"`
     -
   * - sriov-network-operator.operator.admissionControllers.certificates.certManager.enabled
     - bool
     - `true`
     -
   * - sriov-network-operator.operator.admissionControllers.certificates.certManager.generateSelfSigned
     - bool
     - `true`
     -
   * - sriov-network-operator.operator.admissionControllers.certificates.custom.enabled
     - bool
     - `false`
     -
   * - sriov-network-operator.operator.admissionControllers.certificates.secretNames.injector
     - string
     - `"network-resources-injector-cert"`
     -
   * - sriov-network-operator.operator.admissionControllers.certificates.secretNames.operator
     - string
     - `"operator-webhook-cert"`
     -
   * - sriov-network-operator.operator.admissionControllers.enabled
     - bool
     - `false`
     -
   * - sriov-network-operator.operator.resourcePrefix
     - string
     - `"nvidia.com"`
     -
   * - sriov-network-operator.sriovOperatorConfig.configDaemonNodeSelector."beta.kubernetes.io/os"
     - string
     - `"linux"`
     -
   * - sriov-network-operator.sriovOperatorConfig.configDaemonNodeSelector."network.nvidia.com/operator.mofed.wait"
     - string
     - `"false"`
     -
   * - sriov-network-operator.sriovOperatorConfig.deploy
     - bool
     - `true`
     -

===================
Container Resources
===================

Optional `requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ can be configured for each container of the sub-resources deployed by the Network Operator by setting the parameter ``containerResources``.

For example:

.. code-block:: yaml

    containerResources:
    - name: "mofed-container"
      requests:
        cpu: "200m"
        memory: "150Mi"
      limits:
        cpu: "300m"
        memory: "300Mi"

===================
 NVIDIA DOCA Driver
===================

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - ofedDriver.certConfig.name
     - string
     - `""`
     -
   * - ofedDriver.deploy
     - bool
     - `false`
     -
   * - ofedDriver.forcePrecompiled
     - bool
     - `false`
     -
   * - ofedDriver.image
     - string
     - `"doca-driver"`
     -
   * - ofedDriver.initContainer.enable
     - bool
     - `true`
     -
   * - ofedDriver.initContainer.image
     - string
     - `"network-operator-init-container"`
     -
   * - ofedDriver.initContainer.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - ofedDriver.initContainer.version
     - string
     - `"v0.0.2"`
     -
   * - ofedDriver.livenessProbe.initialDelaySeconds
     - int
     - `30`
     -
   * - ofedDriver.livenessProbe.periodSeconds
     - int
     - `30`
     -
   * - ofedDriver.readinessProbe.initialDelaySeconds
     - int
     - `10`
     -
   * - ofedDriver.readinessProbe.periodSeconds
     - int
     - `30`
     -
   * - ofedDriver.repoConfig.name
     - string
     - `""`
     -
   * - ofedDriver.repository
     - string
     - `"nvcr.io/nvidia/mellanox"`
     -
   * - ofedDriver.startupProbe.initialDelaySeconds
     - int
     - `10`
     -
   * - ofedDriver.startupProbe.periodSeconds
     - int
     - `20`
     -
   * - ofedDriver.terminationGracePeriodSeconds
     - int
     - `300`
     -
   * - ofedDriver.upgradePolicy.autoUpgrade
     - bool
     - `true`
     -
   * - ofedDriver.upgradePolicy.drain.deleteEmptyDir
     - bool
     - `true`
     -
   * - ofedDriver.upgradePolicy.drain.enable
     - bool
     - `true`
     -
   * - ofedDriver.upgradePolicy.drain.force
     - bool
     - `true`
     -
   * - ofedDriver.upgradePolicy.drain.podSelector
     - string
     - `""`
     -
   * - ofedDriver.upgradePolicy.drain.timeoutSeconds
     - int
     - `300`
     -
   * - ofedDriver.upgradePolicy.maxParallelUpgrades
     - int
     - `1`
     -
   * - ofedDriver.upgradePolicy.safeLoad
     - bool
     - `false`
     -
   * - ofedDriver.upgradePolicy.waitForCompletion
     - string
     - `nil`
     -
   * - ofedDriver.version
     - string
     - `"24.04-0.6.6.0-0"`
     -

===============================================
NVIDIA DOCA Driver Driver Environment Variables
===============================================

The following are special environment variables supported by the NVIDIA DOCA Driver container to configure its behavior:

.. list-table::
   :header-rows: 1

   * - Name
     - Default
     - Description
   * - CREATE_IFNAMES_UDEV
     - | * "true” for Ubuntu 20.04, RHEL v8.x and OCP <= v4.13.
       | * "false" for newer OS.
     - Create an udev rule to preserve "old-style" path based netdev names e.g enp3s0f0
   * - UNLOAD_STORAGE_MODULES
     - "false"
     - | Unload host storage modules prior to loading NVIDIA DOCA Driver modules:
       |    * ib_isert
       |    * nvme_rdma
       |    * nvmet_rdma
       |    * rpcrdma
       |    * xprtrdma
       |    * ib_srpt
   * - ENABLE_NFSRDMA
     - "false"
     - Enable loading of NFS related storage modules from a NVIDIA DOCA Driver container
   * - RESTORE_DRIVER_ON_POD_TERMINATION
     - "true"
     - Restore host drivers when a container

In addition, it is possible to specify any environment variables to be exposed to the NVIDIA DOCA Driver container, such as the standard "HTTP_PROXY", "HTTPS_PROXY", "NO_PROXY".

.. warning::
   CREATE_IFNAMES_UDEV is set automatically by the Network Operator, depending on the Operating System of the worker nodes in the cluster (the cluster is assumed to be homogenous).

To set these variables, change them into Helm values. For example:

.. code-block:: yaml

    ofedDriver:
      env:
      - name: RESTORE_DRIVER_ON_POD_TERMINATION
        value: "true"
      - name: UNLOAD_STORAGE_MODULES
        value: "true"
      - name: CREATE_IFNAMES_UDEV
        value: "true"

The variables can also be configured directly via the NicClusterPolicy CRD.

=========================
RDMA Shared Device Plugin
=========================

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - rdmaSharedDevicePlugin.deploy
     - bool
     - `true`
     -
   * - rdmaSharedDevicePlugin.image
     - string
     - `"k8s-rdma-shared-dev-plugin"`
     -
   * - rdmaSharedDevicePlugin.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - rdmaSharedDevicePlugin.resources[0].name
     - string
     - `"rdma_shared_device_a"`
     -
   * - rdmaSharedDevicePlugin.resources[0].rdmaHcaMax
     - int
     - `63`
     -
   * - rdmaSharedDevicePlugin.resources[0].vendors[0]
     - string
     - `"15b3"`
     -
   * - rdmaSharedDevicePlugin.useCdi
     - bool
     - `false`
     -
   * - rdmaSharedDevicePlugin.version
     - string
     - `"1.4.0"`
     -

==========================================
RDMA Device Plugin Resource Configurations
==========================================

These configurations consist of a list of RDMA resources, each with a name and a selector of RDMA capable network devices to be associated with the resource. Refer to `RDMA Shared Device Plugin Selectors <https://github.com/Mellanox/k8s-rdma-shared-dev-plugin#devices-selectors>`_ for supported selectors.

.. code-block:: yaml

    resources:
    - name: rdma_shared_device_a
      vendors: [15b3]
      deviceIDs: [1017]
      ifNames: [enp5s0f0]
      rdmaHcaMax: 63
    - name: rdma_shared_device_b
      vendors: [15b3]
      deviceIDs: [1017]
      ifNames: [ib0, ib1]
      rdmaHcaMax: 63

============================
SR-IOV Network Device Plugin
============================

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - sriovDevicePlugin.deploy
     - bool
     - `false`
     -
   * - sriovDevicePlugin.image
     - string
     - `"sriov-network-device-plugin"`
     -
   * - sriovDevicePlugin.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     -
   * - sriovDevicePlugin.resources[0].name
     - string
     - `"hostdev"`
     -
   * - sriovDevicePlugin.resources[0].vendors[0]
     - string
     - `"15b3"`
     -
   * - sriovDevicePlugin.useCdi
     - bool
     - `false`
     -
   * - sriovDevicePlugin.version
     - string
     - `"e6ead1e8f76a407783430ee2666b403db2d76f64"`
     -

===================================================
SR-IOV Network Device Plugin Resource Configuration
===================================================

Consists of a list of RDMA resources, each with a name and a selector of RDMA capable network devices to be associated with the resource. Refer to `SR-IOV Network Device Plugin Selectors <https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin#device-selectors>`_ for supported selectors.

.. code-block:: yaml

    resources:
    - name: hostdev
      vendors: [15b3]
    - name: ethernet_rdma
      vendors: [15b3]
      linkTypes: [ether]
    - name: sriov_rdma
      vendors: [15b3]
      devices: [1018]
      drivers: [mlx5_ib]

=============
IB Kubernetes
=============

ib-kubernetes provides a daemon that works in conjunction with the `SR-IOV Network Device Plugin <https://github.com/openshift/sriov-network-operator>`_. It acts on Kubernetes pod object changes (Create/Update/Delete), reading the pod's network annotation, fetching its corresponding network CRD and reading the PKey. This is done in order to add the newly generated GUID or the predefined GUID in the GUID field of the CRD cni-args to that PKey for pods with ``mellanox.infiniband.app`` annotation.

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - ibKubernetes.deploy
     - bool
     - `false`
     -
   * - ibKubernetes.image
     - string
     - `"ib-kubernetes"`
     -
   * - ibKubernetes.pKeyGUIDPoolRangeEnd
     - string
     - `"02:FF:FF:FF:FF:FF:FF:FF"`
     -
   * - ibKubernetes.pKeyGUIDPoolRangeStart
     - string
     - `"02:00:00:00:00:00:00:00"`
     -
   * - ibKubernetes.periodicUpdateSeconds
     - int
     - `5`
     -
   * - ibKubernetes.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - ibKubernetes.ufmSecret
     - string
     - `""`
     -
   * - ibKubernetes.version
     - string
     - `"v1.0.2"`
     -

==========
UFM Secret
==========

IB Kubernetes must access `NVIDIA UFM <https://www.nvidia.com/en-us/networking/infiniband/ufm/>`_ in order to manage pods' GUIDs. To provide its credentials, the secret of the following format should be deployed in advance:

.. code-block:: yaml

   apiVersion: v1
   kind: Secret
   metadata:
     name: ib-kubernetes-ufm-secret
     namespace: nvidia-network-operator
   stringData:
     UFM_USERNAME: "admin"
     UFM_PASSWORD: "123456"
     UFM_ADDRESS: "ufm-hostname"
     UFM_HTTP_SCHEMA: ""
     UFM_PORT: ""
   data:
     UFM_CERTIFICATE: ""

.. warning::
   The InfiniBand Fabric manages a single pool of GUIDs. In order to use IB Kubernetes in different clusters, different GUID ranges must be specified to avoid collisions.

==================
NVIDIA IPAM Plugin
==================

`NVIDIA IPAM Plugin <https://github.com/Mellanox/nvidia-k8s-ipam>`_ is recommended to be used on large-scale deployments of the NVIDIA Network Operator.

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - nvIpam.deploy
     - bool
     - `false`
     -
   * - nvIpam.enableWebhook
     - bool
     - `false`
     -
   * - nvIpam.image
     - string
     - `"nvidia-k8s-ipam"`
     -
   * - nvIpam.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - nvIpam.version
     - string
     - `"v0.1.2"`
     -

.. warning::
   Supported X.509 certificate management system should be available in the cluster to enable the validation webhook. Currently, the supported systems are `certmanager <https://cert-manager.io/>`_ and `Openshift certificate management <https://docs.openshift.com/container-platform/latest/security/certificates/service-serving-certificate.html>`_.

=================
Secondary Network
=================

Specifies components to deploy in order to facilitate a secondary network in Kubernetes. It consists of the following optionally deployed components:

* `Multus-CNI <https://github.com/k8snetworkplumbingwg/multus-cni>`_: Delegate CNI plugin to support secondary networks in Kubernetes
* CNI plugins: Currently only `containernetworking-plugins <https://github.com/containernetworking/plugins>`_ is supported
* IPAM CNI: Currently only `Whereabout IPAM CNI <https://github.com/k8snetworkplumbingwg/whereabouts>`_ is supported as a part of the secondaryNetwork section. NVIDIA-IPAM is configured separately.
* `IPoIB CNI <https://github.com/Mellanox/ipoib-cni>`_: Allows the user to create IPoIB child link and move it to the pod

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.cniPlugins.deploy
     - bool
     - `true`
     -
   * - secondaryNetwork.cniPlugins.image
     - string
     - `"plugins"`
     -
   * - secondaryNetwork.cniPlugins.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     -
   * - secondaryNetwork.cniPlugins.version
     - string
     - `"v1.3.0"`
     -
   * - secondaryNetwork.deploy
     - bool
     - `true`
     -
   * - secondaryNetwork.ipamPlugin.deploy
     - bool
     - `true`
     -
   * - secondaryNetwork.ipamPlugin.image
     - string
     - `"whereabouts"`
     -
   * - secondaryNetwork.ipamPlugin.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     -
   * - secondaryNetwork.ipamPlugin.version
     - string
     - `"v0.7.0"`
     -
   * - secondaryNetwork.ipoib.deploy
     - bool
     - `false`
     -
   * - secondaryNetwork.ipoib.image
     - string
     - `"ipoib-cni"`
     -
   * - secondaryNetwork.ipoib.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - secondaryNetwork.ipoib.version
     - string
     - `"428715a57c0b633e48ec7620f6e3af6863149ccf"`
     -
   * - secondaryNetwork.multus.deploy
     - bool
     - `true`
     -
   * - secondaryNetwork.multus.image
     - string
     - `"multus-cni"`
     -
   * - secondaryNetwork.multus.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     -
   * - secondaryNetwork.multus.version
     - string
     - `"v3.9.3"`
     -

============================
NVIDIA NIC Feature Discovery
============================

`NVIDIA NIC Feature Discovery <https://github.com/Mellanox/nic-feature-discovery>`_ leverages `Node Feature Discovery <https://kubernetes-sigs.github.io/node-feature-discovery/stable/get-started/index.html>`_ to advertise NIC specific labels on K8s Node objects.

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - nicFeatureDiscovery.deploy
     - bool
     - `false`
     -
   * - nicFeatureDiscovery.image
     - string
     - `"nic-feature-discovery"`
     -
   * - nicFeatureDiscovery.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - nicFeatureDiscovery.version
     - string
     - `"v0.0.1"`
     -

======================
DOCA Telemetry Service
======================
`DOCA Telemetry Service <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/doca/containers/doca_telemetry>`_ exports metrics from NVIDIA NICs on K8s Nodes.

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - docaTelemetryService.deploy
     - bool
     - `false`
     -
   * - docaTelemetryService.image
     - string
     - `"doca_telemetry"`
     -
   * - docaTelemetryService.repository
     - string
     - `"nvcr.io/nvidia/doca"`
     -
   * - docaTelemetryService.version
     - string
     - `"1.16.5-doca2.6.0-host"`
     -

=======================
Helm customization file
=======================

.. warning::
   Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

.. code-block:: bash

   $ helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator
