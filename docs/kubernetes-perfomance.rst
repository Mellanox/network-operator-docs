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


*****************************
Kubernetes Performance Tuning
*****************************

This section provides a configuration example for Kubernetes performance tuning for SR-IOV.

The machine in this example includes the following CPUs:

.. code-block::

  numactl --hardware
  available: 2 nodes (0-1)
  node 0 cpus: 0 1 2 3 4 5 12 13 14 15 16 17
  node 0 size: 31990 MB
  node 0 free: 25314 MB
  node 1 cpus: 6 7 8 9 10 11 18 19 20 21 22 23
  node 1 size: 32237 MB
  node 1 free: 27135 MB
  node distances:
  node 0 1
  0: 10 21
  1: 21 10

3 CPUs are reserved on NUMA, and 1 for the system and for Kubernetes. Edit `/var/lib/kubelet/config.yaml`:

.. code-block:: yaml

  cpuManagerPolicy: static
  reservedSystemCPUs: 6-8
  topologyManagerPolicy: single-numa-node

Using `isolcpus` kernel boot command-line isolates the CPUs from the kernel scheduler. This will ensure that a user-space process will not be scheduled by the kernel. In this example, CPUs 0-5 and 9-23 are isolated.

.. code-block::

  isolcpus=0,1,2,3,4,5,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24

.. warning::
  In case of changes in the `reservedSystemCPUs` or in the `cpuManagerPolicy` the `/var/lib/kubelet/cpu_manager_state` should be deleted, and the `kubelet` should be restarted.
