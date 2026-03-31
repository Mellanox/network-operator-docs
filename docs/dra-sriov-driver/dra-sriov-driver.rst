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

*****************
DRA SR-IOV Driver
*****************

.. contents::
   :depth: 2
   :local:
   :backlinks: none

Dynamic Resource Allocation (DRA) is a Kubernetes concept for flexibly requesting, configuring, and sharing
specialized devices like SR-IOV network interfaces. DRA puts device configuration and scheduling into the hands
of device vendors through drivers such as the DRA Driver for SR-IOV. This page outlines how to install the
NVIDIA DRA Driver for SR-IOV with the NVIDIA Network Operator.

Before using the DRA Driver for SR-IOV, it is recommended that you are familiar with the following concepts:

* `Upstream Kubernetes DRA documentation <https://kubernetes.io/docs/concepts/scheduling-eviction/dynamic-resource-allocation/>`_.
* `DRA Driver repository documentation <https://github.com/k8snetworkplumbingwg/dra-driver-sriov/>`_.

Overview
========

With DRA Driver for SR-IOV, your Kubernetes workload can allocate and consume SR-IOV Virtual Functions (VFs)
from supported NVIDIA network adapters using the native Kubernetes DRA framework.

You can use the DRA Driver for SR-IOV with the SR-IOV Network Operator to deploy and manage your
SR-IOV network resources.

Deployment
==========

.. warning::
   Running the DRA driver and the SR-IOV device plugin on the same cluster at the same time is not supported.
   When DRA is enabled, the SR-IOV device plugin will not run. It is recommended to delete any
   existing ``SriovNetworkNodePolicy`` resources before enabling DRA.

First install the Network Operator with NFD, SR-IOV Network Operator, and DRA enabled:
``values.yaml``:

.. code-block:: yaml

    nfd:
      enabled: true
    sriovNetworkOperator:
      enabled: true
    sriovOperatorConfig:
      featureGates:
        dynamicResourceAllocation: true

**Step 1**: Create NicClusterPolicy

.. code-block:: yaml
   :substitutions:

   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     nvIpam:
       image: nvidia-k8s-ipam
       repository: |nvidia-ipam-repository|
       version: |nvidia-ipam-version|
       enableWebhook: false
     secondaryNetwork:
       cniPlugins:
         image: plugins
         repository: |cni-plugins-repository|
         version: |cni-plugins-version|
       multus:
         image: multus-cni
         repository: |multus-repository|
         version: |multus-version|

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. code-block:: yaml

   apiVersion: nv-ipam.nvidia.com/v1alpha1
   kind: IPPool
   metadata:
     name: sriov-pool
     namespace: nvidia-network-operator
   spec:
     subnet: 192.168.2.0/24
     perNodeBlockSize: 50
     gateway: 192.168.2.1

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Configure SR-IOV

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetworkNodePolicy
   metadata:
     name: ethernet-sriov
     namespace: nvidia-network-operator
   spec:
     deviceType: netdevice
     mtu: 1500
     nodeSelector:
       feature.node.kubernetes.io/pci-15b3.present: "true"
     nicSelector:
       vendor: "15b3"
     isRdma: true
     numVfs: 8
     priority: 90
     resourceName: sriov_resource

.. code-block:: bash

   kubectl apply -f sriovnetworknodepolicy.yaml

Wait for the ``SriovNetworkNodeState`` CRs to reach the ``Synced`` state:

.. code-block:: bash

   kubectl get sriovnetworknodestates -n nvidia-network-operator

Verify that ``ResourceSlices`` are created:

.. code-block:: bash

   kubectl get resourceslices

The following is an example of a ``ResourceSlice`` created by the DRA SR-IOV driver, showing a single
Virtual Function with its attributes:

.. code-block:: yaml

   apiVersion: resource.k8s.io/v1
   kind: ResourceSlice
   metadata:
     generateName: c-237-177-60-062-sriovnetwork.k8snetworkplumbingwg.io-
     name: c-237-177-60-062-sriovnetwork.k8snetworkplumbingwg.io-t4mc5
     ownerReferences:
     - apiVersion: v1
       controller: true
       kind: Node
       name: c-237-177-60-062
   spec:
     devices:
     - attributes:
         dra.net/numaNode:
           int: 0
         resource.kubernetes.io/pciBusID:
           string: "0000:08:00.4"
         resource.kubernetes.io/pcieRoot:
           string: pci0000:00
         sriovnetwork.k8snetworkplumbingwg.io/EswitchMode:
           string: legacy
         sriovnetwork.k8snetworkplumbingwg.io/PFName:
           string: eth2
         sriovnetwork.k8snetworkplumbingwg.io/deviceID:
           string: 101e
         sriovnetwork.k8snetworkplumbingwg.io/linkType:
           string: ethernet
         sriovnetwork.k8snetworkplumbingwg.io/parentPciAddress:
           string: "0000:00:00.0"
         sriovnetwork.k8snetworkplumbingwg.io/pciAddress:
           string: "0000:08:00.4"
         sriovnetwork.k8snetworkplumbingwg.io/pfDeviceID:
           string: 101d
         sriovnetwork.k8snetworkplumbingwg.io/vendor:
           string: 15b3
         sriovnetwork.k8snetworkplumbingwg.io/vfID:
           int: 2
         k8s.cni.cncf.io/resourceName:
           string: nvidia.com/sriov_resource
         k8s.cni.cncf.io/deviceId:
           string: "0000:08:00.4"
       name: 0000-08-00-4

**Step 4**: Create SR-IOV Network

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetwork
   metadata:
     name: sriov-rdma-network
     namespace: nvidia-network-operator
   spec:
     ipam: |
       {
         "type": "nv-ipam",
         "poolName": "sriov-pool"
       }
     networkNamespace: default
     resourceName: sriov_resource

