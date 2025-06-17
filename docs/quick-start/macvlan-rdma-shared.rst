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
Deploy MacVLAN Network with RDMA Shared Device
*************************************************

.. _macvlan-rdma-shared-deployment:

**Step 1**: Create NicClusterPolicy with RDMA shared device

.. literalinclude:: ../../examples/processed/macvlan-rdma-shared/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../../examples/processed/macvlan-rdma-shared/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create MacvlanNetwork

.. literalinclude:: ../../examples/processed/macvlan-rdma-shared/30-macvlannetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f macvlannetwork.yaml

**Step 4**: Deploy test workload

.. literalinclude:: ../../examples/processed/macvlan-rdma-shared/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it macvlan-test-pod -- ip addr show
    kubectl exec -it macvlan-test-pod -- ibv_devinfo

.. dropdown:: Complete Configuration
   :color: primary
   :icon: code

   .. literalinclude:: ../../examples/processed/macvlan-rdma-shared/complete.yaml
      :language: yaml