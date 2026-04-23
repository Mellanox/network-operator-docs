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
.. include:: ./common/vars.rst


*****************************
NVIDIA Kubernetes Launch Kit
*****************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

NVIDIA Kubernetes Launch Kit (l8k) is a CLI tool that automates the deployment of NVIDIA cloud-native networking solutions on Kubernetes. The tool discovers cluster hardware, selects a deployment profile, generates Kubernetes YAML manifests, and optionally deploys them to the cluster. It supports SR-IOV, RDMA, InfiniBand, Host Device, MacVLAN, and Spectrum-X networking configurations, including heterogeneous clusters with mixed NIC and GPU hardware.

Prerequisites
=============

Before using Kubernetes Launch Kit, ensure the following components are deployed on your cluster:

- **NVIDIA Network Operator Helm chart** installed with SR-IOV Network Operator, Maintenance Operator, and Node Feature Discovery (NFD) enabled
- A container runtime (Docker or Podman) available on the machine where you will run l8k
- ``kubectl`` configured with access to the target cluster

For instructions on installing the Network Operator, refer to the :doc:`Getting Started with Kubernetes <getting-started-with-kubernetes>` page.

Installation
============

Kubernetes Launch Kit is distributed as a container image. You can either extract the CLI binary from the image or run the tool directly inside the container.

Install the CLI from the Container Image
------------------------------------------

Extract the tool from the container image and run the included ``install.sh`` script, which installs the binary, profile templates, and default configuration:

.. code-block:: bash
   :substitutions:

   docker create --name l8k-extract |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version|
   docker cp l8k-extract:/src /tmp/l8k
   docker rm l8k-extract
   mkdir -p /tmp/l8k/build && cp /tmp/l8k/l8k /tmp/l8k/build/l8k
   sudo /tmp/l8k/scripts/install.sh

This installs the following to ``/usr/local`` (override with ``--prefix``):

- ``<prefix>/bin/l8k`` --- CLI binary
- ``<prefix>/share/l8k/profiles/`` --- profile templates
- ``<prefix>/share/l8k/l8k-config.yaml`` --- default configuration

Verify the installation:

.. code-block:: bash

   l8k version

Run Inside the Container
-------------------------

Alternatively, run l8k directly from the container. Mount your kubeconfig and an output directory:

.. code-block:: bash
   :substitutions:

   docker run --net=host \
       -v ~/.kube:/kube:ro \
       -v $(pwd)/output:/output \
       |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version| \
       discover --kubeconfig /kube/config \
       --save-cluster-config /output/cluster-config.yaml

.. note::

   You must enable ``--net=host`` so the container can reach the Kubernetes API server. Mount the kubeconfig directory as read-only and an output directory for generated files.

Workflow Overview
=================

Kubernetes Launch Kit operates in three phases: **discover**, **generate**, and **deploy**.

Discover Cluster Configuration
-------------------------------

The ``l8k discover`` command deploys a minimal Network Operator profile to probe your cluster's network hardware --- NICs, PCI addresses, RDMA capabilities, and GPU topology. Nodes are automatically grouped by hardware configuration:

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

Generate Deployment Manifests
------------------------------

The ``l8k generate`` command takes a cluster configuration and a deployment profile, then produces a complete set of Kubernetes YAML manifests:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

Deploy to Cluster
------------------

Add the ``--deploy`` flag to ``l8k generate`` to apply the generated manifests directly to the cluster:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --deploy --kubeconfig ~/.kube/config

Deployment Profiles
===================

Kubernetes Launch Kit supports the following deployment profiles:

.. list-table::
   :header-rows: 1
   :widths: 25 15 15 45

   * - **Profile**
     - **Fabric**
     - **Deployment Type**
     - **Notes**
   * - SR-IOV RDMA
     - ethernet/infiniband
     - sriov
     - High-performance networking with hardware acceleration and dedicated VF resources.
   * - Host Device RDMA
     - ethernet/infiniband
     - host_device
     - Direct hardware access for applications requiring exclusive device control.
   * - IP over InfiniBand with RDMA Shared Device
     - infiniband
     - rdma_shared
     - InfiniBand networking with shared RDMA resources for parallel I/O workloads.
   * - MacVLAN with RDMA Shared Device
     - ethernet
     - rdma_shared
     - Network isolation with shared RDMA capabilities for multi-tenant environments.
   * - Spectrum-X
     - ethernet
     - sriov
     - Spectrum-X networking with ``--spectrum-x`` flag. Supports ``hwplb``, ``swplb``, ``uniplane``, and ``none`` multiplane modes.

