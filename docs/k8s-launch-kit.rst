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


*************************************************************************
[TECH PREVIEW] Configuration Assistance with NVIDIA Kubernetes Launch Kit
*************************************************************************

.. contents:: On this page
   :depth: 3
   :local:
   :backlinks: none

NVIDIA Kubernetes Launch Kit (l8k) is a CLI tool for deploying and managing NVIDIA cloud-native solutions on Kubernetes. The tool helps provide flexible deployment workflows for optimal network performance with SR-IOV, RDMA, and other networking technologies.

Prerequisites
=============

For prerequisites, please refer to the :doc:`NVIDIA Network Operator Deployment Guide with Kubernetes <deployment-guide-kubernetes>` page.

You will need a Kubernetes cluster with NVIDIA Network Operator helm chart installed.

Operation Phases
================

Discover Cluster Configuration
------------------------------

Deploy a minimal Network Operator profile to automatically discover your cluster's network capabilities and hardware configuration. This phase can be skipped if you provide your own configuration file.

Select the Deployment Profile
-----------------------------

Specify the desired deployment profile via CLI flags or with the natural language prompt for the LLM.

Generate Deployment Files
-------------------------

Based on the discovered/provided configuration, generate a complete set of YAML deployment files tailored to your selected network profile.

Deploy to Cluster
-----------------

Apply the generated deployment files to your Kubernetes cluster. This phase uses the ``--deploy`` flag and requires ``--kubeconfig`` to be specified. This phase is optional and can be skipped if ``--deploy`` is not provided.

Supported Deployment Profiles
=============================

Kubernetes Launch Kit supports the following deployment profiles:

.. list-table::
   :header-rows: 1
   :widths: 30 15 15 40

   * - **Profile**
     - **Fabric**
     - **Deployment Type**
     - **Notes**
   * - SR-IOV Ethernet RDMA
     - ethernet
     - sriov
     - High-performance networking with hardware acceleration and dedicated VF resources.
   * - SR-IOV InfiniBand RDMA
     - infiniband
     - sriov
     - Virtualized InfiniBand with hardware acceleration and isolated IB partitions.
   * - IP over InfiniBand with RDMA Shared Device
     - infiniband
     - rdma_shared
     - InfiniBand networking with shared RDMA resources for parallel I/O workloads.
   * - Host Device RDMA
     - any
     - host_device
     - Direct hardware access for legacy applications requiring exclusive device control.
   * - MacVLAN with RDMA Shared Device
     - ethernet
     - rdma_shared
     - Network isolation with shared RDMA capabilities for multi-tenant environments.
   * - Spectrum-X
     - ethernet
     - sriov
     - Spectrum-X networking with ``--spectrum-x`` flag. Supports ``hwplb``, ``swplb``, ``uniplane``, and ``none`` multiplane modes.

Please refer to the :doc:`quick-start/quick-start-k8s` page for more details.

For Spectrum-X configuration, refer to the :doc:`nic-conf-operator/spectrum-x-configuration` page.

.. _heterogeneous-cluster-support:

Heterogeneous Cluster Support
=============================

During cluster discovery, nodes are automatically grouped by their NIC configuration. Nodes with identical PCI addresses and device IDs (the same PF fingerprint) are placed in the same group. Each group receives:

- A unique ``identifier`` (empty string for single-group clusters, ``group-0``, ``group-1``, etc. for multi-group)
- An auto-computed ``nodeSelector`` based on labels that distinguish the group from others
- ``machineType`` and ``productType`` extracted from ``nvidia.com/gpu.machine`` and ``nvidia.com/gpu.product`` node labels

Templates that reference cluster configuration are rendered once per group, producing separate output files per group (e.g., ``30-sriovnetworknodepolicy-group-0.yaml``, ``30-sriovnetworknodepolicy-group-1.yaml``).

Use the ``--group`` flag to generate manifests for a single group:

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --fabric infiniband --deployment-type sriov --multirail \
       --group group-0 \
       --save-deployment-files ./deployments

North-South Traffic Detection
=============================

During cluster discovery, the tool automatically identifies BlueField DPU devices by matching each device's part number against a known list of DPU product codes. Devices matching a DPU product code are classified as **north-south** traffic (management/external), while all other devices (SuperNICs, ConnectX NICs) are classified as **east-west** traffic (GPU interconnect).

North-south PFs are included in the saved cluster configuration for visibility, but are automatically filtered out during template rendering so that only east-west PFs appear in the generated deployment manifests.

Each east-west PF is assigned a sequential rail number (``rail: 0``, ``rail: 1``, ``rail: 2``, ...) used for naming resources such as SriovNetworkNodePolicy and IPPool entries.

Usage
=====

Kubernetes Launch Kit is available as a docker container:

