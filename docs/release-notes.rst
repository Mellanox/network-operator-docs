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


*************
Release Notes
*************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none

========================
Changes and New Features
========================

.. list-table::
   :header-rows: 1
   :widths: 10, 75

   * - Version
     - Description
   * - 24.7.0
     - | - Added support for OpenShift Container Platform v4.16.
       | - Added support for NVIDIA Grace based ARM platforms with OpenShift Container Platform.
       | - Added support for RHEL v8.9, v8.10, v9.3 and v9.4 with Upstream K8s and Containerd runtime.
       | - Added support for Switchdev mode SR-IOV mode with OVS CNI with RHEL.
   * - 24.4.1
     - | - Fixed NVIDIA Network Operator images in OpenShift Container Platform bundle.
   * - 24.4.0
     - | - Added support for OpenShift Container Platform v4.15.
       | - Added support for Ubuntu 24.04.
       | - Added support for NVIDIA Grace based ARM platforms with Ubuntu 22.04 and Upstream K8s as a Tech Preview feature.
       | - Added support for NVIDIA IGX Orin based ARM platforms with Ubuntu 22.04 and Upstream K8s as a GA feature.
       | - Added support for Precompiled DOCA Driver containers for Ubuntu 22.04.
       | - Added support for Switchdev SR-IOV mode with SR-IOV Network Operator and OVS CNI as a Tech Preview feature.
       | - Added support for DOCA Telemetry Service (DTS) integration to expose network telemetry and NIC metrics in K8s.
       | - Added support for network namespace isolation of RDMA devices with RDMA CNI
       | - Added support for RHEL and OpenShift deployments with Real-time kernels.
       | - Enhanced DOCA Driver container deployment and significantly reduced compilation time after node reboots.
   * - 24.1.0
     - | - Added support for Ubuntu 22.04 with Upstream K8s on ARM platforms (NVIDIA IGX Orin) - Tech Preview.
       | - Added support for CNI bin directory configuration.
       | - Added support for OpenShift MOFED/DOCA driver container build and deployment via driver toolkit (DTK).
       | - Added support for Ubuntu 22.04 deployments with Real-time kernels.
       | - Added the ability to disable SR-IOV VF for SR-IOV Network Operator (in systems with pre-configured SR-IOV).
       | - Added the ability to set resource request and limits on the network operator and it components.
   * - 23.10.0
     - | - Added support for OpenShift Container Platform v4.14.
       | - Added support for RHEL v8.8.
       | - Optimized SR-IOV NIC configuration time with Network Operator (vanilla Kubernetes only).
       | - Added a validating admission controller for NVIDIA Network Operator.
       | - Added support for NIC Feature Discovery (driver version discovery).
       | - Added CDI support for SR-IOV Network Device Plugin and RDMA Shared Device Plugin for network device persistency.
       | - Added support for NVIDIA BlueField-3 NIC mode.
       | - Added High-Availability and Leader election support for NV-IPAM.
       | - Added systemd mode support for SR-IOV Network Operator and MOFED container to optimize cluster/node startup time.
   * - 23.7.0
     - | - Added support for OpenShift Container Platform 4.13.
       | - Added support for RHEL 9.1 and 9.2 with CRI-O container runtime (Beta).
       | - Added support for NodeFeatureApi in Node Feature Discovery.
   * - 23.5.0
     - | - Added support for NVIDIA IPAM Plugin deployment.
       | - Added support for CRDs upgrade during NVIDIA Network Operator installation or upgrade.
   * - 23.4.0
     - | - Added support for Kubernetes >= 1.21 and <=1.27.
       | - Added support for NicClusterPolicy update and removal.
       | - Added support for OpenShift Container Platform 4.11 and 4.12.
   * - 23.4.0
     - | - Added a calendar versioning schema for Network Operator releases to better align with the NVIDIA GPU Operator.
       | - Added support for the following operating systems and Kubernetes environments:
       |     - RHEL 8.4 and 8.6 with CRI-O container runtime
       |     - Kubernetes >= 1.21 and <=1.26
       | - Added PKey configuration for IB networks with IB-Kubernetes.
       | - Added the ability to gracefully terminate the OFED container on DGX systems running Red Hat OpenShift.
   * - 1.4.0
     - | - Added support for Kubernetes >= 1.21 and <=1.25.
       | - Added support for Ubuntu 22.04.
       | - Added support for OpenShift Container Platform 4.11 including DGX platform.
       | - Added Beta support for PKey configuration for IB networks with IB-Kubernetes.
   * - 1.3.0
     - | - Added support for Kubernetes >= 1.17 and <=1.24.
       | - Added the option to use a single namespace to deploy Network Operator components.
       | - Added support for automatic MLNX OFED driver upgrade.
       | - Added support for IPoIB CNI.
       | - Added support for Air Gap deployment.
   * - 1.2.0
     - | - Added support for OpenShift Container Platform 4.10.
       | - Added extended selectors support for SR-IOV Device Plugin resources with Helm chart.
       | - Added Whereabouts IP reconciler support.
       | - Added BlueField2 NICs support for SR-IOV operator.
   * - 1.1.0
     - | - Added support for OpenShift Container Platform 4.9.
       | - Added support for Network Operator upgrade from v1.0.0.
       | - Added support for Kubernetes POD Security Policy.
       | - Added support for Kubernetes >= 1.17 and <=1.22.
       | - Added the ability to propagate nodeAffinity property from the NicClusterPolicy to Network Operator dependencies.
   * - 1.0.0
     - | - Added Node Feature Discovery that can be used to mark nodes with NVIDIA SR-IOV NICs.
       | - Added support for different networking models:
       |     - Macvlan Network
       |     - HostDevice Network
       |     - SR-IOV Network
       | - Added Kubernetes cluster scale-up support.
       | - Published Network Operator image at NGC.
       | - Added support for Kubernetes >= 1.17 and <=1.21.