For manual step-by-step configuration of these profiles, refer to the :doc:`Quick Start Guide <quick-start/quick-start-k8s>`.

For Spectrum-X details, refer to the :doc:`Spectrum-X Configuration <nic-conf-operator/spectrum-x-configuration>` page.

Quick Start
===========

Each example below shows the two commands needed to go from a bare cluster to generated manifests. Run ``l8k discover`` once, then ``l8k generate`` for your chosen profile.

SR-IOV RDMA
------------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

Use ``--fabric infiniband`` for InfiniBand clusters.

Host Device RDMA
-----------------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

   l8k generate --user-config ./cluster-config.yaml \
       --deployment-type host_device --multirail \
       --save-deployment-files ./deployments

IP over InfiniBand RDMA Shared
-------------------------------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

   l8k generate --user-config ./cluster-config.yaml \
       --fabric infiniband --deployment-type rdma_shared --multirail \
       --save-deployment-files ./deployments

MacVLAN RDMA Shared
--------------------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type rdma_shared --multirail \
       --save-deployment-files ./deployments

Spectrum-X
-----------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

   l8k generate --user-config ./cluster-config.yaml \
       --spectrum-x --multiplane-mode hwplb --number-of-planes 4 \
       --save-deployment-files ./deployments

When ``--spectrum-x`` is specified, ``--fabric``, ``--deployment-type``, and ``--multirail`` are automatically set to ``ethernet``, ``sriov``, and ``true``.

Cluster Discovery
=================

The ``l8k discover`` command probes cluster hardware by deploying a minimal Network Operator profile with the NIC Configuration Operator. It examines NIC PCI addresses, device IDs, RDMA capabilities, InfiniBand support, and OFED module dependencies.

Basic Discovery
----------------

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --save-cluster-config ./cluster-config.yaml

Discovery with a Base Configuration
-------------------------------------

Provide your own configuration file as a base. Discovery merges discovered hardware into your config, preserving your custom settings (network operator version, subnets, MTU, etc.):

.. code-block:: bash

   l8k discover --user-config ./my-config.yaml \
       --kubeconfig ~/.kube/config

Without ``--save-cluster-config``, the file specified by ``--user-config`` is updated in place. To save results to a separate file:

.. code-block:: bash

   l8k discover --user-config ./my-config.yaml \
       --save-cluster-config ./discovered-config.yaml \
       --kubeconfig ~/.kube/config

Filtering Nodes
----------------

Limit discovery to a subset of nodes using the ``--node-selector`` flag:

.. code-block:: bash

   l8k discover --kubeconfig ~/.kube/config \
       --node-selector "feature.node.kubernetes.io/pci-15b3.present=true" \
       --save-cluster-config ./cluster-config.yaml

The default selector is ``feature.node.kubernetes.io/pci-15b3.present=true``, which targets nodes with Mellanox NICs.

Discovery Output and Configuration
-------------------------------------

Discovery produces a configuration file with all parameters needed for manifest generation. After discovery, you can edit the file to customize network parameters before running ``l8k generate``. The typical workflow is:

#. Run ``l8k discover`` to produce a ``cluster-config.yaml``
#. Edit the file to customize network parameters
#. Run ``l8k generate --user-config ./cluster-config.yaml`` to produce manifests

You can also provide a pre-configured file directly to ``l8k generate`` without running discovery.

The full configuration file format:

.. code-block:: yaml
   :substitutions:

   networkOperator:
     version: |k8s-launch-kit-version|
     componentVersion: |k8s-launch-kit-component-version|
     repository: |k8s-launch-kit-network-operator-repository|
     namespace: nvidia-network-operator
     imagePullSecrets: []
     docsBaseURL: |k8s-launch-kit-docs-base-url|

   docaDriver:
     enable: true
     version: |doca-driver-version|
     unloadStorageModules: false
     enableNFSRDMA: false
     unloadThirdPartyRDMAModules: false

   nvIpam:
     poolName: nv-ipam-pool
     startingSubnet: "192.168.2.0"
     mask: 24
     offset: 1

   sriov:
     ethernetMtu: 9000
     infinibandMtu: 4000
     numVfs: 8
     priority: 90
     resourceName: sriov_resource
     networkName: sriov-network

   hostdev:
     resourceName: hostdev-resource
     networkName: hostdev-network

   rdmaShared:
     resourceName: rdma_shared_resource
     hcaMax: 63

   ipoib:
     networkName: ipoib-network

   macvlan:
     networkName: macvlan-network

   nicConfigurationOperator:
     deployNicInterfaceNameTemplate: true
     rdmaPrefix: "rdma_r%rail%"
     netdevPrefix: "eth_r%rail%"

   spectrumX:
     nicType: "1023"
     overlay: "none"
     rdmaPrefix: "roce_p%plane%_r%rail%"
     netdevPrefix: "eth_p%plane%_r%rail%"

   workload:
     manifest: ""

   profile:
     fabric: ethernet
     deployment: sriov
     multirail: false
     spectrumX:
       spcxVersion: "RA2.1"
       multiplaneMode: swplb
       numberOfPlanes: 4
     ai: false

   clusterConfig:
   - identifier: "group-0"
     machineType: "DGX-B200"
     productType: "NVIDIA-B200"
     capabilities:
       nodes:
         sriov: true
         rdma: true
         ib: false
     workerNodes: ["worker-0", "worker-1"]
     nodeSelector:
       nvidia.com/gpu.machine: "DGX-B200"
     thirdPartyRDMAModules: []
     storageModules: []
     pfs:
     - deviceID: "1023"
       pciAddress: "0000:05:00.0"
       rdmaDevice: "mlx5_0"
       networkInterface: "net1"
       traffic: east-west
       rail: 0
     - deviceID: "1023"
       pciAddress: "0000:75:00.0"
       rdmaDevice: "mlx5_1"
       networkInterface: "net2"
       traffic: east-west
       rail: 1

Key customization areas:

- **networkOperator** --- Network Operator version, component version, container registry, namespace, and image pull secrets for private registries.
- **docaDriver** --- OFED driver version and module unloading flags. Set ``enable: false`` to omit the OFED driver from manifests, or use the ``--enable-doca-driver`` CLI flag.
- **nvIpam** --- IP address management. Supports manual subnets (list each ``subnet``/``gateway`` pair explicitly) or auto-generation from ``startingSubnet``/``mask``/``offset`` (each node group gets unique, non-overlapping subnets).
- **sriov** / **hostdev** / **rdmaShared** / **ipoib** / **macvlan** --- Profile-specific parameters: MTU, number of VFs, resource names, and network names.
- **nicConfigurationOperator** --- NIC interface rename templates with rail-based naming (see :ref:`heterogeneous-cluster-support`).
- **spectrumX** --- Spectrum-X NIC type, overlay mode, and naming prefixes with plane and rail substitution.
- **workload** --- Custom workload manifest path (see `Custom Workload Manifests`_ below).
- **profile** --- Deployment profile selection (can also be set via CLI flags).
- **clusterConfig** --- Discovered node groups. Each group contains PF entries with ``deviceID``, ``pciAddress``, ``traffic`` (``east-west`` for GPU interconnect, ``north-south`` for DPUs), and ``rail`` (sequential index for east-west PFs). North-south PFs are automatically filtered out during manifest generation.

DOCA Driver and Module Pre-Flight
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

