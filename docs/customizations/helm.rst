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
   * - imagePullSecrets
     - list
     - `[]`
     - An optional list of references to secrets to use for pulling any of the Network Operator images.
   * - maintenanceOperator.enabled
     - bool
     - `false`
     - Deploy Maintenance Operator.
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
   * - operator.ofedDriver.initContainer.enable
     - bool
     - `true`
     - Deploy init container.
   * - operator.ofedDriver.initContainer.image
     - string
     - `"network-operator-init-container"`
     - Init container image name.
   * - operator.ofedDriver.initContainer.repository
     - string
     - `"ghcr.io/mellanox"`
     - Init container image repository.
   * - operator.ofedDriver.initContainer.version
     - string
     - `"v0.0.3"`
     - Init container image version.
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
     - Enable the use of Driver ToolKit to compile DOCA Drivers (OpenShift only).
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

Node Feature Discovery Helm chart customization options can be found `here <https://github.com/kubernetes-sigs/node-feature-discovery/blob/master/deployment/helm/node-feature-discovery/values.yaml>`__. Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

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

SR-IOV Network Operator Helm chart customization options can be found `here <https://github.com/k8snetworkplumbingwg/sriov-network-operator/blob/master/deployment/sriov-network-operator-chart/README.md>`__. Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

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
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator:network-operator-25.1.0-rc.1"`
     -
   * - sriov-network-operator.images.ovsCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/ovs-cni-plugin:v0.37.0"`
     -
   * - sriov-network-operator.images.resourcesInjector
     - string
     - `"ghcr.io/k8snetworkplumbingwg/network-resources-injector:v1.7.0"`
     -
   * - sriov-network-operator.images.sriovCni
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-cni:v2.8.1"`
     -
   * - sriov-network-operator.images.sriovConfigDaemon
     - string
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator-config-daemon:network-operator-25.1.0-rc.1"`
     -
   * - sriov-network-operator.images.sriovDevicePlugin
     - string
     - `"ghcr.io/k8snetworkplumbingwg/sriov-network-device-plugin:v3.9.0"`
     -
   * - sriov-network-operator.images.webhook
     - string
     - `"nvcr.io/nvstaging/mellanox/sriov-network-operator-webhook:network-operator-25.1.0-rc.1"`
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

NIC Configuration Operator Helm chart customization options can be found `here <https://github.com/Mellanox/nic-configuration-operator/blob/main/deployment/nic-configuration-operator-chart/README.md>`__. Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

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
     - `"v0.1.15"`
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
     - `"v0.1.15"`
     -

====================
Maintenance Operator
====================

Maintenance Operator Helm chart customization options can be found `here <https://github.com/Mellanox/maintenance-operator/blob/main/deployment/maintenance-operator-chart/README.md>`__. Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Default in NVIDIA Network Operator
     - Notes
   * - maintenance-operator-chart.operator.admissionController.certificates.certManager.enable
     - bool
     - `false`
     - use cert-manager for certificates
   * - maintenance-operator-chart.operator.admissionController.certificates.certManager.generateSelfSigned
     - bool
     - `false`
     - generate self-signed certificates with cert-manager
   * - maintenance-operator-chart.operator.admissionController.certificates.custom.enable
     - bool
     - `false`
     - enable custom certificates using secrets
   * - maintenance-operator-chart.operator.admissionController.certificates.secretNames.operator
     - string
     - `"maintenance-webhook-cert"`
     - secret name containing certificates for the operator admission controller
   * - maintenance-operator-chart.operator.admissionController.enable
     - bool
     - `false`
     - enable admission controller of the operator
   * - maintenance-operator-chart.operator.image.name
     - string
     - `"maintenance-operator"`
     -
   * - maintenance-operator-chart.operator.image.repository
     - string
     - `"ghcr.io/mellanox"`
     -
   * - maintenance-operator-chart.operator.image.tag
     - string
     - `"v0.2.0"`
     -

=======================
Helm customization file
=======================

.. warning::
   It is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

.. code-block:: bash

   $ helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator
