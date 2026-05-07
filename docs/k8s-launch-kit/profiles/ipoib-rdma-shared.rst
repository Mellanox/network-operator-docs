.. license-header
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
.. include:: ../../common/vars.rst

**********************************
IP over InfiniBand (RDMA Shared)
**********************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Use Case
================================================================================

InfiniBand fabric with IPoIB and a shared RDMA device plugin. Multiple pods on a node can share access to the same RDMA hardware. Suited for parallel I/O workloads, distributed storage, and data analytics where dedicated VFs are not required.

================================================================================
Prerequisites
================================================================================

- Network Operator Helm chart installed (see :doc:`../installation`).
- ``l8k`` binary on your PATH.
- Mellanox NICs in InfiniBand mode on each node.

================================================================================
Discover
================================================================================

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

================================================================================
Generate
================================================================================

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric infiniband --deployment-type rdma_shared --multirail \
       --save-deployment-files ./deployments

================================================================================
Deploy
================================================================================

.. code-block:: bash

   l8k deploy

================================================================================
Verify
================================================================================

.. code-block:: bash

   kubectl -n nvidia-network-operator get pods
   kubectl get ipoibnetwork

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``ipoib`` and ``rdmaShared`` config sections