.. code-block:: bash
   :substitutions:

   mkdir ~/cluster-configuration
   cp /etc/kubernetes/admin.conf ~/cluster-configuration/kubeconfig
   docker run -v ~/cluster-configuration:/cluster-configuration \
       --net=host \
       |k8s-launch-kit-repository|/k8s-launch-kit:|k8s-launch-kit-version| \
       --discover-cluster-config \
       --kubeconfig /cluster-configuration/kubeconfig \
       --save-cluster-config /cluster-configuration/config.yaml \
       --log-level debug \
       --save-deployment-files /cluster-configuration/deployments \
       --fabric infiniband --deployment-type rdma_shared --multirail

.. note::

   You must enable ``--net=host`` and mount the necessary directories for input and output files with ``-v``.

CLI Reference
=============

General Flags
-------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--enabled-plugins <string>``
     - Comma-separated list of plugins to enable (default: ``network-operator``)
   * - ``--log-level <string>``
     - Log level: debug, info, warn, error
   * - ``--log-file <string>``
     - Write logs to file instead of stderr
   * - ``-h, --help``
     - Show help

Cluster Discovery Flags
------------------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--discover-cluster-config``
     - Deploy a thin Network Operator profile to discover cluster capabilities
   * - ``--save-cluster-config <string>``
     - Save discovered cluster configuration to the specified path (defaults to ``--user-config`` path if set, otherwise ``/opt/nvidia/k8s-launch-kit/cluster-config.yaml``)
   * - ``--user-config <string>``
     - Use provided cluster configuration file (as base config for discovery or as full config without discovery)
   * - ``--kubeconfig <string>``
     - Path to kubeconfig file for cluster operations
   * - ``--label-selector <string>``
     - Filter nodes for discovery by label (default: ``feature.node.kubernetes.io/pci-15b3.present=true``)
   * - ``--network-operator-namespace <string>``
     - Override the network operator namespace from the config file

Profile Selection Flags
-----------------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--fabric <string>``
     - Select the fabric type to deploy (infiniband, ethernet)
   * - ``--deployment-type <string>``
     - Select the deployment type (sriov, rdma_shared, host_device)
   * - ``--multirail``
     - Enable multirail deployment
   * - ``--spectrum-x``
     - Enable Spectrum-X deployment
   * - ``--ai``
     - Enable AI deployment
   * - ``--group <string>``
     - Generate templates for a specific node group only (e.g., ``group-0``). See :ref:`heterogeneous-cluster-support`.

.. note::

   If the configuration file provided via ``--user-config`` already contains a complete ``profile:`` section, the ``--fabric``, ``--deployment-type``, and other profile selection flags are not required. CLI flags override values from the configuration file when both are provided.

Spectrum-X Flags
----------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--spcx-version <string>``
     - Spectrum-X version (default: ``RA2.1``)
   * - ``--multiplane-mode <string>``
     - Multiplane mode: ``swplb``, ``hwplb``, ``uniplane``, ``none``
   * - ``--number-of-planes <int>``
     - Number of planes for multiplane deployment (required when mode is not ``none``)

.. note::

   When ``--spectrum-x`` is specified, ``--fabric``, ``--deployment-type``, and ``--multirail`` are automatically set to ``ethernet``, ``sriov``, and ``true`` respectively. The ``--spcx-version`` defaults to ``RA2.1``.

LLM Flags
---------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--prompt <string>``
     - Path to file with a prompt to use for LLM-assisted profile generation
   * - ``--llm-interactive``
     - Enable interactive chat mode with the LLM agent
   * - ``--llm-api-key <string>``
     - API key for the LLM API
   * - ``--llm-api-url <string>``
     - API URL for the LLM API
   * - ``--llm-vendor <string>``
     - Vendor of the LLM API (openai, openai-azure, anthropic, gemini). Default: ``openai-azure``
   * - ``--llm-model <string>``
     - Custom model name for the LLM API

Deployment Flags
----------------

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - **Flag**
     - **Description**
   * - ``--save-deployment-files <string>``
     - Save generated deployment files to the specified directory (default: ``/opt/nvidia/k8s-launch-kit/deployment``)
   * - ``--deploy``
     - Deploy the generated files to the Kubernetes cluster

Usage Examples
==============

Complete Workflow
-----------------

Discover cluster config, generate files, and deploy:

.. code-block:: bash

   l8k --discover-cluster-config --save-cluster-config ./cluster-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments \
       --deploy --kubeconfig ~/.kube/config

Discover Cluster Configuration
------------------------------

.. code-block:: bash

   l8k --discover-cluster-config --save-cluster-config ./my-cluster-config.yaml \
       --kubeconfig ~/.kube/config

Filter discovery to specific nodes using a label selector:

.. code-block:: bash

   l8k --discover-cluster-config --save-cluster-config ./my-cluster-config.yaml \
       --label-selector "feature.node.kubernetes.io/pci-15b3.present=true" \
       --kubeconfig ~/.kube/config

