.. headings # #, * *, =, -, ^, ", ~
.. include:: ../common/vars.rst

*******************************
Proxy & Air-Gapped Environments
*******************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none


==================================================
Network Operator Deployment in a Proxy Environment
==================================================

This section describes how to successfully deploy the Network Operator in clusters behind an HTTP Proxy. By default, the Network Operator requires internet access for the following reasons:

    - Container images must be pulled during the NVIDIA Network Operator installation.
    - The driver container must download several OS packages prior to the driver installation.

To address these requirements, all Kubernetes nodes, as well as the driver container, must be properly configured in order to direct traffic through the proxy.

This section demonstrates how to configure the NVIDIA Network Operator, so that the driver container could successfully download packages behind an HTTP proxy. Since configuring Kubernetes/container runtime components for proxy use is not specific to the Network Operator, those instructions are not detailed here.

.. warning::
   If you are not running OpenShift, please skip the section titled HTTP Proxy Configuration for OpenShift, as Openshift configuration instructions are different.

-------------
Prerequisites
-------------

Kubernetes cluster is configured with HTTP proxy settings (container runtime should be enabled with HTTP proxy).

--------------------------------------
HTTP Proxy Configuration for Openshift
--------------------------------------

For Openshift, it is recommended to use the cluster-wide Proxy object to provide proxy information for the cluster.
Please follow the procedure described in `Configuring the Cluster-wide Proxy <https://docs.openshift.com/container-platform/latest/networking/enable-cluster-wide-proxy.html>`_ via the Red Hat Openshift public documentation. The NVIDIA Network Operator will automatically inject proxy related ENV into the driver container, based on the information present in the cluster-wide Proxy object.

------------------------
HTTP Proxy Configuration
------------------------

Specify the ``ofedDriver.env`` in your ``values.yaml`` file with appropriate ``HTTP_PROXY``, ``HTTPS_PROXY``, and ``NO_PROXY`` environment variables (in both uppercase and lowercase).

.. code-block:: yaml

   ofedDriver:
      env:
      - name: HTTPS_PROXY
        value: http://<example.proxy.com:port>
      - name: HTTP_PROXY
        value: http://<example.proxy.com:port>
      - name: NO_PROXY
        value: <example.com>
      - name: https_proxy
        value: http://<example.proxy.com:port>
      - name: http_proxy
        value: http://<example.proxy.com:port>
      - name: no_proxy
        value: <example.com>


========================================================
Network Operator Deployment in an Air-gapped Environment
========================================================

This section describes how to successfully deploy the Network Operator in clusters with restricted internet access.
By default, the Network Operator requires internet access for the following reasons:

 - The container images must be pulled during the Network Operator installation.
 - The DOCA Driver container must download several OS packages prior to the driver installation.

To address these requirements, it may be necessary to create a local image registry and/or a local package repository, so that the necessary images and packages will be available for your cluster.
Subsequent sections of this document detail how to configure the Network Operator to use local image registries and local package repositories.
If your cluster is behind a proxy, follow the steps listed in Network Operator Deployment in Proxy Environments.

--------------------
Local Image Registry
--------------------

Without internet access, the Network Operator requires all images to be hosted in a local image registry that is accessible to all nodes in the cluster.
To allow Network Operator to work with a local registry, users can specify local repository, image, tag along with pull secrets in the ``values.yaml`` file.

--------------------------------------------------------
Pulling and Pushing Container Images to a Local Registry
--------------------------------------------------------

To pull the correct images from the NVIDIA registry, you can leverage the fields ``repository``, ``image`` and ``version`` specified in the ``values.yaml`` file or in the :ref:`container_images_digest` section.

NicClusterPolicy supports use of image container digest in the `version` field, except for DOCA driver.

There is one caveat with regards to the DOCA driver image. The version field must be appended by the OS name and Architecture running on the worker node.

For example for DOCA driver version |mofed-version|, the tag for Ubuntu 24.04 with X86 architecture is "|mofed-version|-ubuntu24.04-amd64".
Available DOCA driver image tags can be found at `NGC <https://catalog.ngc.nvidia.com/orgs/nvidia/teams/mellanox/containers/doca-driver/tags>`_.

In case of local registry required authentication, make sure to create a pull secret and configure in NicClusterPolicy accordingly.

.. note::
    NVIDIA Network Operator communicates with the Image Registry configured for the DOCA Driver in the NICClusterPolicy to list the available tags.
    Specifying pull secret is required in the NicClusterPolicy DOCA Driver section, even if global container access credentials are configured on nodes.

-----------------------------------
Configuring Local Registry TLS Cert
-----------------------------------

NVIDIA Network Operator communicates with the Image Registry configured for the DOCA Driver in the NICClusterPolicy to list the available tags.
This is required to verify the availability of precompiled DOCA Driver container images.

If the Image Registry uses a TLS certificate that is not issued by a well-known Certificate Authority (CA), it is required to configure the NVIDIA Network Operator with the Certificate.


Fetch the TLS Certificates from the Image Registry server and save them in the `ca.crt` file:

.. code-block:: bash

   export REGISTRY_HOST=myregistry.example.com
   export REGISTRY_PORT=5000
   openssl s_client -showcerts -connect ${REGISTRY_HOST}:${REGISTRY_PORT} </dev/null 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/' > ca.crt

Create a ConfigMap containing the TLS Certificates from the `ca.crt file`:

.. code-block:: bash

   kubectl create configmap custom-registry-cert --from-file=<external_registry>=ca.crt -n nvidia-network-operator

In OpenShift, update the `nvidia-network-operator` Subscription by adding the following `config` under `spec`:

.. code-block:: bash

   kubectl apply -f - <<EOF
   apiVersion: operators.coreos.com/v1alpha1
   kind: Subscription
   metadata:
     name: nvidia-network-operator
     namespace: nvidia-network-operator
   spec:
     config:
       volumes:
         - configMap:
             name: custom-registry-cert
           name: custom-registry-ca
       volumeMounts:
         - mountPath: /etc/pki/tls/certs/
           name: custom-registry-ca
   EOF



In Kubernetes, update the `network-operator` Deployment's volumes by running:

.. code-block:: bash

   kubectl apply -f - <<EOF
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: network-operator
     namespace: nvidia-network-operator
   spec:
     template:
       spec:
         volumes:
           - configMap:
               name: custom-registry-cert
             name: custom-registry-ca
         containers:
           - name: network-operator
             volumeMounts:
               - mountPath: /etc/pki/tls/certs/
                 name: custom-registry-ca
   EOF



------------------------
Local Package Repository
------------------------

.. warning::
   The instructions below are provided as reference examples to set up a local package repository for NVIDIA Network Operator.

The DOCA Driver container deployed as part of the Network Operator requires certain packages to be available for the driver installation. In restricted internet access or air-gapped installations, users are required to create a local mirror repository for their OS distribution, and make the following packages available:

.. code-block::

   ubuntu:
      linux-headers-${KERNEL_VERSION}
      linux-modules-${KERNEL_VERSION}
      pkg-config
   rhel, rhcos:
      kernel-headers-${KERNEL_VERSION}
      kernel-devel-${KERNEL_VERSION}
      kernel-core-${KERNEL_VERSION}
      createrepo
      elfutils-libelf-devel
      kernel-rpm-macros
      umactl-libs
      lsof
      pm-build
      patch
      hostname

For RT kernels following packages should be available:

.. code-block::

    kernel-rt-devel-${KERNEL_VERSION}
    kernel-rt-modules-${KERNEL_VERSION}


For Ubuntu, these packages can be found at `archive.ubuntu.com <http://archive.ubuntu.com/>`_, and be used as the mirror that must be replicated locally for your cluster. By using apt-mirror or apt-get download, you can create a full or a partial mirror to your repository server.

For RHCOS, dnf reposync can be used to create the local mirror. This requires an active Red Hat subscription for the supported OpenShift version. For example:

.. code-block:: bash

  dnf --releasever=8.4 reposync --repo rhel-8-for-x86_64-appstream-rpms --download-metadata

Once all the above required packages are mirrored to the local repository, repo lists must be created following distribution specific documentation. A ConfigMap containing the repo list file should be created in the namespace where the NVIDIA Network Operator is deployed.

Following is an example of a repo list for Ubuntu 20.04 (access to a local package repository via HTTP):

``custom-repo.list``:

.. code-block::
   
   deb [arch=amd64 trusted=yes] http://<local pkg repository>/ubuntu/mirror/archive.ubuntu.com/ubuntu focal main universe
   deb [arch=amd64 trusted=yes] http://<local pkg repository>/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-updates main universe
   deb [arch=amd64 trusted=yes] http://<local pkg repository>/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-security main universe


Following is an example of a repo list for RHCOS (access to a local package repository via HTTP):

``cuda.repo`` (a mirror of https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64):

.. code-block::
   
   [cuda]
   name=cuda
   baseurl=http://<local pkg repository>/cuda
   priority=0
   gpgcheck=0
   enabled=1

``redhat.repo``:

.. code-block::
   
   [baseos]
   name=rhel-8-for-x86_64-baseos-rpms
   baseurl=http://<local pkg repository>/rhel-8-for-x86_64-baseos-rpms
   gpgcheck=0
   enabled=1
   [baseoseus]
   name=rhel-8-for-x86_64-baseos-eus-rpms
   baseurl=http://<local pkg repository>/rhel-8-for-x86_64-baseos-eus-rpms
   gpgcheck=0
   enabled=1
   [rhocp]
   name=rhocp-4.10-for-rhel-8-x86_64-rpms
   baseurl=http://<local pkg repository>/rhocp-4.10-for-rhel-8-x86_64-rpms
   gpgcheck=0
   enabled=1
   [apstream]
   name=rhel-8-for-x86_64-appstream-rpms
   baseurl=http://<local pkg repository>/rhel-8-for-x86_64-appstream-rpms
   gpgcheck=0
   enabled=1

``ubi.repo``:

.. code-block::
   
   [ubi-8-baseos]
   name = Red Hat Universal Base Image 8 (RPMs) - BaseOS
   baseurl = http://<local pkg repository>/ubi-8-baseos
   enabled = 1
   gpgcheck = 0
   [ubi-8-baseos-source]
   name = Red Hat Universal Base Image 8 (Source RPMs) - BaseOS
   baseurl = http://<local pkg repository>/ubi-8-baseos-source
   enabled = 0
   gpgcheck = 0
   [ubi-8-appstream]
   name = Red Hat Universal Base Image 8 (RPMs) - AppStream
   baseurl = http://<local pkg repository>/ubi-8-appstream
   enabled = 1
   gpgcheck = 0
   [ubi-8-appstream-source]
   name = Red Hat Universal Base Image 8 (Source RPMs) - AppStream
   baseurl = http://<local pkg repository>/ubi-8-appstream-source
   enabled = 0
   gpgcheck = 0


Create the ConfigMap for Ubuntu:

.. code-block:: bash

   kubectl create configmap repo-config -n <Network Operator Namespace> --from-file=<path-to-repo-list-file>

Create the ConfigMap for RHCOS:

.. code-block:: bash

   kubectl create configmap repo-config -n <Network Operator Namespace> --from-file=cuda.repo --from-file=redhat.repo --from-file=ubi.repo

Once the ConfigMap is created using the above command, update the ``values.yaml`` file with this information to let the Network Operator mount the repo configuration within the driver container and pull the required packages. Based on the OS distribution, the Network Operator will automatically mount this ConfigMap into the appropriate directory.

.. code-block:: yaml
   
   ofedDriver:
     deploy: true
     repoConfg:
       name: repo-config

If self-signed certificates are used for an HTTPS based internal repository, a ConfigMap must be created for those certifications and provided during the Network Operator installation. Based on the OS distribution, the Network Operator will automatically mount this ConfigMap into the appropriate directory.

.. code-block:: bash

   kubectl create configmap cert-config -n <Network Operator Namespace> --from-file=<path-to-pem-file1> --from-file=<path-to-pem-file2>


.. code-block:: yaml
   
   ofedDriver:
     deploy: true
     certConfg:
       name: cert-config
