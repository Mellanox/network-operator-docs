.. headings # #, * *, =, -, ^, ", ~
.. include:: ../common/vars.rst

****************************
NVIDIA DOCA Driver Container
****************************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none

==================================================
NVIDIA DOCA Driver Container Environment Variables
==================================================

The following are special environment variables supported by the NVIDIA DOCA Driver container to configure its behavior:

.. list-table::
   :header-rows: 1

   * - Name
     - Default
     - Description
   * - CREATE_IFNAMES_UDEV
     - | * "true” for Ubuntu 20.04, RHEL v8.x and OCP <= v4.13.
       | * "false" for newer OS.
     - Create an udev rule to preserve "old-style" path based netdev names e.g enp3s0f0
   * - UNLOAD_STORAGE_MODULES
     - "false"
     - | Unload host storage modules prior to loading NVIDIA DOCA Driver modules:
       |    * ib_isert
       |    * nvme_rdma
       |    * nvmet_rdma
       |    * rpcrdma
       |    * xprtrdma
       |    * ib_srpt
   * - ENABLE_NFSRDMA
     - "false"
     - Enable loading of NFS & NVME related storage modules from a NVIDIA DOCA Driver container
   * - RESTORE_DRIVER_ON_POD_TERMINATION
     - "true"
     - Restore host drivers when a container

In addition, it is possible to specify any environment variables to be exposed to the NVIDIA DOCA Driver container, such as the standard "HTTP_PROXY", "HTTPS_PROXY", "NO_PROXY".

.. warning::
   CREATE_IFNAMES_UDEV is set automatically by the Network Operator, depending on the Operating System of the worker nodes in the cluster (the cluster is assumed to be homogenous).

.. warning::
  When ENABLE_NFSRDMA is set to `true`, it is not possible to load NVME related storage modules from NVIDIA DOCA Driver container when they are in use by the system
  (e.g the system has NVMe SSD drives in use). User should ensure the modules are not in use and blacklist them prior to the use of NVIDIA DOCA Driver container.

These variables can be set in the NicClusterPolicy. For example:

.. code-block:: yaml

    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      ofedDriver:
        env:
        - name: RESTORE_DRIVER_ON_POD_TERMINATION
          value: "true"
        - name: UNLOAD_STORAGE_MODULES
          value: "true"
        - name: CREATE_IFNAMES_UDEV
          value: "true"


.. _advanced-configurations-precompiled:

=========================================================================
Precompiled Container Build Instructions for NVIDIA DOCA Driver Container
=========================================================================

-------------
Prerequisites
-------------

Before you begin, ensure that you have the following prerequisites:

- Docker (Ubuntu) / Podman (RH) installed on your build system.
- Web access to NVIDIA NIC drivers sources. Latest NIC drivers are published at `NVIDIA DOCA Downloads <https://developer.nvidia.com/doca-downloads>`_, for example: `https://linux.mellanox.com/public/repo/doca/2.9.1/SOURCES/MLNX_OFED/MLNX_OFED_SRC-debian-24.10-1.1.4.0.tgz <https://linux.mellanox.com/public/repo/doca/2.9.1/SOURCES/MLNX_OFED/MLNX_OFED_SRC-debian-24.10-1.1.4.0.tgz>`_

**NOTE:** NVIDIA NIC driver sources are bundled as part of NVIDIA DOCA package. Both the DOCA package version and its corresponding NIC driver (DOCA Driver) version need to be specified to fetch the correct driver sources when building the driver container.
For example, given a DOCA package version (e.g `2.10.0`) you can find the corresponding MLNX_OFED version at the link: `<https://linux.mellanox.com/public/repo/doca/2.10.0/SOURCES/MLNX_OFED/>`_ which is `24.10-1.1.4.0`

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Download Docker files and scripts:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash
    :substitutions:

    wget https://raw.githubusercontent.com/Mellanox/doca-driver-build/|doca-driver-build-commit|/RHEL_Dockerfile
    wget https://raw.githubusercontent.com/Mellanox/doca-driver-build/|doca-driver-build-commit|/Ubuntu_Dockerfile
    wget https://raw.githubusercontent.com/Mellanox/doca-driver-build/|doca-driver-build-commit|/SLES_Dockerfile
    wget https://raw.githubusercontent.com/Mellanox/doca-driver-build/|doca-driver-build-commit|/entrypoint.sh
    wget https://raw.githubusercontent.com/Mellanox/doca-driver-build/|doca-driver-build-commit|/dtk_nic_driver_build.sh

    chmod +x entrypoint.sh dtk_nic_driver_build.sh


-------------------
Dockerfile Overview
-------------------

To build the precompiled container, the Dockerfile is constructed in a multistage fashion.
This approach is used to optimize the resulting container image size and reduce the number of dependencies included in the final image.

The Dockerfile consists of the following stages:

1. **Base Image Update**: The base image is updated and common requirements are installed. This stage sets up the basic environment for the subsequent stages.

2. **Download Driver Sources**: This stage downloads the NVIDIA DOCA Driver sources to the specified path. It prepares the necessary files for the driver build process.

3. **Build Driver**: The driver is built using the downloaded sources and installed on the container. This stage ensures that the driver is compiled and configured correctly for the target system.

4. **Install precompiled driver**: Finally, the precompiled driver is installed on clean container. This stage sets up the environment to run the NVIDIA NIC drivers on the target system.


---------------------------------
Common mandatory build parameters
---------------------------------

Before building the container, you need to provide following parameters as `build-arg` for container build:

1. `D_OS`: The Linux distribution (e.g., ubuntu22.04 / rhel9.2)
2. `D_ARCH`: Compiled Architecture
3. `D_BASE_IMAGE`: Base container image (e.g., ubuntu:22.04)
4. `D_KERNEL_VER`: The target kernel version (e.g., 5.15.0-25-generic / 5.14.0-284.32.1.el9_2.x86_64)
5. `D_DOCA_VERSION`: NVIDIA DOCA version (e.g., 2.9.1)
6. `D_OFED_VERSION`: NVIDIA NIC drivers version (e.g., 24.10-1.1.4.0)

**NOTE:** Check desired NVIDIA NIC drivers sources availability for designated container OS, only versions available on download page can be utilized

**NOTE:** For proper Network Operator functionality container tag name must be in following pattern: **driver_ver-container_ver-kernel_ver-os-arch**. For example: 24.10-1.1.4.0-0-5.15.0-25-generic-ubuntu22.04-amd64

**NOTE:** Dockerfiles contain default build parameters, which may fail build proccess on your system if not overridden.

.. warning:: Modification of `D_OFED_SRC_DOWNLOAD_PATH` must be tighdly coupled with corresponding update to entrypoint.sh script.


-----
RHCOS
-----

~~~~~~~~~~~~~
Prerequisites
~~~~~~~~~~~~~

- Install `oc <https://docs.openshift.com/container-platform/latest/cli_reference/openshift_cli/getting-started-cli.html>`_ CLI tool.
- Download OpenShift `pull secret <https://console.redhat.com/openshift/install/pull-secret>`_.

~~~~~~~~~~~~~~~~~~~~~~~~~
Specific build parameters
~~~~~~~~~~~~~~~~~~~~~~~~~

1. `D_BASE_IMAGE`: DriverToolKit container image

   **NOTE:** DTK (DriverToolKit) is tightly coupled with specific kernel version for an OpenShift release.
   In order to get the specific DTK container image for a specific OpenShift release, run:

.. code-block:: bash

   oc adm release info <OCP_VERSION> --image-for=driver-toolkit


For example, for OpenShift 4.16.0:

.. code-block:: bash

   oc adm release info 4.16.0 --image-for=driver-toolkit
   quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:dde3cd6a75d865a476aa7e1cab6fa8d97742401e87e0d514f3042c3a881e301f


Then pull the DTK image locally using your pull-secret:

.. code-block:: bash

   podman pull --authfile=/path/to/pull-secret.txt docker://quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:dde3cd6a75d865a476aa7e1cab6fa8d97742401e87e0d514f3042c3a881e301f


2. `D_FINAL_BASE_IMAGE`: Final container image, to install compiled driver

3. `D_ARCH`: Target architecture: `x86_64` or `aarch64`.

4. `D_KERNEL_VER`: CoreOS kernel versions for OpenShift are listed `here <https://access.redhat.com/solutions/7077108>`_.

Kernel version can also be found with the DTK image using the following command:

.. code-block:: bash

   podman run --rm -ti quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:47ba8a10d5938c41f907ee7f70d74aecb9c2dfd7afae4cea2942fc8f47256612 cat /etc/driver-toolkit-release.json | jq -r '.KERNEL_VERSION'
   5.14.0-427.22.1.el9_4.x86_64

~~~~~~~~~~~~~
RHCOS example
~~~~~~~~~~~~~

.. code-block:: bash

   podman build \
    --build-arg D_OS=rhcos4.16 \
    --build-arg D_ARCH=x86_64 \
    --build-arg D_KERNEL_VER=5.14.0-427.22.1.el9_4.x86_64 \
    --build-arg D_DOCA_VERSION=2.9.1 \
    --build-arg D_OFED_VERSION=24.10-1.1.4.0 \
    --build-arg D_BASE_IMAGE="quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:dde3cd6a75d865a476aa7e1cab6fa8d97742401e87e0d514f3042c3a881e301f" \
    --build-arg D_FINAL_BASE_IMAGE=registry.access.redhat.com/ubi9/ubi:9.4 \
    --tag 24.10-1.1.4.0-0-5.14.0-427.22.1.el9_4.x86_64-rhcos4.16-amd64 \
    -f RHEL_Dockerfile \
    --target precompiled .

------
Ubuntu
------

~~~~~~~~~~~~~~
Ubuntu example
~~~~~~~~~~~~~~

.. code-block:: bash

   docker build \
    --build-arg D_OS=ubuntu22.04 \
    --build-arg D_ARCH=x86_64 \
    --build-arg D_BASE_IMAGE=ubuntu:22.04 \
    --build-arg D_KERNEL_VER=5.15.0-25-generic \
    --build-arg D_DOCA_VERSION=2.9.1 \
    --build-arg D_OFED_VERSION=24.10-1.1.4.0 \
    --tag 24.10-1.1.4.0-0-5.15.0-25-generic-ubuntu22.04-amd64 \
    -f Ubuntu_Dockerfile \
    --target precompiled .

----
SLES
----

~~~~~~~~~~~~~
Prerequisites
~~~~~~~~~~~~~

Active subscription. After registering, make sure to run `zypper refresh && zypper update -y`.

~~~~~~~~~~~~
SLES example
~~~~~~~~~~~~

.. code-block:: bash

   docker build \
    --build-arg D_OS=sles15.5 \
    --build-arg D_ARCH=x86_64 \
    --build-arg D_BASE_IMAGE=registry.suse.com/suse/sle15:15.5 \
    --build-arg D_KERNEL_VER=5.14.21-150500.55.83-default \
    --build-arg D_DOCA_VERSION=2.9.1 \
    --build-arg D_OFED_VERSION=24.10-1.1.4.0 \
    --tag 24.10-1.1.4.0-0-5.14.21-150500.55.83-default-sles15.5-amd64 \
    -f SLES_Dockerfile \
    --target precompiled .
