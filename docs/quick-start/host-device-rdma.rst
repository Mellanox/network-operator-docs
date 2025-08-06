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
Host Device Network with RDMA
*********************************

**Step 1**: Create NicClusterPolicy with host device support

.. literalinclude:: ../../examples/processed/host-device-rdma/10-nicclusterpolicy.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f nicclusterpolicy.yaml

**Step 2**: Create IPPool for nv-ipam

.. literalinclude:: ../../examples/processed/host-device-rdma/20-ippool.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f ippool.yaml

**Step 3**: Create HostDeviceNetwork

.. literalinclude:: ../../examples/processed/host-device-rdma/30-hostdevicenetwork.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f hostdevicenetwork.yaml

**Step 4**: Deploy test workload

.. literalinclude:: ../../examples/processed/host-device-rdma/40-pod.yaml
   :language: yaml

.. code-block:: bash

   kubectl apply -f pod.yaml

Verify the deployment:

.. code-block:: bash

    kubectl exec -it hostdev-test-pod -- lspci | grep Mellanox

**Complete Configuration**

.. literalinclude:: ../../examples/processed/host-device-rdma/complete.yaml
   :language: yaml
