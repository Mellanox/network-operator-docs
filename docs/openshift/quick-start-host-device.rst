.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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


*********************************
Host Device Network with RDMA
*********************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

A pod receives a whole PCI network device, exclusively. This is the simplest mode — it needs no
operator beyond the Network Operator, creates no Virtual Functions, and does not drain or reboot
nodes.

It is also the mode to use when OpenShift itself runs inside a virtual machine and the
hypervisor has passed through a NIC or a Virtual Function: the guest consumes the device it was
given, and ``HostDeviceNetwork`` hands it to a pod.

Complete the shared steps in :doc:`Quick Start Guide for OpenShift <quick-start-openshift>`
first.

**Step 1**: Create the NicClusterPolicy

The device plugin selects any NVIDIA RDMA-capable device, so the same policy works whether the
node has a physical NIC or a passed-through device.

.. literalinclude:: ../../examples/processed/openshift-host-device/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f nicclusterpolicy.yaml

Wait for the DOCA-OFED driver to load on every NIC node before continuing:

.. code-block:: bash

   oc -n nvidia-network-operator get pods -l app=mofed
   oc get nicclusterpolicy nic-cluster-policy -o jsonpath='{.status.state}{"\n"}'

**Step 2**: Create an IPPool for NV-IPAM

Adjust the subnet and gateway to match your fabric.

.. literalinclude:: ../../examples/processed/openshift-host-device/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f ippool.yaml

**Step 3**: Create the HostDeviceNetwork

.. literalinclude:: ../../examples/processed/openshift-host-device/30-hostdevicenetwork.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f hostdevicenetwork.yaml

Confirm the resource is advertised and the network attachment exists:

.. code-block:: bash

   oc get nodes -o custom-columns='NODE:.metadata.name,HOSTDEV:.status.allocatable.nvidia\.com/hostdev'
   oc -n default get network-attachment-definitions

**Step 4**: Deploy the test pods

The two pods are scheduled onto different nodes by pod anti-affinity.

.. literalinclude:: ../../examples/processed/openshift-host-device/40-pod.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f pod.yaml

.. note::

   *Pending review.* The security context on these pods is under confirmation. On OpenShift,
   adding ``IPC_LOCK`` requires a SecurityContextConstraints that permits it; whether a
   least-privilege custom SCC is sufficient for RDMA memory registration, or the ``privileged``
   SCC is required, is being validated.

**Step 5**: Test RDMA connectivity

Check both pods are running, and on different nodes:

.. code-block:: bash

   oc -n default get pods -o wide

Capture the server address and each pod's RDMA device:

.. code-block:: bash

   export SERVER_IP=$(oc -n default get pod hostdev-rdma-server \
     -o jsonpath='{.metadata.annotations.k8s\.v1\.cni\.cncf\.io/network-status}' \
     | jq -r '.[] | select(.name=="default/hostdev-net") | .ips[0]')
   export SERVER_RDMA_DEV=$(oc -n default exec hostdev-rdma-server -- ibv_devices | awk 'NR==3 {print $1}')
   export CLIENT_RDMA_DEV=$(oc -n default exec hostdev-rdma-client -- ibv_devices | awk 'NR==3 {print $1}')

   echo "Server IP: $SERVER_IP"
   echo "Server RDMA device: $SERVER_RDMA_DEV"
   echo "Client RDMA device: $CLIENT_RDMA_DEV"

Start the server:

.. code-block:: bash

   oc -n default exec -it hostdev-rdma-server -- bash -lc "ib_write_bw -d $SERVER_RDMA_DEV -R -a --report_gbits"

In a second terminal, run the client:

.. code-block:: bash

   oc -n default exec -it hostdev-rdma-client -- bash -lc "ib_write_bw -d $CLIENT_RDMA_DEV -R -a --report_gbits $SERVER_IP"

The test completes with a bandwidth table. Throughput depends on your NICs and fabric.

**Clean up**

.. code-block:: bash

   oc delete -f pod.yaml
   oc delete -f hostdevicenetwork.yaml
   oc delete -f ippool.yaml

**Complete Configuration**

.. literalinclude:: ../../examples/processed/openshift-host-device/complete.yaml
   :language: yaml
