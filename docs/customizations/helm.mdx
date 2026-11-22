---
title: Helm Chart Customization Options
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

There are various customizations you can do to tailor the deployment of the Network Operator to your cluster needs. You
can find those below.

## General Parameters

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imagePullSecrets | list | `[]` | An optional list of references to secrets to use for pulling any of the Network Operator images. |
| keepNCP | bool | `true` | Preserve a Helm-managed NicClusterPolicy custom resource during chart upgrades. |
| maintenanceOperator.enabled | bool | `false` | Deploy Maintenance Operator. |
| nfd.deployNodeFeatureRules | bool | `true` | Deploy Node Feature Rules to label the nodes with the discovered features. |
| nfd.enabled | bool | `true` | Deploy Node Feature Discovery operator. |
| operator.admissionController.enabled | bool | `false` | Deploy with admission controller. |
| operator.admissionController.useCertManager | bool | `true` | Use cert-manager for generating self-signed certificate. |
| operator.affinity.nodeAffinity | yaml | See the example below the table. | Configure node affinity settings for the operator. |
| operator.cniBinDirectory | string | `"/opt/cni/bin"` | Directory, where CNI binaries will be deployed on the nodes. Setting for the sriov-network-operator is set with ``sriov-network-operator.cniBinPath`` parameter. Note that the CNI bin directory should be aligned with the CNI bin directory in the container runtime. |
| operator.cniNetworkDirectory | string | `"/etc/cni/net.d"` | Directory, where CNI network configuration will be deployed on the nodes. Note that the CNI network directory should be aligned with the CNI network directory in the container runtime. |
| operator.coverage | object | `{"enabled":false}` | Enable Go integration coverage collection (GOCOVERDIR, coverage volume, instrumented image tag). |
| operator.fullnameOverride | string | `""` | Name to be used to replace generated names. |
| operator.image | string | `"network-operator"` | Network Operator image name |
| operator.kubeletRootDir | string | `""` | Directory of the kubelet root on the nodes. Used by the RDMA shared device plugin for --kubelet-root-dir and for device-plugins / plugins_registry hostPath mounts. When empty, the operator uses /var/lib/kubelet and omits --kubelet-root-dir. Set this when kubelet uses a non-default root (for example /var/lib/k0s/kubelet). |
| operator.leaderElection | yaml | See the example below the table. | Leader election settings for the operator controller. |
| operator.leaderElection.renewDeadline | string | `"60s"` | Renew deadline of the leader lease, as a duration such as ``60s``: how long the leader keeps trying to renew before standing down. The lease duration, which is how long a standby waits before taking over, is derived as ``renewDeadline`` plus 5s. Leave empty for the controller-runtime defaults of 10s and 15s. Values below 3s are rejected at startup, since leader election requires the deadline to exceed its retry period with jitter. |
| operator.maintenanceOperator | object | `{"drainControllerRequestorID":"nvidia.network-operator-drain-controller","nodeMaintenanceNamePrefix":"network-operator","nodeMaintenanceNamespace":"default","requestorID":"nvidia.doca-driver-upgrade","useDrainControllerRequestor":false,"useRequestor":false}` | Enable the use of maintenance operator upgrade logic. |
| operator.nameOverride | string | `""` | Name to be used as part of objects name generation. |
| operator.nodeSelector | object | `{}` | Configure node selector settings for the operator. |
| operator.ofedDriver.initContainer.enable | bool | `true` | Deploy init container. |
| operator.ofedDriver.initContainer.image | string | `"network-operator-init-container"` | Init container image name. |
| operator.ofedDriver.initContainer.repository | string | `"nvcr.io/nvidia/mellanox"` | Init container image repository. |
| operator.ofedDriver.initContainer.version | string | `"network-operator-v26.10.0"` | Init container image version. |
| operator.preStopSleepSeconds | int | `25` | Seconds to sleep in ``preStop`` before SIGTERM. Keeps the controller reconciling while MOFED pods begin terminating during graceful node shutdown. Requires Kubernetes >= 1.29 (PodLifecycleSleepAction). Set to ``0`` to disable. |
| operator.priorityClassName | string | `"system-node-critical"` | Priority class for the operator controller. ``system-node-critical`` keeps the controller in the same graceful node shutdown phase as MOFED so it can update ``network.nvidia.com/operator.mofed.wait`` before the node goes down. See https://github.com/Mellanox/network-operator/issues/2954. |
| operator.repository | string | `"nvcr.io/nvidia/cloud-native"` | Network Operator image repository. |
| operator.resources | yaml | See the example below the table. | Optional [resource requests and limits](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the operator. |
| operator.terminationGracePeriodSeconds | int | `30` | Termination grace period for the operator controller. Must be greater than ``preStopSleepSeconds``. |
| operator.tolerations | yaml | See the example below the table. | Set additional tolerations for various Daemonsets deployed by the operator. |
| operator.useDTK | bool | `true` | Enable the use of Driver ToolKit to compile DOCA-OFED Drivers (OpenShift only). |
| sriovNetworkOperator.enabled | bool | `false` | Deploy SR-IOV Network Operator. |
| upgradeCRDs | bool | `true` | Enable CRDs upgrade with helm pre-install and pre-upgrade hooks. |

The default `operator.affinity.nodeAffinity` value:

```yaml
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
```

The default `operator.leaderElection` value:

```yaml
# -- Renew deadline of the leader lease, as a duration such as ``60s``: how long the
# leader keeps trying to renew before standing down. The lease duration, which is how
# long a standby waits before taking over, is derived as ``renewDeadline`` plus 5s.
# Leave empty for the controller-runtime defaults of 10s and 15s. Values below 3s are
# rejected at startup, since leader election requires the deadline to exceed its retry
# period with jitter.
renewDeadline: 60s
```

The default `operator.resources` value:

```yaml
limits:
    cpu: 500m
    memory: 128Mi
requests:
    cpu: 5m
    memory: 64Mi
```

The default `operator.tolerations` value:

```yaml
- key: "node-role.kubernetes.io/master"
  operator: "Equal"
  value: ""
  effect: "NoSchedule"
- key: "node-role.kubernetes.io/control-plane"
  operator: "Equal"
  value: ""
  effect: "NoSchedule"
```

### ImagePullSecrets customization

To provide `imagePullSecrets` object references, you need to specify them using a following structure:

```bash
imagePullSecrets:
  - image-pull-secret1
  - image-pull-secret2
```

## NFD labels

The NFD labels required by the Network Operator and GPU Operator:

| Label | Location |
| --- | --- |
| feature.node.kubernetes.io/pci-15b3.present | Nodes containing NVIDIA Networking hardware |
| feature.node.kubernetes.io/pci-10de.present | Nodes containing NVIDIA GPU hardware |

## Node Feature Discovery

Node Feature Discovery Helm chart customization options can be found [here](https://github.com/kubernetes-sigs/node-feature-discovery/blob/master/deployment/helm/node-feature-discovery/values.yaml). Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

| Name | Type | Default in NVIDIA Network Operator | Notes |
| --- | --- | --- | --- |
| node-feature-discovery.enableNodeFeatureApi | bool | `true` | The Node Feature API enable communication between nfd master and worker through NodeFeature CRs. Otherwise communication is through gRPC. |
| node-feature-discovery.featureGates.NodeFeatureAPI | bool | `true` |  |
| node-feature-discovery.gc.enable | bool | `true` | Specifies whether the NFD Garbage Collector should be created |
| node-feature-discovery.gc.replicaCount | int | `1` | Specifies the number of replicas for the NFD Garbage Collector |
| node-feature-discovery.gc.serviceAccount.create | bool | `false` | disable creation to avoid duplicate serviceaccount creation by master spec above. |
| node-feature-discovery.gc.serviceAccount.name | string | `"node-feature-discovery"` | The name of the service account for garbage collector to use. If not set and create is true, a name is generated using the fullname template and -gc suffix. |
| node-feature-discovery.image.pullPolicy | string | `"IfNotPresent"` |  |
| node-feature-discovery.image.repository | string | `"nvcr.io/nvidia/mellanox/node-feature-discovery"` |  |
| node-feature-discovery.image.tag | string | `"network-operator-v26.10.0"` |  |
| node-feature-discovery.master | yaml | See the example below the table. | NFD master deployment configuration. |
| node-feature-discovery.postDeleteCleanup | bool | `false` | Enable labels cleanup when uninstalling NFD |
| node-feature-discovery.worker | yaml | See the example below the table. | NFD worker daemonset configuration. |

The default `node-feature-discovery.master` value:

```yaml
serviceAccount:
    name: node-feature-discovery
    create: true
config:
    extraLabelNs: ["nvidia.com"]
```

The default `node-feature-discovery.worker` value:

```yaml
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
```

## SR-IOV Network Operator

SR-IOV Network Operator Helm chart customization options can be found [here](https://github.com/k8snetworkplumbingwg/sriov-network-operator/blob/master/deployment/sriov-network-operator-chart/README.md). Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

| Name | Type | Default in NVIDIA Network Operator | Notes |
| --- | --- | --- | --- |
| sriov-network-operator.images.ibSriovCni | string | `"nvcr.io/nvidia/mellanox/ib-sriov-cni:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.operator | string | `"nvcr.io/nvidia/mellanox/sriov-network-operator:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.ovsCni | string | `"nvcr.io/nvidia/mellanox/ovs-cni-plugin:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.rdmaCni | string | `"nvcr.io/nvidia/mellanox/rdma-cni:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.resourcesInjector | string | `"ghcr.io/k8snetworkplumbingwg/network-resources-injector:v1.10.0"` |  |
| sriov-network-operator.images.sriovCni | string | `"nvcr.io/nvidia/mellanox/sriov-cni:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.sriovConfigDaemon | string | `"nvcr.io/nvidia/mellanox/sriov-network-operator-config-daemon:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.sriovDevicePlugin | string | `"nvcr.io/nvidia/mellanox/sriov-network-device-plugin:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.sriovDraDriver | string | `"nvcr.io/nvidia/mellanox/dra-driver-sriov:network-operator-v26.10.0"` |  |
| sriov-network-operator.images.webhook | string | `"nvcr.io/nvidia/mellanox/sriov-network-operator-webhook:network-operator-v26.10.0"` |  |
| sriov-network-operator.operator.admissionControllers | yaml | See the example below the table. | Enable admission controller. |
| sriov-network-operator.operator.admissionControllers.certificates.certManager.enabled | bool | `true` | When enabled, makes use of certificates managed by cert-manager. |
| sriov-network-operator.operator.admissionControllers.certificates.certManager.generateSelfSigned | bool | `true` | When enabled, certificates are generated via cert-manager and then name will match the name of the secrets defined above. |
| sriov-network-operator.operator.admissionControllers.certificates.custom | object | `{"enabled":false}` | If not specified, no secret is created and secrets with the names defined above are expected to exist in the cluster. In that case, the ca.crt must be base64 encoded twice since it ends up being an env variable. |
| sriov-network-operator.operator.resourcePrefix | string | `"nvidia.com"` | Prefix to be used for resources names. |
| sriov-network-operator.sriovOperatorConfig.configDaemonNodeSelector | yaml | See the example below the table. | Selects the nodes to be configured |
| sriov-network-operator.sriovOperatorConfig.deploy | bool | `true` | Deploy ``SriovOperatorConfig`` custom resource |

The default `sriov-network-operator.operator.admissionControllers` value:

```yaml
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
```

The default `sriov-network-operator.sriovOperatorConfig.configDaemonNodeSelector` value:

```yaml
beta.kubernetes.io/os: "linux"
network.nvidia.com/operator.mofed.wait: "false"
# Enable when using together with NIC Configuration Operator to wait until
# all required FW parameters are successfully applied before configuring SR-IOV
# network.nvidia.com/operator.nic-configuration.wait: "false"
```

## Maintenance Operator

Maintenance Operator Helm chart customization options can be found [here](https://github.com/Mellanox/maintenance-operator/blob/main/deployment/maintenance-operator-chart/README.md). Following is a list of overriden values by NVIDIA Network Operator Helm Chart:

| Name | Type | Default in NVIDIA Network Operator | Notes |
| --- | --- | --- | --- |
| maintenance-operator-chart.operator.admissionController.certificates.certManager.enable | bool | `false` | use cert-manager for certificates |
| maintenance-operator-chart.operator.admissionController.certificates.certManager.generateSelfSigned | bool | `false` | generate self-signed certificates with cert-manager |
| maintenance-operator-chart.operator.admissionController.certificates.custom.enable | bool | `false` | enable custom certificates using secrets |
| maintenance-operator-chart.operator.admissionController.certificates.secretNames.operator | string | `"maintenance-webhook-cert"` | secret name containing certificates for the operator admission controller |
| maintenance-operator-chart.operator.admissionController.enable | bool | `false` | enable admission controller of the operator |
| maintenance-operator-chart.operator.image.name | string | `"maintenance-operator"` |  |
| maintenance-operator-chart.operator.image.repository | string | `"nvcr.io/nvidia/mellanox"` |  |
| maintenance-operator-chart.operator.image.tag | string | `"network-operator-v26.10.0"` |  |
| maintenance-operator-chart.operator.resources | yaml | See the example below the table. | Resource requests and limits for the *maintenance-operator* controller. Memory scales with cluster node count (Node informer cache). Defaults match Mellanox/maintenance-operator#225 / PR #243 (256Mi limit / 192Mi request). Raise for larger clusters. Do NOT confuse with top-level `operator.resources`, which sizes the *network-operator* controller, not maintenance-operator. |
| maintenance-operator-chart.operatorConfig | object | `{"deploy":false}` | Deploy MaintenanceOperatorConfig. Maintenance Operator might be already deployed on the cluster, in that case no need to deploy MaintenanceOperatorConfig. |
| maintenance-operator-chart.operatorConfig.deploy | bool | `false` | deploy MaintenanceOperatorConfig CR |

The default `maintenance-operator-chart.operator.resources` value:

```yaml
limits:
    cpu: 500m
    memory: 256Mi
requests:
    cpu: 10m
    memory: 192Mi
```

## Helm customization file

<Warning>
It is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.
</Warning>

```bash
$ helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator
```
