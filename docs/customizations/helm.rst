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
   * - operator.admissionController.enabled
     - Bool
     - False
     - Deploy with admission controller
   * - operator.admissionController.useCertManager
     - Bool
     - True
     - Use cert-manager for generating self-signed certificate
   * - operator.admissionController.certificate.tlsCrt
     - String
     - ""
     - External TLS certificate. Ignored if cert-manager is used
   * - operator.admissionController.certificate.tlsKey
     - String
     - ""
     - External TLS private key. Ignored if cert-manager is used
   * - nfd.enabled
     - Bool
     - True
     - Deploy Node Feature Discovery
   * - nfd.deployNodeFeatureRules
     - Bool
     - True
     - Deploy Node Feature Rules to label the nodes
   * - sriovNetworkOperator.enabled
     - Bool
     - False
     - Deploy SR-IOV Network Operator
   * - sriovNetworkOperator.configDaemonNodeSelectorExtra
     - List
     - node-role.kubernetes.io/worker: ""
     - Additional values for SR-IOV Config Daemon nodes selector
   * - upgradeCRDs
     - Bool
     - True
     - Enable CRDs upgrade with helm pre-install and pre-upgrade hooks
   * - operator.repository
     - String
     - nvcr.io/nvidia
     - Network Operator image repository
   * - operator.image
     - String
     - network-operator
     - Network Operator image name
   * - operator.tag
     - String
     - None
     - Network Operator image tag. If set to ``None``, the chart's ``appVersion`` will be used
   * - operator.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling Network Operator image
   * - operator.cniBinDirectory
     - String
     - /opt/cni/bin
     - Directory, where CNI binaries will be deployed on the nodes. Setting for the sriov-network-operator is set with ``sriov-network-operator.cniBinPath`` parameter. Note that the CNI bin directory should be aligned with the CNI bin directory in the container runtime.
   * - operator.resources
     - Yaml
     - | resources:
       |    limits:
       |        cpu: 500m
       |        memory: 128Mi
       |    requests:
       |        cpu: 5m
       |        memory: 64Mi
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the operator
   * - imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the Network Operator image, if it is not overridden
   * - deployCR
     - Bool
     - False
     - Deploy ``NicClusterPolicy`` custom resource according to the provided parameters
   * - nodeAffinity
     - Yaml
     - | requiredDuringSchedulingIgnoredDuringExecution:
       |    nodeSelectorTerms:
       |        - matchExpressions:
       |            - key: node-role.kubernetes.io/master
       |              operator: DoesNotExist
       |            - key: node-role.kubernetes.io/control-plane
       |              operator: DoesNotExist
     - Configure node affinity settings for Network Operator components
   * - tolerations
     - Yaml
     - ""
     - Set additional tolerations for various Daemonsets deployed by the network operator, e.g. whereabouts, multus, cni-plugins.
   * - useDTK
     - Bool
     - True
     - Enable the use of Driver ToolKit to compile OFED drivers (OpenShift only)

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
SR-IOV Network Operator
=======================

