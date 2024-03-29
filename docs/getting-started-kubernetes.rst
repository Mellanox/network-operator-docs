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
   :depth: 4
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

* NVIDIA Networking drivers to enable advanced features - enp1 netdcreate, an NV-IPAM IPPool
* Kubernetes device plugins to provide hardware resources required for an accelerated network
* Kubernetes secondary network components for network intensive workloads

=========================================================
Network Operator Deployment on Vanilla Kubernetes Cluster
=========================================================
.. _Network-Operator Project Sources: https://github.com/Mellanox/network-operator#nicclusterpolicy-crd
.. warning:: It is recommended to have dedicated control plane nodes for Vanilla Kubernetes deployments with NVIDIA Network Operator.

The default installation via Helm as described below will deploy the Network Operator and related CRDs, after which an additional step is required to create a NicClusterPolicy custom resource with the configuration that is desired for the cluster.

For more information on NicClusterPolicy custom resource, please refer to the `Network-Operator Project Sources`_.

The provided Helm chart contains various parameters to facilitate the creation of a NicClusterPolicy custom resource upon deployment.

.. warning:: Each Network Operator Release has a set of default version values for the various components it deploys. It is recommended that these values will not be changed. Testing and validation were performed with these values, and there is no guarantee of interoperability nor correctness when different versions are used.

.. code-block:: bash
   :caption: Add NVIDIA NGC Helm repository

   helm repo add nvidia https://helm.ngc.nvidia.com/nvidia

.. code-block:: bash
   :caption: Update helm repositories

   helm repo update

Install Network Operator from the NVIDIA NGC chart using the default values:

.. parsed-literal::

    helm install network-operator nvidia/network-operator \
      -n nvidia-network-operator \
      --create-namespace \
      --version |helm-chart-version| \
      --wait

.. code-block:: bash
   :caption: View deployed resources

   kubectl -n nvidia-network-operator get pods

Install the Network Operator from the NVIDIA NGC chart using custom values:

.. warning:: Since several parameters should be provided when creating custom resources during operator deployment, it is recommended to use a configuration file. While it is possible to override the parameters via CLI, we recommend to avoid the use of CLI arguments in favor of a configuration file.

.. parsed-literal::

   helm show values nvidia/network-operator --version |helm-chart-version| > values.yaml

.. parsed-literal::

    helm install network-operator nvidia/network-operator \
      -n nvidia-network-operator \
      --create-namespace \
      --version |helm-chart-version| \
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

Network operator deployment with the default version of the OFED driver and a single RDMA resource mapped to ens1f0 netdev.:

``values.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true

    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          ifNames: [ens1f0]

    sriovDevicePlugin:
      deploy: false

--------------------------------------------------------------------------------
Network Operator Deployment with Multiple Resources in RDMA Shared Device Plugin
--------------------------------------------------------------------------------

Network Operator deployment with the default version of OFED and an RDMA device plugin with two RDMA resources. The first is mapped to ens1f0 and ens1f1, and the second is mapped to ens2f0 and ens2f1.

``values.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true
    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          ifNames: [ens1f0, ens1f1]
        - name: rdma_shared_device_b
          ifNames: [ens2f0, ens2f1]

    sriovDevicePlugin:
      deploy: false

----------------------------------------------------
Network Operator Deployment with a Secondary Network
----------------------------------------------------

Network Operator deployment with:

* RDMA shared device plugin
* Secondary network
* Mutlus CNI
* Container-networking-plugins CNI plugins
* Whereabouts IPAM CNI Plugin

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: false

    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          ifNames: [ens1f0]

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

--------------------------------------------
Network Operator Deployment with NVIDIA-IPAM
--------------------------------------------

Network Operator deployment with:

* RDMA shared device plugin
* Secondary network
* Multus CNI
* Container-networking-plugins
* CNI plugins
* NVIDIA-IPAM CNI Plugin

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: false

    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          ifNames: [ens1f0]

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: false
    
    nvIpam:
      deploy: true

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

Network Operator deployment with:

