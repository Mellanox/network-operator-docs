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


***********************************
RDMA Shared Device with MacVLAN
***********************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

A pod receives a MacVLAN interface plus shared access to the host's RDMA device. Many pods can
use the same NIC, which suits workloads that need RDMA but not device isolation. Like Host
Device, this mode needs no operator beyond the Network Operator and creates no Virtual
Functions.

``rdmaHcaMax`` sets how many pods on a node may share the device. It does not partition
bandwidth or ports — every pod that gets a share sees the same device — so workloads should
request ``1``.

Complete the shared steps in :doc:`Quick Start Guide for OpenShift <quick-start-openshift>`
first.

**Step 1**: Create the NicClusterPolicy

Set ``ifNames`` to the interface on your nodes that carries the RDMA fabric. Check it with
``ip link`` on a worker node.

.. literalinclude:: ../../examples/processed/openshift-rdma-shared/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f nicclusterpolicy.yaml

Wait for the DOCA-OFED driver to load on every NIC node before continuing:

.. code-block:: bash

   oc -n nvidia-network-operator get pods -l app=mofed
   oc get nicclusterpolicy nic-cluster-policy -o jsonpath='{.status.state}{"\n"}'

**Step 2**: Create an IPPool for NV-IPAM

Adjust the subnet and gateway to match your fabric.

.. literalinclude:: ../../examples/processed/openshift-rdma-shared/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f ippool.yaml

**Step 3**: Create the MacvlanNetwork

.. literalinclude:: ../../examples/processed/openshift-rdma-shared/30-macvlannetwork.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f macvlannetwork.yaml

Confirm the resource is advertised and the network attachment exists:

.. code-block:: bash

   oc get nodes -o custom-columns='NODE:.metadata.name,RDMA:.status.allocatable.rdma/rdma_shared_device_a'
   oc -n default get network-attachment-definitions

**Step 4**: Deploy the test pods

The two pods are scheduled onto different nodes by pod anti-affinity.

.. literalinclude:: ../../examples/processed/openshift-rdma-shared/40-pod.yaml
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

   export SERVER_IP=$(oc -n default get pod macvlan-rdma-server \
     -o jsonpath='{.metadata.annotations.k8s\.v1\.cni\.cncf\.io/network-status}' \
     | jq -r '.[] | select(.name=="default/macvlan-network") | .ips[0]')
   export SERVER_RDMA_DEV=$(oc -n default exec macvlan-rdma-server -- ibv_devices | awk 'NR==3 {print $1}')
   export CLIENT_RDMA_DEV=$(oc -n default exec macvlan-rdma-client -- ibv_devices | awk 'NR==3 {print $1}')

   echo "Server IP: $SERVER_IP"
   echo "Server RDMA device: $SERVER_RDMA_DEV"
   echo "Client RDMA device: $CLIENT_RDMA_DEV"

Start the server:

.. code-block:: bash

   oc -n default exec -it macvlan-rdma-server -- bash -lc "ib_write_bw -d $SERVER_RDMA_DEV -R -a --report_gbits"

In a second terminal, run the client:

.. code-block:: bash

   oc -n default exec -it macvlan-rdma-client -- bash -lc "ib_write_bw -d $CLIENT_RDMA_DEV -R -a --report_gbits $SERVER_IP"

The test completes with a bandwidth table. Throughput depends on your NICs and fabric.

**Clean up**

.. code-block:: bash

   oc delete -f pod.yaml
   oc delete -f macvlannetwork.yaml
   oc delete -f ippool.yaml

**Complete Configuration**

.. literalinclude:: ../../examples/processed/openshift-rdma-shared/complete.yaml
   :language: yaml
