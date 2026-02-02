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
     - v26.1.0-beta.5
     - sha256:cf98f1f4fae164ebaf73ccf36aa1c7e51928392339bad1620c12899d162fe633
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.5
     - sha256:1f8ae6643bda7ae2af9a77b2f5c9036b629532744961a5d06d9c5109e98c4fda
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:434168aaa0a5802e9c1236bd6b89962084dfb45ec96e6cac9d74f976d42d09e3
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.5
     - sha256:eb304f04b61157ee590b8b950e9d9791dad5d9736c21d433025b57650665086f
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.5
     - sha256:ff73d32d9857ed0c507df07e396b776324a9d83a6377789ca510a9911e223007
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.5
     - sha256:9f926de88e184c58c1135ba7a9c236388aee02828d895c626e213fb11615c162
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.5
     - sha256:86ff1328a2233cb7aa56563f095dcd7dea4974f252af8416ff1a89d0d6628082
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.5
     - sha256:ec76a6d47cef715caac96fb04ca81c938f9efab028d3cef510bd5149fe500370
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.5
     - sha256:f03998316d7f0f0b226e5bfc6e6ceb8decc95fa75f9e86355bf7e289deba8190
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.5
     - sha256:7fafec5d804814e349a7544f33706c77cea9c9618a74cc03a5684cdcfb28f5d8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:84c5f4b9d25831e3fd7dcee86e35c1c615fbe0e6d9c02d5b1ee98857e05f8312
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.5
     - sha256:f57370a9ff976ac041d58c2cc235c3081cb7391fc734a32c678cdcbab1b3d8f4
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.5
     - sha256:1c596cf05d390732255bcc3bd804742498ec4e627cb9a9141f3837662ebfbb2b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.5
     - sha256:3c6171a23c4c208204de9bb44c873c8af59bb67279ef1304d9b207bb2f15610c
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.5
     - sha256:4405c7779467c8a0c448003241be60790e1f3a01c639341f7655481276cf4ea8
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:1a28b7fa1c697b71352d6fe721dfb5d5d7d7fa7a4a7fada3f2309232316d7a2d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.5
     - sha256:e476e002c04a0272874579d84bdc2c9a6f27ccc633675e112468a99b7b95d682
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.5
     - sha256:8848706f0264d7607e2d8971722dd950935b4168ed57d7c738d06dee0952a3c3
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.5
     - sha256:22ded2a0922914ec8b921c5536b3ebe19c061ead65a1aa574ee02661815cbc98
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.5
     - sha256:22fbbe3e6fadd750d02da2e386991e5896082442b1e03444b8cd828c299ceaf2
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.5
     - sha256:559963ea45b56c23f2f1dc8d322c56a39983b1f9e8101397a76c97c6a68a7526

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
     - doca3.3.0-26.01-0.7.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-5.15.0-168-generic-ubuntu22.04-amd64
     - sha256:91fcafa8b33be7bfb6100f945c37a62ff667e755bfc99080801927691fcef8d7
   * -
       | doca3.3.0-26.01-0.7.1.0-0-5.15.0-168-generic-ubuntu22.04-arm64
     - sha256:d83b7fb306dc90d2bc51e1721a831d48b42aec728e1c29612c3d87c8c84d8e46
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:3ac0a8f6457d9c9cb1fc8a837f5d499979c5fe741f25417d5dd84f00f74fadce
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:85a19f8aee2cb37ded9934d30d4dbd8013282c80630959906ad84790041ea95e
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1004-nvidia-ubuntu24.04-amd64
     - sha256:98ebf398753327489afad42f953a8e8d78b29ed5af25cce493ac85ee5e87cab1
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1004-nvidia-ubuntu24.04-arm64
     - sha256:cb03ab5d668d7636485523ead1ddd06a5f615baea96706aa632a1777064f0bc3
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1004-oracle-ubuntu24.04-amd64
     - sha256:43c6d03557ba6f937dd576bfd8d350327dee4b348db8ac81a9ddd757f782938f
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1004-oracle-ubuntu24.04-arm64
     - sha256:1ff7bc5ec27409a2d0e1b048a7eea3faa7acf0f621b7ca09c34923d3295d51ad
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1005-aws-ubuntu24.04-amd64
     - sha256:2108eaffb39282a29df3f0365a91875f31239f25adbf944924beb843fc397f11
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.17.0-1005-aws-ubuntu24.04-arm64
     - sha256:7d89a5b872e95901aab81fa32534f92257dad72a912860d636756b0d5a7340dc
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1042-oracle-ubuntu22.04-amd64
     - sha256:9a77ee19ef8399a8e2cf526cd6b49e14d75c160fc98562f5a6d08a5e355eab06
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1042-oracle-ubuntu22.04-arm64
     - sha256:c3a1c33dcdaf137f692b46b39add60226b1fd9312d31e7c5dbe2e5af1332a05f
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-aws-ubuntu22.04-amd64
     - sha256:6ad87c68e440a4b6ac870ab4c1a4fa84b387b81af71d23e24e20820ded77c963
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-aws-ubuntu22.04-arm64
     - sha256:83e8510c45df869af73a823b95a87d313f5b2209c623df4feaf7774001321aa4
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:eb158c188c8bb69f4ba937f1629db86bdad2f1cc7eb38c955f44f54309794324
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:2e2e01a77f9a18d3ea1a6f3338e8faba075b6ea0f256cbb2b6f80674aed308d5
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-nvidia-ubuntu22.04-amd64
     - sha256:2255532cfe3e8aba1eb0b97a4f0fe2f9c4d04e7abf28436f51043c14b3a1e767
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-1044-nvidia-ubuntu22.04-arm64
     - sha256:9645f605679d4b2f0c723e609c2dde705601bca8a215d1aa43b24f49388b94d0
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-94-generic-ubuntu24.04-amd64
     - sha256:ac6c503bfbfa757c19da542a377bd8b328e1b670e2e5be2df452cf4bc920eb5f
   * -
       | doca3.3.0-26.01-0.7.1.0-0-6.8.0-94-generic-ubuntu24.04-arm64
     - sha256:0e8efa2a286ef5774b989d1d144a43762f1f17b8ab622f660a1d6434f02941db
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu22.04
     - sha256:51f17ac7aa9fa2b22fd64e8b2546bf22a608132985515643edc8a41d63bb6493
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu22.04-amd64
     - sha256:b2559508a42f6dfb6966e1c36d326f7bbfaf9c74cb7181d2999d03373bc1cb47
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu22.04-arm64
     - sha256:4c0e8f76255e48d07bf7101e27337e69dee52501d7ebf49438ea6a64ded813f5
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu24.04
     - sha256:ffdc38afeff234e98277f61e104832d87adeef6d3b10d52bc583744a6ec95166
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu24.04-amd64
     - sha256:bca990cdca66e92190effe52efa025020aed0d1f8b3bc307ea384d7d74a89360
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu24.04-arm64
     - sha256:a160e76743b2bc70a6a820daa44de17be341f9849861746f84073e121d92dc07

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.19-amd64
     - sha256:59c351e6538cf0efde11e2d018e7be91fbcf00daaf009d246646dba4f1858032
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.19-arm64
     - sha256:252d528b7cafe88e36f0c8ca059f66e76cd049a02260bb316d1139399c9dd204
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhcos4.19
     - sha256:87006eeb1c2b1a014e0e11c2c193259ee3c399b4a2f9fcc21b28578791db1690

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel10.0
     - sha256:2091914b6dba7cf638301567429a7ad027e0cc8dbd26c8fca81e2f8c5e984739
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel10.0-amd64
     - sha256:e0e1d0e4373300342e0e2601c67b614b1882a6f1336b3adab64ff07b109ea0b8
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel10.0-arm64
     - sha256:2fca3112951460b83926b02bb0caf6cd8b8dab065588a45016e6a6484f13a166
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.10
     - sha256:fc47c471ff50d31824be4a0874d3991d1caecd71f6f67086876cdc7f0b1eb3e4
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.9-amd64
     - sha256:dc993dde44344fd7f13382aa8dde2a05ce439a1488f6f2ceb3a41fd0199c6d1a
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel8.9-arm64
     - sha256:3e1d58ed665e49276a30ef3db8a245702e2ecd405cc80262e645df2538c3d290
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.6-amd64
     - sha256:cc4fa845cc40c2016c9c6900074e05ce613cda017470d748be611a2f7d0b8faa
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.6-arm64
     - sha256:3d6066885b4d96f35978bcf23b2be4563bf040938683d5964ff3e347892a00d3
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.6
     - sha256:143dd3b3b356e739c0fe094c2f0ae1f4fca261c9a2aa7d4c76e86ae3fb593c1e

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-sles15.7
     - sha256:8c3eae83dcf0e2c16f4a93d0595f5be9ca835ceb65e0a4456e6185370dfb54cf
   * -
       | doca3.3.0-26.01-0.7.1.0-0-sles15.7-amd64
     - sha256:6e9917485b8b4f0158434e0a18a77e6d112666e0617c6c9a207ce5fd35d37d08
   * -
       | doca3.3.0-26.01-0.7.1.0-0-sles15.7-arm64
     - sha256:633e6b5f83b3802d0f84e603b30c79a60e2331e300b89f2475bd626124f27acc


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
     - doca3.3.0-26.01-0.7.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-ubuntu24.04-amd64
     - sha256:ad9f1ce456f1c03ebfabccfa7da7ec0c2edb3d562ab09003c4142a3480cd6d25

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.7.1.0-0-rhel9.6-amd64
     - sha256:696d249abca1d9d1ada689d7541540444052cbcbce8c33a6559344749c3d3213