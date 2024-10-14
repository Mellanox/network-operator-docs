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
     - Deploy ``NicClusterPolicy`` custom resource according to the provided parameters.
   * - imagePullSecrets
     - list
     - `[]`
     - An optional list of references to secrets to use for pulling any of the Network Operator images.
   * - nfd.deployNodeFeatureRules
     - bool
     - `true`
     - Deploy Node Feature Rules to label the nodes with the discovered features.
   * - nfd.enabled
     - bool
     - `true`
     - Deploy Node Feature Discovery operator.
   * - nicConfigurationOperator.enabled
     - bool
     - `false`
     - Deploy NIC Configuration Operator.
   * - operator.admissionController.enabled
     - bool
     - `false`
     - Deploy with admission controller.
   * - operator.admissionController.useCertManager
     - bool
     - `true`
     - Use cert-manager for generating self-signed certificate.
   * - operator.affinity.nodeAffinity
     - yaml
     - .. code-block:: yaml

          preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 1
                preference:
                  matchExpressions:
                      - key: "node-role.kubernetes.io/master"
                        operator: In
                        values: [""]
              - weight: 1
                preference:
                  matchExpressions:
                      - key: "node-role.kubernetes.io/control-plane"
                        operator: In
                        values: [""]
         
     - Configure node affinity settings for the operator.
   * - operator.cniBinDirectory
     - string
     - `"/opt/cni/bin"`
     - Directory, where CNI binaries will be deployed on the nodes. Setting for  the sriov-network-operator is set with ``sriov-network-operator.cniBinPath`` parameter. Note that the CNI bin directory should be aligned with the CNI bin directory in the container runtime.
   * - operator.fullnameOverride
     - string
     - `""`
     - Name to be used to replace generated names.
   * - operator.image
     - string
     - `"network-operator"`
     - Network Operator image name
   * - operator.nameOverride
     - string
     - `""`
     - Name to be used as part of objects name generation.
   * - operator.nodeSelector
     - object
     - `{}`
     - Configure node selector settings for the operator.
   * - operator.repository
     - string
     - `"nvcr.io/nvstaging/mellanox"`
     - Network Operator image repository.
   * - operator.resources
     - yaml
     - .. code-block:: yaml

          limits:
              cpu: 500m
              memory: 128Mi
          requests:
              cpu: 5m
              memory: 64Mi
         
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the operator.
   * - operator.tolerations
     - yaml
     - .. code-block:: yaml

          - key: "node-role.kubernetes.io/master"
            operator: "Equal"
            value: ""
            effect: "NoSchedule"
          - key: "node-role.kubernetes.io/control-plane"
            operator: "Equal"
            value: ""
            effect: "NoSchedule"
         
     - Set additional tolerations for various Daemonsets deployed by the operator.
   * - operator.useDTK
     - bool
     - `true`
     - Enable the use of Driver ToolKit to compile OFED drivers (OpenShift only).
   * - sriovNetworkOperator.enabled
     - bool
     - `false`
     - Deploy SR-IOV Network Operator.
   * - upgradeCRDs
     - bool
     - `true`
     - Enable CRDs upgrade with helm pre-install and pre-upgrade hooks.

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
     - The Node Feature API enable communication between nfd master and worker through NodeFeature CRs. Otherwise communication is through gRPC.
   * - node-feature-discovery.featureGates.NodeFeatureAPI
     - bool
     - `true`
     -
   * - node-feature-discovery.gc.enable
     - bool
     - `true`
     - Specifies whether the NFD Garbage Collector should be created
   * - node-feature-discovery.gc.replicaCount
     - int
     - `1`
     - Specifies the number of replicas for the NFD Garbage Collector
   * - node-feature-discovery.gc.serviceAccount.create
     - bool
     - `false`
     - disable creation to avoid duplicate serviceaccount creation by master spec above.
   * - node-feature-discovery.gc.serviceAccount.name
     - string
     - `"node-feature-discovery"`
     - The name of the service account for garbage collector to use. If not set and create is true, a name is generated using the fullname template and -gc suffix.
   * - node-feature-discovery.master
     - yaml
     - .. code-block:: yaml

          serviceAccount:
              name: node-feature-discovery
              create: true
          config:
              extraLabelNs: ["nvidia.com"]
         
     - NFD master deployment configuration.
   * - node-feature-discovery.worker
     - yaml
     - .. code-block:: yaml

          serviceAccount:
              # disable creation to avoid duplicate serviceaccount creation by master spec
              # above
              name: node-feature-discovery
              create: false
          tolerations:
              - key: "node-role.kubernetes.io/master"
                operator: "Exists"
                effect: "NoSchedule"
              - key: "node-role.kubernetes.io/control-plane"
                operator: "Exists"
                effect: "NoSchedule"
              - key: nvidia.com/gpu
                operator: Exists
                effect: NoSchedule
          config:
              sources:
                  pci:
                      deviceClassWhitelist:
                          - "0300"
                          - "0302"
                      deviceLabelFields:
                          - vendor
         
     - NFD worker daemonset configuration.

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
     - `"ghcr.io/k8snetworkplumbingwg/ib-sriov-cni:v1.1.1"`
     -
   * - sriov-network-operator.images.operator
     - string
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator:network-operator-24.10.0-beta.3"`
     -
   * - sriov-network-operator.images.ovsCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/ovs-cni-plugin:v0.34.0"`
     -
   * - sriov-network-operator.images.resourcesInjector
     - string
     - `"ghcr.io/k8snetworkplumbingwg/network-resources-injector:8810e6a127366cc1eb829d3f7cb3f866d096946e"`
     -
   * - sriov-network-operator.images.sriovCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-cni:v2.8.1"`
     -
   * - sriov-network-operator.images.sriovConfigDaemon
     - string
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator-config-daemon:network-operator-24.10.0-beta.3"`
     -
   * - sriov-network-operator.images.sriovDevicePlugin
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:v3.7.0"`
     -
   * - sriov-network-operator.images.webhook
     - string
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator-webhook:network-operator-24.10.0-beta.3"`
     -
   * - sriov-network-operator.operator.admissionControllers
     - yaml
     - .. code-block:: yaml

          enabled: false
          certificates:
              secretNames:
                  operator: "operator-webhook-cert"
                  injector: "network-resources-injector-cert"
              certManager:
                  # -- When enabled, makes use of certificates managed by cert-manager.
                  enabled: true
                  # -- When enabled, certificates are generated via cert-manager and then
                  # name will match the name of the secrets defined above.
                  generateSelfSigned: true
              # -- If not specified, no secret is created and secrets with the names
              # defined above are expected to exist in the cluster. In that case,
              # the ca.crt must be base64 encoded twice since it ends up being an env variable.
              custom:
                  enabled: false
          #   operator:
          #     caCrt: |
          #       -----BEGIN CERTIFICATE-----
          #       MIIMIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G
          #       ...
          #       -----END CERTIFICATE-----
          #     tlsCrt: |
          #       -----BEGIN CERTIFICATE-----
          #       MIIMIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G
          #       ...
          #       -----END CERTIFICATE-----
          #     tlsKey: |
          #       -----BEGIN EC PRIVATE KEY-----
          #       MHcl4wOuDwKQa+upc8GftXE2C//4mKANBC6It01gUaTIpo=
          #       ...
          #      -----END EC PRIVATE KEY-----
          #   injector:
          #     caCrt: |
          #       -----BEGIN CERTIFICATE-----
          #       MIIMIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G
          #       ...
          #       -----END CERTIFICATE-----
          #     tlsCrt: |
          #       -----BEGIN CERTIFICATE-----
          #       MIIMIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G
          #       ...
          #       -----END CERTIFICATE-----
          #     tlsKey: |
          #       -----BEGIN EC PRIVATE KEY-----
          #       MHcl4wOuDwKQa+upc8GftXE2C//4mKANBC6It01gUaTIpo=
          #       ...
          #      -----END EC PRIVATE KEY-----
         
     - Enable admission controller.
   * - sriov-network-operator.operator.admissionControllers.certificates.certManager.enabled
     - bool
     - `true`
     - When enabled, makes use of certificates managed by cert-manager.
   * - sriov-network-operator.operator.admissionControllers.certificates.certManager.generateSelfSigned
     - bool
     - `true`
     - When enabled, certificates are generated via cert-manager and then name will match the name of the secrets defined above.
   * - sriov-network-operator.operator.admissionControllers.certificates.custom
     - object
     - `{"enabled":false}`
     - If not specified, no secret is created and secrets with the names defined above are expected to exist in the cluster. In that case, the ca.crt must be base64 encoded twice since it ends up being an env variable.
   * - sriov-network-operator.operator.resourcePrefix
     - string
     - `"nvidia.com"`
     - Prefix to be used for resources names.
   * - sriov-network-operator.sriovOperatorConfig.configDaemonNodeSelector
     - yaml
     - .. code-block:: yaml

          beta.kubernetes.io/os: "linux"
          network.nvidia.com/operator.mofed.wait: "false"
         
     - Selects the nodes to be configured
   * - sriov-network-operator.sriovOperatorConfig.deploy
     - bool
     - `true`
     - Deploy ``SriovOperatorConfig`` custom resource