===============
General Support
===============

-------------
Upgrade Notes
-------------

.. list-table::
   :header-rows: 1
   :widths: 10, 75

   * - Version
     - Notes
   * - 23.10.0
     - | - In NV-IPAM v0.1.1, the IP Pools configurations are read from IPPool CRs instead of using a ConfigMap. Existing ConfigMap configuration will be automatically migrated to IPPools CRs as part of the upgrade process.
   * - 23.7.0
     - | - Dropped MLNX_OFED support for versions older than 5.7-0.1.2.0.
       | - Removed nv-peer-mem support in favor of nvidia-peer-mem.
   * - 1.3.0
     - | - The option of manual gradual upgrade is not supported when upgrading to Network Operator v1.3.0, since all pods are dropped/restarted in case components are deployed into the single namespace when the old namespace is deleted. This could lead to networking connectivity issues during the upgrade procedure.
   * - 1.2.0
     - | - Network Operator 1.2.0 deploys the NVIDIA MLNX_OFED 5.6 driver container by default. When deployed, depending on your system kernel and OS configuration, the network device name may change, as it no longer installs an udev rule to force network device naming scheme. Instead, the default setting uses the name already configured in the system by either `systemd.network` or any pre-existing udev rules (e.g `enp3s0f0` netdev will change to `enp3s0f0np0`). If that is the case in your system, please make sure to update the following:
       |     - The `master` network device name in your MacvlanNetwork
       |     - The `ifNames` selector, if used in RDMA shared device plugin resource configuration
       |     - The `pfNames` selector, if used in SR-IOV device plugin configuration
       |     - If the sriov-network-operator is used, any instance of `SriovNetworkNodePolicy` which utilizes `NicSelector.PfNames` field should be updated to the new network device name.
       | - When Network Operator 1.2.0 is installed via Helm, it no longer deploys both RDMA shared device plugin and SR-IOV network device plugin by default, as it may cause the same device to be registered to two different device plugins. This is an undesirable behavior. Instead, by default, only RDMA shared device plugin is deployed via Helm.
       |   If you wish to deploy both device plugins, set the `sriovDevicePlugin.deploy` Helm parameter to "true".
   * - 1.1.0
     - N/A
   * - 1.0.0
     - N/A

---------
Bug Fixes
---------

.. list-table::
   :header-rows: 1
   :widths: 10, 75

   * - Version
     - Description
   * - 1.4.0
     - | - Fixed a cluster scale-up issue.
       | - Fixed an issue with IPoIB CNI deployment in OCP.
   * - 1.3.0
     - | - N/A
   * - 1.2.0
     - | - N/A
   * - 1.1.0
     - | - Fixed the Whereabouts IPAM plugin to work with Kubernetes v1.22.
       | - Fixed imagePullSecrets for Network Operator.
       | - Enabled resource names for HostDeviceNetwork to be accepted both with and without a prefix.


=================
Known Limitations
=================

.. list-table::
   :header-rows: 1
   :widths: 10, 75

   * - Version
     - Description
   * - 24.7.0
     -  - In case ENABLE_NFSRDMA is enabled for DOCA Driver container and NVMe modules are loaded in the host system, NVIDA DOCA Driver Container will fail to load. User should
          blacklist NVMe modules to prevent them from loading on system boot. if this is not possible (e.g when the system uses NVMe SSD drives) then ENABLE_NFSRDMA must
          be set to `false`. Using features such as GPU Direct Storage is not supported in such case. 
   * - 23.10.0
     - | - IPoIB sub-interface creation does not work on RHEL 8.8 and RHEL 9.2 due to the kernel limitations in these distributions. This means that IPoIBNetwork cannot be used with these operating systems.
   * - 23.4.0
     - | - In case that the UNLOAD_STORAGE_MODULES parameter is enabled for MOFED container deployment, it is required to make sure that the relevant storage modules are not in use in the OS.
   * - 23.1.0
     - | - Only a single PKey can be configured per IPoIB workload pod.
   * - 1.4.0
     - | - The operator upgrade procedure does not reflect configuration changes. The RDMA Shared Device Plugin or SR-IOV Device Plugin should be restarted manually in case of configuration changes.
       | - The RDMA subsystem could be exclusive or shared only in one cluster. Mixed configuration is not supported. The RDMA Shared Device Plugin requires shared RDMA subsystem.
   * - 1.3.0
     - | - MOFED container is not a supported configuration on the DGX platform.
       | - MOFED container deletion may lead to the driver's unloading: In this case, the mlx5_core kernel driver must be reloaded manually. Network connectivity could be affected if there are only NVIDIA NICs on the node.
   * - 1.2.0
     - | - N/A
   * - 1.1.0
     - | - NicClusterPolicy update is not supported at the moment.
       | - Network Operator is compatible only with NVIDIA GPU Operator v1.9.0 and above.
       | - GPUDirect could have performance degradation if it is used with servers which are not optimized. Please see official GPUDirect documentation `here <https://docs.nvidia.com/cuda/gpudirect-rdma/index.html#supported-systems>`_.
       | - Persistent NICs configuration for netplan or ifupdown scripts is required for SR-IOV and Shared RDMA interfaces on the host.
       | - POD Security Policy admission controller should be enabled to use PSP with Network Operator. Please see Deployment with Pod Security Policy in the Network Operator Documentation for details.
   * - 1.0.0
     - | - Network Operator is only compatible with NVIDIA GPU Operator v1.5.2 and above.
       | - Persistent NICs configuration for netplan or ifupdown scripts is required for SR-IOV and Shared RDMA interfaces on the host.
