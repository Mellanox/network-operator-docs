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
.. include:: ./common/vars.rst

*******************************
Getting Started with Kubernetes
*******************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

=================================
Network Operator Deployment Guide
=================================
.. _here: ./release-notes.html
.. _Kubernetes CRDs: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
.. _Operator SDK: https://github.com/operator-framework/operator-sdk
.. _GPU-Operator: https://github.com/NVIDIA/gpu-operator
.. warning:: The Network Operator Release Notes chapter is available here_.

NVIDIA Network Operator leverages `Kubernetes CRDs`_ and `Operator SDK`_ to manage networking related components in order to enable fast networking, RDMA and GPUDirect for workloads in a Kubernetes cluster. The Network Operator works in conjunction with the GPU-Operator_ to enable GPU-Direct RDMA on compatible systems.

The goal of the Network Operator is to manage the networking related components, while enabling execution of RDMA and GPUDirect RDMA workloads in a Kubernetes cluster. This includes:

* NVIDIA Networking drivers to enable advanced features
* Kubernetes device plugins to provide hardware resources required for an accelerated network
* Kubernetes secondary network components for network intensive workloads

=============
Prerequisites
=============

#. You have the ``kubectl`` and ``helm`` CLIs available on a client machine.

   You can run the following commands to install the Helm CLI:

   .. code-block:: bash

      $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
          && chmod 700 get_helm.sh \
          && ./get_helm.sh

#. Nodes must be configured with a container engine such CRI-O or containerd.

#. If your cluster uses Pod Security Admission (PSA) to restrict the behavior of pods,
   label the namespace for the Operator to set the enforcement policy to privileged:

   .. code-block:: bash

      $ kubectl create ns nvidia-network-operator
      $ kubectl label --overwrite ns nvidia-network-operator pod-security.kubernetes.io/enforce=privileged

#. Node Feature Discovery (NFD) is a dependency for the Operator on each node.
   By default, NFD master and worker are automatically deployed by the Operator.
   If NFD is already running in the cluster, then you must disable deploying NFD when you install the Operator.
   by setting ``nfd.enabled=false`` Helm value

   One way to determine if NFD is already running in the cluster is to check for a NFD label on your nodes:

   .. code-block:: bash

      $ kubectl get nodes -o json | jq '.items[].metadata.labels | keys | any(startswith("feature.node.kubernetes.io"))'

   If the command output is ``true``, then NFD is already running in the cluster.

   .. note::
      NFD needs to support NodeFeatureRules API or it should be configured to expose the needed NIC labels.
      Deploying NFD from either NVIDIA Network Operator or NVIDIA GPU Operator will have the correct configurations for both Operators.

=========================================================
Network Operator Deployment on Vanilla Kubernetes Cluster
=========================================================
.. _Network-Operator Project Sources: https://github.com/Mellanox/network-operator#nicclusterpolicy-crd
.. warning:: It is recommended to have dedicated control plane nodes for Vanilla Kubernetes deployments with NVIDIA Network Operator.

The default installation via Helm as described below will deploy the Network Operator and related CRDs, after which an additional step is required to create a NicClusterPolicy custom resource with the configuration that is desired for the cluster.

For more information on NicClusterPolicy custom resource, please refer to the `Network-Operator Project Sources`_.

The provided Helm chart contains various parameters to facilitate the creation of a NicClusterPolicy custom resource upon deployment.

.. warning:: Each Network Operator Release has a set of default version values for the various components it deploys. It is recommended that these values will not be changed. Testing and validation were performed with these values, and there is no guarantee of interoperability nor correctness when different versions are used.

Add NVIDIA NGC Helm repository

.. code-block:: bash

   helm repo add nvidia https://helm.ngc.nvidia.com/nvidia

Update Helm repositories

.. code-block:: bash

   helm repo update

Install Network Operator from the NVIDIA NGC chart using the default values:

.. code-block:: bash
   :substitutions:

    helm install network-operator nvidia/network-operator \
      -n nvidia-network-operator \
      --create-namespace \
      --version |network-operator-version| \
      --wait

View deployed resources

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods

Install the Network Operator from the NVIDIA NGC chart using custom values:

.. warning:: Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

.. code-block:: bash
   :substitutions:

   helm show values nvidia/network-operator --version |network-operator-version| > values.yaml

Install with specifying the custom `values.yaml`

.. code-block:: bash
   :substitutions:

    helm install network-operator nvidia/network-operator \
      -n nvidia-network-operator \
      --create-namespace \
      --version |network-operator-version| \
      -f ./values.yaml \
      --wait

===================
Deployment Examples
===================

.. warning:: Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

Below are deployment examples, which the ``values.yaml`` file provided to the Helm during the installation of the network operator. This was achieved by running:

.. code-block:: bash

   helm install -f ./values.yaml -n nvidia-network-operator --create-namespace --wait nvidia/network-operator network-operator

----------------------------------------------------------
Network Operator Deployment with RDMA Shared Device Plugin
----------------------------------------------------------

First install the Network Operator with NFD enabled:

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with
    * DOCA driver
    * RDMA Shared device plugin configured to a netdev with name ens1f0.


Note: You may need to change the interface names in the NicClusterPolicy to those used by your target nodes.

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      rdmaSharedDevicePlugin:
        # [map[ifNames:[ens1f0] name:rdma_shared_device_a]]
        image: k8s-rdma-shared-dev-plugin
        repository: ghcr.io/mellanox
        version: |k8s-rdma-shared-dev-plugin-version|
        imagePullSecrets: []
        # The config below directly propagates to k8s-rdma-shared-device-plugin configuration.
        # Replace 'devices' with your (RDMA capable) netdevice name.
        config: |
          {
            "configList": [
              {
                "resourceName": "rdma_shared_device_a",
                "rdmaHcaMax": 63,
                "selectors": {
                  "vendors": [],
                  "deviceIDs": [],
                  "drivers": [],
                  "ifNames": ["ens1f0"],
                  "linkTypes": []
                }
              }
            ]
          }

--------------------------------------------------------------------------------
Network Operator Deployment with Multiple Resources in RDMA Shared Device Plugin
--------------------------------------------------------------------------------



First install the Network Operator with NFD enabled:

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * RDMA Shared Device pluging with two RDMA resources - the first mapped to ens1f0 and ens1f1 and the second mapped to ens2f0 and ens2f1.

Note: You may need to change the interface names in the NicClusterPolicy to those used by your target nodes.

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      rdmaSharedDevicePlugin:
        # [map[ifNames:[ens1f0 ens1f1] name:rdma_shared_device_a] map[ifNames:[ens2f0 ens2f1] name:rdma_shared_device_b]]
        image: k8s-rdma-shared-dev-plugin
        repository: ghcr.io/mellanox
        version: |k8s-rdma-shared-dev-plugin-version|
        imagePullSecrets: []
        # The config below directly propagates to k8s-rdma-shared-device-plugin configuration.
        # Replace 'devices' with your (RDMA capable) netdevice name.
        config: |
          {
            "configList": [
              {
                "resourceName": "rdma_shared_device_a",
                "rdmaHcaMax": 63,
                "selectors": {
                  "vendors": [],
                  "deviceIDs": [],
                  "drivers": [],
                  "ifNames": ["ens1f0","ens1f1"],
                  "linkTypes": []
                }
              },
              {
                "resourceName": "rdma_shared_device_b",
                "rdmaHcaMax": 63,
                "selectors": {
                  "vendors": [],
                  "deviceIDs": [],
                  "drivers": [],
                  "ifNames": ["ens2f0","ens2f1"],
                  "linkTypes": []
                }
              }
            ]
          }

----------------------------------------------------
Network Operator Deployment with a Secondary Network
----------------------------------------------------

First install the Network Operator with NFD enabled:

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with the following enabled:
    * Secondary network
    * Multus CNI
    * Container-networking-plugins CNI plugins
    * IPAM Plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

--------------------------------------------
Network Operator Deployment with NVIDIA-IPAM
--------------------------------------------

First install the Network Operator with NFD enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with the following enabled:
    * Secondary network
    * Multus CNI
    * Container Networking plugins
    * NVIDIA-IPAM plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
      nvIpam:
        image: nvidia-k8s-ipam
        repository: ghcr.io/mellanox
        version: |nvidia-ipam-version|
        imagePullSecrets: []
        enableWebhook: false


To create an NV-IPAM IPPool, apply:

.. code-block:: yaml

    apiVersion: nv-ipam.nvidia.com/v1alpha1
    kind: IPPool
    metadata:
      name: my-pool
      namespace: nvidia-network-operator
    spec:
      subnet: 192.168.0.0/24
      perNodeBlockSize: 100
      gateway: 192.168.0.1

Example of a MacvlanNetwork that uses NVIDIA-IPAM:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: MacvlanNetwork
    metadata:
      name: example-macvlannetwork
    spec:
      networkNamespace: "default"
      master: "ens2f0"
      mode: "bridge"
      mtu: 1500
      ipam: |
        {
          "type": "nv-ipam",
          "poolName": "my-pool"
        }

------------------------------------------------------
Network Operator Deployment with a Host Device Network
------------------------------------------------------

In this mode, the Network Operator could be deployed on virtualized deployments as well. It supports both Ethernet and InfiniBand modes. From the Network Operator perspective, there is no difference between the deployment procedures. To work on a VM (virtual machine), the PCI passthrough must be configured for SR-IOV devices. The Network Operator works both with VF (Virtual Function) and PF (Physical Function) inside the VMs.

.. warning:: If the Host Device Network is used without the DOCA Driver, the following packages should be installed:

    * the linux-generic package on Ubuntu hosts
    * the kernel-modules-extra package on the RedHat-based hosts

First install the Network Operator with NFD enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * SR-IOV device plugin configured with a single SR-IOV resource pool
    * Secondary network
    * Multus CNI
    * Container Networking plugins
    * IPAM plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      sriovDevicePlugin:
        image: sriov-network-device-plugin
        repository: ghcr.io/k8snetworkplumbingwg
        version: |sriovnetop-sriov-device-plugin-version|
        imagePullSecrets: []
        config: |
          {
            "resourceList": [
              {
                "resourcePrefix": "nvidia.com",
                "resourceName": "hostdev",
                "selectors": {
                  "vendors": ["15b3"],
                  "devices": [],
                  "drivers": [],
                  "pfNames": [],
                  "pciAddresses": [],
                  "rootDevices": [],
                  "linkTypes": [],
                  "isRdma": true
                }
              }
            ]
          }
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []


Following the deployment, the network operator should be configured, and K8s networking should be deployed to use it in pod configuration.

The ``host-device-net.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
      name: hostdev-net
    spec:
      networkNamespace: "default"
      resourceName: "hostdev"
      ipam: |
        {
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "192.168.3.225/28",
          "exclude": [
           "192.168.3.229/30",
           "192.168.3.236/32"
          ],
          "log_file": "/var/log/whereabouts.log",
          "log_level": "info"
        }

The ``host-device-net-ocp.yaml`` configuration file for such a deployment in the OpenShift Platform:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
      name: hostdev-net
    spec:
      networkNamespace: "default"
      resourceName: "hostdev"
      ipam: |
        {
          "type": "whereabouts",
          "range": "192.168.3.225/28",
          "exclude": [
           "192.168.3.229/30",
           "192.168.3.236/32"
          ]
        }

The ``pod.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: hostdev-test-pod
      annotations:
        k8s.v1.cni.cncf.io/networks: hostdev-net
    spec:
      restartPolicy: OnFailure
      containers:
      - image:
        name: mofed-test-ctr
        securityContext:
          capabilities:
            add: [ "IPC_LOCK" ]
        resources:
          requests:
            nvidia.com/hostdev: 1
          limits:
            nvidia.com/hostdev: 1
        command:
        - sh
        - -c
        - sleep inf

--------------------------------------------------------------------------
Network Operator Deployment with a Host Device Network and Macvlan Network
--------------------------------------------------------------------------

In this combined deployment, different NVIDIA NICs are used for RDMA Shared Device Plugin and SR-IOV Network Device Plugin in order to work with a Host Device Network or a Macvlan Network on different NICs. It is impossible to combine different networking types on the same NICs. The same principle should be applied for other networking combinations.

First install the Network Operator with NFD enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed deploy a NicClusterPolicy with:
    * RDMA shared device plugin with
    * SR-IOV device plugin, single SR-IOV resource pool
    * Secondary network
    * Multus CNI
    * Container-networking-plugins CNI plugins
    * RDMA Shared device plugin
    * Whereabouts IPAM CNI plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      rdmaSharedDevicePlugin:
        # [map[linkTypes:[ether] name:rdma_shared_device_a]]
        image: k8s-rdma-shared-dev-plugin
        repository: ghcr.io/mellanox
        version: |k8s-rdma-shared-dev-plugin-version|
        imagePullSecrets: []
        # The config below directly propagates to k8s-rdma-shared-device-plugin configuration.
        # Replace 'devices' with your (RDMA capable) netdevice name.
        config: |
          {
            "configList": [
              {
                "resourceName": "rdma_shared_device_a",
                "rdmaHcaMax": 63,
                "selectors": {
                  "vendors": [],
                  "deviceIDs": [],
                  "drivers": [],
                  "ifNames": [],
                  "linkTypes": ["ether"]
                }
              }
            ]
          }
      sriovDevicePlugin:
        image: sriov-network-device-plugin
        repository: ghcr.io/k8snetworkplumbingwg
        version: |sriovnetop-sriov-device-plugin-version|
        imagePullSecrets: []
        config: |
          {
            "resourceList": [
              {
                "resourcePrefix": "nvidia.com",
                "resourceName": "hostdev",
                "selectors": {
                  "vendors": [],
                  "devices": [],
                  "drivers": [],
                  "pfNames": [],
                  "pciAddresses": [],
                  "rootDevices": [],
                  "linkTypes": ["IB"],
                  "isRdma": true
                }
              }
            ]
          }
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

For pods and network configuration examples please refer to the corresponding sections: Network Operator Deployment with the RDMA Shared Device Plugin and Network Operator Deployment with a Host Device Network.

----------------------------------------------------------------------
Network Operator Deployment with an IP over InfiniBand (IPoIB) Network
----------------------------------------------------------------------


In this mode, the Network Operator could be deployed on virtualized deployments as well. It supports both Ethernet and InfiniBand modes. From the Network Operator perspective, there is no difference between the deployment procedures. To work on a VM (virtual machine), the PCI passthrough must be configured for SR-IOV devices. The Network Operator works both with VF (Virtual Function) and PF (Physical Function) inside the VMs.

First install the Network Operator with NFD enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * RDMA shared device plugin
    * Secondary network
    * Multus CNI
    * IPoIB CNI
    * Whereabouts IPAM CNI plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      rdmaSharedDevicePlugin:
        # [map[ifNames:[ibs1f0] name:rdma_shared_device_a]]
        image: k8s-rdma-shared-dev-plugin
        repository: ghcr.io/mellanox
        version: |k8s-rdma-shared-dev-plugin-version|
        imagePullSecrets: []
        # The config below directly propagates to k8s-rdma-shared-device-plugin configuration.
        # Replace 'devices' with your (RDMA capable) netdevice name.
        config: |
          {
            "configList": [
              {
                "resourceName": "rdma_shared_device_a",
                "rdmaHcaMax": 63,
                "selectors": {
                  "vendors": [],
                  "deviceIDs": [],
                  "drivers": [],
                  "ifNames": ["ibs1f0"],
                  "linkTypes": []
                }
              }
            ]
          }
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipoib:
          image: ipoib-cni
          repository: ghcr.io/mellanox
          version: 428715a57c0b633e48ec7620f6e3af6863149ccf
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

Following the deployment, the network operator should be configured, and K8s networking deployed to use it in the pod configuration.

The ``ipoib-net.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: IPoIBNetwork
    metadata:
      name: example-ipoibnetwork
    spec:
      networkNamespace: "default"
      master: "ibs1f0"
      ipam: |
        {
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "192.168.5.225/28",
          "exclude": [
           "192.168.6.229/30",
           "192.168.6.236/32"
          ],
          "log_file" : "/var/log/whereabouts.log",
          "log_level" : "info",
          "gateway": "192.168.6.1"
        }

The ``ipoib-net-ocp.yaml`` configuration file for such a deployment in the OpenShift Platform:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: IPoIBNetwork
    metadata:
      name: example-ipoibnetwork
    spec:
      networkNamespace: "default"
      master: "ibs1f0"
      ipam: |
        {
          "type": "whereabouts",
          "range": "192.168.5.225/28",
          "exclude": [
           "192.168.6.229/30",
           "192.168.6.236/32"
          ]
        }

The ``pod.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: iboip-test-pod
      annotations:
        k8s.v1.cni.cncf.io/networks: example-ipoibnetwork
    spec:
      restartPolicy: OnFailure
      containers:
      - image:
        name: mofed-test-ctr
        securityContext:
          capabilities:
            add: [ "IPC_LOCK" ]
        resources:
          requests:
            rdma/rdma_shared_device_a: 1
          limits:
            edma/rdma_shared_device_a: 1
        command:
        - sh
        - -c
        - sleep inf

---------------------------------------------------
Network Operator Deployment for GPUDirect Workloads
---------------------------------------------------

GPUDirect requires the following:

* NVIDIA DOCA Driver v5.5-1.0.3.2 or newer
* GPU Operator v1.9.0 or newer
* NVIDIA GPU and driver supporting GPUDirect e.g Quadro RTX 6000/8000 or NVIDIA T4/NVIDIA V100/NVIDIA A100

First install the Network Operator with NFD enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * SR-IOV Device Plugin
    * Secondary network
    * Multus CNI
    * Container Networking plugins
    * IPAM plugin


.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      sriovDevicePlugin:
        image: sriov-network-device-plugin
        repository: ghcr.io/k8snetworkplumbingwg
        version: |sriovnetop-sriov-device-plugin-version|
        imagePullSecrets: []
        config: |
          {
            "resourceList": [
              {
                "resourcePrefix": "nvidia.com",
                "resourceName": "hostdev",
                "selectors": {
                  "vendors": ["15b3"],
                  "devices": [],
                  "drivers": [],
                  "pfNames": [],
                  "pciAddresses": [],
                  "rootDevices": [],
                  "linkTypes": [],
                  "isRdma": true
                }
              }
            ]
          }
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

``host-device-net.yaml:``

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
       name: hostdevice-net
    spec:
      networkNamespace: "default"
      resourceName: "hostdev"
      ipam: |
        {
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "192.168.3.225/28",
          "exclude": [
           "192.168.3.229/30",
           "192.168.3.236/32"
          ],
          "log_file" : "/var/log/whereabouts.log",
          "log_level" : "info"
        }

The ``host-device-net-ocp.yaml`` configuration file for such a deployment in the OpenShift Platform:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
       name: hostdevice-net
    spec:
      networkNamespace: "default"
      resourceName: "hostdev"
      ipam: |
        {
          "type": "whereabouts",
          "range": "192.168.3.225/28",
          "exclude": [
           "192.168.3.229/30",
           "192.168.3.236/32"
          ]
        }

``host-net-gpudirect-pod.yaml``

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: testpod1
      annotations:
         k8s.v1.cni.cncf.io/networks: hostdevice-net
    spec:
      containers:
      - name: appcntr1
        image: <image>
        imagePullPolicy: IfNotPresent
        securityContext:
          capabilities:
            add: ["IPC_LOCK"]
        command:
          - sh
          - -c
          - sleep inf
        resources:
          requests:
            nvidia.com/hostdev: '1'
            nvidia.com/gpu: '1'
          limits:
            nvidia.com/hostdev: '1'
            nvidia.com/gpu: '1'

-------------------------------------------------
Network Operator Deployment in SR-IOV Legacy Mode
-------------------------------------------------

.. _Project Documentation: https://github.com/k8snetworkplumbingwg/sriov-network-operator/
.. warning:: The SR-IOV Network Operator will be deployed with the default configuration. You can override these settings using a CLI argument, or the ‘sriov-network-operator’ section in the values.yaml file. For more information, refer to the `Project Documentation`_.
.. warning:: This deployment mode supports SR-IOV in legacy mode.

First install the Network Operator with NFD and SRIOV Network Operator enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * Secondary network
    * Multus CNI
    * IPoIB CNI
    * IPAM CNI plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

Following the deployment, the Network Operator should be configured, and sriovnetwork node policy and K8s networking should be deployed.

The ``sriovnetwork-node-policy.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: policy-1
      namespace: nvidia-network-operator
    spec:
      deviceType: netdevice
      mtu: 1500
      nicSelector:
        vendor: "15b3"
        pfNames: ["ens2f0"]
      nodeSelector:
        feature.node.kubernetes.io/pci-15b3.present: "true"
      numVfs: 8
      priority: 90
      isRdma: true
      resourceName: sriov_resource

The ``sriovnetwork.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetwork
    metadata:
      name: "example-sriov-network"
      namespace: nvidia-network-operator
    spec:
      vlan: 0
      networkNamespace: "default"
      resourceName: "sriov_resource"
      ipam: |-
        {
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "log_file": "/tmp/whereabouts.log",
          "log_level": "debug",
          "type": "whereabouts",
          "range": "192.168.101.0/24"
        }

.. warning:: The ens2f0 network interface name has been chosen from the following command output: ``kubectl -n nvidia-network-operator get sriovnetworknodestates.sriovnetwork.openshift.io -o yaml``.

.. code-block:: yaml

    ...

    status:
      interfaces:
      - deviceID: 101d
        driver: mlx5_core
        linkSpeed: 100000 Mb/s
        linkType: ETH
        mac: 0c:42:a1:2b:74:ae
        mtu: 1500
        name: ens2f0
        pciAddress: "0000:07:00.0"
        totalvfs: 8
        vendor: 15b3
      - deviceID: 101d
        driver: mlx5_core
        linkType: ETH
        mac: 0c:42:a1:2b:74:af
        mtu: 1500
        name: ens2f1
        pciAddress: "0000:07:00.1"
        totalvfs: 8
        vendor: 15b3

    ...

Wait for all required pods to be spawned:

.. code-block:: bash

    # kubectl get pod -n nvidia-network-operator | grep sriov
    network-operator-sriov-network-operator-544c8dbbb9-vzkmc          1/1     Running   0          5d
    sriov-device-plugin-vwpzn                                         1/1     Running   0          2d6h
    sriov-network-config-daemon-qv467                                 3/3     Running   0          5d
    # kubectl get pod -n nvidia-network-operator
    NAME                                            READY   STATUS    RESTARTS   AGE
    cni-plugins-ds-kbvnm                            1/1     Running   0          5d
    cni-plugins-ds-pcllg                            1/1     Running   0          5d
    kube-multus-ds-5j6ns                            1/1     Running   0          5d
    kube-multus-ds-mxgvl                            1/1     Running   0          5d
    mofed-ubuntu20.04-ds-2zzf4                      1/1     Running   0          5d
    mofed-ubuntu20.04-ds-rfnsw                      1/1     Running   0          5d
    whereabouts-nw7hn                               1/1     Running   0          5d
    whereabouts-zvhrv                               1/1     Running   0          5d
    ...

The ``pod.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: testpod1
      annotations:
        k8s.v1.cni.cncf.io/networks: example-sriov-network
    spec:
      containers:
      - name: appcntr1
        image: <image>
        imagePullPolicy: IfNotPresent
        securityContext:
          capabilities:
            add: ["IPC_LOCK"]
        resources:
          requests:
            nvidia.com/sriov_resource: '1'
          limits:
            nvidia.com/sriov_resource: '1'
        command:
        - sh
        - -c
        - sleep inf

---------------------------------------------------------------------------
SR-IOV Network Operator Deployment – Parallel Node Configuration for SR-IOV
---------------------------------------------------------------------------

.. warning:: This feature is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

To apply SR-IOV configuration on several nodes in parallel, create a ``SriovNetworkPoolConfig`` CR and specify the maximum number or percentage of nodes that can be unavailable at the same time:

``sriov-network-pool-config-number.yaml``

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkPoolConfig
    metadata:
      name: pool-1
      namespace: nvidia-network-operator
    spec:
      maxUnavailable: "20"
      nodeSelector:
        - matchExpressions:
          - key: some-label
            operator: In
            values:
              - val-2
        - matchExpressions:
          - key: other-label
            operator: "Exists"

``sriov-network-pool-config-percent.yaml``

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkPoolConfig
    metadata:
      name: pool-1
      namespace: nvidia-network-operator
    spec:
      maxUnavailable: "10%"
      nodeSelector:
        - matchExpressions:
          - key: some-label
            operator: In
            values:
              - val-2
        - matchExpressions:
          - key: other-label
            operator: "Exists"

--------------------------------------------------------------------------
SR-IOV Network Operator Deployment – Parallel NIC Configuration for SR-IOV
--------------------------------------------------------------------------

.. warning:: This feature is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

To apply SriovNetworkNodePolicy on several nodes in parallel, specify the ``featureGates`` option in the SriovOperatorConfig CRD:

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n nvidia-network-operator default --patch '{ "spec": { "featureGates": { "parallelNicConfig": true  } } }' --type='merge'

---------------------------------------------------------------------------
SR-IOV Network Operator Deployment – SR-IOV Using the systemd Service
---------------------------------------------------------------------------

To enable systemd SR-IOV configuration mode, specify the configurationMode option in the SriovOperatorConfig CRD:

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n nvidia-network-operator default --patch '{ "spec": { "configurationMode": "systemd"} }' --type='merge'

-------------------------------------------------------------
Network Operator Deployment with an SR-IOV InfiniBand Network
-------------------------------------------------------------

Network Operator deployment with InfiniBand network requires the following:

* NVIDIA DOCA Driver and OpenSM running. OpenSM runs on top of the NVIDIA DOCA Driver stack, so both the driver and the subnet manager should come from the same installation. Note that partitions that are configured by OpenSM should specify defmember=full to enable the SR-IOV functionality over InfiniBand. For more details, please refer to this `article <https://docs.mellanox.com/display/MLNXOFEDv51258060/OpenSM>`_.
* InfiniBand device – Both the host device and switch ports must be enabled in InfiniBand mode.
* rdma-core package should be installed when an inbox driver is used.

First install the Network Operator with NFD and SR-IOV Network Operator enabled:
``values.yaml``

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * Secondary network
    * Multus CNI
    * Container Networking Plugins
    * IPAM plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|
          imagePullSecrets: []

``sriov-ib-network-node-policy.yaml``

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: infiniband-sriov
      namespace: nvidia-network-operator
    spec:
      deviceType: netdevice
      mtu: 1500
      nodeSelector:
        feature.node.kubernetes.io/pci-15b3.present: "true"
      nicSelector:
        vendor: "15b3"
      linkType: IB
      isRdma: true
      numVfs: 8
      priority: 90
      resourceName: mlnxnics

``sriov-ib-network.yaml``

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovIBNetwork
    metadata:
      name: example-sriov-ib-network
      namespace: nvidia-network-operator
    spec:
      ipam: |
        {
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "192.168.5.225/28",
          "exclude": [
           "192.168.5.229/30",
           "192.168.5.236/32"
          ],
          "log_file": "/var/log/whereabouts.log",
          "log_level": "info"
        }
      resourceName: mlnxnics
      linkState: enable
      networkNamespace: default

``sriov-ib-network-pod.yaml``

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: test-sriov-ib-pod
      annotations:
        k8s.v1.cni.cncf.io/networks: example-sriov-ib-network
    spec:
      containers:
        - name: test-sriov-ib-pod
          image: centos/tools
          imagePullPolicy: IfNotPresent
          command:
            - sh
            - -c
            - sleep inf
          securityContext:
            capabilities:
              add: [ "IPC_LOCK" ]
          resources:
            requests:
              nvidia.com/mlnxics: "1"
            limits:
              nvidia.com/mlnxics: "1"

----------------------------------------------------------------------------------
Network Operator Deployment with an SR-IOV InfiniBand Network with PKey Management
----------------------------------------------------------------------------------

.. _this article: https://docs.mellanox.com/display/MLNXOFEDv51258060/OpenSM
.. _the project documentation: https://docs.nvidia.com/networking/display/UFMEnterpriseUMv652

Network Operator deployment with InfiniBand network requires the following:

* NVIDIA DOCA Driver and OpenSM running. OpenSM runs on top of the NVIDIA DOCA Driver stack, so both the driver and the subnet manager should come from the same installation. Note that partitions that are configured by OpenSM should specify defmember=full to enable the SR-IOV functionality over InfiniBand. For more details, please refer to `this article`_.
* NVIDIA UFM running on top of OpenSM. For more details, please refer to `the project documentation`_.
* InfiniBand device – Both the host device and the switch ports must be enabled in InfiniBand mode.
* rdma-core package should be installed when an inbox driver is used.


Current limitations:

* Only a single PKey can be configured per workload pod.
* When a single instance of NVIDIA UFM is used with several K8s clusters, different PKey GUID pools should be configured for each cluster.

.. note:: ib-kubernetes provides a daemon that works in conjunction with the `SR-IOV Network Device Plugin <https://github.com/openshift/sriov-network-operator>`_. It acts on Kubernetes pod object changes (Create/Update/Delete), reading the pod's network annotation, fetching its corresponding network CRD and reading the PKey. This is done in order to add the newly generated GUID or the predefined GUID in the GUID field of the CRD cni-args to that PKey for pods with ``mellanox.infiniband.app`` annotation.

.. warning:: `ib-kubernetes-ufm-secret` should be created before NicClusterPolicy.

IB Kubernetes must access `NVIDIA UFM <https://www.nvidia.com/en-us/networking/infiniband/ufm/>`_ in order to manage pods' GUIDs. To provide its credentials, the secret of the following format should be deployed in advance:

``ufm-secret.yaml``

.. code-block:: yaml

    apiVersion: v1
    kind: Secret
    metadata:
      name: ib-kubernetes-ufm-secret
      namespace: nvidia-network-operator
    stringData:
      UFM_USERNAME: "admin"
      UFM_PASSWORD: "123456"
      UFM_ADDRESS: "ufm-host"
      UFM_HTTP_SCHEMA: ""
      UFM_PORT: ""
    data:
      UFM_CERTIFICATE: ""

First install the Network Operator with NFD enabled:
``values.yaml``

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true
      resourcePrefix: "nvidia.com"

Once the Network Operator is installed create a NicClusterPolicy with:
    * DOCA driver
    * ibKubernetes
    * Secondary network
    * Multus CNI
    * Container Networking plugins
    * IPAM Plugin

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
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
      ibKubernetes:
        image: ib-kubernetes
        repository: ghcr.io/mellanox
        version: |ib-kubernetes-version|
        imagePullSecrets: []
        pKeyGUIDPoolRangeStart: 02:00:00:00:00:00:00:00
        pKeyGUIDPoolRangeEnd: 02:FF:FF:FF:FF:FF:FF:FF
        ufmSecret: "ib-kubernetes-ufm-secret"
      nvIpam:
        image: nvidia-k8s-ipam
        repository: ghcr.io/mellanox
        version: |nvidia-ipam-version|
        imagePullSecrets: []
        enableWebhook: false
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []

Create IPPool object for nv-ipam

.. code-block:: yaml

    apiVersion: nv-ipam.nvidia.com/v1alpha1
    kind: IPPool
    metadata:
      name: pool1
      namespace: nvidia-network-operator
    spec:
      subnet: 192.168.0.0/16
      perNodeBlockSize: 100
      gateway: 192.168.0.1
      nodeSelector:
        nodeSelectorTerms:
        - matchExpressions:
            - key: node-role.kubernetes.io/worker
              operator: Exists

Wait for NVIDIA DOCA Driver to install and apply the following CRs:

``sriov-ib-network-node-policy.yaml``

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: infiniband-sriov
      namespace: nvidia-network-operator
    spec:
      deviceType: netdevice
      mtu: 1500
      nodeSelector:
        feature.node.kubernetes.io/pci-15b3.present: "true"
      nicSelector:
        vendor: "15b3"
      linkType: IB
      isRdma: true
      numVfs: 8
      priority: 90
      resourceName: mlnxnics

``sriov-ib-network.yaml``

.. code-block:: yaml

    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: ib-sriov-network
      annotations:
        k8s.v1.cni.cncf.io/resourceName: nvidia.com/mlnxnics
    spec:
      config: '{
      "type": "ib-sriov",
      "cniVersion": "0.3.1",
      "name": "ib-sriov-network",
      "pkey": "0x6",
      "link_state": "enable",
      "ibKubernetesEnabled": true,
      "ipam": {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
    }'

.. note::
    To use the IB network with Pkey management feature with RDMA isolation, use the following ``sriov-ib-network.yaml``:

.. code-block:: yaml

    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: ib-sriov-network
      annotations:
        k8s.v1.cni.cncf.io/resourceName: nvidia.com/mlnxnics
    spec:
      config: '{
      "cniVersion": "0.3.1",
      "name": "ib-sriov-network",
      "plugins": [
      {
        "type": "ib-sriov",
        "pkey": "0x6",
        "link_state": "enable",
        "ibKubernetesEnabled": true,
        "ipam": {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
      },
      {
        "type": "rdma"
      }
      ]
    }'

``sriov-ib-network-pod.yaml``

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: test-sriov-ib-pod
      annotations:
        k8s.v1.cni.cncf.io/networks: ib-sriob-network
    spec:
      containers:
        - name: test-sriov-ib-pod
          image: centos/tools
          imagePullPolicy: IfNotPresent
          command:
            - sh
            - -c
            - sleep inf
          securityContext:
            capabilities:
              add: [ "IPC_LOCK" ]
          resources:
            requests:
              nvidia.com/mlnxics: "1"
            limits:
              nvidia.com/mlnxics: "1"

--------------------------------------------------------------------
Network Operator Deployment for DPDK Workloads with NicClusterPolicy
--------------------------------------------------------------------

.. _HUGEPAGE: http://manpages.ubuntu.com/manpages/focal/man8/hugeadm.8.html

This deployment mode supports DPDK applications. In order to run DPDK applications, HUGEPAGE_ should be configured on the required K8s Worker Nodes. By default, the inbox operating system driver is used. For support of cases with specific requirements, OFED container should be deployed.

Network Operator deployment with:

* Host Device Network
* DPDK pod

``nicclusterpolicy.yaml``

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
      sriovDevicePlugin:
        image: sriov-network-device-plugin
        repository: ghcr.io/k8snetworkplumbingwg
        version: |sriov-device-plugin-version|
         config: |
          {
            "resourceList": [
                {
                    "resourcePrefix": "nvidia.com",
                    "resourceName": "rdma_host_dev",
                    "selectors": {
                        "vendors": ["15b3"],
                        "devices": ["1018"],
                        "drivers": ["mlx5_core"]
                    }
                }
            ]
          }
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|-amd64
        ipamPlugin:
          image: whereabouts
          repository: ghcr.io/k8snetworkplumbingwg
          version: |whereabouts-version|-amd64
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|

``host-device-net.yaml``

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
      name: example-hostdev-net
    spec:
      networkNamespace: "default"
      resourceName: "rdma_host_dev"
      ipam: |
        {
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "192.168.3.225/28",
          "exclude": [
           "192.168.3.229/30",
           "192.168.3.236/32"
          ],
          "log_file" : "/var/log/whereabouts.log",
          "log_level" : "info"
        }

``pod.yaml``

.. code-block:: yaml

    apiVersion: v1
    kind: Pod
    metadata:
      name: testpod1
      annotations:
        k8s.v1.cni.cncf.io/networks: example-hostdev-net
    spec:
      containers:
      - name: appcntr1
        image: <dpdk image>
        imagePullPolicy: IfNotPresent
        securityContext:
          capabilities:
              add: ["IPC_LOCK"]
        volumeMounts:
          - mountPath: /dev/hugepages
            name: hugepage
        resources:
          requests:
            memory: 1Gi
            hugepages-1Gi: 2Gi
            nvidia.com/rdma_host_dev: '1'
        command: [ "/bin/bash", "-c", "--" ]
        args: [ "while true; do sleep 300000; done;" ]
      volumes:
       - name: hugepage
         emptyDir:
           medium: HugePages

-------------------------------------------------------------------------
Network Operator Deployment and OpenvSwitch offload - managed OpenvSwitch
-------------------------------------------------------------------------

.. warning:: This feature is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

.. warning:: To use DOCA Driver container with this mode of operation, set the `RESTORE_DRIVER_ON_POD_TERMINATION` environment variable to `false` in the driver configuration section in the NicClusterPolicy. Restoration to the inbox driver is not supported for this feature.

.. warning:: Tech Preview feature.


In this mode, the sriov-network-operator automatically creates and configures OpenvSwitch bridges.
For more complex scenarios, such as VF lag, you must use the "externally managed OpenvSwitch" feature of the sriov-network-operator,
which is detailed in a separate section of the documentation.


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Network Operator Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Deploy network-operator by Helm with sriov-network-operator and nv-ipam.

First install the Network Operator with NFD enabled:
``values.yaml``

.. code-block:: yaml

    sriovNetworkOperator:
      enabled: true

Once the Network Operator has been installed create a NicClusterPolicy with nv-ipam:

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      nvIpam:
        image: nvidia-k8s-ipam
        repository: ghcr.io/mellanox
        version: |nvidia-ipam-version|
        imagePullSecrets: []
        enableWebhook: false
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []


Enable ``manageSoftwareBridges`` featureGate for sriov-network-operator

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n nvidia-network-operator default --patch '{ "spec": { "featureGates": { "manageSoftwareBridges": true  } } }' --type='merge'
    
Create IPPool object for nv-ipam

.. code-block:: yaml

    apiVersion: nv-ipam.nvidia.com/v1alpha1
    kind: IPPool
    metadata:
      name: pool1
      namespace: nvidia-network-operator
    spec:
      subnet: 192.168.0.0/16
      perNodeBlockSize: 100
      gateway: 192.168.0.1
      nodeSelector:
        nodeSelectorTerms:
        - matchExpressions:
            - key: node-role.kubernetes.io/worker
              operator: Exists


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Prerequisites for Worker Nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Supported operating systems:

* Ubuntu 22.04

OpenvSwitch from the ``NVIDIA DOCA for Host`` package with ``doca-all`` or ``doca-networking`` profile should be installed on each worker node.

Check NVIDIA DOCA `Official installation guide <https://docs.nvidia.com/doca/sdk/nvidia+doca+installation+guide+for+linux/index.html>`_
for details. 

Supported OpenvSwitch dataplanes:

* OVS-kernel

* OVS-doca

Check `OpenvSwitch Offload <https://docs.nvidia.com/doca/sdk/openvswitch+offload+(ovs+in+doca)/index.html>`_ document to know about differences.

^^^^^^^^^^^
OVS-kernel
^^^^^^^^^^^

*These steps are for OVS-kernel data plane, to use OVS-doca follow instructions from the relevant section.*

"""""""""""""""""""""
Prepare Worker Nodes
"""""""""""""""""""""

Configure Open_vSwitch

.. code-block:: bash

    ovs-vsctl set Open_vSwitch . other_config:hw-offload=true

Restart Open_vSwitch

.. code-block:: bash

    systemctl restart openvswitch-switch.service


"""""""""""""""""""""""""""""""""""""
Sriov Network Operator Configuration
"""""""""""""""""""""""""""""""""""""

Create SriovNetworkNodePolicy for selected NIC

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: ovs-switchdev
      namespace: nvidia-network-operator
    spec:
      eSwitchMode: switchdev
      mtu: 1500
      nicSelector:
        deviceID: 101d
        vendor: 15b3
      nodeSelector:
        node-role.kubernetes.io/worker: ""
      numVfs: 4
      isRdma: true
      linkType: ETH
      resourceName: switchdev
      bridge:
        ovs: {}

Create OVSNetwork CR

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: OVSNetwork
    metadata:
      name: ovs
      namespace: nvidia-network-operator
    spec:
      networkNamespace: default
      ipam: |
        {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
      resourceName: switchdev


^^^^^^^^^^^
OVS-doca
^^^^^^^^^^^

*These steps are for OVS-doca data plane, to use OVS-kernel follow instructions from the relevant section.*

"""""""""""""""""""""
Prepare Worker Nodes
"""""""""""""""""""""

Configure hugepages

.. code-block:: bash

    mkdir -p /hugepages
    mount -t hugetlbfs hugetlbfs /hugepages
    echo 4096 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages

*Note: for multi CPU system hugepages should be created for each NUMA node: node0, node1, ...*

Configure system to create hugepages on boot

.. code-block:: bash

    echo "vm.nr_hugepages=8192" > /etc/sysctl.d/99-hugepages.conf

*Note: this example is for a server with two CPU*


Configure Open_vSwitch

.. code-block:: bash

    ovs-vsctl --no-wait set Open_vSwitch . other_config:doca-init=true
    ovs-vsctl set Open_vSwitch . other_config:hw-offload=true

Restart Open_vSwitch

.. code-block:: bash

    systemctl restart openvswitch-switch.service

"""""""""""""""""""""""""""""""""""""
Sriov Network Operator Configuration
"""""""""""""""""""""""""""""""""""""

Create SriovNetworkNodePolicy for selected NIC

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: ovs-switchdev
      namespace: nvidia-network-operator
    spec:
      eSwitchMode: switchdev
      mtu: 1500
      nicSelector:
        deviceID: 101d
        vendor: 15b3
      nodeSelector:
        node-role.kubernetes.io/worker: ""
      numVfs: 4
      isRdma: true
      linkType: ETH
      resourceName: switchdev
      bridge:
        ovs:
          bridge:
            datapathType: netdev
          uplink:
            interface:
              type: dpdk


Create OVSNetwork CR

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: OVSNetwork
    metadata:
      name: ovs
      namespace: nvidia-network-operator
    spec:
      networkNamespace: default
      ipam: |
        {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
      resourceName: switchdev
      interfaceType: dpdk

^^^^^^^^^^^^^^
Test Workload
^^^^^^^^^^^^^^

.. code-block:: yaml

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: ovs-offload
      labels:
        app: ovs-offload
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: ovs-offload
      template:
        metadata:
          labels:
            app: ovs-offload
          annotations:
            k8s.v1.cni.cncf.io/networks: ovs
        spec:
          containers:
          - name: ovs-offload-container
            command: ["/bin/bash", "-c"]
            args:
            - |
              while true; do sleep 1000; done
            image: mellanox/rping-test
            securityContext:
              capabilities:
                add: ["IPC_LOCK"]
            resources:
              requests:
                nvidia.com/switchdev: 1
              limits:
                nvidia.com/switchdev: 1

^^^^^^^^^^^^^^^^^^^
Troubleshooting OVS
^^^^^^^^^^^^^^^^^^^

Please see the following DOCA documentation for OVS hardware offload verification and troubleshooting steps:

* `OVS-Kernel Hardware Offloads <https://docs.nvidia.com/doca/sdk/ovs-kernel+hardware+offloads/index.html>`_

* `OVS-DOCA Hardware Offloads <https://docs.nvidia.com/doca/sdk/ovs-doca+hardware+offloads/index.html>`_


------------------------------------------------------------------------------------------------
Network Operator Deployment and OpenvSwitch offload - externally managed OpenvSwitch with VF lag
------------------------------------------------------------------------------------------------

.. warning:: This feature is not compatible with the OFED container.

.. warning:: This feature is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

.. warning:: Tech Preview feature.


In this mode, the sriov-network-operator is responsible for configuring the physical and virtual functions but will not manage the configuration of the software bridge.
The VF LAG and Open vSwitch should be preconfigured on the host.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Network Operator Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Deploy network-operator by Helm with sriov-network-operator and nv-ipam.

First install the Network Operator with NFD enabled:
``values.yaml``

.. code-block:: yaml

    sriovNetworkOperator:
      enabled: true

Once the Network Operator has been installed create a NicClusterPolicy with nv-ipam:

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      nvIpam:
        image: nvidia-k8s-ipam
        repository: ghcr.io/mellanox
        version: |nvidia-ipam-version|
        imagePullSecrets: []
        enableWebhook: false
      secondaryNetwork:
        cniPlugins:
          image: plugins
          repository: ghcr.io/k8snetworkplumbingwg
          version: |cni-plugins-version|
          imagePullSecrets: []
        multus:
          image: multus-cni
          repository: ghcr.io/k8snetworkplumbingwg
          version: |multus-version|
          imagePullSecrets: []

Switch sriov-network-operator to `systemd` configuration mode.

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n nvidia-network-operator default --patch '{ "spec": { "configurationMode": "systemd"} }' --type='merge'


Create IPPool object for nv-ipam

.. code-block:: yaml

    apiVersion: nv-ipam.nvidia.com/v1alpha1
    kind: IPPool
    metadata:
      name: pool1
      namespace: nvidia-network-operator
    spec:
      subnet: 192.168.0.0/16
      perNodeBlockSize: 100
      gateway: 192.168.0.1
      nodeSelector:
        nodeSelectorTerms:
        - matchExpressions:
            - key: node-role.kubernetes.io/worker
              operator: Exists


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Prerequisites for Worker Nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Supported operating systems:

* Ubuntu 22.04

OpenvSwitch from the ``NVIDIA DOCA for Host`` package with ``doca-all`` or ``doca-networking`` profile should be installed on each worker node.

Check NVIDIA DOCA `Official installation guide <https://docs.nvidia.com/doca/sdk/nvidia+doca+installation+guide+for+linux/index.html>`_
for details. 

Supported OpenvSwitch dataplanes:

* OVS-kernel

* OVS-doca

Check `OpenvSwitch Offload <https://docs.nvidia.com/doca/sdk/openvswitch+offload+(ovs+in+doca)/index.html>`_ document to know about differences.

""""""""""""""""""""""""""""""""""""""
Configure Bond interface with netplan
""""""""""""""""""""""""""""""""""""""

.. code-block:: bash

    # content of /etc/netplan/01-uplink-bond.yaml
    network:
      version: 2
      renderer: networkd
      ethernets:
        enp4s0f0np0:
          dhcp4: no
          dhcp6: no
        enp4s0f1np1:
          dhcp4: no
          dhcp6: no
      bonds:
        bond0:
          dhcp4: no
          dhcp6: no
          interfaces:
            - enp4s0f0np0
            - enp4s0f1np1
          parameters:
            mode: 802.3ad

*Replace `enp4s0f0np0` and `enp4s0f1np1` with the right PF names for you node*

^^^^^^^^^^^
OVS-kernel
^^^^^^^^^^^

*These steps are for OVS-kernel data plane, to use OVS-doca follow instructions from the relevant section.*

"""""""""""""""""""""
Prepare Worker Nodes
"""""""""""""""""""""

Configure Open_vSwitch

.. code-block:: bash

    ovs-vsctl set Open_vSwitch . other_config:hw-offload=true

Restart Open_vSwitch

.. code-block:: bash

    systemctl restart openvswitch-switch.service


Create bridge


Create OVS bridge

.. code-block:: bash

    ovs-vsctl add-br mybr
    # this commad may fail with "No such device" error
    ovs-vsctl add-port mybr bond0


*Note: the second command may fail with "No such device" error because bond0 interface is not exist yet.* 

"""""""""""""""""""""""""""""""""""""
Sriov Network Operator Configuration
"""""""""""""""""""""""""""""""""""""

Create SriovNetworkNodePolicy for selected NIC

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: ovs-switchdev
      namespace: nvidia-network-operator
    spec:
      eSwitchMode: switchdev
      mtu: 1500
      nicSelector:
        deviceID: 101d
        vendor: 15b3
      nodeSelector:
        node-role.kubernetes.io/worker: ""
      numVfs: 4
      isRdma: true
      linkType: ETH
      resourceName: switchdev

Create OVSNetwork CR

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: OVSNetwork
    metadata:
      name: ovs
      namespace: nvidia-network-operator
    spec:
      networkNamespace: default
      ipam: |
        {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
      resourceName: switchdev


^^^^^^^^^^^
OVS-doca
^^^^^^^^^^^

*These steps are for OVS-doca data plane, to use OVS-kernel follow instructions from the relevant section.*

"""""""""""""""""""""
Prepare Worker Nodes
"""""""""""""""""""""

Configure hugepages

.. code-block:: bash

    mkdir -p /hugepages
    mount -t hugetlbfs hugetlbfs /hugepages
    echo 4096 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages

*Note: for multi CPU system hugepages should be created for each NUMA node: node0, node1, ...*

Configure system to create hugepages on boot

.. code-block:: bash

    echo "vm.nr_hugepages=8192" > /etc/sysctl.d/99-hugepages.conf

*Note: this example is for a server with two CPU*


Configure Open_vSwitch

.. code-block:: bash

    ovs-vsctl --no-wait set Open_vSwitch . other_config:doca-init=true
    ovs-vsctl set Open_vSwitch . other_config:hw-offload=true

Restart Open_vSwitch

.. code-block:: bash

    systemctl restart openvswitch-switch.service

Create OVS bridge

.. code-block:: bash

    ovs-vsctl --no-wait add-br mybr -- set bridge mybr datapath_type=netdev
    # this commad may fail with "No such device" error
    ovs-vsctl add-port mybr bond0 -- set Interface bond0 type=dpdk options:dpdk-lsc-interrupt=true mtu_request=1450

*Note: the second command may fail with "No such device" error because bond0 interface is not exist yet.*

"""""""""""""""""""""""""""""""""""""
Sriov Network Operator Configuration
"""""""""""""""""""""""""""""""""""""

Create SriovNetworkNodePolicy for selected NIC

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: SriovNetworkNodePolicy
    metadata:
      name: ovs-switchdev
      namespace: nvidia-network-operator
    spec:
      eSwitchMode: switchdev
      mtu: 1500
      nicSelector:
        deviceID: 101d
        vendor: 15b3
      nodeSelector:
        node-role.kubernetes.io/worker: ""
      numVfs: 4
      isRdma: true
      linkType: ETH
      resourceName: switchdev

Create OVSNetwork CR

.. code-block:: yaml

    apiVersion: sriovnetwork.openshift.io/v1
    kind: OVSNetwork
    metadata:
      name: ovs
      namespace: nvidia-network-operator
    spec:
      networkNamespace: default
      ipam: |
        {
          "type": "nv-ipam",
          "poolName": "pool1"
        }
      resourceName: switchdev
      interfaceType: dpdk

^^^^^^^^^^^^^^
Test Workload
^^^^^^^^^^^^^^

.. code-block:: yaml

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: ovs-offload
      labels:
        app: ovs-offload
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: ovs-offload
      template:
        metadata:
          labels:
            app: ovs-offload
          annotations:
            k8s.v1.cni.cncf.io/networks: ovs
        spec:
          containers:
          - name: ovs-offload-container
            command: ["/bin/bash", "-c"]
            args:
            - |
              while true; do sleep 1000; done
            image: mellanox/rping-test
            securityContext:
              capabilities:
                add: ["IPC_LOCK"]
            resources:
              requests:
                nvidia.com/switchdev: 1
              limits:
                nvidia.com/switchdev: 1

^^^^^^^^^^^^^^^^^^^
Troubleshooting OVS
^^^^^^^^^^^^^^^^^^^

Please see the following DOCA documentation for OVS hardware offload verification and troubleshooting steps:

* `OVS-Kernel Hardware Offloads <https://docs.nvidia.com/doca/sdk/ovs-kernel+hardware+offloads/index.html>`_

* `OVS-DOCA Hardware Offloads <https://docs.nvidia.com/doca/sdk/ovs-doca+hardware+offloads/index.html>`_

===========================================================================
[TECH PREVIEW] Configure NIC Firmware using the NIC Configuration Operator
===========================================================================
`NVIDIA NIC Configuration Operator <https://github.com/Mellanox/nic-configuration-operator>`_ provides Kubernetes API (Custom Resource Definition) to allow Firmware configuration on NVIDIA NICs in a coordinated manner. It deploys a configuration daemon on each of the desired nodes to configure NVIDIA NICs there. NVIDIA NIC Configuration Operator uses `Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_ to prepare a node for maintenance before the actual configuration.

.. warning:: `Maintenance Operator <https://github.com/Mellanox/maintenance-operator>`_ is required to be deployed in the cluster for the NIC Configuration Operator

.. warning:: NVIDIA NIC Configuration Operator does not support FW reset flow for DPU mode. Check `limitations <https://github.com/Mellanox/network-operator-docs/blob/main/docs/release-notes.rst>`_

* `limitations <https://github.com/Mellanox/network-operator-docs/blob/main/docs/release-notes.rst>`_

First install the Network Operator with NIC Configuration Operator enabled:

``values.yaml``:

.. code-block:: yaml

    nicConfigurationOperator:
      enabled: true

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

    kubectl get nicdevice -n nvidia-network-operator node1-1015-mt1627x08307 -o yaml

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicDevice
    metadata:
      creationTimestamp: "2024-09-21T08:43:08Z"
      generation: 1
      name: node1-1015-mt1627x08307
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
      - lastTransitionTime: "2024-09-21T08:43:08Z"
        message: Device configuration spec is empty, cannot update configuration
        reason: DeviceConfigSpecEmpty
        status: "False"
        type: ConfigUpdateInProgress
      firmwareVersion: 14.31.2006
      node: node1
      partNumber: mcx4131a-gcat
      ports:
      - networkInterface: enp129s0np0
        pci: 0000:81:00.0
        rdmaInterface: mlx5_2
      psid: mt_2430110032
      serialNumber: mt1627x08307
      type: "1015"

Configure and apply the NicConfigurationTemplate CR:

.. code-block:: yaml

    apiVersion: configuration.net.nvidia.com/v1alpha1
    kind: NicConfigurationTemplate
    metadata:
       name: connectx6-config
       namespace: nic-configuration-operator
    spec:
       nodeSelector:
          feature.node.kubernetes.io/network-sriov.capable: "true"
       nicSelector:
          # nicType selector is mandatory the rest are optional. Only a single type can be specified.
          nicType: 101b
          pciAddresses:
             - "0000:03:00.0"
             - “0000:04:00.0”
          serialNumbers:
             - "MT2116X09299"
       resetToDefault: false # if set, template is ignored, device configuration should reset
       template:
          # numVfs and linkType fields are mandatory, the rest are optional
          numVfs: 2
          linkType: Ethernet
          pciPerformanceOptimized:
             enabled: true
             maxAccOutRead: 44
             maxReadRequest: 4096
          roceOptimized:
             enabled: true
             qos:
                trust: dscp
                pfc: "0,0,0,1,0,0,0,0"
          gpuDirectOptimized:
             enabled: true
             env: Baremetal

.. note:: It's not possible to apply more than one template to a single device. In this case, no template will be applied and an error event will be emitted for the corresponding NicDevice CR.

.. note:: To use the NIC Configuration Operator functionality together with SR-IOV Network Operator, numVfs and linkType need to match both in NicConfigurationTemplate and SriovNetworkNodePolicy CRs matching the same NICs.

For more information about the CRD API, refer to `API documentation <https://github.com/Mellanox/nic-configuration-operator/blob/main/docs/api-reference.md>`_.
For more information, which FW parameter each settings corresponds to, refer to `Configuration details doc section <https://github.com/Mellanox/nic-configuration-operator?tab=readme-ov-file#configuration-details>`_.

Status conditions of the NicDevice CR reflect the status of the configuration update and indicate any errors that might occur during the process

.. code-block:: bash

    > kubectl get nicdevice -n nic-configuration-operator cloud-dev-40-1015-mt1627x08307 -o jsonpath='{.status.conditions}' | yq -P

    - lastTransitionTime: "2024-09-21T08:43:08Z"
      message: ""
      reason: UpdateStarted
      status: "True"
      type: ConfigUpdateInProgress

----------------------------------
NIC Firmware Mismatch Notification
----------------------------------

NIC Configuration Operator updates status conditions of the NicDevice CR to set `FirmwareConfigMatch` condition based on a current NIC firmware:

.. code-block:: bash

    > kubectl get nicdevice -n nic-configuration-operator cloud-dev-40-1015-mt1627x08307 -o jsonpath='{.status.conditions}' | yq -P

    - lastTransitionTime: "2024-09-21T08:43:10Z"
      message: Device firmware '20.42.1000' matches to recommended version '20.42.1000'
      reason: DeviceFirmwareConfigMatch
      status: "True"
      type: FirmwareConfigMatch

.. warning:: NIC Firmware Mismatch feature doesn't support NVIDIA BlueField-3 NIC.

`FirmwareConfigMatch` condition status is set to `Unknown` if MOFED is not installed otherwise it notifies if current NIC firmware is recommended or not recommended by MOFED. E.g.:

.. code-block:: bash

    > kubectl get nicdevice -n nic-configuration-operator cloud-dev-40-1015-mt1627x08307 -o jsonpath='{.status.conditions}' | yq -P

   - lastTransitionTime: "2024-11-08T09:19:41Z"
     message: Device firmware '20.42.1000' matches to recommended version '20.42.1000'
     reason: DeviceFirmwareConfigMatch
     status: "True"
     type: FirmwareConfigMatch
