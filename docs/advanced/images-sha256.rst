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
     - v25.7.0-beta.2
     - sha256:e1cb85354fa339e863e4a5868d1b38475b380bbc19a6cbfeaa6bcfce50e11590
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0-beta.2
     - sha256:939930c4e99230a740b31fc7e4adf3d7e5b90f4a94169b9da4c3994dc8137816
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:f69523e7e0f6f1cf5a8d18c4ebae83229f9c45373ed206f50926250672e8c6af
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0-beta.2
     - sha256:c410b334baeb1e781767b60b82b9b33a2ac1b1df584ab2c350d8a0ae5497e71b
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.7.0-beta.2
     - sha256:3343112f345b8caa0f7aa29906cb3a0e5b290e737f18bd19fcd2d32cba903ecc
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0-beta.2
     - sha256:a132150417d1c857e86418456af05d70deb7d4d828184013c064fd436cacbb82
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0-beta.2
     - sha256:64547422659625aefbd85aa59944812dca49e5ef8428656bdb48dfbf6b33a628
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0-beta.2
     - sha256:c949e2f8df549cd90b91983130d7e5787b8eb739afd1c91db0d3f0e1b43e494f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0-beta.2
     - sha256:340e44869255aaca470e21170fe385a1c954ce65409027a13c3c87aaf7a23c78
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0-beta.2
     - sha256:f115a0cc165a26ef784ed0e767fb96ad225b28a365665eb3b069b8b5fda195cc
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:b2aa75e4533f2c2cc65c66c828d874e2d349ea120cdee99e6f994aee26613d8a
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.7.0-beta.2
     - sha256:cad7b91d2e59c7d0b49ec6c1f430697e6848f2d828a002c66f49e26aa1a102ac
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0-beta.2
     - sha256:35032a8a6195dcb6e4e01f8f1c82405aedde1a07386fc746c3048f463e9b1b5b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.7.0-beta.2
     - sha256:226d1274c503c47473fb310c4ef2bf029be6d8c9b21f5a9f17a9c335d49e2020
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.7.0-beta.2
     - sha256:80234d240000c7d839a661dc902ee6c0a65743cafc93f68cc36d01796b0f7fad
   * - nvcr.io/nvstaging/mellanox
     - whereabouts
     - network-operator-v25.7.0-beta.2
     - sha256:ab4289c5bda987ca2eee10cbc7d35247cb13ed8487f9972dd95b0d00c3f617a9
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:cd4c3bc9bb0ede3bed71026edbef2aadbfea97a90b156f9260e00e13ae8d9c55
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.7.0-beta.2
     - sha256:bd62b733910c005d2d49207ae10e90c68b927b5804d82918bf58dd7fa82e62d9
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v1.0.3
     - sha256:353ab27f5f5fba08197cbe8968222e1c115431cc1b9b8d8445f1facb3c3c4d7b
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v1.0.3
     - sha256:0e8478898e0b30aec13030b11081b205308666c2a9c5c5bf2c00121079901b41
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.7.0-beta.2
     - sha256:70c5725a2f99c3c9318477e00b1dfcd9b13c885bede3ad680bdc95f73a7b8ac9
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0-beta.2
     - sha256:b01b62f7c899d2679d8912923397390c8b95a7cbe407e28a3936f012d439373c

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
     - doca3.1.0-25.07-0.6.6.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.6.6.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:84d42c58064425a14393d3b44fadebe74c982f78df9f4fdb89de1112986b1f87
   * -
       | doca3.1.0-25.07-0.6.6.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:63ddc9222dde074e07bc4acc6dff78dc662a3fbbbf6ba9fd7198621eef884da2
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.11.0-1017-azure-ubuntu24.04-amd64
     - sha256:73bfde56395db35bcb83d1496237e49b4b7e92d2e8cfacdb63c77ec4b7254114
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.11.0-1017-azure-ubuntu24.04-arm64
     - sha256:3aadb49aeb262d404ade3fe5f5655bf393abd7d59b027e20a3bb0492e05568de
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-aws-ubuntu24.04-amd64
     - sha256:948739af6e9c4959b91c43666a51af0f593fc3ca1429ce18bde4df49a6179416
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-aws-ubuntu24.04-arm64
     - sha256:c171891d69b13678d23276eec51790a77faaeaf87ce8170b3cf6d3afef66a807
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-nvidia-ubuntu24.04-amd64
     - sha256:48ec01b0da85bba1a29f705a1454ee36854935c9d8f179d580fae92f40909461
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-nvidia-ubuntu24.04-arm64
     - sha256:ec4b12c5f23566dae10877f28a25424fad71794fd686ccb6023bdd95c43aa18e
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-oracle-ubuntu24.04-amd64
     - sha256:c9b51bf8036c67a5cd1739a433c25c857d49833f6dd52838e1b3381ece6ff4df
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.14.0-1007-oracle-ubuntu24.04-arm64
     - sha256:b907af0206fa0815f9fdc9996b6a6fc3cb5539349c32f8631ea6a776f73d51a1
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1028-oracle-ubuntu22.04-amd64
     - sha256:33d9a03e0b3f9446cbfc8ab883db08c93e8bfa4bb9d5e36c2be313a90c39c19c
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1028-oracle-ubuntu22.04-arm64
     - sha256:77c4c04f6e0a0ca98f41ee8ac908daecdf0801ade991be64cbd6cce57a52e205
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1030-azure-ubuntu22.04-amd64
     - sha256:adfa5626c4c955100bfc5e66ca0d809058abc94d1f6d7f8fd97afd823a21fa76
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1030-azure-ubuntu22.04-arm64
     - sha256:876d2b29d28773187c705f6e454985fe654656909aebd3b26ef0870ea8c5d078
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1030-nvidia-ubuntu22.04-amd64
     - sha256:759212f0f386dddd76a5afd467558f506f17a31a613eb6bf2e555e36a07239f4
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1030-nvidia-ubuntu22.04-arm64
     - sha256:8aff6045f4c42150b450a3ddd68156cd4da9d97a393a0a0b7d1029bd74ef151c
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1031-aws-ubuntu22.04-amd64
     - sha256:2ef3ca04ab7fbf5c9e52620e4c9ddddcfa74227d030e528c698e7dfbec4218b1
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-1031-aws-ubuntu22.04-arm64
     - sha256:4a8e7a5ab06af904140ea0a9e9be75d466660891a958f39dac66e72c13aad67e
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:493cb7637d9fcb33c1a5253caa665cad42c91e8340ed4fc96b5fd4992f0da276
   * -
       | doca3.1.0-25.07-0.6.6.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:05b3c6c194b4bac536860bfc4aaf9527052389fdb6909348a6dcf158e49fe7b4
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu22.04
     - sha256:b07c8898db054c6d450fbbfc46b11c3aa78d45befd1f3e900554364efcce2ccc
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu22.04-amd64
     - sha256:b13659bdcf7ab532e2ec6b152a62fb0b7d7f6f2dc6f126aa01c4f0627c1bb8e7
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu22.04-arm64
     - sha256:8b6fe43b9041223c0292e4807a09e822c7023035083bbf09b7af7b1875da906e
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu24.04
     - sha256:42795c26c284dcc358ffcd637d503bdc24bbfcbbe6f8a7d274f633db0551053f
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu24.04-amd64
     - sha256:a981e14e54452b20fa416dcf15341ff8c159a6f12fdd41f038ede080b0d1a56c
   * -
       | doca3.1.0-25.07-0.6.6.0-0-ubuntu24.04-arm64
     - sha256:aa24b700deb1c83e6b9955046c5becef50b64d23707109f285c4cb91c631c573

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.16-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.17-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.18-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.19-amd64
     - sha256:6c59b549f3e4fd35b1e9a630154d5d7806dc2f6e749a4ff57178e0e883335009
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.16-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.17-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.18-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.19-arm64
     - sha256:d3ca4b572791fd5b10576176d2e6c8680b98cee5d4ae80d24502112a3f6b1e9d
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhcos4.19
     - sha256:95f528a494e188c8255aa158ad959f1c409ccded8434533f8f7e798eecf7238b

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.10
     - sha256:13590c7cdb43e4bc9a2ad30963d66efa2a95d374403d1b732a47948e687675a3
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.10-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.6-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.8-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.9-amd64
     - sha256:abb483f87628c688829d43c7cb1bc791736dccfdfef8125cd301708043572f18
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.10-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.6-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.8-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel8.9-arm64
     - sha256:ebaaaa1d9da41e3c829273a6ce7285888b0b6a08075be5b2d2d1c5216850ffb0
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.0-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.2-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.3-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.4-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.5-amd64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.6-amd64
     - sha256:d1331a02ba39f22922a88a53bb029683743e9dbf9a5229fdb0ff4d8c091c2de9
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.0-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.2-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.3-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.4-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.5-arm64
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.6-arm64
     - sha256:beb609b9fdb1e409532288c59563efe30ef1c244739235e6d16c04f76bb0dcd8
   * -
       | doca3.1.0-25.07-0.6.6.0-0-rhel9.6
     - sha256:0a9a8bd3658dd6302adde1aa8bc80a6a0d47505d00d6f597d5e484722920ac73

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.6.6.0-0-sles15.6
     - sha256:3aeabe8718eb2e91ae7d4f6d23d087316f1bc1b5c8fdcb03452a23ac66936dc4
   * -
       | doca3.1.0-25.07-0.6.6.0-0-sles15.6-amd64
     - sha256:0f9736cdf8378f8ef84d1ee02b42d8f42462f3107d1dfd60bee1abbd9fa16f45
   * -
       | doca3.1.0-25.07-0.6.6.0-0-sles15.6-arm64
     - sha256:e4fdea1e2131f70b914a28b5178b4029c26229fe43916452bbbd0e69ded0ffea