SR-IOV Network Operator Helm chart customization options can be found `here <https://github.com/k8snetworkplumbingwg/sriov-network-operator/blob/master/deployment/sriov-network-operator/README.md>`_. Following is a list of overriden values by NVIDIA Operator Helm Chart:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default in NVIDIA Network Operator
     - Notes
   * - sriov-network-operator.operator.resourcePrefix
     - String
     - nvidia.com
     -
   * - sriov-network-operator.images.operator
     - String
     - nvcr.io/nvidia/mellanox/sriov-network-operator:|sriovnetop-image-tag|
     -
   * - sriov-network-operator.images.sriovConfigDaemon
     - String
     - nvcr.io/nvidia/mellanox/sriov-network-operator-config-daemon:|sriovnetop-image-tag|
     -
   * - sriov-network-operator.images.sriovCni
     - String
     - ghcr.io/k8snetworkplumbingwg/sriov-cni:|sriovnetop-sriov-cni-image-tag|
     - For ARM-based deployments, it is recommended to use the ``ghcr.io/k8snetworkplumbingwg/sriov-cni:v2.8.0-arm64`` image
   * - sriov-network-operator.images.ibSriovCni
     - String
     - ghcr.io/k8snetworkplumbingwg/ib-sriov-cni:|sriovnetop-ib-sriov-cni-image-tag|
     - For ARM-based deployments, it is recommended to use the ``ghcr.io/k8snetworkplumbingwg/ib-sriov-cni:1.1.0-arm64`` image
   * - sriov-network-operator.images.sriovDevicePlugin
     - String
     - ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:|sriovnetop-sriov-device-plugin-image-tag|
     - For ARM-based deployments, it is recommended to use the ``ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:v3.6.2-amd64`` image
   * - sriov-network-operator.images.webhook
     - String
     - nvcr.io/nvidia/mellanox/sriov-network-operator-webhook:|sriovnetop-image-tag|
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


================
MLNX_OFED Driver
================

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - ofedDriver.deploy
     - Bool
     - false
     - Deploy the MLNX_OFED driver container
   * - ofedDriver.repository
     - String
     - nvcr.io/nvidia/mellanox
     - MLNX_OFED driver image repository
   * - ofedDriver.image
     - String
     - doca-driver
     - MLNX_OFED driver image name
   * - ofedDriver.version
     - String
     - |mofed-version|
     - MLNX_OFED driver version
   * - ofedDriver.initContainer.enable
     - Bool
     - true
     - Deploy init container
   * - ofedDriver.initContainer.repository
     - string
     - ghcr.io/mellanox
     - init container image repository
   * - ofedDriver.initContainer.image
     - string
     - network-operator-init-container
     - init container image name
   * - ofedDriver.initContainer.version
     - string
     - |mofed-init-container-version|
     - init container image version
   * - ofedDriver.certConfig.name
     - String
     - ""
     - Custom TLS key/certificate configuration configMap name
   * - ofedDriver.repoConfig.name
     - String
     - ""
     - Private mirror repository configuration configMap name
   * - ofedDriver.terminationGracePeriodSeconds
     - Int
     - 300
     - NVIDIA OFED termination grace periods in seconds
   * - ofedDriver.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the MLNX_OFED driver images
   * - ofedDriver.env
     - List
     - []
     - An optional list of `environment variables <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.29/#envvar-v1-core>`_ passed to the NVIDIA OFED driver image
   * - ofedDriver.startupProbe.initialDelaySeconds
     - Int
     - 10
     - MLNX_OFED startup probe initial delay
   * - ofedDriver.startupProbe.periodSeconds
     - Int
     - 20
     - MLNX_OFED startup probe interval
   * - ofedDriver.livenessProbe.initialDelaySeconds
     - Int
     - 30
     - MLNX_OFED liveness probe initial delay
   * - ofedDriver.livenessProbe.periodSeconds
     - Int
     - 30
     - MLNX_OFED liveness probe interval
   * - ofedDriver.readinessProbe.initialDelaySeconds
     - Int
     - 10
     - MLNX_OFED readiness probe initial delay
   * - ofedDriver.readinessProbe.periodSeconds
     - Int
     - 30
     - MLNX_OFED readiness probe interval
   * - ofedDriver.upgradePolicy.autoUpgrade
     - Bool
     - true
     - A global switch for the automatic upgrade feature. If set to false, all other options are ignored.
   * - ofedDriver.upgradePolicy.maxParallelUpgrades
     - Int
     - 1
     - The amount of nodes that can be upgraded in parallel. 0 means no limit. All nodes will be upgraded in parallel.
   * - ofedDriver.upgradePolicy.safeLoad
     - Bool
     - false
     - Cordon and drain (if enabled) a node before loading the driver on it, requires ``ofedDriver.initContainer`` to be enabled and ``ofedDriver.upgradePolicy.autoUpgrade`` to be true
   * - ofedDriver.upgradePolicy.drain.enable
     - Bool
     - true
     - Options for node drain (``kubectl drain``) before driver reload, if auto upgrade is enabled.
   * - ofedDriver.upgradePolicy.drain.force
     - Bool
     - true
     - Use force drain of pods
   * - ofedDriver.upgradePolicy.drain.podSelector
     - String
     - ""
     - Pod selector to specify which pods will be drained from the node. An empty selector means all pods.
   * - ofedDriver.upgradePolicy.drain.timeoutSeconds
     - Int
     - 300
     - Number of seconds to wait for pod eviction
   * - ofedDriver.upgradePolicy.drain.deleteEmptyDir
     - Bool
     - false
     - Delete pods local storage
   * - ofedDriver.upgradePolicy.waitForCompletion.podSelector
     - String
     - Not set
     - Specifies a label selector for the pods to wait for completion before starting the driver upgrade
   * - ofedDriver.upgradePolicy.waitForCompletion.timeoutSeconds
     - int
     - Not set
     - Specify the length of time in seconds to wait before giving up for workload to finish. Zero means infinite
   * - ofedDriver.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ and limits for the ``mofed-container``
   * - ofedDriver.forcePrecompiled
     - Bool
     - false
     - Fail Mellanox OFED deployment if precompiled OFED driver container image does not exists

