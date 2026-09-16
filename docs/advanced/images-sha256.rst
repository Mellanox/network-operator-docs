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
     - v26.4.2-rc.4
     - sha256:612ad3ecc17f3ef19bc0154f117573f7faeb7d93b60f612ceb88288d85cc686d
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.2-rc.4
     - sha256:feb4051178e790e94872ef3db0ff36cf06fae6900d2afb05cbc478b47fd1cd45
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.2-rc.4
     - sha256:a8be239b616053ec9eb1f7e17d8ff372024cc81b1b2f3747419546ebc548006a
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.2-rc.4
     - sha256:52585c5a8ee686134e49930ebdc03f92e92869c5987953c29fb3ef2459d0f0b3
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.2-rc.4
     - sha256:0fa7f8d4a74c5f29f48d0ce3f6544166077bf68606fdd024ec9a92ee73dd5b93
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.2-rc.4
     - sha256:43e0da3fe8dbf7232c7058483db78d380aba2ce5681c34df8521e20a87345d8b
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.2-rc.4
     - sha256:394c96eb949a1bff249c322c6683fda49ddb0aa4a270d914254704fbbf44ba40
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.2-rc.4
     - sha256:728bc3212900cb254b285e6f335c7816edcc78236248a079a792c15ee95719a4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.2-rc.4
     - sha256:8d821f9b46a4935f6e5f1e60ed8c070cf1af21f5a6ffacc253b81abdabe7a32d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.2-rc.4
     - sha256:6ef3ba86b40d7b823bc200145bd0bd113f63355ee488b5fdf6815f9a0e880342
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.2-rc.4
     - sha256:0555b1afd92eadbda366df859c3b3b8c21f0b8ee83174b1adb62f090fd9a8cdc
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.2-rc.4
     - sha256:e5998a6a44e70c155f43a3d4b839756b0997cf8bb5489ec0cc245676a4096f65
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.2-rc.4
     - sha256:223df1db08b70114f15f6db3f46ec24d3aa40bd896868cd224aad47e467866d2
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.2-rc.4
     - sha256:57f189041d9202a4e624c15a550494b0092245f321ac81d5c5883f1198b77b3a
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.2-rc.4
     - sha256:30695fcb54a7cb0e6bae1b3f4a6385d1b7613ed2536f5f1907581f40c26dbd97
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.2-rc.4
     - sha256:40abbf5234819c44155dc9f7116172ac549b8950dc4a8a15d415ed65cdb191d8
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.2-rc.4
     - sha256:59d4e1d4ce39f1d216b1ecb9b18e7b3f0f85e16c42bca70ae25cb622b1489510
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.2-rc.4
     - sha256:75ca78853661dc2b4343f5bf85f24616d021f72ff072d033b7d07676c3ccb257
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.2-rc.4
     - sha256:e17232db22ac3dee7854bf9f40d0a6270b1df21cd325bfcbc0e376a41068fbc7
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.2-rc.4
     - sha256:c59cd04e6002b4d132a4fe619cdfd5dddccb980398356fd0b5a32a45671d9626
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.2-rc.4
     - sha256:6e145828b7d3eb1e7227bcbac19bc327af09fccccc41d3ca5c1ab386a6433254
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.2-rc.4
     - sha256:3b509da37a6059e43ee763c5d01f49d01c0fb3008766239b3acb06ed53f5f77c

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
     - doca3.4.1-26.04-1.1.0.0-3


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-5.15.0-191-generic-ubuntu22.04-amd64
     - sha256:0a3f974c5d0397e46cf0a3ac2b70dc1756d08885f86c306ee302fc9660c359ae
   * -
       | doca3.4.1-26.04-1.1.0.0-3-5.15.0-191-generic-ubuntu22.04-arm64
     - sha256:ec85ce58e0a8b8efb275316656aa3db16710c1743964fc2d0422da5d709a2a42
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1060-oracle-ubuntu22.04-amd64
     - sha256:c8c4a23ee6fb6188dc3ad9be754075f8bdeda431fc9c0d7fe4a66766b1e55e4e
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1060-oracle-ubuntu22.04-arm64
     - sha256:01db140b45f374ec5de51eb54aee75d4813bcf6dc8c8b4e1051997f43772b434
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1062-nvidia-ubuntu22.04-amd64
     - sha256:9c92d860f7856b1cd43a2873bf4100f6e14ff0167175b3113ea397fe4a6c81ab
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1062-nvidia-ubuntu22.04-arm64
     - sha256:25f8832f3569a78ef5e5e7c481f49d22a4741212d8aae2b6bb413d5540ffadec
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1063-aws-ubuntu22.04-amd64
     - sha256:9269f1d8666e70b86e2f396f208ae27f264b49ebc3b4a5fdcf156a9b0fa73beb
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1063-aws-ubuntu22.04-arm64
     - sha256:71acecf3de606f778d6808e3d42840ff2f34fb781846c9ed6afa6801ffad9684
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1065-azure-ubuntu22.04-amd64
     - sha256:9e75fd105c32dcb2a7c9d9bb8986856301f0f4f261b8fb151087f9f344f30a3d
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-1065-azure-ubuntu22.04-arm64
     - sha256:9841bd0c188fb1f1fbb83cfdc162d3e563d660066d3462d6d630cf6adb966747
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-139-generic-ubuntu24.04-amd64
     - sha256:932dca2af72fef4a69b34b6476e1b4f1f62941d2c77c6afaa8294508b923c541
   * -
       | doca3.4.1-26.04-1.1.0.0-3-6.8.0-139-generic-ubuntu24.04-arm64
     - sha256:b53107772bf569e6915a5e310990b93177a201c1ca4be1f4bc8f2d1c146cb535
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:3b903951216292b518b23b47dcbc34f055f2e17df50b9b2282a85c1f1eca8e3a
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:01bc6d7ab3dcf26cd38deecbc24f53d6a36570397495e280afef9ab7bd8ccf77
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:0d547d1170fd3c529eeb8cccffb1b49952833b916dede3e0c4be8d1c9cfe823e
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:33e4c1b832f79000f543a5a8e8fcf9cf8628638ddb5293fa14dd875675ee52b6
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1012-aws-ubuntu24.04-amd64
     - sha256:e509dc0a38dd3f8ace64d398e024465ec37307f7f4fe9d42b6cd2fc9de5bbd9a
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1012-aws-ubuntu24.04-arm64
     - sha256:f7302af6fd21dd8f9e0ad0ec3f54470af139e452b6767786f504f768c51ed41c
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:5198f7b447abfe599cfc4bbd8c40fa19df783d22daba9ee717627c7f6a2d2223
   * -
       | doca3.4.1-26.04-1.1.0.0-3-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:b50cab9fe5e809dc7321ea14d4907c441048179d1f7c2c98ccb90fb43a8f3445
   * -
       | doca3.4.1-26.04-1.1.0.0-3-ubuntu22.04-amd64
     - sha256:09a1bfe065e94cad58d935b8fa6c9953ffa8d85c8b6752f2c56186f295d3fd5e
   * -
       | doca3.4.1-26.04-1.1.0.0-3-ubuntu22.04-arm64
     - sha256:715d7c37a26dea29b6f81badefec43501e37007a1e5e31527ce33265bc053bca
   * -
       | doca3.4.1-26.04-1.1.0.0-3-ubuntu24.04-amd64
     - sha256:1857a9040926a8090c56c79035a3998cca54a579f50d7a34bc3ebda3fa01b5bd
   * -
       | doca3.4.1-26.04-1.1.0.0-3-ubuntu24.04-arm64
     - sha256:8f5f6ffee6f8c00e0badce3825e1e2088fa108f3f3c21648c431ce14bb85f69d

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.16-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.17-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.18-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.19-amd64
     - sha256:fbb5c074aa0916a4866a9cddafdef41344fbbea149dc766f52965a90292fbc58
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.16-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.17-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.18-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhcos4.19-arm64
     - sha256:cce0d6c406937383a43d5415bb11b5c590ba5fdf53d6b880a8537a31b2999e0a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel10.0-amd64
     - sha256:6654e9f5f1f4d7d494bbb5518d847700399761ac5b6742bb0406ab7e96e037c2
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel10.0-arm64
     - sha256:84b93232e0447d81b1c82377cfead1a8747c314037350f2e585bc73bf5e57ce2
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel10.2-amd64
     - sha256:659ef0dc6ab01db1be9c8b53db3dfb61363ed91c01acc94a220cd4adfbdc181a
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel10.2-arm64
     - sha256:ec218361e8fa3bfb04fb1df49e395ba33bc3aaf34f1536fe9c02a2aa20a08455
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.10-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.6-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.8-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.9-amd64
     - sha256:e09fca7b6e07879b91171d884ab6b25057587d71a9f4f011194f3eb541258fa8
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.10-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.6-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.8-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel8.9-arm64
     - sha256:6d8a5b9245058ffd38abeffd90bc4babd778d3c27b69f3328e078eb5e0f70fbf
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.0-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.2-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.3-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.4-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.5-amd64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.6-amd64
     - sha256:da1e0b1cc5f60718f7f60b10cfb03ec5ac97432095279f6c998c1425617645f7
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.0-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.2-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.3-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.4-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.5-arm64
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.6-arm64
     - sha256:d1527dee8745826d1b14e896c4f054f94ed85fb51b73eb10dfd1c61ea29d55ef
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.8-amd64
     - sha256:c585ed2129f988ad50746c715b9ab7d38938b9196381bdfa49dc51eef2e4786c
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.8-arm64
     - sha256:90780a5929eca6c22499d8446edfcf88f150aafb2c7330129d2fc11f026fb2a4

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-sles15.7-amd64
     - sha256:ad14f7dbd1a81c1876d6c4e3e8559a91f4acba74c34829f9ccec1c703447fa37
   * -
       | doca3.4.1-26.04-1.1.0.0-3-sles15.7-arm64
     - sha256:5329bd0bb6cf46cec8b1c3a55fa1fc520eb8ab12fcd09db4f19ba26dbd2878a9


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
     - doca3.4.1-26.04-1.1.0.0-3

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-ubuntu24.04-amd64
     - sha256:875cc2b13090f3eb0ce03b3b5d66c9bc645960cb18733f9711d71527dff012e7

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-3-rhel9.6-amd64
     - sha256:e714542a8e573730134e5546251e696a4798eff8569c55b1c37bd5708705bebe