Discovery with User-Provided Base Config
-----------------------------------------

Use your own config file (with custom network operator version, subnets, etc.) as the base for discovery. Without ``--save-cluster-config``, the file is rewritten in place with discovery results:

.. code-block:: bash

   l8k --user-config ./my-config.yaml --discover-cluster-config \
       --kubeconfig ~/.kube/config

Save discovery results to a separate file instead:

.. code-block:: bash

   l8k --user-config ./my-config.yaml --discover-cluster-config \
       --save-cluster-config ./discovered-config.yaml \
       --kubeconfig ~/.kube/config

Use Existing Configuration
--------------------------

Generate and deploy with pre-existing config:

.. code-block:: bash

   l8k --user-config ./existing-config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --deploy --kubeconfig ~/.kube/config

Generate Deployment Files
-------------------------

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --fabric ethernet --deployment-type sriov --multirail \
       --save-deployment-files ./deployments

Generate Deployment Files for a Specific Node Group
----------------------------------------------------

In heterogeneous clusters, discovery produces multiple node groups. Use ``--group`` to generate manifests for a single group:

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --fabric infiniband --deployment-type sriov --multirail \
       --group group-0 \
       --save-deployment-files ./deployments

Spectrum-X Deployment
---------------------

The ``--spectrum-x`` flag automatically sets ``--fabric`` to ``ethernet``, ``--deployment-type`` to ``sriov``, and ``--multirail`` to ``true``. You must specify ``--multiplane-mode`` to select the multiplane mode, and ``--number-of-planes`` when the mode is not ``none``. The ``--spcx-version`` defaults to ``RA2.1``.

For more information on Spectrum-X configuration, refer to the :doc:`nic-conf-operator/spectrum-x-configuration` page.

.. note::

   NIC type constraints for multiplane modes:

   - ConnectX-8 (device ID 1023): supports ``swplb``, ``hwplb``, and ``uniplane`` modes
   - BlueField-3 SuperNIC (device ID a2dc): only supports ``none`` mode

HWPLB Mode
^^^^^^^^^^

Hardware Plane Load Balancing for larger-scale clusters with 2-tier or 3-tier switch topologies.

.. code-block:: bash

   l8k --user-config ./config.yaml --spectrum-x \
       --multiplane-mode hwplb --number-of-planes 4 \
       --save-deployment-files ./deployments

SWPLB Mode
^^^^^^^^^^

Software Plane Load Balancing generates separate resources per-rail per-plane. Suitable for smaller-scale clusters.

.. code-block:: bash

   l8k --user-config ./config.yaml --spectrum-x \
       --multiplane-mode swplb --number-of-planes 2 \
       --save-deployment-files ./deployments

Uniplane Mode
^^^^^^^^^^^^^

Unified plane mode with no plane separation. Simplest topology for ConnectX-8. Forces ``--number-of-planes`` to ``1``.

.. code-block:: bash

   l8k --user-config ./config.yaml --spectrum-x \
       --multiplane-mode uniplane \
       --save-deployment-files ./deployments

Single Plane (None)
^^^^^^^^^^^^^^^^^^^

No multiplane separation. Use with BlueField-3 SuperNIC or simple topologies.

.. code-block:: bash

   l8k --user-config ./config.yaml --spectrum-x \
       --multiplane-mode none \
       --save-deployment-files ./deployments

LLM-Assisted Profile Selection
-------------------------------

Kubernetes Launch Kit supports LLM-assisted profile generation. An AI agent analyzes your cluster configuration and requirements to recommend the optimal deployment profile.

Supported LLM vendors:

- ``openai`` --- OpenAI API
- ``openai-azure`` --- Azure OpenAI Service
- ``anthropic`` --- Anthropic API
- ``gemini`` --- Google Gemini API

Non-Interactive Mode
^^^^^^^^^^^^^^^^^^^^

Provide a prompt file with ``--prompt`` for single-shot profile generation.

.. code-block:: bash

   echo "I want to enable multirail networking in my AI cluster" > requirements.txt
   l8k --user-config ./config.yaml \
       --prompt requirements.txt --llm-vendor openai-azure \
       --llm-api-key <OPENAI_API_KEY> --llm-api-url <OPENAI_API_URL> \
       --llm-model <OPENAI_MODEL> \
       --save-deployment-files ./deployments

Using Anthropic:

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --prompt requirements.txt --llm-vendor anthropic \
       --llm-api-key <ANTHROPIC_API_KEY> --llm-api-url <ANTHROPIC_API_URL> \
       --llm-model <ANTHROPIC_MODEL> \
       --save-deployment-files ./deployments

Using Gemini:

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --prompt requirements.txt --llm-vendor gemini \
       --llm-api-key <GEMINI_API_KEY> --llm-api-url <GEMINI_API_URL> \
       --llm-model <GEMINI_MODEL> \
       --save-deployment-files ./deployments