======================================
MLNX_OFED Driver Environment Variables
======================================

The following are special environment variables supported by the MLNX_OFED container to configure its behavior:

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
     - | Unload host storage modules prior to loading MLNX_OFED modules:
       |    * ib_isert
       |    * nvme_rdma
       |    * nvmet_rdma
       |    * rpcrdma
       |    * xprtrdma
       |    * ib_srpt
   * - ENABLE_NFSRDMA
     - "false"
     - Enable loading of NFS related storage modules from a MLNX_OFED container
   * - RESTORE_DRIVER_ON_POD_TERMINATION
     - "true"
     - Restore host drivers when a container

In addition, it is possible to specify any environment variables to be exposed to the MLNX_OFED container, such as the standard "HTTP_PROXY", "HTTPS_PROXY", "NO_PROXY".

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
     - Bool
     - true
     - Deploy RDMA shared device plugin
   * - rdmaSharedDevicePlugin.repository
     - String
     - nvcr.io/nvidia/cloud-native
     - RDMA shared device plugin image repository
   * - rdmaSharedDevicePlugin.image
     - String
     - k8s-rdma-shared-dev-plugin
     - RDMA shared device plugin image name
   * - rdmaSharedDevicePlugin.version
     - String
     - |k8s-rdma-shared-dev-plugin-version|
     - RDMA shared device plugin version
   * - rdmaSharedDevicePlugin.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the RDMA Shared device plugin image
   * - rdmaSharedDevicePlugin.resources
     - List
     - See below
     - RDMA shared device plugin resources
   * - rdmaSharedDevicePlugin.useCdi
     - Bool
     - false
     - | Enable Container Device Interface (CDI) mode.
       | **NOTE**: NVIDIA Network Operator does not configure container runtime to enable CDI
   * - rdmaSharedDevicePlugin.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``rdma-shared-dp`` container

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
     - Bool
     - false
     - Deploy SR-IOV Network device plugin
   * - sriovDevicePlugin.repository
     - String
     - ghcr.io/k8snetworkplumbingwg
     - SR-IOV Network device plugin image repository
   * - sriovDevicePlugin.image
     - String
     - sriov-network-device-plugin
     - SR-IOV Network device plugin image name
   * - sriovDevicePlugin.version
     - String
     - |sriov-device-plugin-version|
     - | SR-IOV Network device plugin version
       | For ARM-based deployments, it is recommended to use the ``ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:v3.6.2-amd64`` image
   * - sriovDevicePlugin.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the SR-IOV Network device plugin image
   * - sriovDevicePlugin.resources
     - List
     - See below
     - SR-IOV Network device plugin resources
   * - sriovDevicePlugin.useCdi
     - Bool
     - false
     - | Enable Container Device Interface (CDI) mode.
       | **NOTE**: NVIDIA Network Operator does not configure container runtime to enable CD.
   * - sriovDevicePlugin.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``kube-sriovdp`` container

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
     - false
     - Deploy IB Kubernetes
   * - ibKubernetes.repository
     - string
     - ghcr.io/mellanox
     - IB Kubernetes image repository
   * - ibKubernetes.image
     - string
     - ib-kubernetes
     - IB Kubernetes image name
   * - ibKubernetes.version
     - string
     - |ib-kubernetes-version|
     - IB Kubernetes version
   * - ibKubernetes.imagePullSecrets
     - list
     - []
     - An optional list of references to secrets used for pulling any of the IB Kubernetes images
   * - ibKubernetes.periodicUpdateSeconds
     - int
     - 5
     - Interval of periodic update in seconds
   * - ibKubernetes.pKeyGUIDPoolRangeStart
     - string
     - 02:00:00:00:00:00:00:00
     - Minimal available GUID value to be allocated for the pod
   * - ibKubernetes.pKeyGUIDPoolRangeEnd
     - string
     - 02:FF:FF:FF:FF:FF:FF:FF
     - Maximal available GUID value to be allocated for the pod
   * - ibKubernetes.ufmSecret
     - string
     - See below
     - Name of the Secret with the NVIDIA UFM access credentials, deployed in advance
   * - ibKubernetes.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``ib-kubernetes`` container

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

