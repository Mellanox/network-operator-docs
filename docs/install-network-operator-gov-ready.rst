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

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none

The NVIDIA Network Operator now offers government-ready components for NVIDIA AI Enterprise customers.
Government ready is NVIDIA's designation for software that meets applicable security requirements for deployment in your FedRAMP High or equivalent sovereign use case. 
For more information on NVIDIA's government-ready support, refer to the white paper `AI Software for Regulated Environments <https://docs.nvidia.com/ai-enterprise/planning-resource/ai-software-regulated-environments-white-paper/latest/index.html>`_.


Government-Ready Components Requiring NGC Access
================================================

Most Network Operator components are available as government-ready containers in the public container registry.
However, the following STIG-FIPS certified components require an NGC API key and are available from a separate NGC repository:

.. list-table::
   :header-rows: 1

   * - Component
     - Repository
     - Image Name
     - Version
   * - DOCA-OFED Driver Container
     - |doca-driver-repository-stig|
     - doca-driver-stig-fips
     - |doca-driver-version-stig|
   * - SR-IOV Network Operator Config Daemon
     - |sriovnetop-config-daemon-stig-repository|
     - sriov-network-operator-config-daemon-stig-fips
     - |sriovnetop-config-daemon-stig-version|
   * - NIC Configuration Operator
     - |nic-configuration-operator-stig-ubuntu-repository|
     - nic-configuration-operator-stig-fips
     - |nic-configuration-operator-stig-ubuntu-version| / |nic-configuration-operator-stig-rhel-version|
   * - NIC Configuration Operator Daemon
     - |nic-configuration-operator-stig-ubuntu-repository|
     - nic-configuration-operator-daemon-stig-fips
     - |nic-configuration-config-daemon-stig-ubuntu-version| / |nic-configuration-config-daemon-stig-rhel-version|
   * - Spectrum X Operator
     - |spectrum-x-operator-stig-ubuntu-repository|
     - spectrumx-operator-stig-fips
     - |spectrum-x-operator-stig-ubuntu-version| / |spectrum-x-operator-stig-rhel-version|


.. note::

   All other Network Operator components are government-ready and available in the standard public container registry.


Validated Kubernetes Distributions
==================================

The government-ready NVIDIA Network Operator has been validated on the following Kubernetes distributions:

- Canonical Kubernetes 1.35 with Ubuntu Pro 24.04 amd64 and FIPS-compliant kernel
- Red Hat OpenShift Container Platform (OCP) 4.20 or newer with FIPS mode enabled

Common Prerequisites
====================

The following prerequisites apply to all supported platforms:

- An active NVIDIA AI Enterprise subscription and NGC API token to access Network Operator government-ready containers.
  Refer to `Generating Your NGC API Key <https://docs.nvidia.com/ngc/gpu-cloud/ngc-user-guide/index.html#generating-api-key>`_ in the NVIDIA NGC User Guide for more information on NGC API tokens.

- A namespace to deploy the NVIDIA Network Operator.
  The example install commands below use ``nvidia-network-operator`` as the namespace.

- Optionally, Service Mesh for intra-cluster traffic encryption.
  By default, the NVIDIA Network Operator does not encrypt traffic between its controller (and operands) and the Kubernetes API server.
  If you wish to encrypt this communication, you should deploy and maintain a service mesh application within the Kubernetes cluster to enable secure traffic.

Ubuntu/Canonical Kubernetes
===========================

Prerequisites
-------------

- The ``helm`` CLI installed on a client machine.

  You can run the following commands to install the Helm CLI:

  .. code-block:: console

     $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
         && chmod 700 get_helm.sh \
         && ./get_helm.sh

- An Ubuntu Pro token for Canonical Kubernetes deployments.
  This token is required for the driver container to download kernel headers and other necessary packages from the Canonical repository when using the FIPS-enabled kernel on Ubuntu 24.04.
  Refer to the `Ubuntu Pro documentation <https://documentation.ubuntu.com/pro-client/en/v30/howtoguides/get_token_and_attach/>`_ for more information on accessing Ubuntu Pro tokens.

