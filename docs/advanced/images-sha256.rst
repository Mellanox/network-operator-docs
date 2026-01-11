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
     - v26.1.0-beta.2
     - sha256:52b8e2763777cf4731bc33f4b285623ab7e14c839be4f63422b414f95e281a95
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.2
     - sha256:14352e8ff49bc847f31125d84086c6cef0f9ca9b2acc7f422722bbed77b358d1
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.2
     - sha256:210dbbabb9652f1afe71031a4e59ce117aa097e0574c6d0a667309263e89253b
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.2
     - sha256:61fb4b2045b8e3e63ebff9ac6d66abd166e85452ed97ad52b3f68515ef92b492
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.2
     - sha256:f1e024efbef0ab10e8c0056e92b0bb6b1b8a9a187d1a7ffd49bb320d81fae64d
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.2
     - sha256:03c1b6c999329a88e24c17e1c74c6b288163c136d157adbe2d2b517d9590b415
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.2
     - sha256:49798e27914713237d7ae56e2b3909076cc74c887586625ee46830f6f56e7c5c
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.2
     - sha256:86a248f6fc98f7bcc27c661d4d1e525b9655c56568873762c204d4cb7b5d6afe
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.2
     - sha256:dcf294698ad10cabdd886a4655cb09a6a93a61efca791b7ac074d604b5a22d1e
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.2
     - sha256:731514ebc3b441d844c2f516c7d99d24509c24637b816cee9b74c4efd3e3fe13
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.2
     - sha256:dd7382210a97861e64e0c764821742fe5fcb459832456346d6bb2151dba43a69
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.2
     - sha256:627706e940a13bd1195e2d7dbea60992a907738425d450c202a6f914a09e9921
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.2
     - sha256:111d51a8cb4d75f78a1a4f3604e414422b59bc683f5fbb496a292e5e4663ad9b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.2
     - sha256:218966cd1c25717f3213ce867fd5db894b837af3612e1fee816c656bfa5f3f78
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.2
     - sha256:d078fd5bdab9c62321f317763fbe3a1bc45b6a11787cd4dabe75d9405d46fc9f
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.2
     - sha256:4b396f2c4eb56f84fe46e199c03cb5926eb0c796181573af484c907ca87e61f3
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.2
     - sha256:c8d96b2fab9aca60aa37dbb448be3bfd6fee6019f84ef8ff9b422a3b4c7e6d29
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.2
     - sha256:9d3c0c05bf4e3807ca9ce572d321183be35356db05b2d5cab3332897e18cea91
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.2
     - sha256:19444ec8b178d6b59753be5a99b7bcfcf74d1c81239a4894a20264d47deabb1e
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.2
     - sha256:6732f59181e20d85c2ec1d407c571158ac76112025a7c16b719b4012360e09fe
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.2
     - sha256:679a02c78dbaf1a5b4c9c71cf2d4f412126d38f3fcf2539e0e5845b6a6832ca8

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
     - doca3.3.0-26.01-0.4.6.0-1


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-5.15.0-164-generic-ubuntu22.04-amd64
     - sha256:9bd232fd74609799eec95be2bb413d8ee1140722efee8ed09108a5f261902846
   * -
       | doca3.3.0-26.01-0.4.6.0-1-5.15.0-164-generic-ubuntu22.04-arm64
     - sha256:13500fbd2551406fffa642c528d016ec84eee750060258aa118b291207a1c562
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:6cbe865463e811dc19e7004cabb316ef7d93dfe6fd46c51ea6f316830fb53278
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:e5b4986a18f97cca68a3e3045c49891f9dd285407d412a647382c514fa4570df
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1018-aws-ubuntu24.04-amd64
     - sha256:cd257c5ee0512b4394ed03d4249064fbcb5c55689b2fa22c808ebc9be5beb413
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1018-aws-ubuntu24.04-arm64
     - sha256:e29d78445ae1f2255013b277dbad7043d7aac0a6b2cd5263c56f6233170455c4
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1018-oracle-ubuntu24.04-amd64
     - sha256:ffe9f7825059f694fba285c3bae216461b8aabaeed927dee7f9eef92b4a8546e
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.14.0-1018-oracle-ubuntu24.04-arm64
     - sha256:4bb31d2fbbe9c3e3c06332b717da1a198794999d9115d568650e1145f2efbd1e
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.17.0-1004-nvidia-ubuntu24.04-amd64
     - sha256:5f02eb39c366e804151503eff76af833e778a85329070ea1b8828734d9ee6853
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.17.0-1004-nvidia-ubuntu24.04-arm64
     - sha256:d4270fb31a865a78e75e15b475be27738a12eb080e2a75c0953f15dd5283e7f9
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1041-oracle-ubuntu22.04-amd64
     - sha256:98fb33f19d8ab0dba94b3de1cadbc7c2f76cd98d5394b56650bc0b0bcb34d954
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1041-oracle-ubuntu22.04-arm64
     - sha256:2fdbce6af486d1a988edae55b7f621854c75ef172fcaaabe0b21ef1b7a696465
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-aws-ubuntu22.04-amd64
     - sha256:265a33a4c4c6332281427cab850c3813f56026257027740085e8f2bd4c09565c
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-aws-ubuntu22.04-arm64
     - sha256:cab27946f93ec8d722a5129a881ce630119bc10c6b614b57074c5b8cea3684c6
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:cd4c469b594c95a09f1e33e8bc905342f8a1b278a281a7300c1a8a7f57221876
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:91d9d6c605615677875528cd7c52c8a893386cbac28979b59baa45cb2cabc33b
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-nvidia-ubuntu22.04-amd64
     - sha256:7272258254eca5280de6c07355fa03d081f357c11f8005972d3c7e0190e27b36
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-1044-nvidia-ubuntu22.04-arm64
     - sha256:9ce3cfb072e2dc88b4d808943f381ba078dc3dfd2116ce196ba8208704e87c02
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-90-generic-ubuntu24.04-amd64
     - sha256:55358bd2172ad87f88984dfc52cc9a5cd09fb7b7669fb117121ca8a37517f332
   * -
       | doca3.3.0-26.01-0.4.6.0-1-6.8.0-90-generic-ubuntu24.04-arm64
     - sha256:75b31aa96bacd2546f6e3bb22887bef95fe708caed7fd616a7112858b33bab48
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu22.04
     - sha256:445e28e1302ab3202c036656da935f537cec7ce906e5090705cf54619f3660d5
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu22.04-amd64
     - sha256:5047e87780cc70b484f5466f8bca86ec69259f096b3869e75159cc6da4d6d6bb
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu22.04-arm64
     - sha256:15dc85d070f5631451fad2b2ee4c4afcdd4cb5fe2efe3216bc83e7edefd873d3
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu24.04
     - sha256:88eb4effe01cfd5699939f20b6e7f1ce9104dc58fbe9f5a9015586cb93fa55ea
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu24.04-amd64
     - sha256:0ff57d5d2067470097b25e30318acdcf82263bf90556c3f900c413afe8f13712
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu24.04-arm64
     - sha256:40a3b16acd70f2812675c6feafa10967e5cf3f5af183d6f8bad56f5694b27535

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.16-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.17-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.18-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.19-amd64
     - sha256:660e9ebd235e7f8b3408ff9d58d0cdec80c3fb3b1f69600a22c8b963ed5d4bc0
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.16-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.17-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.18-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.19-arm64
     - sha256:737ab204700644a0c875f010503ebb3b1b0e5f3f18e4728509e08550d3fb5705
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhcos4.19
     - sha256:92015318b0d457e689f350309b457b6e774ee2c4ab7c4eb531c9ce98bdea5198

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel10.0
     - sha256:dd393f1a352f9e14be014b02bc5303892a4adf4d782052116c66550a710b62a2
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel10.0-amd64
     - sha256:b58cecda6964240ddd19a565348fe36644ff6ccea7595efb137e9472f980f5d4
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel10.0-arm64
     - sha256:97285784505b9d6d73502b136a2db4ed086eb071f3eafbc1b3ffd2e07c63f327
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.10
     - sha256:d0ff159caef4b7d2fb8e08064bb98128aabd5d5368e94e51e40b7e0f3043b216
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.10-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.6-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.8-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.9-amd64
     - sha256:a9928f04a3788748d038bca521a04703ec2f2307991a2a7ecb3eb9ea5bc6aa53
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.10-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.6-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.8-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel8.9-arm64
     - sha256:af7098d9eb0b40d4159c95539d2f730f1eecafbfe0bc213e5fc9348f322695a6
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.0-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.2-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.3-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.4-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.5-amd64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.6-amd64
     - sha256:2cdbd30363348aba59597093617d2ea4764be0c0cef8faade1e90ac8f26d0679
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.0-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.2-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.3-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.4-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.5-arm64
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.6-arm64
     - sha256:29f10b1bf688c3ce6860f9ec11d3450f43ba2ee182e61076499bc5de43350622
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.6
     - sha256:d87bc5fabf9434ca58bd7562fb8808942cd013c902593a26292865bfeb1ec87f

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-sles15.7
     - sha256:227cbdf0e7522f1fa0e90caa366120178df896991db6ff4a00e833956900d19b
   * -
       | doca3.3.0-26.01-0.4.6.0-1-sles15.7-amd64
     - sha256:0e65f66733110234d8b4e321091bc0c3606a24e92f0616a3de98625d3b7a14fc
   * -
       | doca3.3.0-26.01-0.4.6.0-1-sles15.7-arm64
     - sha256:bbbe48a6e2951941fba1039c137a6bf54dcb1f8f41e8de4b67b6bbf1b32a3bfb


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
     - doca3.3.0-26.01-0.4.6.0-1

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-ubuntu24.04-amd64
     - sha256:99eb0a18d5621656bf2d2eff17d298573950161781692c2604054861d26936d1

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.4.6.0-1-rhel9.6-amd64
     - sha256:0ab32f793725396fa5b60f99df5a8d4baad04855bea612b26946298259367e9b