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

*Enabling AI Networking in Kubernetes.*

The NVIDIA Network Operator simplifies the provisioning and management of NVIDIA networking resources in a Kubernetes cluster.
The operator automatically installs the required host networking software - bringing together all the needed components to provide high-speed network connectivity.
These components include the NVIDIA networking driver, Kubernetes device plugin, CNI plugins, IP address management (IPAM) plugin and others.
The NVIDIA Network Operator works in conjunction with the `NVIDIA GPU Operator <https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/>`_ to deliver high-throughput, low-latency networking for scale-out, GPU computing clusters.

A Helm chart is provided for easily deploying the Network operator in a cluster to provision the host software on NVIDIA-enabled nodes.

.. note::

   **What's new in 26.7.0**

   * **Spectrum-X Reference Architecture 2.3** — NIC tuning is delivered as a Spectrum-X profile ConfigMap instead of a Reference Architecture version built into the operator. See :doc:`NVIDIA Spectrum-X <spectrum-x/spectrum-x>`.
   * **Hardware Multiplane is GA** — plane load balancing in the NIC with DOCA xPlane, on ConnectX-8 SuperNIC for B300 and GB300 deployments. See :doc:`Architecture and Components <spectrum-x/components>`.
   * **KubeVirt SR-IOV passthrough on Red Hat OpenShift** — accelerated East-West networking for OpenShift Virtualization virtual machines. See :doc:`OpenShift Virtualization SR-IOV Integration <openshift/ocp-kubevirt>`.

   For the full list of changes, see the :doc:`release-notes`.

===================
Networking Features
===================

**RDMA Support**
  Remote Direct Memory Access (RDMA) for memory-to-memory data transfers that bypass the CPU and kernel networking stack. Supports InfiniBand on NVIDIA Quantum-X fabrics and RDMA over Converged Ethernet (RoCE) on NVIDIA Spectrum-X fabrics.

**SR-IOV Virtualization**
  Single Root I/O Virtualization technology that partitions network interface cards into multiple Virtual Functions (VFs) for hardware-level isolation and performance.

**Secondary Networks**
  Multiple network interface types including host device networks, MacVLAN networks, IP over InfiniBand networks, and SR-IOV networks for specialized networking requirements.

**Driver Management**
  Automated deployment and management of NVIDIA DOCA-OFED networking drivers across cluster nodes with version control and updates.

**Heterogeneous Cluster Support**
  Per-node-group NIC driver and device plugin configurations via NicNodePolicy, enabling different DOCA-OFED versions for different node roles.

==================
Supported Hardware
==================

See the :doc:`platform-support` page for supported hardware and software.

=========
Use Cases
=========

**AI Training at Scale**: Distributed training across multi-GPU, multi-node clusters, with GPUDirect RDMA between GPUs and NICs for low-latency East-West traffic.

**AI Inference and Generative AI**: Multi-node serving of large language and multimodal models, where tensor and pipeline parallelism depend on accelerated GPU-to-GPU networking.

**Telco CNFs and DPDK Workloads**: Cloud-native network functions and DPDK-accelerated user-plane applications using SR-IOV for line-rate packet processing.

**Media and Broadcast**: Containerized live-broadcast pipelines on Kubernetes and OpenShift using NVIDIA Rivermax and uncompressed SMPTE ST 2110 over SR-IOV, with PTP-synchronized timing. Foundational to NVIDIA Holoscan for Media.

**Edge AI and Sensor Streaming**: Low-latency sensor ingest over SR-IOV and RDMA for real-time inference on NVIDIA IGX Orin and Grace ARM platforms.

**High-Performance Computing (HPC)**: Scientific simulations, modeling, and distributed computing workloads.

**Data Processing**: Database systems, analytics platforms, and storage applications requiring high network throughput.

==================
License Agreements
==================

The NVIDIA Network Operator source code is licensed under Apache 2.0 and contributions are accepted with a DCO. See the `contributing document <https://github.com/Mellanox/network-operator/blob/master/CONTRIBUTING.md>`_ for more information on how to contribute and the release artifacts.

NVIDIA Network Operator container images distributed via `NVIDIA NGC <https://catalog.ngc.nvidia.com/>`_ are subject to the NVIDIA software license terms. Refer to the corresponding container listing on NGC for the applicable license; by pulling and using these containers you accept those terms.

==========
Learn More
==========

The Network Operator is open-source. For more information on contributions and release artifacts, see the `GitHub repo <https://github.com/Mellanox/network-operator>`_.

For detailed deployment, operational, and release information:

- :doc:`release-notes`: What changed in this release, known issues, and upgrade considerations
- :doc:`platform-support`: Supported hardware, operating systems, and Kubernetes platforms
- :doc:`quick-start/quick-start-k8s`: Quick deployment guide with common configurations
- :doc:`deployment-guide-kubernetes`: Detailed deployment scenarios
- :doc:`life-cycle-management`: Upgrade procedures and lifecycle guidance
- :doc:`troubleshooting/troubleshooting`: Troubleshooting common issues
