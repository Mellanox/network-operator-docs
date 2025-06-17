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
.. include:: ./common/vars.rst

**************************************************
NVIDIA Network Operator |network-operator-version|
**************************************************


The NVIDIA Network Operator simplifies the provisioning and management of NVIDIA networking resources in a Kubernetes cluster.
The operator automatically installs the required host networking software - bringing together all the needed components to provide high-speed network connectivity.
These components include the NVIDIA networking driver, Kubernetes device plugin, CNI plugins, IP address management (IPAM) plugin and others.
The NVIDIA Network Operator works in conjunction with the NVIDIA GPU Operator to deliver high-throughput, low-latency networking for scale-out, GPU computing clusters.

A Helm chart is provided for easily deploying the Network operator in a cluster to provision the host software on NVIDIA-enabled nodes.

===================
Networking Features
===================

**RDMA Support**
  Remote Direct Memory Access (RDMA) for memory-to-memory data transfers that bypass the CPU and kernel networking stack. Supports InfiniBand and RDMA over Converged Ethernet (RoCE) protocols.

**SR-IOV Virtualization**
  Single Root I/O Virtualization technology that partitions network interface cards into multiple Virtual Functions (VFs) for hardware-level isolation and performance.

**Secondary Networks**
  Multiple network interface types including host device networks, MacVLAN networks, IP over InfiniBand networks, and SR-IOV networks for specialized networking requirements.

**Driver Management**
  Automated deployment and management of NVIDIA DOCA-OFED networking drivers across cluster nodes with version control and updates.

==================
Supported Hardware
==================

See the :doc:`platform-support` page for supported hardware and software.

=========
Use Cases
=========

**High-Performance Computing (HPC)**: Scientific simulations, modeling applications, and distributed computing workloads

**Machine Learning**: Distributed training and inference workloads across multiple GPU nodes

**Data Processing**: Database systems, analytics platforms, and storage applications requiring high network throughput

**Legacy Applications**: Existing applications that require direct access to networking hardware

=================
License Agreement
=================

The NVIDIA Network Operator is licensed under Apache 2.0 and contributions are accepted with a DCO. 
See the contributing document for more information on how to contribute and the release artifacts.

==========
Learn More
==========

The Network Operator is open-source. 
For more information on contributions and release artifacts, see the `GitHub repo <https://github.com/Mellanox/network-operator>`_.

For detailed deployment instructions and examples:

- :doc:`quick-start/quick-start-k8s`: Quick deployment guide with common configurations  
- :doc:`deployment-guide-kubernetes`: Detailed deployment scenarios
