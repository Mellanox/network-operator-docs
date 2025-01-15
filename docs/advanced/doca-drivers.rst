.. headings # #, * *, =, -, ^, ", ~


************
DOCA Drivers
************

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

=========================================================
Precompiled Container Build Instructions for DOCA Drivers
=========================================================

-------------
Prerequisites
-------------

Before you begin, ensure that you have the following prerequisites:

~~~~~~
Common
~~~~~~
- Docker (Ubuntu) / Podman (RH) installed on your build system.
- Web access to NVIDIA NIC drivers sources. Latest NIC drivers are published at `NVIDIA DOCA Downloads <https://developer.nvidia.com/doca-downloads>`_, for example: `https://linux.mellanox.com/public/repo/doca/2.9.1/SOURCES/MLNX_OFED/MLNX_OFED_SRC-debian-24.10-1.1.4.0.tgz <https://linux.mellanox.com/public/repo/doca/2.9.1/SOURCES/MLNX_OFED/MLNX_OFED_SRC-debian-24.10-1.1.4.0.tgz>`_

**NOTE:** NVIDIA NIC driver sources are bundled as part of NVIDIA DOCA package. Both the DOCA package version and its corresponding NIC driver (MLNX_OFED) version need to be specified to fetch the correct driver sources when building the driver container.
For example, given a DOCA package version (e.g `2.9.1`) you can find the corresponding MLNX_OFED version at the link: `<https://linux.mellanox.com/public/repo/doca/2.9.1/SOURCES/MLNX_OFED/>`_ which is `24.10-1.1.4.0`

~~~~
RHEL
~~~~
- Active subscription and login credentials for `registry.redhat.io <https://registry.redhat.io>`_. To build RHEL based container from official repository, you need to log in to `registry.redhat.io <https://registry.redhat.io>`_, run the following command:

.. code-block:: bash

   podman login registry.redhat.io --username=${RH_USERNAME} --password=${RH_PASSWORD}

Replace `RH_USERNAME` and `RH_PASSWORD` with your Red Hat account username and password.

~~~~~
RHCOS
~~~~~
- Install `oc <https://docs.openshift.com/container-platform/latest/cli_reference/openshift_cli/getting-started-cli.html>`_ CLI tool.
- Download OpenShift `pull secret <https://console.redhat.com/openshift/install/pull-secret>`_.

~~~~~
SLES:
~~~~~
Active subscription.

-------------------
Dockerfile Overview
-------------------

To build the precompiled container, the Dockerfile is constructed in a multistage fashion.
This approach is used to optimize the resulting container image size and reduce the number of dependencies included in the final image.

The Dockerfile consists of the following stages:

1. **Base Image Update**: The base image is updated and common requirements are installed. This stage sets up the basic environment for the subsequent stages.

2. **Download Driver Sources**: This stage downloads the Mellanox OFED driver sources to the specified path. It prepares the necessary files for the driver build process.

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

------------------------------
RHEL specific build parameters
------------------------------
1. `D_BASE_IMAGE`: DriverToolKit container image
    **NOTE:** DTK (DriverToolKit) is tightly coupled with specific kernel versions, verify match between kernel version to compile drivers for, versus DTK image.
2. `D_FINAL_BASE_IMAGE`: Final container image, to install compiled driver

For more details regarding DTK please read `official documentation <https://docs.openshift.com/container-platform/4.15/hardware_enablement/psap-driver-toolkit.html#pulling-the-driver-toolkit-from-payload>`_.

-------------------------------
RHCOS specific build parameters
-------------------------------
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

3. `D_KERNEL_VER`: CoreOS kernel versions for OpenShift are listed `here <https://access.redhat.com/solutions/7077108>`_.

~~~~~~~~~~~~
RHEL example
~~~~~~~~~~~~

To build RHEL-based image please use provided `RHEL Dockerfile <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/RHEL_Dockerfile>`_:

.. code-block:: bash

   podman build \
    --build-arg D_OS=rhel9.2 \
    --build-arg D_ARCH=x86_64 \
    --build-arg D_KERNEL_VER=5.14.0-284.32.1.el9_2.x86_64 \
    --build-arg D_DOCA_VERSION=2.9.1 \
    --build-arg D_OFED_VERSION=24.10-1.1.4.0 \
    --build-arg D_BASE_IMAGE="registry.redhat.io/openshift4/driver-toolkit-rhel9:v4.13.0-202309112001.p0.gd719bdc.assembly.stream" \
    --build-arg D_FINAL_BASE_IMAGE=registry.access.redhat.com/ubi9/ubi:latest \
    --tag 24.10-1.1.4.0-0-5.14.0-284.32.1.el9_2-rhel9.2-amd64 \
    -f RHEL_Dockerfile \
    --target precompiled .

~~~~~~~~~~~~~
RHCOS example
~~~~~~~~~~~~~

To build RHCOS based image please use provided `RHCOS Dockerfile <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/RHEL_Dockerfile>`_:

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

~~~~~~~~~~~~~~
Ubuntu example
~~~~~~~~~~~~~~

To build Ubuntu-based image please use provided `Ubuntu Dockerfile <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/Ubuntu_Dockerfile>`_:.

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

~~~~~~~~~~~~
SLES example
~~~~~~~~~~~~

To build SLES-based image please use provided `SLES Dockerfile <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/SLES_Dockerfile>`_:.

**SLES example**:

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


**NOTE:** Dockerfiles contain default build parameters, which may fail build proccess on your system if not overridden.

**NOTE:** Download `entrypoint script file <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/entrypoint.sh>`_

**NOTE:** Download `DTK build script file <https://raw.githubusercontent.com/Mellanox/doca-driver-build/249ff2118e4ae849d3c138ca6cbc5942f6101007/dtk_nic_driver_build.sh>`_

**NOTE:** Make sure the `.sh` files are executable by running `chmod +x entrypoint.sh dtk_nic_driver_build.sh`

.. warning:: Modification of `D_OFED_SRC_DOWNLOAD_PATH` must be tighdly coupled with corresponding update to entrypoint.sh script.
