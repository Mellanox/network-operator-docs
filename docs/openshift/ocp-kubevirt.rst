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

*******************************************
OpenShift Virtualization SR-IOV Integration
*******************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

This guide explains how to attach SR-IOV Virtual Functions (VFs) to OpenShift Virtualization virtual machines using VFIO PCI passthrough.

With ``deviceType: vfio-pci``, a VF's PCI device is passed directly into the guest VM via the `VFIO <https://www.kernel.org/doc/Documentation/vfio.txt>`_ userspace interface.
The VM gets near-native network performance because the data path bypasses the host kernel entirely.

For more information about OpenShift Virtualization, please refer to the `OpenShift Virtualization <https://www.redhat.com/en/technologies/cloud-computing/openshift/virtualization>`_.


=============
Prerequisites
=============

- OpenShift Virtualization installed on the cluster:

  - Red Hat OpenShift: `OpenShift Virtualization installation guide <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/virtualization/installing>`_
- IOMMU enabled on worker nodes:

  - Intel: kernel parameter ``intel_iommu=on iommu=pt``
  - AMD: kernel parameter ``amd_iommu=on iommu=pt``

- ``vfio-pci`` kernel module available on worker nodes
- ``virtctl`` CLI tool installed:

  - Red Hat OpenShift: `Installing virtctl on OpenShift <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/virtualization/getting-started#installing-virtctl_virt-using-the-cli-tools>`_

----------------------
Node Feature Discovery
----------------------

To enable Node Feature Discovery, please follow the official `guide <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/specialized_hardware_and_driver_enablement/psap-node-feature-discovery-operator>`_.
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

For more details please read official NFD `documentation <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/specialized_hardware_and_driver_enablement/psap-node-feature-discovery-operator#creating-nfd-cr-cli_psap-node-feature-discovery-operator>`_.

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

If you are planning to use SR-IOV, follow these `instructions <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/networking_operators/sr-iov-operator#installing-sriov-operator>`_ to install SR-IOV Network Operator on an OpenShift Container Platform.

.. warning::
   The SR-IOV resources created will have the `openshift.io` prefix.


.. warning::
   SR-IOV Network Operator configuration documentation can be found on the `Official Website <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/networking_operators/sr-iov-operator#configuring-sriov-operator>`_.

========================================
Step 1: Create an SriovNetworkNodePolicy
========================================

Configure VFs with ``deviceType: vfio-pci``. The operator creates the VFs and binds them to the ``vfio-pci`` driver, making them available as allocatable extended resources on the node.

Set ``isRdma: false`` (RDMA is not compatible with ``vfio-pci``). The guest VM must have the ``mlx5_core`` kernel module available.

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetworkNodePolicy
   metadata:
     name: kubevirt-policy
     namespace: openshift-sriov-network-operator
   spec:
     resourceName: kubevirt_sriov
     nodeSelector:
       feature.node.kubernetes.io/network-sriov.capable: "true"
     numVfs: 8
     nicSelector:
       vendor: "15b3"
       pfNames:
         - ens1f0
     deviceType: vfio-pci
     isRdma: false

Wait for the policy to be applied:

.. code-block:: bash

   oc get sriovnetworknodestates -n openshift-sriov-network-operator -o jsonpath='{.items[*].status.syncStatus}'

The output should show ``Succeeded`` for all nodes.


==============================
Step 2: Create an SriovNetwork
==============================

Create an ``SriovNetwork`` CR that references the ``resourceName`` from the policy. This generates a ``NetworkAttachmentDefinition`` that KubeVirt VMs can consume.

.. note::
   With VFIO passthrough, the VF is passed directly into the guest VM. The host kernel does not see the network interface, so pod-level CNI IPAM cannot assign IPs to the VF. IP addresses must be configured inside the guest (e.g. via cloud-init or DHCP from an external server on the L2 network).

.. code-block:: yaml

   apiVersion: sriovnetwork.openshift.io/v1
   kind: SriovNetwork
   metadata:
     name: sriov-kubevirt-net
     namespace: openshift-sriov-network-operator
   spec:
     resourceName: kubevirt_sriov
     networkNamespace: default
     spoofChk: "off"
     trust: "on"

Verify the ``NetworkAttachmentDefinition`` was created:

.. code-block:: bash

   oc get net-attach-def -n default sriov-kubevirt-net


===============================
Step 3: Create a VirtualMachine
===============================

Define a ``VirtualMachine`` with an ``sriov: {}`` interface pointing at the network attachment definition. Since IPAM is handled inside the guest, use cloud-init to configure a static IP on the SR-IOV interface.

.. code-block:: yaml

   apiVersion: kubevirt.io/v1
   kind: VirtualMachine
   metadata:
     name: vm-sriov
     namespace: default
   spec:
     runStrategy: Always
     template:
       spec:
         domain:
           devices:
             interfaces:
               - name: default
                 masquerade: {}
               - name: sriov-net
                 sriov: {}
             disks:
               - name: containerdisk
                 disk: {bus: virtio}
               - name: cloudinit
                 disk: {bus: virtio}
           resources:
             requests:
               memory: "4Gi"
         networks:
           - name: default
             pod: {}
           - name: sriov-net
             multus:
               networkName: sriov-kubevirt-net
         volumes:
           - name: containerdisk
             containerDisk:
               image: quay.io/containerdisks/fedora:latest
           - name: cloudinit
             cloudInitNoCloud:
               userData: |-
                 #cloud-config
                 password: password123
                 chpasswd: {expire: false}
                 ssh_pwauth: true
                 runcmd:
                   - |
                     for i in $(seq 1 30); do
                       SRIOV_IF=$(ls -1 /sys/class/net/ | grep -v ^lo$ | grep -v ^enp1s0$ | head -1)
                       [ -n "$SRIOV_IF" ] && break
                       sleep 1
                     done
                     if [ -n "$SRIOV_IF" ]; then
                       nmcli con add type ethernet ifname $SRIOV_IF con-name sriov \
                         ipv4.addresses 192.168.0.1/24 ipv4.method manual
                       nmcli con up sriov
                     fi

The ``sriov: {}`` interface type tells KubeVirt to pass the VF into the VM via VFIO. KubeVirt's resource injector automatically adds the extended resource request (e.g. ``nvidia.com/kubevirt_sriov: "1"``) to the virt-launcher pod.

The cloud-init ``runcmd`` script waits for the SR-IOV interface to appear (the ``mlx5_core`` driver must load first), then configures a static IP using ``nmcli``. Adjust the IP address for each VM accordingly.


============
Verification
============

------------------------
Check the VMI is Running
------------------------

.. code-block:: bash

   oc get vmi vm-sriov

Verify the VF Inside the Guest
-------------------------------

Connect to the VM console:

.. code-block:: bash

   virtctl console vm-sriov

Inside the guest, verify the SR-IOV interface and IP configuration:

.. code-block:: bash

   ip a
   lspci | grep -i mellanox

.. note::
   NVIDIA NICs require the ``mlx5_core`` driver inside the guest. If no network interface appears but ``lspci`` shows the device, run ``modprobe mlx5_core``.


==================
Guest Driver Note
==================

NVIDIA VFs passed via VFIO require the ``mlx5_core`` driver inside the guest VM. If the guest image does not include it, you need to either:

- Use a guest image with NVIDIA DOCA-OFED or inbox ``mlx5_core`` drivers pre-installed
- Install the driver via cloud-init at first boot

.. warning::
   Without the driver, the VF PCI device appears in ``lspci`` output but no network interface is created.


===========
Limitations
===========

**No live migration**
  VFIO passthrough gives the VM direct access to hardware PCI resources. Live migration is not possible because hardware state cannot be serialized.

**Host-side RDMA not available**
  ``deviceType: vfio-pci`` is incompatible with ``isRdma: true`` on the ``SriovNetworkNodePolicy``. RDMA works inside the guest VM because ``mlx5_core`` provides both ethernet and RDMA capabilities. To enable RDMA inside the guest, install the required packages and load the kernel modules:

  .. code-block:: bash

     sudo dnf install -y kernel-modules-extra-$(uname -r) rdma-core
     sudo modprobe ib_uverbs mlx5_ib

**IOMMU required**
  Nodes without IOMMU support cannot use VFIO passthrough. Run ``virt-host-validate qemu`` on the worker nodes to check hardware virtualization and IOMMU:

  .. code-block:: bash

     virt-host-validate qemu

  All checks should show ``PASS``, including ``Checking for device assignment IOMMU support`` and ``Checking if IOMMU is enabled by kernel``.

  Confirm IOMMU groups are populated:

  .. code-block:: bash

     ls /sys/kernel/iommu_groups/

  If IOMMU checks fail, enable it on the worker nodes via kernel parameter (``intel_iommu=on iommu=pt`` or ``amd_iommu=on iommu=pt``) and reboot.


===============
Troubleshooting
===============

------------------------
VF Not Available on Node
------------------------

Check node allocatable resources:

.. code-block:: bash

   oc describe node <node> | grep kubevirt_sriov

Verify the VFs are bound to ``vfio-pci``:

.. code-block:: bash

   oc exec -n openshift-sriov-network-operator <config-daemon-pod> -- lspci -k -s <vf-pci-addr>

------------------
VMI Fails to Start
------------------

Check virt-launcher pod events:

.. code-block:: bash

   oc describe pod virt-launcher-vm-sriov-xxxxx

Check KubeVirt logs:

.. code-block:: bash

   oc logs virt-launcher-vm-sriov-xxxxx -c compute

Common causes:

- IOMMU not enabled on the host
- ``vfio-pci`` module not loaded
- No VFs available (all allocated to other workloads)

-----------------------------
No Network Interface in Guest
-----------------------------

If ``lspci`` inside the guest shows the device but no interface appears in ``ip link``:

.. code-block:: bash

   modprobe mlx5_core

If the module is not available, install NVIDIA DOCA-OFED drivers in the guest image.

