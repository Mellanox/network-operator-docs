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

**************************************
Getting Started with Red Hat OpenShift
**************************************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none


==============================================================
Network Operator Deployment on an OpenShift Container Platform
==============================================================

.. warning::
   It is recommended to have dedicated control plane nodes for OpenShift deployments with NVIDIA Network Operator.

.. warning::
   Automatic DOCA Driver Upgrade doesn't work on Single Node OpenShift (SNO) deployments.

----------------------
Node Feature Discovery
----------------------

To enable Node Feature Discovery, please follow the official `guide <https://docs.openshift.com/container-platform/latest/hardware_enablement/psap-node-feature-discovery-operator.html>`_.
A single instance of Node Feature Discovery is expected to be used in the cluster.


An example of Node Feature Discovery configuration:

.. code-block:: yaml

   apiVersion: nfd.openshift.io/v1
   kind: NodeFeatureDiscovery
   metadata:
     name: nfd-instance
     namespace: openshift-nfd
   spec:
     operand:
       image: registry.redhat.io/openshift4/ose-node-feature-discovery-rhel9:v4.16
       imagePullPolicy: Always
     workerConfig:
       configData: |
         sources:
           pci:
             deviceClassWhitelist:
               - "02"
               - "03"
               - "0200"
               - "0207"
             deviceLabelFields:
               - vendor

Verify that the following label is present on the nodes containing NVIDIA networking hardware: `feature.node.kubernetes.io/pci-15b3.present=true`

For more details please read official NFD `documentation <https://docs.openshift.com/container-platform/4.16/hardware_enablement/psap-node-feature-discovery-operator.html#creating-nfd-cr-cli_psap-node-feature-discovery-operator>`_.

.. code-block:: bash

   oc describe node | grep -E 'Roles|pci' | grep -v "control-plane"

   Roles:              worker
                       cpu-feature.node.kubevirt.io/invpcid=true
                       cpu-feature.node.kubevirt.io/pcid=true
                       feature.node.kubernetes.io/pci-102b.present=true
                       feature.node.kubernetes.io/pci-10de.present=true
                       feature.node.kubernetes.io/pci-10de.sriov.capable=true
                       feature.node.kubernetes.io/pci-14e4.present=true
                       feature.node.kubernetes.io/pci-15b3.present=true
                       feature.node.kubernetes.io/pci-15b3.sriov.capable=true
   Roles:              worker
                       cpu-feature.node.kubevirt.io/invpcid=true
                       cpu-feature.node.kubevirt.io/pcid=true
                       feature.node.kubernetes.io/pci-102b.present=true
                       feature.node.kubernetes.io/pci-10de.present=true
                       feature.node.kubernetes.io/pci-10de.sriov.capable=true
                       feature.node.kubernetes.io/pci-14e4.present=true
                       feature.node.kubernetes.io/pci-15b3.present=true
                       feature.node.kubernetes.io/pci-15b3.sriov.capable=true

-----------------------
SR-IOV Network Operator
-----------------------

If you are planning to use SR-IOV, follow these `instructions <https://docs.openshift.com/container-platform/latest/networking/hardware_networks/installing-sriov-operator.html>`_ to install SR-IOV Network Operator on an OpenShift Container Platform.

.. warning::
   The SR-IOV resources created will have the `openshift.io` prefix.

For the default SriovOperatorConfig CR to work with the NVIDIA DOCA Driver container, please run this command to update the following values:

.. code-block:: bash

   oc patch sriovoperatorconfig default \
     --type=merge -n openshift-sriov-network-operator \
     --patch '{ "spec": { "configDaemonNodeSelector": { "network.nvidia.com/operator.mofed.wait": "false", "node-role.kubernetes.io/worker": "", "feature.node.kubernetes.io/pci-15b3.sriov.capable": "true" } } }'

.. warning::
   SR-IOV Network Operator configuration documentation can be found on the `Official Website <https://docs.openshift.com/container-platform/latest/networking/hardware_networks/configuring-sriov-operator.html#configuring-sriov-operator>`_.

------------
GPU Operator
------------

If you plan to use GPUDirect, follow `this <https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/openshift/contents.html>`_ to install GPU Operator on an OpenShift Container Platform.

Make sure to enable RDMA and disable useHostMofed in the driver section in the spec of the ClusterPolicy CR.

-----------------------------
Network Operator Installation
-----------------------------

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Network Operator Installation Using OpenShift Catalog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- In the OpenShift Container Platform web console side menu, select Operators > OperatorHub, and search for the NVIDIA Network Operator.
- Select NVIDIA Network Operator, and click Install in the first screen and in the subsequent one.
- For additional information, see the `Red Hat OpenShift Container Platform Documentation <https://docs.openshift.com/container-platform/latest/operators/admin/olm-adding-operators-to-cluster.html>`_.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Network Operator Installation using OpenShift OC CLI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Create a namespace for the Network Operator.

   .. code-block:: bash

      oc create namespace nvidia-network-operator

#. Install the Network Operator in the namespace created in the previous step by creating the below objects. Run the following command to get the channel value required for the next step:

   .. code-block:: bash

      oc get packagemanifest nvidia-network-operator -n openshift-marketplace -o jsonpath='{.status.defaultChannel}'

   Example output:

   .. code-block:: bash

      stable

#. Create the following Subscription CR, and save the YAML in the network-operator-sub.yaml file:


   .. code-block:: yaml
      :substitutions:

      apiVersion: operators.coreos.com/v1alpha1
      kind: Subscription
      metadata:
        name: nvidia-network-operator
        namespace: nvidia-network-operator
      spec:
        channel: "|ocp-channel|"
        name: nvidia-network-operator
        source: certified-operators
        sourceNamespace: openshift-marketplace

#. Create the subscription object by running the following command:

   .. code-block:: bash

      oc create -f network-operator-sub.yaml

#. Change to the network-operator project:

   .. code-block:: bash

      oc project nvidia-network-operator


""""""""""""
Verification
""""""""""""

To verify that the operator deployment is successful, run:

.. code-block:: bash

   oc get pods -n nvidia-network-operator

Example output:

.. code-block:: bash

   
   NAME                                                          READY   STATUS    RESTARTS   AGE
   nvidia-network-operator-controller-manager-8f8ccf45c-zgfsq    2/2     Running   0          1m

A successful deployment shows a `Running` status.

---------------------------------------------------------------------------------
Using Network Operator to Create NicClusterPolicy in OpenShift Container Platform
---------------------------------------------------------------------------------

See Deployment Examples for OCP:

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Deployment Examples For OpenShift Container Platform
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In OCP, some components are deployed by default like Multus and WhereAbouts, whereas others, such as NFD and SR-IOV Network Operator must be deployed manually, as described in the Installation section.

In addition, since there is no use of the Helm chart, the configuration should be done via the NicClusterPolicy CRD.

Following are examples of NicClusterPolicy configuration for OCP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Network Operator Deployment with a Host Device Network - OCP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Network Operator deployment with:

SR-IOV device plugin, single SR-IOV resource pool:

- There is no need for a secondary network configuration, as it is installed by default in OCP.

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
        startupProbe:
         initialDelaySeconds: 10
         periodSeconds: 20
       livenessProbe:
         initialDelaySeconds: 30
         periodSeconds: 30
       readinessProbe:
         initialDelaySeconds: 10
         periodSeconds: 30
     sriovDevicePlugin:
         image: sriov-network-device-plugin
         repository: ghcr.io/k8snetworkplumbingwg
         version: |sriov-device-plugin-version|
         config: |
           {
             "resourceList": [
                 {
                     "resourcePrefix": "nvidia.com",
                     "resourceName": "hostdev",
                     "selectors": {
                         "vendors": ["15b3"],
                         "isRdma": true
                     }
                 }
             ]
           }

Following the deployment, the Network Operator should be configured, and K8s networking deployed to use it in pod configuration.
The `host-device-net.yaml`` configuration file for such a deployment:

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
         "log_file" : "/var/log/whereabouts.log",
         "log_level" : "info"
       }

The `pod.yaml` configuration file for such a deployment:

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
     - image: <rdma image>
       name: doca-test-ctr
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Network Operator Deployment with SR-IOV Legacy Mode - OCP 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

This deployment mode supports SR-IOV in legacy mode.
Note that the SR-IOV Network Operator is required as described in the Deployment for OCP section. 

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
        startupProbe:
         initialDelaySeconds: 10
         periodSeconds: 20
       livenessProbe:
         initialDelaySeconds: 30
         periodSeconds: 30
       readinessProbe:
         initialDelaySeconds: 10
         periodSeconds: 30

Sriovnetwork node policy and K8s networking should be deployed.
`sriovnetwork-node-policy.yaml` configuration file for such a deployment:

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetworkNodePolicy
   metadata:
     name: policy-1
     namespace:  openshift-sriov-network-operator
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
     resourceName: sriovlegacy

The `sriovnetwork.yaml` configuration file for such a deployment:

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetwork
   metadata:
     name: sriov-network
     namespace:  openshift-sriov-network-operator
   spec:
     vlan: 0
     networkNamespace: "default"
     resourceName: "sriovlegacy" 
     ipam: |
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


Note that the resource prefix in this case will be `openshift.io`.
The `pod.yaml` configuration file for such a deployment:

.. code-block:: yaml

   apiVersion: v1
   kind: Pod
   metadata:
     name: testpod1
     annotations:
       k8s.v1.cni.cncf.io/networks: sriov-network
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
           openshift.io/sriovlegacy: '1'
         limits:
           openshift.io/sriovlegacy: '1'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Network Operator Deployment with the RDMA Shared Device Plugin - OCP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

The following is an example of RDMA Shared with MacVlanNetwork:

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
        startupProbe:
         initialDelaySeconds: 10
         periodSeconds: 20
       livenessProbe:
         initialDelaySeconds: 30
         periodSeconds: 30
       readinessProbe:
         initialDelaySeconds: 10
         periodSeconds: 30
     rdmaSharedDevicePlugin:
       config: |
         {
           "configList": [
             {
               "resourceName": "rdmashared",
               "rdmaHcaMax": 1000,
               "selectors": {
                 "ifNames": ["enp4s0f0np0"]
               }
             }
           ]
         }
       image: k8s-rdma-shared-dev-plugin
       repository: nvcr.io/nvidia/cloud-native
       version: |k8s-rdma-shared-dev-plugin-version|


The `macvlan-net-ocp.yaml` configuration file for such a deployment in an OpenShift Platform:

.. code-block:: yaml

   apiVersion: mellanox.com/v1alpha1
   kind: MacvlanNetwork
   metadata:
     name: rdmashared-net
   spec:
     networkNamespace: default
     master: enp4s0f0np0
     mode: bridge
     mtu: 1500
     ipam: '{"type": "whereabouts", "range": "16.0.2.0/24", "gateway": "16.0.2.1"}' 

The `pod.yaml` configuration file for such a deployment:

.. code-block:: yaml

   apiVersion: v1
   kind: Pod
   metadata:
     name: test-rdma-shared-1
     annotations:
       k8s.v1.cni.cncf.io/networks: rdmashared-net
   spec:
     containers:
     - image: myimage
       name: rdma-shared-1
       securityContext:
         capabilities:
           add:
           - IPC_LOCK
       resources:
         limits:
           rdma/rdmashared: 1
         requests:
           rdma/rdmashared: 1
     restartPolicy: OnFailure

""""""""""""""""""""""""""""""""""""""""""""""""""""
Network Operator Deployment for DPDK Workloads - OCP
""""""""""""""""""""""""""""""""""""""""""""""""""""

In order to configure `HUGEPAGES` in OpenShift, refer to this `steps <https://docs.openshift.com/container-platform/latest/scalability_and_performance/what-huge-pages-do-and-how-they-are-consumed-by-apps.html>`_.

For SR-IOV Network Operator configuration instructions, visit the Official `Website <https://docs.openshift.com/container-platform/latest/networking/hardware_networks/configuring-sriov-operator.html#configuring-sriov-operator>`_.