Interactive Chat Mode
^^^^^^^^^^^^^^^^^^^^^

Use ``--llm-interactive`` for a back-and-forth conversation with the AI agent. The agent will ask clarifying questions and help you select the optimal profile. Type ``generate`` to confirm and generate manifests.

.. note::

   ``--prompt`` and ``--llm-interactive`` cannot be used together.

.. code-block:: bash

   l8k --user-config ./config.yaml \
       --llm-interactive --llm-vendor anthropic \
       --llm-api-key <KEY> --llm-api-url <API_URL> \
       --llm-model <LLM_MODEL> \
       --save-deployment-files ./deployments

HTML Overview Generation
------------------------

An ``overview.html`` file is generated alongside the YAML deployment files. It contains the profile description, notes, collapsible file contents, and a link to the deployment guide. The path to the generated HTML file is automatically printed to the console.

Configuration File Format
=========================

After the cluster configuration is discovered, the tool will save the configuration to a file.
You can use this file as a starting point for your own configuration. A custom configuration file can be provided to the tool using the ``--user-config`` flag --- either as a standalone config (skipping discovery) or as a base config combined with ``--discover-cluster-config`` (discovery takes network operator parameters from the file and adds discovered cluster config).

.. code-block:: yaml
  :substitutions:

   networkOperator:
     version: |k8s-launch-kit-version|
     componentVersion: |k8s-launch-kit-component-version|
     repository: |k8s-launch-kit-network-operator-repository|
     namespace: nvidia-network-operator
     docsBaseURL: |k8s-launch-kit-docs-base-url|

   docaDriver:
     version: |doca-driver-version|
     unloadStorageModules: false
     enableNFSRDMA: false

   nvIpam:
     poolName: nv-ipam-pool
     subnets:
     - subnet: 192.168.2.0/24
       gateway: 192.168.2.1
     - subnet: 192.168.3.0/24
       gateway: 192.168.3.1
     - subnet: 192.168.4.0/24
       gateway: 192.168.4.1
     - subnet: 192.168.5.0/24
       gateway: 192.168.5.1

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

   spectrumX:
     nicType: "1023"    # "1023" for ConnectX-8, "a2dc" for BlueField-3 SuperNIC
     overlay: "none"
     rdmaPrefix: "roce_p%plane%_r%rail%"
     netdevPrefix: "eth_p%plane%_r%rail%"

   profile:
     fabric: ethernet   # infiniband, ethernet
     deployment: sriov  # rdma_shared, sriov, host_device
     multirail: false
     spectrumX:          # Spectrum-X configuration (set to null or omit if not using Spectrum-X)
       spcxVersion: "RA2.1"        # CLI override: --spcx-version
       multiplaneMode: swplb       # CLI override: --multiplane-mode (swplb, hwplb, uniplane, none)
       numberOfPlanes: 4           # CLI override: --number-of-planes
     ai: false

   clusterConfig:
   - identifier: "group-0"
     machineType: "DGX-B200"
     productType: "NVIDIA-B200"
     labelSelector:
       feature.node.kubernetes.io/pci-15b3.present: "true"
     capabilities:
       nodes:
         sriov: true
         rdma: true
         ib: false
     workerNodes: ["worker-0", "worker-1"]
     nodeSelector:
       nvidia.com/gpu.machine: "DGX-B200"
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
     - deviceID: "1023"
       pciAddress: "0000:6a:00.0"
       rdmaDevice: "mlx5_4"
       networkInterface: "net5"
       traffic: north-south
   - identifier: "group-1"
     machineType: "PowerEdge-XE9680"
     productType: "NVIDIA-H100"
     labelSelector:
       feature.node.kubernetes.io/pci-15b3.present: "true"
     capabilities:
       nodes:
         sriov: true
         rdma: true
         ib: false
     workerNodes: ["worker-2", "worker-3"]
     nodeSelector:
       nvidia.com/gpu.machine: "PowerEdge-XE9680"
     pfs:
     - deviceID: "a2dc"
       pciAddress: "0000:1a:00.0"
       rdmaDevice: ""
       networkInterface: ""
       traffic: east-west
       rail: 0
     - deviceID: "a2dc"
       pciAddress: "0000:3c:00.0"
       rdmaDevice: ""
       networkInterface: ""
       traffic: east-west
       rail: 1

.. note::

   The ``clusterConfig`` section is an array of node groups. In heterogeneous clusters, each group contains nodes with identical NIC configurations (same PCI addresses and device IDs). Each PF entry includes a ``traffic`` field (``east-west`` or ``north-south``) and a ``rail`` field (sequential index for east-west PFs). North-south PFs do not have a ``rail`` field. See :ref:`heterogeneous-cluster-support` for details.
