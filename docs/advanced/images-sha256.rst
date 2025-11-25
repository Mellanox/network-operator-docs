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
     - v25.10.0-rc.3
     - sha256:fbf3e6fd1242f3654229e6f2d8b3fc8b2669ec760ab8abba9604999c668019bc
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-rc.3
     - sha256:de7a1acb89d5203ecd81ee83fd212f3f438655c87855f67327d7e4499ce218c2
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-rc.3
     - sha256:915bba7b9d393bdb7cf8a0636e58d8612e3225e53417adb40f308de4b864c154
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-rc.3
     - sha256:4d96641881a7e814615f43f515b39d2a530486d1bc1b3746177df728432491e9
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-rc.3
     - sha256:8634cea4bfcbcde1f7a9609da5ad82885866a61ab3b2293ec2b75f39977eb165
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-rc.3
     - sha256:0e5547e6cafca82df31456f17ac09960b0681f96924dc20c5d549fea07e02297
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-rc.3
     - sha256:922ab4dcce3a43c01bdabcc633f70bf2c3499d1a832add742bdafd429e64c7f2
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-rc.3
     - sha256:c3ceb23676c46c8efd586c8c6d0c21a54cd92e002880cb65f142cb5ca7384bd1
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-rc.3
     - sha256:2b42c22422e4dea623caa7628446c93f74957a9539eb694bc7cb4dbd527b46a7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-rc.3
     - sha256:cff98768ff7ed288bb0197c93617f05fc81df11a0edd402612f42d093b8e9ad6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-rc.3
     - sha256:2467d080bd567cc2f44262599dec6981104d2b56f670ec0508e8c98cae6732b7
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-rc.3
     - sha256:bef94adab2e5f28fd8ce9990112290fecb91592d2f9a7ca2af790248723e43a3
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-rc.3
     - sha256:ce861013d7da2b841d13193fa46251b9b6dce92956311e2dbb060f6edb11bb9a
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-rc.3
     - sha256:3ca0784ae94d44866e716afd1cca7729743e85411c96c065ee5bcaecea13150a
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-rc.3
     - sha256:becece919212839244bdd49dd268658f4a77f9e1041227e93f3ce8631b335b4d
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-rc.3
     - sha256:ffff0fece1f8bbf0145da91c9b15bbdce424507ae3388a3af6f61e2d9059bac3
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-rc.3
     - sha256:f0ef6d11cbeca9100572f708c5d6c8fe7ae0840bfc5eac3c313c600cd5c548e4
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-rc.3
     - sha256:3b16d5a5188b0e4a5bb37a395fa840948fe52176a4e61a2ad26f0d9c1ab1f359
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-rc.3
     - sha256:fada333f18235029dbeb8cf6693692bb244e0a8f2672f202c062a132e561481e
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-rc.3
     - sha256:1907c0fc28b2f19f9ce24a39042e36a0bf64c105df51d70cfd5841f19ea17f11
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-rc.3
     - sha256:6aa8d92bcd10fae0841dde23320540eacb3cbf1c48ca4ce4804187d4f4221ae4

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
     - doca3.2.0-25.10-1.2.8.0-2


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-5.15.0-161-generic-ubuntu22.04-amd64
     - sha256:7e060b5c2e9eef274a65d51c1d6b39ee90d1ec1299657ff7407407847e1f7722
   * -
       | doca3.2.0-25.10-1.2.8.0-2-5.15.0-161-generic-ubuntu22.04-arm64
     - sha256:fdf08cac9c20971edd5b8a3210e2953762465fcb034461df14d8cd7d8aea3463
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1013-nvidia-ubuntu24.04-amd64
     - sha256:d70b60639c2db224c384a151b2f8ad88b25859c4536cb4018cc8f7d0ed2b6b33
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1013-nvidia-ubuntu24.04-arm64
     - sha256:02ac5f7352bf2a9f6afacb18f3dd994e747bb718a53c83f92f557cbb7768ff82
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1014-azure-ubuntu24.04-amd64
     - sha256:faa7c3730399b9631a075aae6c33d40de7c9fd144bd3ac043ddee835fcda0c8b
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1014-azure-ubuntu24.04-arm64
     - sha256:c931d086596722e07d563115da6ef48abe28d86ec1aba7bb76bb9d5b5c9442ae
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1017-aws-ubuntu24.04-amd64
     - sha256:559bc02ce8a99923f41f3436f003af7b897e258c9c0d9d06025ec52c3d5d12ce
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1017-aws-ubuntu24.04-arm64
     - sha256:968e609ea5449972bd7f254651bfa505417471d4f1b92ae4916ae40a2bc38aba
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1017-oracle-ubuntu24.04-amd64
     - sha256:ca6962aa53d1115044df3225e707a68f268a73b5b6e943078c322318c004a4c3
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.14.0-1017-oracle-ubuntu24.04-arm64
     - sha256:1aa7f64925d1035b1c26f95f91ce840cfbef2e2f0215de90c76222266e834dc6
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1039-oracle-ubuntu22.04-amd64
     - sha256:d1b3d794e3f46d6eea527c4594bd974497b27743feb48e2b8e812dc7462599ac
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1039-oracle-ubuntu22.04-arm64
     - sha256:825b8869bcc0a69d1a45c1e9ebe9f90a129107f212089ae4e6ec37263cc43480
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:069f2bd7a3c5581a343cf3fb4f17a17d95e9151fd707c52bbd47dc6f3e5965a8
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:8f71d9722b89ec5657c662b8b5dc46ef8569b0232761f24fdecbd10d1f1065b2
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1043-aws-ubuntu22.04-amd64
     - sha256:78b388dface7f7a69260a8957a9f278f800fb9438db8b958e0aa45b63ec6a5ce
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1043-aws-ubuntu22.04-arm64
     - sha256:41119ca490553e7cb6943bdf58a2f9ec9874040bf49774d57fec8ec8a8e4487b
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1043-nvidia-ubuntu22.04-amd64
     - sha256:f328b294ebd51ef5135fb749111958c7c5b8ab76ff3142652ff055c82f9d86c3
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-1043-nvidia-ubuntu22.04-arm64
     - sha256:a97f2e1f51ab63d29122661b54e2dd91270bd08a17f6fa8f101f2d053470c5be
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-88-generic-ubuntu24.04-amd64
     - sha256:40272e26741119f9f4773aa6968df3412c9b4a752290fab6eef62355fdba7059
   * -
       | doca3.2.0-25.10-1.2.8.0-2-6.8.0-88-generic-ubuntu24.04-arm64
     - sha256:e55327bc33e01a77cb2e8b1d2d33dbbe686735bfe94fab8df9e6648fcdd28461
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu22.04
     - sha256:95c8ad120532e0b32002e21a14affe48cdd430815ef5753155a2c48406a5379f
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu22.04-amd64
     - sha256:e41147df25c09628840e1925da97d6ba04b348b7855c05f79add3dc99573eadd
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu22.04-arm64
     - sha256:1942c2ba5d3c74e0c5d9df833ffa31f605dfcf6f76959d59df274cf81d61890b
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu24.04
     - sha256:485ea875f0dc118c3e26896f8dc14c8cfa4f07851bb8e6904e577d4a649e04bd
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu24.04-amd64
     - sha256:0ebf2439d80dc8f11f2790c642439c96abd40e563013c378ec319f29b5d8ab5f
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu24.04-arm64
     - sha256:73d940857a1589bbc0cf11c15e9fba7aa94534898f61c9869ff1a66211e590d7

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.16-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.17-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.18-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.19-amd64
     - sha256:327f4396b63cc6d6694a3272f48758e3bc415b477919d36f3ff8b5e4b0c322eb
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.16-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.17-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.18-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.19-arm64
     - sha256:54606f3cde8fe47e5399347661d58954889a7712f7b35c505b949a313d5f7dfe
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.19
     - sha256:899b4e02a78eb5b6890f908c39255545d3ce8e304f6aa876b0fbb0efbfa2e0be

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel10.0
     - sha256:c211fb3a64f05e42271dd20bd619c08e4b4979c5bd2928938d5b824acbf523cb
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel10.0-amd64
     - sha256:bca54e10732c1a617cc9cc2ded9b83372593963559ba72a54c499d39a143fcb0
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel10.0-arm64
     - sha256:8f6a0c704e40e383079a7d9fd6b06d60af168e3ebf3cb98175f952a3c404a9a8
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.10
     - sha256:cc48db55d1b07e7acc31880c8974ca997a7123ebe0d1b8cf9410615a2e23a45f
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.10-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.6-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.8-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.9-amd64
     - sha256:2ba90699f70a848488bf520afd03283e515c73daef431618256920d685957d4c
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.10-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.6-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.8-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.9-arm64
     - sha256:4015c620d07b169462d726dee926616faf0d20b4331a1922bade079efd8427b5
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.0-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.2-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.3-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.4-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.5-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.6-amd64
     - sha256:c6c0ef891b8dd381c002976b202ffe1c8d7d35710d812dbc3d31151a913b3fd4
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.0-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.2-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.3-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.4-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.5-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.6-arm64
     - sha256:0f99c9165a5001cca2d5fe11c7fd480f7fc455928c43ebec1fdd2cac3cb811be
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.6
     - sha256:c9d002d72db46393ec127b4bb9310ad7c28d6cf3a5bfc0021c49d4a57e777e5a

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-sles15.7
     - sha256:61df82fee71721baadde459dbd5c976c47c97d30ada83f3c2d824ff73ceef5b2
   * -
       | doca3.2.0-25.10-1.2.8.0-2-sles15.7-amd64
     - sha256:9743405ec476c5f40c80b9ad822024d747ef75e0a007683ca5165656f06767bd
   * -
       | doca3.2.0-25.10-1.2.8.0-2-sles15.7-arm64
     - sha256:66c27a410c97199879f09652f1e7569de556f3e1996af10978ac6c84bc4912df


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
     - doca3.2.0-25.10-1.2.8.0-2

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu24.04-amd64
     - sha256:226cb0f80e1a83b4804ee41b594a4d8fd56eec930a8f0d5654920d641b01f299