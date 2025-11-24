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

*********************************    
Deploy SR-IOV Network with RDMA
*********************************    

**Step 1**: Create NicClusterPolicy

.. literalinclude:: ../../examples/processed/sriov-network-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../../examples/processed/sriov-network-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Configure SR-IOV

.. literalinclude:: ../../examples/processed/sriov-network-rdma/30-sriovnetworknodepolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovnetworknodepolicy.yaml

**Step 4**: Create SR-IOV Network

.. literalinclude:: ../../examples/processed/sriov-network-rdma/40-sriovnetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f sriovnetwork.yaml

**Step 5**: Deploy test workload

.. literalinclude:: ../../examples/processed/sriov-network-rdma/50-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

**Step 6**: Verify the deployment

Check that the pods are running on different nodes:

.. code-block:: bash

    kubectl get pods -n default -o wide

Verify RDMA devices are available in the pods:

.. code-block:: bash

    kubectl -n default exec sriov-rdma-server -- ibv_devices
    kubectl -n default exec sriov-rdma-client -- ibv_devices

Capture the server IP and RDMA device names in environment variables:

.. code-block:: bash

    export SERVER_IP=$(kubectl get pod sriov-rdma-server -n default -o jsonpath='{.metadata.annotations.k8s\.v1\.cni\.cncf\.io/network-status}' | jq -r '.[] | select(.name=="default/sriov-rdma-network") | .ips[0]')
    export SERVER_RDMA_DEV=$(kubectl -n default exec sriov-rdma-server -- ibv_devices | awk 'NR==3 {print $1}')
    export CLIENT_RDMA_DEV=$(kubectl -n default exec sriov-rdma-client -- ibv_devices | awk 'NR==3 {print $1}')
    
    echo "Server IP: $SERVER_IP"
    echo "Server RDMA Device: $SERVER_RDMA_DEV"
    echo "Client RDMA Device: $CLIENT_RDMA_DEV"


**Step 7**: Test RDMA connectivity

Start the RDMA bandwidth test server:

.. code-block:: bash

    kubectl -n default exec -it sriov-rdma-server -- bash -lc "ib_write_bw -d $SERVER_RDMA_DEV -R -a --report_gbits"

In a separate terminal, run the RDMA bandwidth test client:

.. code-block:: bash

    kubectl -n default exec -it sriov-rdma-client -- bash -lc "ib_write_bw -d $CLIENT_RDMA_DEV -R -a --report_gbits $SERVER_IP"

.. note::
   The commands above automatically use the first available RDMA device from each pod.
   If you need to use a different device, manually set the environment variables or replace them in the command.

**Complete Configuration**

.. literalinclude:: ../../examples/processed/sriov-network-rdma/complete.yaml
   :language: yaml
