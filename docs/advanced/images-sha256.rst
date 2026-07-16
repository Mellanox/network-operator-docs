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
     - v26.1.2-rc.4
     - sha256:7a9bf1049880bcd53b97b8a9879cbb1cbaa9abe48d67a955e9554071f6632859
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.2-rc.4
     - sha256:5e2eb1f6ffe19a9807448f3fd1a0435a818cce4c2abcfbb744c3ef1c9538abc2
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.2-rc.4
     - sha256:1673011d8e8db85eee956075621d5182ee27590871b0c1f9e1899b8617b89b97
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.2-rc.4
     - sha256:86731b82d82cdc09e9a0a9f0a28a9450347ec6abcbe2a276eb6c366445c8d7e2
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.2-rc.4
     - sha256:eeb6217aceb235fe525106539242532a21e8d7c38a5a56034e0dedfdb448a762
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.2-rc.4
     - sha256:9009151a12cedcfeeaf8eeb7943ce27658320c805b9d0bffe09709b6cecd6779
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.2-rc.4
     - sha256:4e6f3e7e7f43c04b290ac35adaef4418f4ce475ed41aed842bd0e9a052388591
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.2-rc.4
     - sha256:e8b65949fa2341fb2ef068ba1d48461bc85ad0fa13ba0ebbabedbde5cbe019d8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.2-rc.4
     - sha256:4b976ed7b12436c8c9c2ab5c895e058d6b84756a7d5158ba41e9ee8306cf8795
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.2-rc.4
     - sha256:7ad94b248f59a96d60359fbee6356e5793b39ca525d7454c4b5a0a1968f78b29
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.2-rc.4
     - sha256:1224fca01298c34f5770de2887552090bd19d36fc1f848e55acb912fb6753e9c
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.2-rc.4
     - sha256:cd93aa891895ec7c5cdaf9d0fafb6c1753700074a5699817c6555e46914d4c66
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.2-rc.4
     - sha256:ccde2bf68541051274309d0d9921e21b1f74631cbcabebbbd9ae85ef9368bb96
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.2-rc.4
     - sha256:6cd9be33e951996776ad70f2db715114ff710da9e64c2a6c4bf1ebdb99841c26
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.2-rc.4
     - sha256:7296f79e9039b2ccfe822d1c42d27709bd5d2723cb43e2f2c0e836187298e319
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.2-rc.4
     - sha256:2aaed38c914ea0c6e75ec0e44fde46d64c49a377ada6b69c05c8dc60a595c483
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.2-rc.4
     - sha256:6ec8108340f865f0d71ec3894f0e83c242593aaf205272b9f5b4bd8c7cdb7794
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.2-rc.4
     - sha256:a95519169390cfc2520eb125294e0c704938fa8d623f3fd813717c8ffbb737a0
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.2-rc.4
     - sha256:49d94fb9107678ef49c8e230028cd0b4d424797c4513473f1d20838962c275d2
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.2-rc.4
     - sha256:0c26b1c95cb6e8c9eae3a8930e4022f5331cceaab01105557ebf197a9714f9d2
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.2-rc.4
     - sha256:f49edc01404ab4ef2d016924c270319035e1dc73a35f6dcd50b24cf210787419

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
     - doca3.3.0-26.01-1.0.0.0-6


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-5.15.0-185-generic-ubuntu22.04-amd64
     - sha256:1787308ee5761370674088443294bc79c7fcdf92806d0a2b41bd45a94e84a3e8
   * -
       | doca3.3.0-26.01-1.0.0.0-6-5.15.0-185-generic-ubuntu22.04-arm64
     - sha256:13a327c21ba8abe5e8f39b9304f440a4ce6344524cafd356fdc0173ccb7f1895
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:e5c398f754578221b8a71f1ee80b2b2933ea11f1f3f267cd6e317be814078b36
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:c0745d5d3364813cdde3ce19b7c7fe2da01c37b7066ca71af997cd971fe0b367
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1057-oracle-ubuntu22.04-amd64
     - sha256:4aa900cd3bbe9eff6df12c2fbfb55a96e3c434f56d6b4caeaf0827bb1b45fffa
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1057-oracle-ubuntu22.04-arm64
     - sha256:d637fca036288ff21ace0c4345b17323b15a4b88ab0913bcf01c63cf3c191868
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1058-nvidia-ubuntu22.04-amd64
     - sha256:4abbe5babc99755dc5ac7cf31446c8a134575815b27594170a100c5c4745286f
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1058-nvidia-ubuntu22.04-arm64
     - sha256:cb96e4de70bbcb4ecc77e803b8a0d2f4b290e8a1fa44c181daab9e10f3ef552e
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:91fe3140b3d429cae8227ed8e8c09842031f3a44151cc028b6432a30f88a0033
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:bf99e07d46a264b64123b974693ef7150c9680076b79c32152d9d7919a8bf2df
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1062-azure-ubuntu22.04-amd64
     - sha256:d875b88ab885d216de7ca491abf3e71a82c9b70b6d6c696ae6256df1f7060672
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-1062-azure-ubuntu22.04-arm64
     - sha256:41777d7f3c65309b79daf8b88b556ce012538085e47aaed76b2b5e9745e5c07f
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-134-generic-ubuntu24.04-amd64
     - sha256:fd411f416768ebbce14376ee5070ae4ea82582cdf50deb5a8496377f47d3fa8b
   * -
       | doca3.3.0-26.01-1.0.0.0-6-6.8.0-134-generic-ubuntu24.04-arm64
     - sha256:a0dc05ae932859c4470fd793c5ff6282669f75252ccc1821cbec3719fd613d36
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu22.04
     - sha256:a090f2568f1f8aaa1dce50d67f6d78838dae6dd976881919124e30a63c0f7199
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu22.04-amd64
     - sha256:fcd7b5967627aab886931df27dd414bd6a8229608e473784ec3f80ba2d7a5cda
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu22.04-arm64
     - sha256:cd6b5c59bcd899142ed8e948d6212d4b77faf66dc5fd769ba8a31dbb4ed13f6d
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu24.04
     - sha256:c59a2ce4c7879df829e3822cc9d113c5c34b35b469c58d6b009808571136ff7c
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu24.04-amd64
     - sha256:df0557e26534056c0e8cb21ad609e7e2d780165110760b60b6bedcecfb4a21dc
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu24.04-arm64
     - sha256:bf6fcbf87c356aaa0cbc9bfef5e24ebe2dc6768925816ac3341b870c656c27c3

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.16-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.18-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.19-amd64
     - sha256:5560fbc50b4e1643987e8d60006cfbc566bcf59820fa932af335be9a24d02dc6
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.16-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.18-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.19-arm64
     - sha256:dd4c1e07b8ca2eaa8c850bb087d7cec9bab901316bf7bb06e9b9968228aacb06
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhcos4.19
     - sha256:3eec41fa168e19ca11f269b50f0c0bb487f96bca9920d424e299d37017a15a62

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel10.0
     - sha256:73a1ded8cc3411203b42ea16ee57446206f8e430e1574d66df90d0271c0fa289
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel10.0-amd64
     - sha256:513e7acb27c72f7ae129aafc5d6d299aa87175f3ead9f365a4935ff3b75238a3
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel10.0-arm64
     - sha256:c33fcc0306f97ae65066c2bc828ddd6893251eff3df41bf99d0be6e98439f657
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.10
     - sha256:91633f6fc405b981bb822db7a5cbe30bbd498cbe23bf99748279b11fd7850e5a
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.10-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.6-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.8-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.9-amd64
     - sha256:0f12fc8ef086443b46ff42c803ffbc38e89532db70a522ec3f5077bbef474443
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.10-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.6-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.8-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel8.9-arm64
     - sha256:3350c92d7d7622bc044f302d56ad44a1109d8f01db58a0886b91e4bf1f170689
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.0-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.2-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.3-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.5-amd64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.6-amd64
     - sha256:7ca241f7395b15f637e68f815e1ea97c6fdfae4701f0099cb948f77556b367f1
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.0-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.2-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.3-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.5-arm64
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.6-arm64
     - sha256:7e0af3a3ebeccfdc6d85775ed804190bff4f2999dff9474895629cd83c2e47a0
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.6
     - sha256:1b937c17af9cd3a89eefaa7c61d283fd9c4e238ed748479172b422b9a0a6a174

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-sles15.7
     - sha256:1ee12fcd84e51b7deb70071a2a89ea203e3dfe18d76ed8613a74a42a8eb9fa04
   * -
       | doca3.3.0-26.01-1.0.0.0-6-sles15.7-amd64
     - sha256:7085e1dfb1bf6ce475803dceeb3357376f2d50eb9fc28396fab24e41738d7f8b
   * -
       | doca3.3.0-26.01-1.0.0.0-6-sles15.7-arm64
     - sha256:1beaa5f6b1d6cd767aa8076065ae0a1054dd54ae7ba425858f58e609882b9b32


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
     - doca3.3.0-26.01-1.0.0.0-6

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-ubuntu24.04-amd64
     - sha256:e1a4cc8931ba8ba9764ed43895a977767837a2bc6996583ac86dcda92c181522

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-6-rhel9.6-amd64
     - sha256:95b216b6b3b866402122907832c7b9dcf1cc7c8e3fed7785f8a981640574fe26