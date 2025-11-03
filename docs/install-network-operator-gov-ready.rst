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


.. _install-network-operator-gov-ready:

########################################
NVIDIA Network Operator Government Ready
########################################

The NVIDIA Network Operator now offers government-ready components for NVIDIA AI Enterprise customers.
Government ready is NVIDIA's designation for software that meets applicable security requirements for deployment in your FedRAMP High or equivalent sovereign use case. 
For more information on NVIDIA's government-ready support, refer to the white paper `AI Software for Regulated Environments <https://docs.nvidia.com/ai-enterprise/planning-resource/ai-software-regulated-environments-white-paper/latest/index.html>`_.

=====================================
Supported Network Operator Components
=====================================
The government-ready NVIDIA Network Operator includes the following components:

.. _fn1: #base-image
.. |fn1| replace:: :sup:`1`

.. list-table::
   :header-rows: 1

   * - Component
     - Version
   * - NVIDIA Network Operator
     - |network-operator-version|
   * - NVIDIA Network Operator Init Container
     - |doca-init-container-version|
   * - DOCA-OFED Driver Container
     - |doca-driver-version-stig|
   * - RDMA Shared Device Plugin
     - |k8s-rdma-shared-dev-plugin-version|
   * - IP Over Infiniband (IPoIB) CNI plugin
     - |ipoib-cni-version|
   * - SRIOV Network Operator Config
     - |sriovnetop-version|
   * - SRIOV Network Operator Config Config Daemon
     - |sriovnetop-config-daemon-stig-version|
   * - SR-IOV Network Device Plugin
     - |sriovnetop-sriov-device-plugin-version|
   * - SR-IOV CNI plugin
     - |sriovnetop-sriov-cni-version|
   * - InfiniBand SR-IOV CNI plugin
     - |sriovnetop-ib-sriov-cni-version|
   * - K8s CNI network plugins
     - |cni-plugins-version|
   * - Multus CNI
     - |multus-version|
   * - RDMA CNI plugin
     - |rdma-cni-repository|
   * - NVIDIA IPAM Plugin
     - |nvidia-ipam-version|

:sup:`1`
Hardened for STIG/FIPS compliance

Artifacts for these components are available from the `NVIDIA NGC Catalog <https://registry.ngc.nvidia.com/orgs/nvidia/teams/mellanox/containers/doca-driver-stig-fips>`_.

.. note::

    Not all Network Operator components and features are available as government-ready containers in the v25.10.0 release.


Validated Kubernetes Distributions
==================================

The government-ready NVIDIA Network Operator has been validated on the following Kubernetes distributions:

- Canonical Kubernetes 1.34 with Ubuntu Pro 24.04 and FIPS-compliant kernel

Install Government-Ready NVIDIA Network Operator
================================================

Once you have your :ref:`gov-ready-prerequisites` configured, use the following steps to install the NVIDIA Network Operator on Canonical Kubernetes distributions:

#. :ref:`install-nfd`
#. :ref:`create-ngc-api-pull-secret`
#. :ref:`create-ubuntu-pro-token-secret`
#. :ref:`deploy-nvidia-network-operator-gov-ready`

.. _gov-ready-prerequisites:

Prerequisites
-------------

- An active NVIDIA AI Enterprise subscription and NGC API token to access Network Operator government-ready containers.
  Refer to `Generating Your NGC API Key <https://docs.nvidia.com/ngc/gpu-cloud/ngc-user-guide/index.html#generating-api-key>`_ in the NVIDIA NGC User Guide for more information on NGC API tokens.

- An Ubuntu Pro token for Canonical Kubernetes deployments.
  This token is required for the driver container to download kernel headers and other necessary packages from the Canonical repository when using the FIPS-enabled kernel on Ubuntu 24.04.
  Refer to the `Ubuntu Pro documentation <https://documentation.ubuntu.com/pro-client/en/v30/howtoguides/get_token_and_attach/>`_ for more information on accessing Ubuntu Pro tokens.