==========================
NIC Configuration Operator
==========================

NIC Configuration Operator Helm chart customization options can be found `here <https://github.com/Mellanox/nic-configuration-operator/blob/main/deployment/nic-configuration-operator-chart/README.md>`__. Following is a list of overriden values by NVIDIA Operator Helm Chart:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default in NVIDIA Network Operator
     - Notes
   * - nic-configuration-operator-chart.configDaemon.image.name
     - string
     - `"nic-configuration-operator-daemon"`
     -
   * - nic-configuration-operator-chart.configDaemon.image.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - nic-configuration-operator-chart.configDaemon.image.tag
     - string
     - `"v0.1.1"`
     -
   * - nic-configuration-operator-chart.operator.image.name
     - string
     - `"nic-configuration-operator"`
     -
   * - nic-configuration-operator-chart.operator.image.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - nic-configuration-operator-chart.operator.image.tag
     - string
     - `"v0.1.1"`
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
     - Custom TLS key/certificate configuration configMap name.
   * - ofedDriver.deploy
     - bool
     - `false`
     - Deploy the  NVIDIA DOCA Driver driver container.
   * - ofedDriver.forcePrecompiled
     - bool
     - `false`
     - Fail Mellanox OFED deployment if precompiled OFED driver container image does not exists.
   * - ofedDriver.image
     - string
     - `"doca-driver"`
     - NVIDIA DOCA Driver image name.
   * - ofedDriver.initContainer.enable
     - bool
     - `true`
     - Deploy init container.
   * - ofedDriver.initContainer.image
     - string
     - `"network-operator-init-container"`
     - Init container image name.
   * - ofedDriver.initContainer.repository
     - string
     - `"ghcr.io/mellanox"`
     - Init container image repository.
   * - ofedDriver.initContainer.version
     - string
     - `"v0.0.2"`
     - Init container image version.
   * - ofedDriver.livenessProbe.initialDelaySeconds
     - int
     - `30`
     - NVIDIA DOCA Driver liveness probe initial delay.
   * - ofedDriver.livenessProbe.periodSeconds
     - int
     - `30`
     - NVIDIA DOCA Driver liveness probe interval.
   * - ofedDriver.readinessProbe.initialDelaySeconds
     - int
     - `10`
     - NVIDIA DOCA Driver readiness probe initial delay.
   * - ofedDriver.readinessProbe.periodSeconds
     - int
     - `30`
     - NVIDIA DOCA Driver readiness probe interval.
   * - ofedDriver.repoConfig
     - yaml
     - .. code-block:: yaml

          name: ""
         
     - Private mirror repository configuration.
   * - ofedDriver.repository
     - string
     - `"nvcr.io/nvstaging/mellanox"`
     - NVIDIA DOCA Driver image repository.
   * - ofedDriver.startupProbe.initialDelaySeconds
     - int
     - `10`
     - NVIDIA DOCA Driver startup probe initial delay.
   * - ofedDriver.startupProbe.periodSeconds
     - int
     - `20`
     - NVIDIA DOCA Driver startup probe interval.
   * - ofedDriver.terminationGracePeriodSeconds
     - int
     - `300`
     - The grace period before the driver containeris forcibly removed.
   * - ofedDriver.upgradePolicy.autoUpgrade
     - bool
     - `true`
     - Global switch for automatic upgrade feature, if set to false all other options are ignored.
   * - ofedDriver.upgradePolicy.drain
     - yaml
     - .. code-block:: yaml

          # -- Options for node drain (``kubectl drain``) before driver reload, if
          # auto upgrade is enabled.
          enable: true
          # -- Use force drain of pods.
          force: true
          # -- Pod selector to specify which pods will be drained from the node.
          # An empty selector means all pods.
          podSelector: ""
          # -- It's recommended to set a timeout to avoid infinite drain in case
          # non-fatal error keeps happening on retries.
          timeoutSeconds: 300
          # -- Delete pods local storage.
          deleteEmptyDir: true
         
     - Options for node drain (`kubectl drain`) before the driver reload. If auto upgrade is enabled but drain.enable is false, then driver POD will be reloaded immediately without removing PODs from the node.
   * - ofedDriver.upgradePolicy.drain.deleteEmptyDir
     - bool
     - `true`
     - Delete pods local storage.
   * - ofedDriver.upgradePolicy.drain.enable
     - bool
     - `true`
     - Options for node drain (``kubectl drain``) before driver reload, if auto upgrade is enabled.
   * - ofedDriver.upgradePolicy.drain.force
     - bool
     - `true`
     - Use force drain of pods.
   * - ofedDriver.upgradePolicy.drain.podSelector
     - string
     - `""`
     - Pod selector to specify which pods will be drained from the node. An empty selector means all pods.
   * - ofedDriver.upgradePolicy.drain.timeoutSeconds
     - int
     - `300`
     - It's recommended to set a timeout to avoid infinite drain in case non-fatal error keeps happening on retries.
   * - ofedDriver.upgradePolicy.maxParallelUpgrades
     - int
     - `1`
     - Number of nodes that can be upgraded in parallel (default: 1). 0 means no limit, all nodes will be upgraded in parallel.
   * - ofedDriver.upgradePolicy.safeLoad
     - bool
     - `false`
     - Cordon and drain (if enabled) a node before loading the driver on it.
   * - ofedDriver.upgradePolicy.waitForCompletion
     - string
     - `nil`
     -
   * - ofedDriver.version
     - string
     - `"24.10-0.4.6.0-0"`
     - NVIDIA DOCA Driver version.

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
     - Enable loading of NFS & NVME related storage modules from a NVIDIA DOCA Driver container
   * - RESTORE_DRIVER_ON_POD_TERMINATION
     - "true"
     - Restore host drivers when a container

