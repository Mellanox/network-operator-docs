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
.. include:: ../common/vars.rst

.. _container_images_digest:

****************************************
NVIDIA Network Operator Container Images
****************************************



.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Tag
     - Digest
   * - nvcr.io/nvstaging/mellanox
     - network-operator
     - v26.4.2-rc.2
     - sha256:656349a69304914da96b905066134d87f1b987e9282fa9f5f975773aa5888b6b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.2-rc.2
     - sha256:82372e0d9316cb90026b3ab3394b78dbd09f9b2584519b519f2ab7c663990f7f
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.2-rc.2
     - sha256:63457aab69f030ed95e2ec9f312a1773ce900c0dc6129a8c60c31bc1d5a2eff5
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.2-rc.2
     - sha256:a769e6bd72f5cf17d3a837ccc8b734a695cca76c73a1122f95ed8a695d36a4c8
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.2-rc.2
     - sha256:997a47e5bddb20311c7a58b6de96aa4e219e193faca62c30a977c382cb517c92
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.2-rc.2
     - sha256:4e2c80c320dd735f9a74848573c14dbb01c198fa6dcfc8cd88cf72db9c3bb6ff
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.2-rc.2
     - sha256:5c9c37637b2ded3a5d0707dad978efabaca27808626399c3c592970308397602
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.2-rc.2
     - sha256:6b8035f03778f727b29080272c1ac542e90d7d72830a04be3403986a17a73dcf
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.2-rc.2
     - sha256:d46d833514b7855a9a409a75b6df006b97cea469f5acd7cb93c420cdd68648cf
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.2-rc.2
     - sha256:42260776a910fdaa455ab1b5ca43777045d550d4d8815e02b83f6d4534c54969
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.2-rc.2
     - sha256:a1554b0e4c189c4db4257c75780a8d61e90c0f93cee1ee9c358b63d2b319a198
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.2-rc.2
     - sha256:c02375051facabe79ec2d454d9672c1d2fa2be7c840d61e192ea3161519589f2
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.2-rc.2
     - sha256:ffd2bf0a8043f02c32a9a9758062f367aa5d3ad6457229e30039b3c1ceb4f23f
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.2-rc.2
     - sha256:8f0d425baea11a11085ceffe458460cea4273b503647e8152998ce9775f132e5
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.2-rc.2
     - sha256:19bf4c26e477551ff0f1e07a0af6239872cc89812acdf4746425443dbd168bff
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.2-rc.2
     - sha256:b3541f4e653055b64434a1ca5cce975e380c1dc73a1218ba148c1ffbaf06635c
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.2-rc.2
     - sha256:e5457f90bd6b57df6400c7b7d5db931f1fce50e7bfcb5f319fd4a1622ec8e45d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.2-rc.2
     - sha256:285696a9787d95b5f8140d3b37e1a8b8b0109bb242c9231dd26925b5a8aae5ee
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.2-rc.2
     - sha256:b1d2882d33c5085ffe401cad7e62522f233c293fa681ddc44253d6ef2312b4fd
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.2-rc.2
     - sha256:c7bc94c50eb3c94d36d17c625bf904bf47e312d0888cd73eed375f075918eaf6
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.2-rc.2
     - sha256:f71a716affe6a1a82aea4297f1980d5657445c7de6ffa2262578377e9c4209f8
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.2-rc.2
     - sha256:f9e2b7a5743c70e17727a97a0476c7f48248850bbe790db0c920a5ec1f291258

=================================
DOCA-OFED Driver Container Images
=================================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvstaging/mellanox
     - doca-driver
     - doca3.4.1-26.04-1.1.0.0-1


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-5.15.0-186-generic-ubuntu22.04-amd64
     - sha256:47a6fb4c03e2d615922b2e2f062294054e4941f0edc757df248a060b50c4c609
   * -
       | doca3.4.1-26.04-1.1.0.0-1-5.15.0-186-generic-ubuntu22.04-arm64
     - sha256:86d90b354234628e2bd3da28941a1dfdf90d225ef35263ec73fe52acae993a25
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:948878edf174fa9385286a8c7f8cce56c03b3cb57a1b7145f4e5441b8b6b3976
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:4f4d7cb58c6c187aa8196a79c37e72977b315376bd3402fc3da96422ccd4ca5e
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1058-oracle-ubuntu22.04-amd64
     - sha256:4e6809fef7bdbd4caa4a41f9e18e9707bdbcde7420cddaf9578dca7900bd71b7
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1058-oracle-ubuntu22.04-arm64
     - sha256:a529fdbcd997f98233a90b87bfe84aa4c2af0c924160dcee80cd2e371431ed17
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1059-nvidia-ubuntu22.04-amd64
     - sha256:7302810208ed93a20e4190e3ff06192a134802fcda7740a5638ee93093320c49
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1059-nvidia-ubuntu22.04-arm64
     - sha256:0e56966dcaf0d910e7852b549a84b65db3c0aa27b846206ba4f575ab2013839f
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:db0dda46ccd375a9d995ebeb01070624db6dad9ddefcdf2f33ea5b633b74a5f0
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:ccc8a894291eae350f8d4c56bdcaf68221a420b559de9066a4782c9881191219
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1062-azure-ubuntu22.04-amd64
     - sha256:e96d634f000fd0fb1154877d92f983bab849f26e1801a31104ed9e99fec2afd9
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-1062-azure-ubuntu22.04-arm64
     - sha256:03cce9c7eb096ae90c7e51c34f6869938d6e566cc1eb5a63921dbd0bcd69ef9c
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-136-generic-ubuntu24.04-amd64
     - sha256:0423624781c6c2e4c1e1a4cb708d33616398fb4f18132ff7276b9c7f3555fdd9
   * -
       | doca3.4.1-26.04-1.1.0.0-1-6.8.0-136-generic-ubuntu24.04-arm64
     - sha256:4719bae5270c8682180c61edd86651055fb4a714fa39cdc8529793257e2a9414
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1007-aws-ubuntu24.04-amd64
     - sha256:9db49f50d510a8c9b8d10e852045e7de97904d962ab80010d2f6f0473cb7227e
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1007-aws-ubuntu24.04-arm64
     - sha256:6d5634d211c4464e28484210379eadafe332f9cc9f1dea4eae9933c82776c64f
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:d44d884e45203fa6b619d4322b662a1b1563a64309a33a00fb8f7c3e3df9511a
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:03ac5f7bc8fb6aae9cb3c62f83a57bd7015344a5cd3f09aa4068751a9bd1dc48
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1013-nvidia-ubuntu24.04-amd64
     - sha256:96dc7189d22c5fcbda4a6cc5e3230c8596df13e7c0155a6588454f296f8d51b1
   * -
       | doca3.4.1-26.04-1.1.0.0-1-7.0.0-1013-nvidia-ubuntu24.04-arm64
     - sha256:614009dad9d39e6f6a95a7f287c67e119cd5bb8418f3ee620f1809a6fa33205a
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu22.04
     - sha256:52a800dce5fba7e0ccf5ce27357219cd5bee42f5829e92cbddce47cda105a06b
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu22.04-amd64
     - sha256:015ae0c39d5fe8ced57f66e369f0d1c0ba77e6f83817489b3d15a2697f5a9ebe
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu22.04-arm64
     - sha256:f0a16e01d47cd928692092b500ce8b2e5401a73884bca8b4a8b841b7e5acd04c
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu24.04
     - sha256:35d467f5edd785a26c8a4d854a03e1652a5933f8ebcc85681abcf6beb57eb5f8
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu24.04-amd64
     - sha256:edce1f95a5778cd6a36c13ebb4b87fc43b61ede5d4dc0489e56cfa9ae37fa0c3
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu24.04-arm64
     - sha256:c802335d23793c12347fae05adcadc4de5bff556d7c1d9f3eb1fa2fce1ad1061

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.16-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.17-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.18-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.19-amd64
     - sha256:8c21373355eebfb0127fb6c19efb5a59ce878e636afddeaf186f238b68b394ea
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.16-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.17-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.18-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.19-arm64
     - sha256:087d6ca78ff0ff1ca0446e80c093185cdf06976df757db74ff9f3453c8e3a7fd
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.19
     - sha256:a18c0cd1e2eaeafc17fb08c9ea688d191b865323f7fddf481d9a69a09700ee47

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.0
     - sha256:20abc3255ccb361948cdd4b2a9bb0e8c9d61d7c9bbe1cc91710841c7cd22a8a4
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.0-amd64
     - sha256:b15772d84e982ba4e83e772405d9ea71c80dc92bee7064fdc5725e88ff046fef
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.0-arm64
     - sha256:4bbb1726299e9df97fa43c2a067670f30ca9e13f301b78d426b1910b51b9a825
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.2
     - sha256:45a8ee2aa1a6cbc3799262aa849132b2f6848ea685d9ddc7a2b255b6093cdef8
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.2-amd64
     - sha256:6bd61a20b45e22ceacac6da16fb04512c494ecf37878505d8cbd67a6ea178dae
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.2-arm64
     - sha256:092424661028fd9c1d8fcdc5fab79136952211a66d7f096c574f97973216e034
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.10
     - sha256:e247096ca295df158a0b1622e64db6a31f22bc5b85ef38aa9a711a5b38477642
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.10-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.6-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.8-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.9-amd64
     - sha256:df9d3e99ca8ef8cb9188ae9c858d5eb32a480733f6b70d0fba1cb813cbc10f25
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.10-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.6-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.8-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.9-arm64
     - sha256:32e2855ade034b7be6b04de7033c1c6764e5e6afb665a7e6ffa786b90c1f53d0
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.0-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.2-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.3-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.4-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.5-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6-amd64
     - sha256:73e37500c6224b9807b3f7814b72d81ec2b5708cdb9e6264007910c8f409c0bd
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.0-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.2-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.3-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.4-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.5-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6-arm64
     - sha256:559ff08d3f0fbf72bb300f87e7782aacd1e90ab8b1d80c78235f6478d8d8e77a
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6
     - sha256:8c7444effcf5192e793ddcdbdeeb5cdb21f3ed7a2f33e8e0194bd698c341ce84
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.8
     - sha256:90646ee7d6df775d6afaf48fd918ae46075719d286eb6e503e2354ba3cb3628a
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.8-amd64
     - sha256:08946c3bc681506f5b08557bed9b19683d225569aa835dd6f2dace7461e30e61
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.8-arm64
     - sha256:0c5d7f07d8aa8331745739be21563e3faa67bd914bc055c63cc5aeb8577b4aaa

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-sles15.7
     - sha256:c258af17ed2aa572bd6b2fb3a8dd4245c1f1f469f9b7c1a6a150316cca53968d
   * -
       | doca3.4.1-26.04-1.1.0.0-1-sles15.7-amd64
     - sha256:721656effacc772748693fd7087e5d313a1707d35c9b9ca14782ff748cff9d66
   * -
       | doca3.4.1-26.04-1.1.0.0-1-sles15.7-arm64
     - sha256:048468221ba0664e1e8fba9daf0d9be0dca00952a80cc3dd3dbc022b11112d58


=====================================================
STIG FIPS Compliant DOCA-OFED Driver Container Images
=====================================================

.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvstaging/mellanox
     - doca-driver-stig-fips
     - doca3.4.1-26.04-1.1.0.0-1

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu24.04-amd64
     - sha256:23d6bd67ae83f1d720a562dff3a94ca8e1c476d44ad3e3a0e88cba5cda67306b

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6-amd64
     - sha256:648b0c3664c8111a7572d1996dbab2be2ea55f6609a75f0f9d78e640b29ae4c8