* SR-IOV device plugin, single SR-IOV resource pool
* Secondary network
* Multus CNI
* Container-networking-plugins CNI plugins
* Whereabouts IPAM CNI plugin

In this mode, the Network Operator could be deployed on virtualized deployments as well. It supports both Ethernet and InfiniBand modes. From the Network Operator perspective, there is no difference between the deployment procedures. To work on a VM (virtual machine), the PCI passthrough must be configured for SR-IOV devices. The Network Operator works both with VF (Virtual Function) and PF (Physical Function) inside the VMs.

.. warning:: If the Host Device Network is used without the MLNX_OFED driver, the following packages should be installed:

    * the linux-generic package on Ubuntu hosts
    * the kernel-modules-extra package on the RedHat-based hosts

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: false

    rdmaSharedDevicePlugin:
      deploy: false

    sriovDevicePlugin:
      deploy: true
      resources:
        - name: hostdev
          vendors: [15b3]
    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

Following the deployment, the network operator should be configured, and K8s networking should be deployed to use it in pod configuration.

The ``host-device-net.yaml`` configuration file for such a deployment:

.. code-block:: yaml

    apiVersion: mellanox.com/v1alpha1
    kind: HostDeviceNetwork
    metadata:
      name: hostdev-net
    spec:
      networkNamespace: "default"
      resourceName: "nvidia.com/hostdev"
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
      resourceName: "nvidia.com/hostdev"
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

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true

    # NicClusterPolicy CR values:
    deployCR: true

    ofedDriver:
      deploy: false

    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          linkTypes: [ether]

    sriovDevicePlugin:
      deploy: true
      resources:
        - name: hostdev
          linkTypes: [“infiniband”]

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

For pods and network configuration examples please refer to the corresponding sections: Network Operator Deployment with the RDMA Shared Device Plugin and Network Operator Deployment with a Host Device Network.

----------------------------------------------------------------------
Network Operator Deployment with an IP over InfiniBand (IPoIB) Network
----------------------------------------------------------------------

Network Operator deployment with:

* RDMA shared device plugin
* Secondary network
* Multus CNI
* IPoIB CNI
* Whereabouts IPAM CNI plugin

In this mode, the Network Operator could be deployed on virtualized deployments as well. It supports both Ethernet and InfiniBand modes. From the Network Operator perspective, there is no difference between the deployment procedures. To work on a VM (virtual machine), the PCI passthrough must be configured for SR-IOV devices. The Network Operator works both with VF (Virtual Function) and PF (Physical Function) inside the VMs.

``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true

    rdmaSharedDevicePlugin:
      deploy: true
      resources:
        - name: rdma_shared_device_a
          ifNames: [ibs1f0]

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      ipoib:
        deploy: true
      ipamPlugin:
        deploy: true

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

* MLNX_OFED v5.5-1.0.3.2 or newer
* GPU Operator v1.9.0 or newer
* NVIDIA GPU and driver supporting GPUDirect e.g Quadro RTX 6000/8000 or NVIDIA T4/NVIDIA V100/NVIDIA A100

``values.yaml`` example:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: false
    # NicClusterPolicy CR values:
    ofedDriver:
      deploy: true
    deployCR: true

    sriovDevicePlugin:
      deploy: true
      resources:
        - name: hostdev
          vendors: [15b3]

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

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

``values.yaml`` configuration for such a deployment:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true

    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true
    rdmaSharedDevicePlugin:
      deploy: false
    sriovDevicePlugin:
      deploy: false

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

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

.. warning:: This is a Tech Preview feature, which is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

To apply SriovNetworkNodePolicy on several nodes in parallel, specify the ``maxParallelConfiguration`` option in the SriovOperatorConfig CRD:

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n network-operator default --patch '{ "spec": { "maxParallelNodeConfiguration": 0 } }' --type='merge'

--------------------------------------------------------------------------
SR-IOV Network Operator Deployment – Parallel NIC Configuration for SR-IOV
--------------------------------------------------------------------------

.. warning:: This is a Tech Preview feature, which is supported only for Vanilla Kubernetes deployments with SR-IOV Network Operator.

To apply SriovNetworkNodePolicy on several nodes in parallel, specify the ``featureGates`` option in the SriovOperatorConfig CRD:

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n network-operator default --patch '{ "spec": { "featureGates": { "parallelNicConfig": true  } } }' --type='merge'

---------------------------------------------------------------------------
SR-IOV Network Operator Deployment – SR-IOV Using the systemd Service
---------------------------------------------------------------------------

To enable systemd SR-IOV configuration mode, specify the configurationMode option in the SriovOperatorConfig CRD:

.. code-block:: bash

    kubectl patch sriovoperatorconfigs.sriovnetwork.openshift.io -n network-operator default --patch '{ "spec": { "configurationMode": "systemd"} }' --type='merge'

-------------------------------------------------------------
Network Operator Deployment with an SR-IOV InfiniBand Network
-------------------------------------------------------------

Network Operator deployment with InfiniBand network requires the following:

* MLNX_OFED and OpenSM running. OpenSM runs on top of the MLNX_OFED stack, so both the driver and the subnet manager should come from the same installation. Note that partitions that are configured by OpenSM should specify defmember=full to enable the SR-IOV functionality over InfiniBand. For more details, please refer to `this article <https://docs.mellanox.com/display/MLNXOFEDv51258060/OpenSM>`.
* InfiniBand device – Both the host device and switch ports must be enabled in InfiniBand mode.
* rdma-core package should be installed when an inbox driver is used.

``values.yaml``

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true

    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true
    rdmaSharedDevicePlugin:
      deploy: false
    sriovDevicePlugin:
      deploy: false

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

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
      linkType: infiniband
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

* MLNX_OFED and OpenSM running. OpenSM runs on top of the MLNX_OFED stack, so both the driver and the subnet manager should come from the same installation. Note that partitions that are configured by OpenSM should specify defmember=full to enable the SR-IOV functionality over InfiniBand. For more details, please refer to `this article`_.
* NVIDIA UFM running on top of OpenSM. For more details, please refer to `the project documentation`_.
* InfiniBand device – Both the host device and the switch ports must be enabled in InfiniBand mode.
* rdma-core package should be installed when an inbox driver is used.

Current limitations:

* Only a single PKey can be configured per workload pod.
* When a single instance of NVIDIA UFM is used with several K8s clusters, different PKey GUID pools should be configured for each cluster.

.. warning:: `ib-kubernetes-ufm-secret` should be created before NicClusterPolicy.

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

``values.yaml``

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true
      resourcePrefix: "nvidia.com"

    # NicClusterPolicy CR values:
    deployCR: true
    ofedDriver:
      deploy: true
    rdmaSharedDevicePlugin:
      deploy: false
    sriovDevicePlugin:
      deploy: false
    ibKubernetes:
      deploy: true
      periodicUpdateSeconds: 5
      pKeyGUIDPoolRangeStart: "02:00:00:00:00:00:00:00"
      pKeyGUIDPoolRangeEnd: "02:FF:FF:FF:FF:FF:FF:FF"
      ufmSecret: ufm-secret

    secondaryNetwork:
      deploy: true
      multus:
        deploy: true
      cniPlugins:
        deploy: true
      ipamPlugin:
        deploy: true

Wait for MLNX_OFED to install and apply the following CRs:

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
      linkType: ib
      isRdma: true
      numVfs: 8
      priority: 90
      resourceName: mlnxnics

``sriov-ib-network.yaml``

.. code-block:: yaml

    apiVersion: "k8s.cni.cncf.io/v1"
    kind: SriovIBNetwork
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
          "type": "whereabouts",
          "datastore": "kubernetes",
          "kubernetes": {
            "kubeconfig": "/etc/cni/net.d/whereabouts.d/whereabouts.kubeconfig"
          },
          "range": "10.56.217.0/24",
          "log_file" : "/var/log/whereabouts.log",
          "log_level" : "info"
        }
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

.. parsed-literal::

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