.. code-block:: bash

   kubectl apply -f sriovnetwork.yaml

**Step 5**: Create ResourceClaimTemplate

.. code-block:: yaml

   apiVersion: resource.k8s.io/v1
   kind: ResourceClaimTemplate
   metadata:
     name: sriov-vf
   spec:
     spec:
       devices:
         requests:
         - name: vf
           exactly:
             deviceClassName: sriovnetwork.k8snetworkplumbingwg.io
             count: 1
             selectors:
             - cel:
                 expression: >
                   device.attributes["k8s.cni.cncf.io"].resourceName == "nvidia.com/sriov_resource"

.. code-block:: bash

   kubectl apply -f resourceclaimtemplate.yaml

**Step 6**: Deploy test workload

.. code-block:: yaml

   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: sriov-rdma-server
     namespace: default
     labels:
       app: sriov-rdma
       role: server
     annotations:
       k8s.v1.cni.cncf.io/networks: sriov-rdma-network
   spec:
     tolerations:
     - key: "node-role.kubernetes.io/control-plane"
       operator: "Exists"
       effect: "NoSchedule"
     - key: "node-role.kubernetes.io/master"
       operator: "Exists"
       effect: "NoSchedule"
     restartPolicy: Never
     containers:
     - name: rdma-test
       image: nvcr.io/nvidia/doca/doca:3.1.0-full-rt-host
       command: ["/bin/bash", "-c", "sleep infinity"]
       securityContext:
         capabilities:
           add: ["IPC_LOCK"]
         privileged: true
       resources:
         claims:
         - name: vf
     resourceClaims:
     - name: vf
       resourceClaimTemplateName: sriov-vf
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: sriov-rdma-client
     namespace: default
     labels:
       app: sriov-rdma
       role: client
     annotations:
       k8s.v1.cni.cncf.io/networks: sriov-rdma-network
   spec:
     affinity:
       podAntiAffinity:
         requiredDuringSchedulingIgnoredDuringExecution:
         - labelSelector:
             matchExpressions:
             - key: role
               operator: In
               values:
               - server
           topologyKey: kubernetes.io/hostname
     restartPolicy: Never
     containers:
     - name: rdma-test
       image: nvcr.io/nvidia/doca/doca:3.1.0-full-rt-host
       command: ["/bin/bash", "-c", "sleep infinity"]
       securityContext:
         capabilities:
           add: ["IPC_LOCK"]
         privileged: true
       resources:
         claims:
         - name: vf
     resourceClaims:
     - name: vf
       resourceClaimTemplateName: sriov-vf

.. code-block:: bash

   kubectl apply -f pod.yaml

Resource Alignment
==================

DRA enables end users to select resources from different DRA drivers with matching attributes to achieve
maximum performance. By using constraints with ``matchAttribute``, the Kubernetes scheduler ensures that
allocated devices share a common topology, such as the same PCIe root complex.

The following example shows a ``ResourceClaimTemplate`` that requests both an SR-IOV VF and a GPU
from the `NVIDIA DRA Driver for GPUs <https://github.com/NVIDIA/k8s-dra-driver-gpu>`_,
constrained to share the same PCIe root:

.. code-block:: yaml

   apiVersion: resource.k8s.io/v1
   kind: ResourceClaimTemplate
   metadata:
     name: resource-alignment
   spec:
     spec:
       devices:
         requests:
         - name: vf
           exactly:
             deviceClassName: sriovnetwork.k8snetworkplumbingwg.io
             selectors:
             - cel:
                 expression: >
                   device.attributes["k8s.cni.cncf.io"].resourceName == "nvidia.com/sriov_resource"
         - name: gpu
           exactly:
             deviceClassName: gpu.nvidia.com
             count: 1
         constraints:
         - matchAttribute: "resource.kubernetes.io/pcieRoot"

Extended Resource Allocation by DRA
====================================

.. note::
   This is an **alpha feature** in Kubernetes v1.34 (disabled by default). It requires enabling the
   ``DRAExtendedResource`` feature gate in the kube-apiserver, kube-scheduler, and kubelet.
   See `Enable Or Disable Feature Gates <https://kubernetes.io/docs/tasks/administer-cluster/configure-feature-gates/>`_
   for instructions on how to enable feature gates in your cluster.

Extended resource allocation by DRA allows a ``DeviceClass`` to specify an ``extendedResourceName``.
The scheduler then selects DRA devices matching the class for extended resource requests, enabling
pods to use the familiar ``resources.requests`` syntax to request DRA-managed devices without
explicitly creating a ``ResourceClaim``.

This means existing workloads that use extended resources (e.g. via the device plugin) can
seamlessly migrate to DRA.

.. note::
   The SR-IOV Network Operator automatically creates a ``DeviceClass`` that can be used with this feature.

The following is an example of an auto-created ``DeviceClass``:

.. code-block:: yaml

   apiVersion: resource.k8s.io/v1
   kind: DeviceClass
   metadata:
     name: sriov-resource
   spec:
     selectors:
     - cel:
         expression: >
           device.driver == 'sriov.k8snetworkplumbingwg.io' &&
           device.attributes["k8s.cni.cncf.io"].resourceName == "nvidia.com/sriov_resource"
     extendedResourceName: nvidia.com/sriov_resource

Users can also use the special extended resource name prefix ``deviceclass.resource.kubernetes.io/``
followed by the ``DeviceClass`` name. This works for any ``DeviceClass``, even without a configured
``extendedResourceName``. The resulting ``ResourceClaim`` will contain a request for the specified
number of devices of that class.

For more information, refer to the
`Kubernetes DRA documentation <https://kubernetes.io/docs/concepts/scheduling-eviction/dynamic-resource-allocation/>`_.
