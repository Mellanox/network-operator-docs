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
     - v26.1.0-beta.1
     - sha256:a3d8e4bd1de7d3fe43f05ded0333f7688fd1c9308dac790da6291b5e8bdea1f9
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.1
     - sha256:7344da54e7fdcbf82ed67ca05d0171389ed2d9b5bb9b3f6d0a8665128294f485
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.1
     - sha256:2eee7ecd2058fde3b8649b0ea380928c961c1ba1eaf96a7f49c48f4723da71cb
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.1
     - sha256:b1d2849bbe2b2bbeb2863dd949d3e240f04b744a00f198e33fc187cd10547a8d
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.1
     - sha256:5ad2d3ef3321cbc91715daf701e679f970f4a050bc4f80af31ced882413357dc
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.1
     - sha256:0defbe6c633bdaa86877b3f44bb291aae6740bad19c40df277d265770e8b216c
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.1
     - sha256:6462cfbfd21e9e1d1dc267cd71b9c1a544f4ee159b87c9c999f9775dc2a7fd15
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.1
     - sha256:3b3225bc749571966a195032c5030e08f448f449d7b453fc1a447fc45372d224
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.1
     - sha256:38cb329e6e3fad54dbc1fff84380e1b05ff032ac49aa384ddc277da331e07ae2
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.1
     - sha256:6822733d30d7c9249ae34ad9b030262cfa828a0754b10c9888ed9507e6c53c2a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.1
     - sha256:02a3dd86b1c36b8f558c1730cebd36e44b1ad79bdff5f2496fe02b3fe6b18d6d
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.1
     - sha256:33874a731afe7e10e23fce0c5d064e6663057c46ebf341b753de5849654983d6
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.1
     - sha256:43a1aa014427842fee6be096e40c9a2a241cf60c080f80e7d578fd3770e4ec21
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.1
     - sha256:d4adf5d11c22edf5d39c1180b6c61e21227bf010c0d49a96de94a40b82252f68
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.1
     - sha256:ae91ef8da0936964c7c98c1c9d34a133c70732f678170be2e7d8c494bbdc75e6
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.1
     - sha256:6c35c5be70ffc5c9861e89280306bda54bccc0769f42388a6b61f90a33a3e565
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.1
     - sha256:5d0ac18f9c2e106ddc4e1a1eac02ee15c12a7d7e64581d6e1e0ef1b02c943823
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.1
     - sha256:604a81b409db630c0af6b30ccbdcbba4c52585ffcf0f61081ef6d4955b00f782
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.1
     - sha256:b8ad2ce17ee6d44c324403662351ae98d462de758a647ffb2630c013a3df4f82
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.1
     - sha256:dc2acd291021acbe6ed763107121152f2b9633c61b05b9b034ad02c57ad6c314
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.1
     - sha256:d87d1b87cd3f45fc41ef656bae037110ef2d5435bf9076a33392b4764331a563

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
     - sha256:00372cede0a8d09cf56322d24d68dce52712a9af113a48f9ce2dd375fbabac9b