=================
Secondary Network
=================

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.deploy
     - Bool
     - true
     - Deploy Secondary Network

Specifies components to deploy in order to facilitate a secondary network in Kubernetes. It consists of the following optionally deployed components:

* `Multus-CNI <https://github.com/k8snetworkplumbingwg/multus-cni>`_: Delegate CNI plugin to support secondary networks in Kubernetes
* CNI plugins: Currently only `containernetworking-plugins <https://github.com/containernetworking/plugins>`_ is supported
* IPAM CNI: Currently only `Whereabout IPAM CNI <https://github.com/k8snetworkplumbingwg/whereabouts>`_ is supported as a part of the secondaryNetwork section. NVIDIA-IPAM is configured separately.
* `IPoIB CNI <https://github.com/Mellanox/ipoib-cni>`_: Allows the user to create IPoIB child link and move it to the pod

==========
CNI Plugin
==========

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.cniPlugins.deploy
     - Bool
     - true
     - Deploy CNI Plugins Secondary Network
   * - secondaryNetwork.cniPlugins.image
     - String
     - plugins
     - CNI Plugins image name
   * - secondaryNetwork.cniPlugins.repository
     - String
     - ghcr.io/k8snetworkplumbingwg
     - CNI Plugins image repository
   * - secondaryNetwork.cniPlugins.version
     - String
     - |cni-plugins-version|-amd64
     - CNI Plugins image version
   * - secondaryNetwork.cniPlugins.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the CNI Plugins images
   * - secondaryNetwork.cniPlugins.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``cni-plugins`` container

==========
Multus CNI
==========

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.multus.deploy
     - Bool
     - true
     - Deploy Multus Secondary Network
   * - secondaryNetwork.multus.image
     - String
     - multus-cni
     - Multus image name
   * - secondaryNetwork.multus.repository
     - String
     - ghcr.io/k8snetworkplumbingwg
     - Multus image repository
   * - secondaryNetwork.multus.version
     - String
     - |multus-version|
     - Multus image version
   * - secondaryNetwork.multus.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the Multus images
   * - secondaryNetwork.multus.config
     - String
     - ""
     - Multus CNI config. If empty, the config will be automatically generated from the CNI configuration file of the master plugin (the first file in lexicographical order in the cni-confg-dir).
   * - secondaryNetwork.multus.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``kube-multus`` container

