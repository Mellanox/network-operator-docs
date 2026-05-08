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

*************
Host Device
*************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

================================================================================
Use Case
================================================================================

Direct passthrough to host network devices, with no virtualization layer. Each pod gets exclusive access to a physical NIC. Minimal CPU overhead --- best for legacy HPC codes, specialized protocols, and DPDK applications. Works with both Ethernet and InfiniBand fabrics.

================================================================================
Prerequisites
================================================================================

- Network Operator Helm chart installed (see :doc:`../installation`).
- ``l8k`` binary on your PATH.
- One or more Mellanox NICs per node not used by the host.

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
       --deployment-type host_device --multirail \
       --save-deployment-files ./deployments

Add ``--fabric ethernet`` or ``--fabric infiniband`` if you need to constrain the fabric explicitly.

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
   kubectl get hostdevicenetwork

================================================================================
See Also
================================================================================

- :doc:`Deployment Profiles <profiles>` --- decision matrix
- :doc:`Generate Workflow <../workflows/generate>` --- generation details
- :doc:`Configuration Reference <../reference/config>` --- ``hostdev`` config section