During discovery, the tool automatically detects kernel modules that depend on OFED drivers. It execs into ``nic-configuration-daemon`` pods and builds a reverse dependency graph from ``/sys/module/*/holders/`` for the core MLX/OFED kernel modules.

Discovered modules are classified into two categories:

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **Category**
     - **Examples**
     - **Action**
   * - Storage-over-RDMA modules
     - ``nvme_rdma``, ``ib_isert``, ``rpcrdma``
     - Auto-enables ``unloadStorageModules: true``
   * - Third-party RDMA modules
     - ``rdma_rxe``, ``qedr``, ``bnxt_re``
     - Auto-enables ``unloadThirdPartyRDMAModules: true``

After discovery, the config reflects the auto-enabled flags and the discovered modules are saved per group as ``storageModules`` and ``thirdPartyRDMAModules``.

.. warning::

   Verify that no running workloads depend on modules that will be unloaded. To disable automatic unloading, set the flags back to ``false`` in your config after discovery.

Custom Workload Manifests
^^^^^^^^^^^^^^^^^^^^^^^^^^

By default, l8k generates example DaemonSet workloads for each profile. To use your own workload manifest instead:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov \
       --workload-manifest /path/to/my-workload.yaml \
       --save-deployment-files ./deployments

The tool patches the workload manifest with the correct network annotations, resource requests, and node affinity based on the cluster configuration. Supported workload kinds: Pod, Deployment, DaemonSet, StatefulSet, Job, ReplicaSet.

**Before** --- your input manifest:

.. code-block:: yaml

   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: my-rdma-workload
     namespace: default
   spec:
     selector:
       matchLabels:
         app: my-rdma-workload
     template:
       metadata:
         labels:
           app: my-rdma-workload
       spec:
         containers:
         - name: rdma-app
           image: my-registry/my-rdma-app:latest
           securityContext:
             capabilities:
               add: ["IPC_LOCK"]

**After** --- patched by l8k for an SR-IOV deployment with 2 rails:

.. code-block:: yaml

   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     name: my-rdma-workload
     namespace: default
   spec:
     selector:
       matchLabels:
         app: my-rdma-workload
     template:
       metadata:
         labels:
           app: my-rdma-workload
         annotations:
           k8s.v1.cni.cncf.io/networks: sriov-network-rail-0,sriov-network-rail-1
       spec:
         affinity:
           nodeAffinity:
             requiredDuringSchedulingIgnoredDuringExecution:
               nodeSelectorTerms:
               - matchExpressions:
                 - key: nvidia.com/gpu.machine
                   operator: In
                   values:
                   - DGX-B200
         containers:
         - name: rdma-app
           image: my-registry/my-rdma-app:latest
           securityContext:
             capabilities:
               add: ["IPC_LOCK"]
           resources:
             requests:
               nvidia.com/sriov_resource_rail_0: "1"
               nvidia.com/sriov_resource_rail_1: "1"
             limits:
               nvidia.com/sriov_resource_rail_0: "1"
               nvidia.com/sriov_resource_rail_1: "1"

Network Operator Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``networkOperator`` section controls the operator version, container registry, namespace, and image pull secrets. These can also be set via CLI flags:

- ``--network-operator-namespace`` --- override the namespace (default: ``nvidia-network-operator``)
- ``--image-pull-secrets`` --- image pull secret names for NicClusterPolicy (comma-separated)

Example configuration with image pull secrets for a private registry:

.. code-block:: yaml

   networkOperator:
     version: v26.4.0
     repository: nvcr.io/nvidia/mellanox
     namespace: nvidia-network-operator
     imagePullSecrets:
     - my-registry-secret

The secrets are rendered in the NicClusterPolicy ``spec.global.imagePullSecrets`` field.


Manifest Generation
===================

Profile Selection via CLI Flags
--------------------------------

Specify the deployment profile using ``--fabric``, ``--deployment-type``, and ``--multirail``:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

For Spectrum-X, the ``--spectrum-x`` flag automatically sets ``--fabric ethernet``, ``--deployment-type sriov``, and ``--multirail true``.

.. note::

   If the configuration file already contains a ``profile`` section, CLI flags are optional. CLI flags override configuration file values when both are provided.

Output Directory Structure
---------------------------

Generated files follow a numbered naming convention that determines deployment order:

- ``10-nicclusterpolicy.yaml`` --- cluster-wide components (Multus, CNI, NV-IPAM, operators)
- ``11-nicnodepolicy.yaml`` --- per-node-group components (OFED driver, device plugins)
- ``20-ippool.yaml`` --- NV-IPAM IP pools
- ``30-*`` --- network resources (SriovNetworkNodePolicy, SriovNetwork, etc.)
- ``35-nicinterfacenametemplate.yaml`` --- NIC rename templates (when needed)
- ``40-*`` / ``50-*`` --- example workload DaemonSets
- ``overview.html`` --- human-readable deployment summary

In heterogeneous clusters, per-group files include the group identifier in the filename (e.g., ``30-sriovnetworknodepolicy-group-0.yaml``).

Deploy to Cluster
------------------

Add ``--deploy`` to apply generated manifests to the cluster:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --deploy --kubeconfig ~/.kube/config

Deployment follows a specific ordering: NicClusterPolicy is applied first and the tool waits for it to become ready. Then NicNodePolicy resources are applied per group, each waiting for readiness. Finally, the remaining manifests (networks, pools, workloads) are applied.

Dry-Run Mode
--------------

Preview what would be deployed without making changes:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --deploy --dry-run --kubeconfig ~/.kube/config

Group-Specific Generation
--------------------------

In heterogeneous clusters, use ``--group`` to generate manifests for a single node group:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric infiniband --deployment-type sriov --multirail \
       --group group-0 \
       --save-deployment-files ./deployments

.. _heterogeneous-cluster-support:

Heterogeneous Cluster Support
=============================

Node Grouping
--------------

During cluster discovery, nodes are automatically grouped by their NIC configuration. Nodes with identical PCI addresses and device IDs (the same PF fingerprint) are placed in the same group. Each group receives:

- A unique ``identifier`` (``group-0``, ``group-1``, etc.)
- An auto-computed ``nodeSelector`` based on labels that distinguish the group from others
- ``machineType`` and ``productType`` identifying the hardware (e.g., ``PowerEdge-R760xa``, ``NVIDIA-H100-NVL``)

Compatible groups with the same GPU product type and east-west rail count are automatically merged into a single group when possible.

Per-Group Manifests
--------------------

To support heterogeneous clusters where different node groups may run different hardware configurations:

- **NicClusterPolicy** (``10-nicclusterpolicy.yaml``) contains cluster-wide components only: Multus, CNI plugins, NV-IPAM, NIC Configuration Operator, Spectrum-X Operator.
- **NicNodePolicy** (``11-nicnodepolicy.yaml``) is rendered per group with the group's ``nodeSelector``, and contains per-node components: OFED driver and device plugins (SR-IOV or RDMA shared).

Templates that reference per-group configuration produce separate output files per group (e.g., ``30-sriovnetworknodepolicy-group-0.yaml``, ``30-sriovnetworknodepolicy-group-1.yaml``).

The deployment ordering ensures proper dependency resolution: NicClusterPolicy first (wait for readiness), then each NicNodePolicy (wait for readiness), then remaining manifests.

NIC Interface Name Templates
------------------------------

When ``nicConfigurationOperator.deployNicInterfaceNameTemplate`` is set to ``true`` in the configuration, the tool deploys NicInterfaceNameTemplate CRs to rename NIC interfaces to predictable, rail-based names using udev rules. This setting means "enable when needed" rather than "always enable".

Name templates are deployed when machines within the same node group have different PCI addresses for the same rail position. In this case, PCI addresses alone cannot identify which interface corresponds to which rail, so NicInterfaceNameTemplate provides a consistent mapping by renaming interfaces based on their rail assignment.

The naming conventions are:

- Standard profiles: ``rdma_r%rail%``, ``eth_r%rail%`` (e.g., ``rdma_r0``, ``eth_r1``)
- Spectrum-X profiles: ``roce_p%plane%_r%rail%``, ``eth_p%plane%_r%rail%`` (e.g., ``roce_p0_r2``)

When all machines in a group have identical PCI addresses per rail, name templates are not deployed and PCI addresses are used directly.

North-South Traffic Detection
=============================

During cluster discovery, the tool identifies BlueField DPU devices by matching each device's part number against a known list of DPU product codes. Devices matching a DPU product code are classified as **north-south** traffic (management/external), while all other devices (SuperNICs, ConnectX NICs) are classified as **east-west** traffic (GPU interconnect).

North-south PFs are included in the saved cluster configuration for visibility, but are automatically filtered out during template rendering so that only east-west PFs appear in the generated deployment manifests. Each east-west PF is assigned a sequential rail number (``rail: 0``, ``rail: 1``, ``rail: 2``, ...) used for naming resources.

Spectrum-X Configuration
========================

The ``--spectrum-x`` flag automatically sets ``--fabric ethernet``, ``--deployment-type sriov``, and ``--multirail true``. You must specify ``--multiplane-mode`` to select the multiplane mode and ``--number-of-planes`` for the plane count (except with ``none`` mode).

For detailed Spectrum-X configuration, refer to the :doc:`Spectrum-X Configuration <nic-conf-operator/spectrum-x-configuration>` page.

Multiplane Modes
-----------------

HWPLB
^^^^^^

Hardware Plane Load Balancing for larger-scale clusters with 2-tier or 3-tier switch topologies:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml --spectrum-x \
       --multiplane-mode hwplb --number-of-planes 4 \
       --save-deployment-files ./deployments

SWPLB
^^^^^^

Software Plane Load Balancing for smaller-scale Spectrum-X clusters. Generates separate resources per-rail per-plane:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml --spectrum-x \
       --multiplane-mode swplb --number-of-planes 2 \
       --save-deployment-files ./deployments

Uniplane
^^^^^^^^^

Unified plane mode with no plane separation. Forces ``--number-of-planes`` to 1:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml --spectrum-x \
       --multiplane-mode uniplane \
       --save-deployment-files ./deployments

None (Single Plane)
^^^^^^^^^^^^^^^^^^^^

No multiplane separation. Use with BlueField-3 SuperNIC or simple topologies:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml --spectrum-x \
       --multiplane-mode none \
       --save-deployment-files ./deployments

NIC Type Constraints
---------------------

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - **NIC Type**
     - **Device ID**
     - **Supported Modes**
   * - ConnectX-8
     - 1023
     - ``swplb``, ``hwplb``, ``uniplane``
   * - BlueField-3 SuperNIC
     - a2dc
     - ``none`` only

AI-Assisted Workflows (Claude Code Skills)
===========================================

Kubernetes Launch Kit ships with Claude Code skills in the ``skills/`` directory that enable AI-assisted cluster configuration, profile selection, and troubleshooting. These skills provide structured domain knowledge that helps Claude Code guide you through the l8k workflow.

Available Skills
-----------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Skill**
     - **Description**
   * - ``k8s-launch-kit-shared``
     - Shared reference for binary location, global flags, output formatting, and exit codes.
   * - ``k8s-launch-kit-discover``
     - Guides cluster hardware discovery, NIC detection, and node grouping.
   * - ``k8s-launch-kit-config``
     - Helps create, understand, and edit l8k configuration files (field-by-field schema reference).
   * - ``k8s-launch-kit-generate``
     - Assists with profile selection and manifest generation for all supported profiles.
   * - ``k8s-launch-kit-deploy``
     - Guides deployment of generated manifests to the cluster with proper ordering.
   * - ``k8s-launch-kit-dryrun``
     - Provides dry-run preview and configuration validation before applying changes.
   * - ``k8s-launch-kit-pipeline``
     - Orchestrates the full end-to-end pipeline: discover, generate, and deploy.
   * - ``k8s-launch-kit-troubleshoot``
     - Analyzes sosreport diagnostic data and common Network Operator failure patterns.
   * - ``k8s-network-engineer``
     - Senior networking engineer persona that coordinates all skills and provides expert guidance on profile selection, Spectrum-X configuration, and troubleshooting.

Using Skills with Claude Code
------------------------------

Skills activate automatically based on your request. Example workflows:

- *"Discover my cluster's network hardware"* --- activates the discover skill and runs ``l8k discover``
- *"What profile should I use for my H100 cluster?"* --- activates the network engineer skill with the profile decision tree
- *"Generate manifests for SR-IOV Ethernet"* --- activates the generate skill with profile selection
- *"My OFED driver pods are crashing"* --- activates the troubleshoot skill to collect and analyze diagnostics
- *"Set up networking end-to-end"* --- activates the pipeline skill for the full discover → generate → deploy workflow

Profile Selection with the Network Engineer Skill
---------------------------------------------------

The ``k8s-network-engineer`` skill acts as an expert advisor that coordinates all other skills. It uses a profile decision tree to recommend the optimal deployment profile based on your cluster's hardware (NIC types, fabric, GPU topology) and workload requirements. It can guide you through the complete workflow from initial discovery to final deployment.

Diagnostics
===========

SOS-Report Collection
----------------------

The ``l8k sosreport`` command collects diagnostic data from the cluster, including pod logs, CRD statuses, OFED diagnostics, and node information:

.. code-block:: bash

   l8k sosreport --kubeconfig ~/.kube/config

The output is saved to a directory (default: ``./sosreport``) that can be shared for offline analysis.

Troubleshooting with AI Skills
-------------------------------

The ``k8s-launch-kit-troubleshoot`` skill can analyze sosreport data when used with Claude Code. Collect a sosreport and then ask Claude Code to investigate issues such as OFED driver crashes, SR-IOV VF allocation failures, pods stuck in ``ContainerCreating``, or NIC configuration errors.

Automation and CI/CD
====================

Kubernetes Launch Kit is designed for both interactive use and automation in CI/CD pipelines.

JSON Output Mode
-----------------

Use ``--output json`` to get machine-readable output. In JSON mode, structured data goes to stdout and human-readable logs go to stderr:

.. code-block:: bash

   l8k generate --user-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --output json --yes 2>/dev/null | jq .

Non-Interactive Flags
----------------------

- ``--yes`` / ``-y`` --- auto-confirm all prompts (implied by ``--output json``)
- ``--quiet`` / ``-q`` --- suppress informational output

Exit Codes
-----------

.. list-table::
   :header-rows: 1
   :widths: 15 85

   * - **Code**
     - **Meaning**
   * - 0
     - Success
   * - 1
     - General error
   * - 2
     - Validation error (invalid flags or configuration)
   * - 3
     - Cluster error (API unreachable, discovery failed)
   * - 4
     - Deployment error (apply failed)
   * - 5
     - Partial success (discovery completed but deployment failed)

Structured Errors
------------------

In JSON mode, errors include structured fields (``code``, ``category``, ``transient``, ``suggestion``) to help automation decide whether to retry or fix input.

Schema Discovery
-----------------

AI agents and automation tools can programmatically discover l8k's capabilities:

.. code-block:: bash

   l8k schema

This outputs a JSON description of available commands, phases, fabrics, deployment types, flags, exit codes, and output formats.

CLI Reference
=============

Global Flags
-------------

These flags are available on all subcommands:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--output <string>``
     - Output format: ``text`` (default, human-readable) or ``json`` (structured)
   * - ``-y, --yes``
     - Auto-confirm all prompts
   * - ``-q, --quiet``
     - Suppress informational output
   * - ``--log-level <string>``
     - Log level: ``debug``, ``info``, ``warn``, ``error``
   * - ``--log-file <string>``
     - Write logs to file instead of stderr
   * - ``-h, --help``
     - Show help

l8k discover
-------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig file (falls back to ``$KUBECONFIG``)
   * - ``--user-config <string>``
     - Base config to merge with discovered hardware
   * - ``--save-cluster-config <string>``
     - Output path for the discovered cluster configuration
   * - ``--network-operator-namespace <string>``
     - Override the Network Operator namespace (default: ``nvidia-network-operator``)
   * - ``--node-selector <string>``
     - Filter nodes for discovery by label (default: ``feature.node.kubernetes.io/pci-15b3.present=true``)
   * - ``--image-pull-secrets <strings>``
     - Image pull secret names for NicClusterPolicy (comma-separated)
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``)

l8k generate
-------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--user-config <string>``
     - Cluster configuration file
   * - ``--fabric <string>``
     - Fabric type: ``ethernet``, ``infiniband``
   * - ``--deployment-type <string>``
     - Deployment type: ``sriov``, ``rdma_shared``, ``host_device``
   * - ``--multirail``
     - Enable multirail deployment
   * - ``--spectrum-x``
     - Enable Spectrum-X deployment
   * - ``--spcx-version <string>``
     - Spectrum-X version (default: ``RA2.1``)
   * - ``--multiplane-mode <string>``
     - Multiplane mode: ``swplb``, ``hwplb``, ``uniplane``, ``none``
   * - ``--number-of-planes <int>``
     - Number of planes (required when mode is not ``none``)
   * - ``--group <string>``
     - Generate for a specific node group (e.g., ``group-0``)
   * - ``--save-deployment-files <string>``
     - Output directory for generated YAML files
   * - ``--deploy``
     - Deploy generated manifests to the cluster
   * - ``--dry-run``
     - Preview deployment without applying (requires ``--deploy``)
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (required with ``--deploy``)
   * - ``--enable-doca-driver``
     - Enable DOCA driver deployment
   * - ``--workload-manifest <string>``
     - Path to a custom workload manifest
   * - ``--image-pull-secrets <strings>``
     - Image pull secret names for NicClusterPolicy (comma-separated)
   * - ``--network-operator-namespace <string>``
     - Override the Network Operator namespace
   * - ``--pod-namespace <string>``
     - Namespace for pods and network resources
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``)
   * - ``--ai``
     - Enable AI deployment

l8k sosreport
--------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - **Flag**
     - **Description**
   * - ``--kubeconfig <string>``
     - Path to kubeconfig (falls back to ``$KUBECONFIG``)
   * - ``--output-dir <string>``
     - Directory to save the sosreport (default: ``./sosreport``)

l8k schema
-----------

No additional flags. Outputs a JSON description of l8k's capabilities, commands, phases, fabrics, deployment types, exit codes, and output formats.

l8k version
-------------

Prints the version number. Supports ``--output json`` for structured output.
