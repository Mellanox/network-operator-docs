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

*************************************************
Deploy IP over InfiniBand with RDMA Shared Device
*************************************************

**Step 1**: Create NicClusterPolicy with IPoIB support and 3 RDMA shared device pools

.. literalinclude:: ../../examples/processed/ipoib-rdma-shared/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool CRs for nv-ipam with 3 IP pools

.. literalinclude:: ../../examples/processed/ipoib-rdma-shared/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create IPoIBNetwork CRs for 3 IPoIB networks

.. literalinclude:: ../../examples/processed/ipoib-rdma-shared/30-ipoibnetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ipoibnetwork.yaml

**Step 4**: Deploy test workloads for 3 IPoIB networks

.. literalinclude:: ../../examples/processed/ipoib-rdma-shared/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it ipoib-test-pod-a -- ibstat
    kubectl exec -it ipoib-test-pod-a -- ip addr show

    kubectl exec -it ipoib-test-pod-b -- ibstat
    kubectl exec -it ipoib-test-pod-b -- ip addr show
    
    kubectl exec -it ipoib-test-pod-c -- ibstat
    kubectl exec -it ipoib-test-pod-c -- ip addr show

**Complete Configuration**

.. literalinclude:: ../../examples/processed/ipoib-rdma-shared/complete.yaml
   :language: yaml