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

*************************
MacVLAN (RDMA Shared)
*************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Use Case
================================================================================

Ethernet fabric with MacVLAN network isolation and a shared RDMA device plugin. Each tenant gets its own MAC address and network namespace; RDMA hardware is shared across pods. Ideal for multi-tenant clusters, microservices, and cloud-native HPC where 10+ pods per node need network segmentation.

================================================================================
Prerequisites
================================================================================

- Network Operator Helm chart installed (see :doc:`../installation`).
- ``l8k`` binary on your PATH.
- Mellanox NICs in Ethernet mode on each node.

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
       --fabric ethernet --deployment-type rdma_shared --multirail \
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
   kubectl get macvlannetwork

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``macvlan`` and ``rdmaShared`` config sections