- The ``helm`` CLI installed on a client machine.

  You can run the following commands to install the Helm CLI:

  .. code-block:: console

     $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
         && chmod 700 get_helm.sh \
         && ./get_helm.sh

- A namespace to deploy the NVIDIA Network Operator.
  The example install commands below use ``nvidia-network-operator`` as the namespace.

- Optionally, Service Mesh for intra-cluster traffic encryption.
  By default, the NVIDIA Network Operator does not encrypt traffic between its controller (and operands) and the Kubernetes API server.
  If you wish to encrypt this communication, you should deploy and maintain a service mesh application within the Kubernetes cluster to enable secure traffic.

.. _install-nfd:

Install Node Feature Discovery (NFD)
------------------------------------

NFD is an open-source project that is a dependency for the Operator on each node in your cluster.
It must be deployed before installing the NVIDIA Network Operator.

Network Operator does not maintain a government ready version of NFD, it is recommended that you install the upstream NFD version that aligns with the :ref:`network-operator-component-matrix`.
The NFD container is built on top of a scratch image, providing a highly secure container environment.
For information on NFD CVEs and security updates, refer to the `NFD GitHub repository <https://github.com/kubernetes-sigs/node-feature-discovery/security>`_.

Refer to the NFD documentation for `installation instructions <https://kubernetes-sigs.github.io/node-feature-discovery/stable/get-started/index.html>`_.


.. _create-ngc-api-pull-secret:

Create NGC API Pull Secret
--------------------------

Add a Docker registry secret for downloading the Network Operator artifacts from NVIDIA NGC in the same namespace where you are planning to deploy the NVIDIA Network Operator.
Update ``ngc-api-key`` in the command below with your NGC API key.

.. code-block:: console

   $ kubectl create secret -n nvidia-network-operator docker-registry ngc-secret \
       --docker-server=nvcr.io \
       --docker-username='$oauthtoken' \
       --docker-password=<ngc-api-key>

.. _create-ubuntu-pro-token-secret:

Create Ubuntu Pro Token Secret
------------------------------

Create a Kubernetes secret to hold the value of your Ubuntu Pro token secret. 
This secret will be used in the install command in the next step.

The Ubuntu Pro Token is required for the driver container to download kernel headers and other necessary packages from the Canonical repository when using the FIPS-enabled kernel on Ubuntu 24.04.

.. _deploy-nvidia-network-operator-gov-ready:

Install NVIDIA Network Operator Government-Ready Components
-----------------------------------------------------------

#. Label your ``nvidia-network-operator`` namespace for the Operator to set the enforcement policy to privilege.

   .. code-block:: console

      $ kubectl label --overwrite ns nvidia-network-operator pod-security.kubernetes.io/enforce=privileged

#. Add the NVIDIA Helm repository:

   .. code-block:: console

      $ helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
          && helm repo update

#. Install the NVIDIA Network Operator with SR-IOV Network Operator.

   .. code-block:: console

      $  helm install network-operator nvidia/network-operator \
           --namespace nvidia-network-operator \
           --set sriov-network-operator.images.sriovConfigDaemon=doca-driver-stig-fips \
           --set sriov-network-operator.imagePullSecrets={ngc-secret} \
           --set sriovNetworkOperator.enabled=true
           --set nfd.enabled=true

.. _update-ubuntu-pro-token-in-nicclusterpolicy:

Update Ubuntu Pro Token in NicClusterPolicy
===========================================

``UBUNTU_PRO_TOKEN`` environment variable of the Network Operator NicClusterPolicy should be configured.

.. code-block:: console

   $ kubectl edit nicclusterpolicy nic-cluster-policy

Then update the secret with your new Ubuntu Pro Token.
This token is required for the driver container to download kernel headers and other necessary packages from the Canonical repository when using the FIPS-enabled kernel on Ubuntu 24.04.