In addition, it is possible to specify any environment variables to be exposed to the NVIDIA DOCA Driver container, such as the standard "HTTP_PROXY", "HTTPS_PROXY", "NO_PROXY".

.. warning::
   CREATE_IFNAMES_UDEV is set automatically by the Network Operator, depending on the Operating System of the worker nodes in the cluster (the cluster is assumed to be homogenous).

.. warning::
  When ENABLE_NFSRDMA is set to `true`, it is not possible to load NVME related storage modules from NVIDIA DOCA Driver container when they are in use by the system
  (e.g the system has NVMe SSD drives in use). User should ensure the modules are not in use and blacklist them prior to the use of NVIDIA DOCA Driver container.

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
     - Deploy RDMA shared device plugin.
   * - rdmaSharedDevicePlugin.image
     - string
     - `"k8s-rdma-shared-dev-plugin"`
     - RDMA shared device plugin image name.
   * - rdmaSharedDevicePlugin.repository
     - string
     - `"ghcr.io/mellanox"`
     - RDMA shared device plugin image repository.
   * - rdmaSharedDevicePlugin.resources
     - yaml
     - .. code-block:: yaml

          - name: rdma_shared_device_a
            vendors: [15b3]
            rdmaHcaMax: 63
         
     - The following defines the RDMA resources in the cluster. It must be provided by the user when deploying the chart. Each entry in the resources element will create a resource with the provided <name> and list of devices.
   * - rdmaSharedDevicePlugin.useCdi
     - bool
     - `false`
     - Enable Container Device Interface (CDI) mode. **NOTE**: NVIDIA Network Operator does not configure container runtime to enable CDI.
   * - rdmaSharedDevicePlugin.version
     - string
     - `"sha-4f3eb2224b8b5f97be3f17441ddee8d41753b7d5"`
     - RDMA shared device plugin version.

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
     - Deploy SR-IOV Network device plugin.
   * - sriovDevicePlugin.image
     - string
     - `"sriov-network-device-plugin"`
     - SR-IOV Network device plugin image name.
   * - sriovDevicePlugin.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     - SR-IOV Network device plugin image repository.
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
     - Enable Container Device Interface (CDI) mode. **NOTE**: NVIDIA Network Operator does not configure container runtime to enable CD.
   * - sriovDevicePlugin.version
     - string
     - `"v3.7.0"`
     - SR-IOV Network device plugin version

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
     - Deploy IB Kubernetes.
   * - ibKubernetes.image
     - string
     - `"ib-kubernetes"`
     - IB Kubernetes image name.
   * - ibKubernetes.pKeyGUIDPoolRangeEnd
     - string
     - `"02:FF:FF:FF:FF:FF:FF:FF"`
     - Maximal available GUID value to be allocated for the pod.
   * - ibKubernetes.pKeyGUIDPoolRangeStart
     - string
     - `"02:00:00:00:00:00:00:00"`
     - Minimal available GUID value to be allocated for the pod.
   * - ibKubernetes.periodicUpdateSeconds
     - int
     - `5`
     - Interval of periodic update in seconds.
   * - ibKubernetes.repository
     - string
     - `"ghcr.io/mellanox"`
     - IB Kubernetes image repository.
   * - ibKubernetes.ufmSecret
     - string
     - `""`
     - Name of the Secret with the NVIDIA UFM access credentials, deployed in advance.
   * - ibKubernetes.version
     - string
     - `"v1.1.0"`
     - IB Kubernetes version.

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
     - `true`
     - Deploy NVIDIA IPAM Plugin.
   * - nvIpam.enableWebhook
     - bool
     - `false`
     - Enable deployment of the validataion webhook for IPPool CRD.
   * - nvIpam.image
     - string
     - `"nvidia-k8s-ipam"`
     - NVIDIA IPAM Plugin image name.
   * - nvIpam.repository
     - string
     - `"ghcr.io/mellanox"`
     - NVIDIA IPAM Plugin image repository.
   * - nvIpam.version
     - string
     - `"v0.2.0"`
     - NVIDIA IPAM Plugin image version.

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
     - Deploy CNI Plugins Secondary Network.
   * - secondaryNetwork.cniPlugins.image
     - string
     - `"plugins"`
     - CNI Plugins image name.
   * - secondaryNetwork.cniPlugins.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     - CNI Plugins image repository.
   * - secondaryNetwork.cniPlugins.version
     - string
     - `"v1.5.0"`
     - CNI Plugins image version.
   * - secondaryNetwork.deploy
     - bool
     - `true`
     - Deploy Secondary Network.
   * - secondaryNetwork.ipamPlugin.deploy
     - bool
     - `false`
     - Deploy IPAM CNI Plugin Secondary Network.
   * - secondaryNetwork.ipamPlugin.image
     - string
     - `"whereabouts"`
     - IPAM CNI Plugin image name.
   * - secondaryNetwork.ipamPlugin.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     - IPAM CNI Plugin image repository.
   * - secondaryNetwork.ipamPlugin.version
     - string
     - `"v0.7.0"`
     - IPAM CNI Plugin image version.
   * - secondaryNetwork.ipoib.deploy
     - bool
     - `false`
     - Deploy IPoIB CNI.
   * - secondaryNetwork.ipoib.image
     - string
     - `"ipoib-cni"`
     - IPoIB CNI image name.
   * - secondaryNetwork.ipoib.repository
     - string
     - `"ghcr.io/mellanox"`
     - IPoIB CNI image repository.
   * - secondaryNetwork.ipoib.version
     - string
     - `"v1.2.0"`
     - IPoIB CNI image version.
   * - secondaryNetwork.multus.deploy
     - bool
     - `true`
     - Deploy Multus Secondary Network.
   * - secondaryNetwork.multus.image
     - string
     - `"multus-cni"`
     - Multus image name.
   * - secondaryNetwork.multus.repository
     - string
     - `"ghcr.io/k8snetworkplumbingwg"`
     - Multus image repository.
   * - secondaryNetwork.multus.version
     - string
     - `"v4.1.0"`
     - Multus image version.

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
     - Deploy NVIDIA NIC Feature Discovery.
   * - nicFeatureDiscovery.image
     - string
     - `"nic-feature-discovery"`
     - NVIDIA NIC Feature Discovery image name.
   * - nicFeatureDiscovery.repository
     - string
     - `"ghcr.io/mellanox"`
     - NVIDIA NIC Feature Discovery repository.
   * - nicFeatureDiscovery.version
     - string
     - `"v0.0.1"`
     - NVIDIA NIC Feature Discovery image version.

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
     - Deploy DOCA Telemetry Service.
   * - docaTelemetryService.image
     - string
     - `"doca_telemetry"`
     - DOCA Telemetry Service image name.
   * - docaTelemetryService.repository
     - string
     - `"nvcr.io/nvidia/doca"`
     - DOCA Telemetry Service image repository.
   * - docaTelemetryService.version
     - string
     - `"1.16.5-doca2.6.0-host"`
     - DOCA Telemetry Service image version.

=======================
Helm customization file
=======================

.. warning::
   Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

.. code-block:: bash

   $ helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator
