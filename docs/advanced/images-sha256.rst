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
   * - nvcr.io/nvidia/cloud-native
     - network-operator
     - v26.4.1
     - sha256:49d8bd43fa4559468ec93a4c52053aaf7f36861d9f802ffe8fd3aa94266f82de
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.4.1
     - sha256:922217cee504f080b2a76c51ec5d17baa562ffe2447bb1e370c01a6b26a7059f
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.1
     - sha256:464970d3197fe982b779c48cce74d90f7563ede5daef834bf169db39ee4541c7
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.4.1
     - sha256:b103b0a36693d6ab1a25ca65f6cc058bfb5819b9d11a8f0638ae7f1c832273d1
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.4.1
     - sha256:e5eb2d3c746a06a44bad7e8e451ff7a4d14251b1a254f9a411f17dd529c41f0f
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.1
     - sha256:88db2fa65846d68d9c4ec996de0ecf4839b79e02e5643eb9ad3354d448cb2757
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.1
     - sha256:2599a0d512af2f92c1fa6ac7536d657463219d64bb1369156644ab1b150b672f
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.4.1
     - sha256:d631df0a88e9088b6196d4db258644085df052b04f2db6b06dc9c8ba93de9866
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.1
     - sha256:b4410df7cc3961fd7e059d8ca419e9f8bebdcb74359a910ccc843dfd69b30c9c
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.1
     - sha256:96e50e3f5d754ac33bb0a8000ce317d15df4abc8d6a74660900f02e8f2b2b7f4
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.1
     - sha256:c24d0993feb97c0a1952bf30ab51f7452dc57d5846684e481aaa4455cd56e1aa
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.4.1
     - sha256:9d627407b27ff817152e1c0d1d26d60a49b8cc9d8e54f9ad28d0b8fe4f017b35
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.1
     - sha256:ed91dfb15d5da90d9fad623ea0472a9c65c5404e528aabbb56fb3aff2ee50925
   * - nvcr.io/nvidia/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.1
     - sha256:ff43dae772403fa5f8988fa0a0e81544e8e000bc467b1610333b0fffc89469bc
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.4.1
     - sha256:7d96a2f3a4009f29c6cd799cd9c3abc90b4a850e278c0bfadc1e0a454767689c
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.4.1
     - sha256:27e5fc5349625fd6d354230513e936973a3a28b8b30f3203758965ec21f55c77
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.1
     - sha256:d86c29504c0a4ff4bd2e4124c81f046d851cfd541091ec5c0264e83cb3c206fe
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.4.1
     - sha256:03f9845060c952c78208365536d1d08d3ea7955309f7ce5b2c350090f66309a4
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.1
     - sha256:b5e9733a01ba6031ecbf71024a98ad02b9052d11a10d3df62daf75135a07ba9b
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.1
     - sha256:ff80af3402473fba6251f36f924ddc50341f954980bfba919cae70925e644318
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.4.1
     - sha256:cfd6cd87f077c1879d4c4e9a6de146c7200afe6b25b340c803a2f9a2ceb8d910
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.1
     - sha256:0f5bb7c29d17b6c9c4957d2d666798713f0b9855d9f12a6dcb50ea36dbccede1

=================================
DOCA-OFED Driver Container Images
=================================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
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
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu22.04-amd64
     - sha256:015ae0c39d5fe8ced57f66e369f0d1c0ba77e6f83817489b3d15a2697f5a9ebe
   * -
       | doca3.4.1-26.04-1.1.0.0-1-ubuntu22.04-arm64
     - sha256:f0a16e01d47cd928692092b500ce8b2e5401a73884bca8b4a8b841b7e5acd04c
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
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.17-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.18-amd64
     - sha256:8c21373355eebfb0127fb6c19efb5a59ce878e636afddeaf186f238b68b394ea
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.17-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhcos4.18-arm64
     - sha256:087d6ca78ff0ff1ca0446e80c093185cdf06976df757db74ff9f3453c8e3a7fd

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.0-amd64
     - sha256:b15772d84e982ba4e83e772405d9ea71c80dc92bee7064fdc5725e88ff046fef
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.0-arm64
     - sha256:4bbb1726299e9df97fa43c2a067670f30ca9e13f301b78d426b1910b51b9a825
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.2-amd64
     - sha256:6bd61a20b45e22ceacac6da16fb04512c494ecf37878505d8cbd67a6ea178dae
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel10.2-arm64
     - sha256:092424661028fd9c1d8fcdc5fab79136952211a66d7f096c574f97973216e034
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.10-amd64
     - sha256:df9d3e99ca8ef8cb9188ae9c858d5eb32a480733f6b70d0fba1cb813cbc10f25
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel8.10-arm64
     - sha256:32e2855ade034b7be6b04de7033c1c6764e5e6afb665a7e6ffa786b90c1f53d0
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.4-amd64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6-amd64
     - sha256:73e37500c6224b9807b3f7814b72d81ec2b5708cdb9e6264007910c8f409c0bd
   * -
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.4-arm64
       | doca3.4.1-26.04-1.1.0.0-1-rhel9.6-arm64
     - sha256:559ff08d3f0fbf72bb300f87e7782aacd1e90ab8b1d80c78235f6478d8d8e77a
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
   * - nvcr.io/nvidia/mellanox
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