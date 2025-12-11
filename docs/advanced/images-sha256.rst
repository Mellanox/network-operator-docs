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
     - v25.10.0
     - sha256:8d3a075b6672c8375b33a84773027047a290f57f88903fd8040d87a36e8fdcae
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0
     - sha256:8990b7fabb164d5c369964bca8bd0424acd6227d2cc8f0cbfc23b2e3cc732c8b
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0
     - sha256:78f01edc4cc6f5f1282b5e4bf0a0d0291ee97c1bdb372616daa5367e1070269e
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0
     - sha256:da161f6694fb5134948e8ffc47ebc556c8fdbdb4cb83be1dc6c9a2276b671c03
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v25.10.0
     - sha256:8567594bb1570383f5b68c9e9ce814bc34dd0f1d8df60a89c44105cf476a8ff0
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0
     - sha256:f3618a6bf879057dd3e63ae0bef5bad3fecc5f5548430cf5aa8745287c71e063
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0
     - sha256:7573a7a063ee4bfbaa5b8e3517e655da5fa5472e2c9bf96a4d45469718416531
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0
     - sha256:9176748070a760485f300a428bcd70411ab9c0472088ff7650a0f30a70130dda
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0
     - sha256:3643963e1257467078ecf5e3aa6b52c21e0a65c0b6976f5d060693e2ee941eee
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0
     - sha256:1a2ea145ce4c1a9df7c29ddfa3899bc4a89ae00f74d59fa4a48fb1e25ca81563
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0
     - sha256:16230372aa23ae025f7b5fa5ac092bbf58c8040bf66e162f7977469ba7322bcc
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v25.10.0
     - sha256:709c4db39ffaf02250fc3ec2920e9c3714e8f6a942693f769b1b45b6f43dfa4e
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0
     - sha256:5eceefa0522213dc58b7b73ee5d02a538c78405f36a86f070bdf1438d01126e3
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v25.10.0
     - sha256:d37a11d7ba9b3e9b2a2fd6faf5bc717ca6f0e6202659a7137a8fcf231cc17b9e
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v25.10.0
     - sha256:b78a227bba45163f7bebd3b67c6f67aa55fabf9cdfe0d6ac2f75e0ae9da23e05
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0
     - sha256:e3390b9aa40d1a703d6768bd4256a30c24e8ffb42d479a8eb4c3e3f122e198c0
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v25.10.0
     - sha256:5eeda9882d9ad4e7ed23a9dd82e0f9ba90caf858a8efef6299ed0fd114cb59a0
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0
     - sha256:25fbecba5fa2c588007c85fbffdedf4b734c36774824da1598ab063e0e9a9685
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0
     - sha256:efef0cd39324058f23cfeda561d4c23063f260905c35a0a29d5a246bec091341
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v25.10.0
     - sha256:9f6d1db428f3d3c5e009158a4db9f403d5d1bbf7678491aeaefdfb6f750b9b77
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0
     - sha256:d806c8913833596c53344601e77620ce441afe164968b6c6626b6a715031515a

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
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu22.04-amd64
     - sha256:e41147df25c09628840e1925da97d6ba04b348b7855c05f79add3dc99573eadd
   * -
       | doca3.2.0-25.10-1.2.8.0-2-ubuntu22.04-arm64
     - sha256:1942c2ba5d3c74e0c5d9df833ffa31f605dfcf6f76959d59df274cf81d61890b
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
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.17-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.18-amd64
     - sha256:327f4396b63cc6d6694a3272f48758e3bc415b477919d36f3ff8b5e4b0c322eb
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.17-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhcos4.18-arm64
     - sha256:54606f3cde8fe47e5399347661d58954889a7712f7b35c505b949a313d5f7dfe

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel10.0-amd64
     - sha256:bca54e10732c1a617cc9cc2ded9b83372593963559ba72a54c499d39a143fcb0
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel10.0-arm64
     - sha256:8f6a0c704e40e383079a7d9fd6b06d60af168e3ebf3cb98175f952a3c404a9a8
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.10-amd64
     - sha256:2ba90699f70a848488bf520afd03283e515c73daef431618256920d685957d4c
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel8.10-arm64
     - sha256:4015c620d07b169462d726dee926616faf0d20b4331a1922bade079efd8427b5
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.4-amd64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.6-amd64
     - sha256:c6c0ef891b8dd381c002976b202ffe1c8d7d35710d812dbc3d31151a913b3fd4
   * -
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.4-arm64
       | doca3.2.0-25.10-1.2.8.0-2-rhel9.6-arm64
     - sha256:0f99c9165a5001cca2d5fe11c7fd480f7fc455928c43ebec1fdd2cac3cb811be

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
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
   * - nvcr.io/nvidia/mellanox
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
     - sha256:445f9a8a09123de5e5a0ec6b23e98a3830a2246bda65c0e42f5c2e26111cd2f9