Create NGC API Pull Secret
--------------------------

Add a Docker registry secret for downloading the Network Operator artifacts from NVIDIA NGC in the same namespace where you are planning to deploy the NVIDIA Network Operator.
Update ``ngc-api-key`` in the command below with your NGC API key.

.. code-block:: console

   $ kubectl create secret -n nvidia-network-operator docker-registry ngc-secret \
       --docker-server=nvcr.io \
       --docker-username='$oauthtoken' \
       --docker-password=<ngc-api-key>

Install Network Operator Using Helm
-----------------------------------

#. Label your ``nvidia-network-operator`` namespace for the Operator to set the enforcement policy to privilege.

   .. code-block:: console

      $ kubectl label --overwrite ns nvidia-network-operator pod-security.kubernetes.io/enforce=privileged

#. Add the NVIDIA Helm repository:

   .. code-block:: console

      $ helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
          && helm repo update

#. Install the NVIDIA Network Operator with SR-IOV Network Operator.

   .. code-block:: console
      :substitutions:

      $  helm install network-operator nvidia/network-operator \
           --namespace nvidia-network-operator \
           --set sriov-network-operator.images.sriovConfigDaemon=|sriovnetop-config-daemon-stig-repository|/sriov-network-operator-config-daemon-stig-fips:|sriovnetop-config-daemon-stig-version| \
           --set sriov-network-operator.imagePullSecrets={ngc-secret} \
           --set sriovNetworkOperator.enabled=true \
           --set nfd.enabled=true

Configure NicClusterPolicy
--------------------------

For the NVIDIA DOCA OFED Driver, the ``UBUNTU_PRO_TOKEN`` environment variable in the NicClusterPolicy should be configured.
This token is required for the driver container to download kernel headers and other necessary packages from the Canonical repository when using the FIPS-enabled kernel on Ubuntu 24.04.

.. note::

   The following example demonstrates how to configure the government-ready components that require NGC access (STIG-FIPS variants not available in the public registry).
   This example should be adapted to your specific environment. You can add other components as needed from the standard Network Operator configuration.

.. code-block:: yaml
   :substitutions:

   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     ofedDriver:
       image: doca-driver-stig-fips
       repository: |doca-driver-repository-stig|
       version: |doca-driver-version-stig|
       imagePullSecrets:
         - ngc-secret
       env:
         - name: UBUNTU_PRO_TOKEN
           value: "<YOUR_UBUNTU_PRO_TOKEN>"
     spectrumXOperator:
       image: spectrum-x-operator-stig-fips
       repository: |spectrum-x-operator-stig-ubuntu-repository|
       version: |spectrum-x-operator-stig-ubuntu-version|
       imagePullSecrets:
         - ngc-secret
     nicConfigurationOperator:
       operator:
         image: nic-configuration-operator-stig-fips
         repository: |nic-configuration-operator-stig-ubuntu-repository|
         version: |nic-configuration-operator-stig-ubuntu-version|
         imagePullSecrets:
           - ngc-secret
       configurationDaemon:
         image: nic-configuration-operator-daemon-stig-fips
         repository: |nic-configuration-config-daemon-stig-ubuntu-repository|
         version: |nic-configuration-config-daemon-stig-ubuntu-version|
         imagePullSecrets:
           - ngc-secret
       nicFirmwareStorage:
         create: true
         pvcName: nic-fw-storage-pvc
         storageClassName: nic-fw-storage-class
         availableStorageSize: 1Gi
       logLevel: info

Red Hat OpenShift Container Platform
=====================================

Prerequisites
-------------

- An OpenShift Container Platform cluster installed in FIPS mode.
  Refer to the `OpenShift FIPS Installation Guide <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/installation_overview/installing-fips>`_ for detailed instructions on installing OpenShift Container Platform in FIPS mode.

  .. note::

     To enable FIPS mode for your OpenShift cluster, you must run the installation program from a RHEL 9 computer that is configured to operate in FIPS mode. 
     Use a FIPS-capable version of the installation program and set ``fips: true`` in the ``install-config.yaml`` file before cluster deployment.