=========
IPoIB CNI
=========

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.ipoib.deploy
     - Bool
     - false
     - Deploy IPoIB CNI
   * - secondaryNetwork.ipoib.image
     - String
     - ipoib-cni
     - IPoIB CNI image name
   * - secondaryNetwork.ipoib.repository
     - String
     - ""
     - IPoIB CNI image repository
   * - secondaryNetwork.ipoib.version
     - String
     - |ipoib-cni-version|
     - IPoIB CNI image version
   * - secondaryNetwork.ipoib.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the IPoIB CNI images
   * - secondaryNetwork.ipoib.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``ipoib-cni`` container

===============
IPAM CNI Plugin
===============

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default
     - Description
   * - secondaryNetwork.ipamPlugin.deploy
     - Bool
     - true
     - Deploy IPAM CNI Plugin Secondary Network
   * - secondaryNetwork.ipamPlugin.image
     - String
     - whereabouts
     - IPAM CNI Plugin image name
   * - secondaryNetwork.ipamPlugin.repository
     - String
     - ghcr.io/k8snetworkplumbingwg
     - IPAM CNI Plugin image repository
   * - secondaryNetwork.ipamPlugin.version
     - String
     - |whereabouts-version|-amd64
     - IPAM CNI Plugin image version
   * - secondaryNetwork.ipamPlugin.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the IPAM CNI Plugin images
   * - secondaryNetwork.ipamPlugin.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``whereabouts`` container

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
     - Bool
     - false
     - Deploy NVIDIA IPAM Plugin
   * - nvIpam.image
     - String
     - nvidia-k8s-ipam
     - NVIDIA IPAM Plugin image name
   * - nvIpam.repository
     - String
     - ghcr.io/mellanox
     - NVIDIA IPAM Plugin image repository
   * - nvIpam.version
     - String
     - |nvidia-ipam-version|
     - NVIDIA IPAM Plugin image version
   * - nvIpam.imagePullSecrets
     - List
     - []
     - An optional list of references to secrets to use for pulling any of the Plugin images
   * - nvIpam.enableWebhook
     - Bool
     - false
     - Enable deployment of the validataion webhook for IPPool CRD
   * - nvIpam.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``nv-ipam-node`` and ``nv-ipam-controller`` containers



.. warning::
   Supported X.509 certificate management system should be available in the cluster to enable the validation webhook. Currently, the supported systems are `certmanager <https://cert-manager.io/>`_ and `Openshift certificate management <https://docs.openshift.com/container-platform/latest/security/certificates/service-serving-certificate.html>`_.

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
     - Bool
     - false
     - Deploy NVIDIA NIC Feature Discovery
   * - nicFeatureDiscovery.image
     - String
     - nic-feature-discovery
     - NVIDIA NIC Feature Discovery image name
   * - nicFeatureDiscovery.repository
     - String
     - ghcr.io/mellanox
     - NVIDIA NIC Feature Discovery repository
   * - nicFeatureDiscovery.version
     - String
     - |nic-feature-discovery-version|
     - NVIDIA NIC Feature Discovery image version
   * - nicFeatureDiscovery.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``nic-feature-discovery`` container

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
     - Bool
     - false
     - Deploy DOCA Telemetry Service
   * - docaTelemetryService.image
     - String
     - doca_telemetry
     - DOCA Telemetry Service image name
   * - docaTelemetryService.repository
     - String
     - nvcr.io/nvidia/doca
     - DOCA Telemetry Service image repository
   * - docaTelemetryService.version
     - String
     - |doca-telemetry-version|
     - DOCA Telemetry Service image version
   * - docaTelemetryService.containerResources
     - List
     - Not set
     - Optional `resource requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ for the ``doca-telemetry-service`` container

=======================
Helm customization file
=======================

.. warning::
   Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.


.. code-block:: bash

   $ helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator
