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


****************************
K8s on Bare Metal - Ethernet
****************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none



This chapter describes Kubernetes solutions running on bare-metal hosts with NVIDIA's Ethernet NIC family.

=============================
Operating System Requirements
=============================

NVIDIA drivers should be installed as part of the operating system.

========================
Kubernetes Prerequisites
========================

Install kubernetes Version 1.18, or newer. You may use the following references to Install Kubernetes with deployment tools:

- `Bootstrapping clusters with kubeadm <https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/>`_
- `Installing Kubernetes with Kubespray <https://kubespray.io/>`_

It is recommended to use Kubernetes Version 1.18 with the following features enabled. This will ensure the best NUMA alignment between the NIC PCI and the CPU, and better utilize SR-IOV performance:

- `CPU Manager <https://kubernetes.io/docs/tasks/administer-cluster/cpu-management-policies>`_ - With static CPU manager policy
- `Topology Manager <https://kubernetes.io/docs/tasks/administer-cluster/topology-manager/>`_ - With single NUMA node policy

Examples of how to configure CPU and topology managers can be found in the :doc:`Kubernetes Performance Tuning </kubernetes-perfomance>` section.

==========================================
Enabling SR-IOV Networking with Kubernetes
==========================================

This chapter describes the setup and configuration procedures of legacy SR-IOV with SR-IOV Device Plugin and SR-IOV CNI.

Single Root IO Virtualization (SR-IOV) is a technology that allows a physical PCIe device to present itself multiple times through the PCIe bus. This technology enables multiple virtual instances of the device with separate resources. These virtual functions can then be provisioned separately. Each VF is an additional device connected to the Physical Function. It shares the same resources with the Physical Function, and its number of ports equals those of the Physical Function.

The following diagram represents the POD networking interfaces with Legacy SR-IOV as a secondary network.

.. image:: images/sriovpod.png

----------------------------------------------
Supported Network Interface Cards and Firmware
----------------------------------------------

NVIDIA Networking supports the following Network Interface Cards and their corresponding firmware versions in Kubernetes:

.. list-table::
   :header-rows: 1

   * - Network Interface Card
     - Firmware Version
   * - ConnectX®-6 Dx
     - 22.28.2006
   * - ConnectX®-6
     - 20.28.2006
   * - ConnectX®-5
     - 16.28.2006

------------------------------------------------
Enabling SR-IOV Virtual Functions in Legacy Mode
------------------------------------------------

SR-IOV Legacy mode supports standard network device and RDMA Over Converged Ethernet (RoCE)-enabled network device.
To enable SR-IOV virtual functions in legacy mode, follow the instructions detailed in this `link <https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin/blob/master/docs/vf-setup.md#mellanox>`_.

--------------------
RoCE Namespace Aware
--------------------

Prior to Kernel Version 5.3.0, all RDMA devices were visible in all network namespaces.
Kernel Version 5.3.0 or NVIDIA OFED Version 4.7 introduce network namespace isolation of RDMA devices.
When the RDMA system is set to exclusive, this feature ensures that the RDMA device is bound to a particular net namespace and visible only to it.
To learn how to enable RoCE Namespace Aware by using RDMA CNI, see `here <https://github.com/k8snetworkplumbingwg/rdma-cni/blob/v1.0.0/README.md>`_.

1. Set the RDMA system to "exclusive". This should be done on the host preparation stage:


.. code-block:: bash

   rdma system set netns exclusive

2. Deploy the RDMA CNI:


.. code-block:: bash
  
   kubectl apply -f https://raw.githubusercontent.com/Mellanox/rdma-cni/v1.0.0/deployment/rdma-cni-daemonset.yaml

3. Update the SR-IOV network CRD with RDMA CNI as a chained plugin:

.. code-block:: yaml
   
   apiVersion: "k8s.cni.cncf.io/v1"
   kind: NetworkAttachmentDefinition
   metadata:
     name: sriov-net
     annotations:
       k8s.v1.cni.cncf.io/resourceName: nvidia.com/mlnx_sriov_netdevice
   spec:
     config: '{
     "cniVersion": "0.3.1",
     "name": "sriov-network",
     "plugins": [
       {
         "type": "sriov",
         "ipam": {
           "type": "host-local",
           "subnet": "10.56.217.0/24",
           "routes": [
             {
               "dst": "0.0.0.0/0"
             }
           ],
           "gateway": "10.56.217.1"
         }
       },
       {
         "type": "rdma"
       }
     ]
   }

.. _Creating SR-IOV with RoCE POD:

Example of RoCE-enabled pod with SR-IOV resource:

.. code-block:: yaml
   
   apiVersion: v1
   kind: Pod
   metadata:
     name: testpod1
     annotations:
       k8s.v1.cni.cncf.io/networks: sriov-net
   spec:
     containers:
     - name: appcntr1
       image: <rdma image>
       imagePullPolicy: IfNotPresent
       securityContext:
         capabilities:
           add: ["IPC_LOCK"]
       command: [ "/bin/bash", "-c", "--" ]
       args: [ "while true; do sleep 300000; done;" ]
       resources:
         requests:
           nvidia.com/mlnx_sriov_netdevice: '1'
         limits:
           nvidia.com/mlnx_sriov_netdevice: '1'

The `<rdma image>` should contain RDMA user space libraries - e.g rdma-core, which are compatible with the host kernel.

Deploy the SR-IOV RoCE POD:

.. code-block:: bash
   
   kubectl create -f  sriov-roce-pod.yaml

---------------------------------
RoCE with Connection Manager (CM)
---------------------------------

Some RDMA applications use RDMA CM to establish connections across the network.
Due to kernel limitation, NVIDIA NICs require pre-allocate MACs for all VFs in the deployment, if an RDMA workload wishes to utilize RMDA CM to establish connection.

To do that, run:

.. code-block:: bash
   
   ip link set <pf-netdev> vf <vf-index> mac <mac-address>
   echo <vf-pci-address> > /sys/bus/pci/drivers/mlx5_core/unbind
   echo <vf-pci-address> > /sys/bus/pci/drivers/mlx5_core/bind

This will populate the VF's node and port GUID required for RDMA CM to establish connection.

-------------------
RoCE with GPUDirect
-------------------

GPUDirect allows network adapters and storage drives to directly read and write to/from GPU memory, thereby eliminating unnecessary memory copies, decreasing CPU overheads and reducing latency. These actions result in significant performance improvements.

GPUDirect requires the following:

- MOFED 5.5-1.0.3.2 and above
- `nvidia-peermem` kernel module loaded by GPU Operator v1.9.0
- NVIDIA GPU and driver supporting GPUDirect e.g Quadro RTX 6000/8000 or Tesla T4/Tesla V100/Tesla A100

The RoCE POD should be deployed as described in `Creating SR-IOV with RoCE POD`_.

----
DPDK
----

SR-IOV DPDK support is configured similarly to SR-IOV (legacy) configuration. This section describes the differences.

1. Create the `sriov-dpdk-pod.yaml` file:

.. code-block:: yaml
   
   apiVersion: v1
   kind: Pod
   metadata:
     name: testpod1
     annotations:
       k8s.v1.cni.cncf.io/networks: sriov-net
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
       command: [ "/bin/bash", "-c", "--" ]
       args: [ "while true; do sleep 300000; done;" ]
       resources:
         requests:
           mellanox.com/mlnx_sriov_netdevice: '1'
         limits:
           mellanox.com/mlnx_sriov_netdevice: '1'
     volumes:
      - name: hugepage
        emptyDir:
          medium: HugePages


The `<dpdk image>` should contain DPDK and RDMA user space libraries e.g - rdma-core, which are compatible with the host Kernel and with each other.

- CRI-O Version 1.17 and above requires adding `NET_RAW` to the capabilities (for other runtimes, `NET_RAW` is the default).
- For DPDK to work with PA addresses with Linux >= 4.0 requires adding `SYS_ADMIN` to the capabilities.
- DPDK applications that configure the device, such as MTU, MAC and link state, require adding `NET_ADMIN`.


Deploy the SR-IOV DPDK POD:

.. code-block:: bash
   
   kubectl create -f sriov-dpdk-pod.yaml

===========
OVS Offload
===========

The ASAP2 solution combines the performance and efficiency of server/storage networking hardware with the flexibility of virtual switching software. ASAP2 offers up to 10 times better performance than non offloaded OVS solutions, delivering software-defined networks with the highest total infrastructure efficiency, deployment flexibility and operational simplicity. Starting from NVIDIA® ConnectX®-5 NICs, NVIDIA supports accelerated virtual switching in server NIC hardware through the ASAP2 feature. While accelerating the data plane, ASAP2 keeps the SDN control plane intact, thus staying completely transparent to applications, maintaining flexibility and ease of deployments.

--------------------------------
OVN Kubernetes CNI with ConnectX
--------------------------------

To enable OVN Kubernetes CNI with ConnectX, see `OVN Kubernetes CNI with OVS offload <https://github.com/ovn-org/ovn-kubernetes/blob/master/docs/ovs_offload.md>`_.

------
Antrea
------

For Antrea CNI configuration instructions, see `Antrea CNI with OVS Offload <https://github.com/antrea-io/antrea/blob/v0.10.0/docs/ovs-offload.md>`_.

================
RoCE Shared Mode
================

RoCE shared mode allows RDMA devices to be shared between PODs on the same host. This configuration can work with macvlan or with ipvlan CNI.

-----------------------
Kubernetes Prerequisite
-----------------------

Install Kubernetes Version 1.16 or above. You may use the following references when installing Kubernetes with deployment tools:

- `Bootstrapping Clusters with Kubeadm <https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/>`_
- `Installing Kubernetes with Kubespray <https://kubespray.io/>`_

----------------------------------
Deploying the Shared Device Plugin
----------------------------------

Create the `rdma-shared.yaml` configMap for the shared device plugin:

.. code-block:: json
   
   {
     "configList": [
       {
         "resourceName": "roce_shared_devices",
         "rdmaHcaMax": 1000,
         "selectors": {
           "vendors": ["15b3"],
           "deviceIDs": ["1017"]
         }
       }
     ]
   }

.. code-block:: bash
   
   kubectl create -f rdma-shared.yaml
   kubectl create -f https://raw.githubusercontent.com/Mellanox/k8s-rdma-shared-dev-plugin/master/images/k8s-rdma-shared-dev-plugin-ds.yaml

For advanced macvlan CNI configuration see following `instructions <https://github.com/containernetworking/plugins/tree/main/plugins/main/macvlan>`_.

Supported IPAM (IP Address Management) operations:

- host-local
- dhcp
- static
- whereabouts