Verify FIPS Mode
----------------

Before proceeding with the Network Operator configuration, verify that your OpenShift cluster is running in FIPS mode.

You can check FIPS mode by running the following command on any node:

.. code-block:: console

   $ oc debug node/<node-name> -- chroot /host cat /proc/sys/crypto/fips_enabled

The output should be ``1`` if FIPS mode is enabled.

All nodes should report ``1`` when checking ``/proc/sys/crypto/fips_enabled``.

Install Network Operator
-------------------------

For OpenShift Container Platform, follow the standard OpenShift Operator installation process using the OpenShift Catalog or OC CLI.

Refer to the :doc:`NVIDIA Network Operator Deployment Guide with OpenShift </openshift/deployment-guide-openshift>` for detailed instructions on installing the operator via:

- OpenShift Web Console (OperatorHub)
- OpenShift OC CLI

Create NGC API Pull Secret
---------------------------

Add a Docker registry secret for downloading the Network Operator government-ready artifacts from NVIDIA NGC:

.. code-block:: console

   $ oc create secret -n nvidia-network-operator docker-registry ngc-secret \
       --docker-server=nvcr.io \
       --docker-username='$oauthtoken' \
       --docker-password=<ngc-api-key>

Replace ``<ngc-api-key>`` with your NGC API key.

Configure NicClusterPolicy
--------------------------

For OpenShift deployments, create or update the NicClusterPolicy to use the government-ready FIPS images.

.. note::

   The following example demonstrates how to configure the government-ready components that require NGC access (STIG-FIPS variants not available in the public registry).
   This example should be adapted to your specific environment. You can add other components as needed from the standard Network Operator configuration.

.. code-block:: yaml
   :substitutions:

   apiVersion: mellanox.com/v1alpha1
   kind: NicClusterPolicy
   metadata:
     name: nic-cluster-policy
   spec:
     ofedDriver:
       image: doca-driver-stig-fips
       repository: |doca-driver-repository-stig|
       version: |doca-driver-version-stig|
       imagePullSecrets:
         - ngc-secret
     spectrumXOperator:
       image: spectrum-x-operator-stig-fips
       repository: |spectrum-x-operator-stig-rhel-repository|
       version: |spectrum-x-operator-stig-rhel-version|
       imagePullSecrets:
         - ngc-secret
     nicConfigurationOperator:
       operator:
         image: nic-configuration-operator-stig-fips
         repository: |nic-configuration-operator-stig-rhel-repository|
         version: |nic-configuration-operator-stig-rhel-version|
         imagePullSecrets:
           - ngc-secret
       configurationDaemon:
         image: nic-configuration-operator-daemon-stig-fips
         repository: |nic-configuration-config-daemon-stig-rhel-repository|
         version: |nic-configuration-config-daemon-stig-rhel-version|
         imagePullSecrets:
           - ngc-secret
       nicFirmwareStorage:
         create: true
         pvcName: nic-fw-storage-pvc
         storageClassName: nic-fw-storage-class
         availableStorageSize: 1Gi
       logLevel: info

Additional Considerations
-------------------------

- **Security Context Constraints (SCC)**: The Network Operator requires privileged access. 
  OpenShift will automatically apply the appropriate SCCs when the operator is deployed in the ``nvidia-network-operator`` namespace.

- **etcd Encryption**: For enhanced security in FIPS mode, consider enabling etcd encryption using the FIPS-approved AES CBC cryptographic algorithm. 
  Refer to the `OpenShift documentation on encrypting etcd data <https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html-single/etcd/index#enabling-etcd-encryption>`_.

- **Storage**: If using persistent storage, ensure it uses RHEL-provided disk encryption for data at rest protection in FIPS environments.

- **Network Policy**: OpenShift's OVN-Kubernetes network plugin is FIPS-compliant. 
  Ensure any additional network policies are compatible with your FIPS requirements.

