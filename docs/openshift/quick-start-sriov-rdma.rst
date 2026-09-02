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


****************************
SR-IOV Network with RDMA
****************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

A pod receives a dedicated SR-IOV Virtual Function with its own RDMA device. This gives the
strongest isolation between workloads, at the cost of a more involved setup.

Unlike the other two modes, this one needs **Red Hat's SR-IOV Network Operator** — the NVIDIA
Network Operator OLM bundle does not ship an SR-IOV operator or the ``sriovnetwork.openshift.io``
custom resource definitions. Creating Virtual Functions also drains and reboots the selected
nodes.

This mode is for pods. To attach Virtual Functions to virtual machines instead, see
:doc:`OpenShift Virtualization with SR-IOV <ocp-kubevirt>` — that path uses ``vfio-pci`` with
``isRdma: false`` and cannot be served by the same ``SriovNetworkNodePolicy``.

Complete the shared steps in :doc:`Quick Start Guide for OpenShift <quick-start-openshift>`
first, then install Red Hat's SR-IOV Network Operator from OperatorHub into the
``openshift-sriov-network-operator`` namespace and wait for it to become ready:

.. code-block:: bash

   oc -n openshift-sriov-network-operator get pods

**Step 1**: Create the NicClusterPolicy

This policy provides the DOCA-OFED driver and NV-IPAM. The Virtual Functions themselves are
created by Red Hat's SR-IOV Network Operator in the next steps.

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f nicclusterpolicy.yaml

Wait for the DOCA-OFED driver to load on every NIC node before continuing:

.. code-block:: bash

   oc -n nvidia-network-operator get pods -l app=mofed
   oc get nicclusterpolicy nic-cluster-policy -o jsonpath='{.status.state}{"\n"}'

**Step 2**: Create an IPPool for NV-IPAM

Adjust the subnet and gateway to match your fabric.

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f ippool.yaml

**Step 3**: Create the SriovNetworkNodePolicy

Set ``pfNames`` to the physical function on your nodes. Applying this policy drains and reboots
each selected node while the Virtual Functions are created.

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/30-sriovnetworknodepolicy.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f sriovnetworknodepolicy.yaml

Watch the nodes converge before continuing:

.. code-block:: bash

   oc get sriovnetworknodestates -n openshift-sriov-network-operator

.. note::

   On BlueField-3 in DPU or embedded CPU mode, the SR-IOV Network Operator's Mellanox plugin
   must be disabled, otherwise the configuration daemon fails with a *NIC is in DPU mode* error:

   .. code-block:: bash

      oc patch sriovoperatorconfig default -n openshift-sriov-network-operator \
        --type=merge --patch '{"spec":{"disablePlugins":["mellanox"]}}'

**Step 4**: Create the SriovNetwork

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/40-sriovnetwork.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f sriovnetwork.yaml

Confirm the resource is advertised and the network attachment exists:

.. code-block:: bash

   oc get nodes -o custom-columns='NODE:.metadata.name,VF:.status.allocatable.openshift\.io/sriovrdma'
   oc -n default get network-attachment-definitions

**Step 5**: Deploy the test pods

The two pods are scheduled onto different nodes by pod anti-affinity.

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/50-pod.yaml
   :language: yaml

.. code-block:: bash

   oc apply -f pod.yaml

.. note::

   *Pending review.* The security context on these pods is under confirmation. On OpenShift,
   adding ``IPC_LOCK`` requires a SecurityContextConstraints that permits it; whether a
   least-privilege custom SCC is sufficient for RDMA memory registration, or the ``privileged``
   SCC is required, is being validated.

**Step 6**: Test RDMA connectivity

Check both pods are running, and on different nodes:

.. code-block:: bash

   oc -n default get pods -o wide

Capture the server address and each pod's RDMA device:

.. code-block:: bash

   export SERVER_IP=$(oc -n default get pod sriov-rdma-server \
     -o jsonpath='{.metadata.annotations.k8s\.v1\.cni\.cncf\.io/network-status}' \
     | jq -r '.[] | select(.name=="default/sriov-rdma-network") | .ips[0]')
   export SERVER_RDMA_DEV=$(oc -n default exec sriov-rdma-server -- ibv_devices | awk 'NR==3 {print $1}')
   export CLIENT_RDMA_DEV=$(oc -n default exec sriov-rdma-client -- ibv_devices | awk 'NR==3 {print $1}')

   echo "Server IP: $SERVER_IP"
   echo "Server RDMA device: $SERVER_RDMA_DEV"
   echo "Client RDMA device: $CLIENT_RDMA_DEV"

Start the server:

.. code-block:: bash

   oc -n default exec -it sriov-rdma-server -- bash -lc "ib_write_bw -d $SERVER_RDMA_DEV -R -a --report_gbits"

In a second terminal, run the client:

.. code-block:: bash

   oc -n default exec -it sriov-rdma-client -- bash -lc "ib_write_bw -d $CLIENT_RDMA_DEV -R -a --report_gbits $SERVER_IP"

The test completes with a bandwidth table. Throughput depends on your NICs and fabric.

**Clean up**

.. code-block:: bash

   oc delete -f pod.yaml
   oc delete -f sriovnetwork.yaml
   oc delete -f sriovnetworknodepolicy.yaml
   oc delete -f ippool.yaml

**Complete Configuration**

.. literalinclude:: ../../examples/processed/openshift-sriov-rdma/complete.yaml
   :language: yaml
