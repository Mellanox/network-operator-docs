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
     - v26.7.0-rc.2
     - sha256:291861b4a06f45b5e08fa1cd97f6fc691d96a518a7934661665569a5c833c5ec
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-rc.2
     - sha256:86bad106eb165413a6c856a009f7fd1d4e8566a74eb24b253606e247afb1678a
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-rc.2
     - sha256:eb8ffd745fafd37d07688dc442b356633bc7d091bd87743bc9e6907bae5396da
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-rc.2
     - sha256:37a1d0ccfa5c6392d86210904b348519a0032a04853fec07c4d8417436e469bb
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-rc.2
     - sha256:e2c6ed08264c35ece8100f28662295056c7a22b33f744ac6b597d9a54fb406e5
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-rc.2
     - sha256:a5040ead85992ef2ea84f060dd34e6fb6010fcd89ef56779e2e0fa945b577a74
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-rc.2
     - sha256:ea8d91fcc41f5a4ae9a9ec687b755ebc4c03936552c1fa97a68dc6098159972a
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-rc.2
     - sha256:48008aa99004a43f82bc7124609c39f038f38cb824a2ab03af1fdc1131a85b82
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-rc.2
     - sha256:5d8d3a0e8818338bf9b67ce32437caab8316810f04c46170e2ce422859eb2810
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-rc.2
     - sha256:aebb7b204d2da143c4141d491cdc9fa3746f7a102302e1c7aa36b02182e5f2fc
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-rc.2
     - sha256:9d6446d5e0ebdac463397bf5e12a6de7d954086eab1c2acc7133ff14ea729592
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-rc.2
     - sha256:e0bbdc7e7c7abd5e05bb466a4eaeb319736bbbe91500ad24dea58de1ac650fd5
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-rc.2
     - sha256:b967fe5463c310867811920f3faee31888f4d55dd591df4d353afbcca51a11f2
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-rc.2
     - sha256:49cc59f9d2b74f26d0f9359033e26149dc348de392e5d1e5421b93d66577ff3d
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-rc.2
     - sha256:144374b74819207cad5bbb94449f2b6c1f19e3c6732e5f0d562ab92136093e79
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-rc.2
     - sha256:2151acde5c5047d7c9acba7eb58da07fb8525490c2628c59f646da32a14d3170
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-rc.2
     - sha256:2f805a3d4d96adcf221c1f3a49d4e4ca9947c51bd6b3e862a0176e311d01373d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-rc.2
     - sha256:8f378fafcde6e31639bb382e28c17f45c1a3168e63dcf4d7ee5fc853330cdd2c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-rc.2
     - sha256:93e4157f7bf4706f0ce224c0280f3bcdd1cf0b22ada1e19e54ea297ec8fc2874
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-rc.2
     - sha256:dc5064800a6d2e2da3b0faeb06859cacf9a94a1b8275e469573eebdcff242cc8
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-rc.2
     - sha256:f5c3d3bbf9e925d5db0feaaf0a2b5e5ced5612e195f1ccec77f73c6864798ca6
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-rc.2
     - sha256:1b52ce04c78645261189a75ced797aac65e9dd9c9389bdb6c52a9f0a9867e637

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
     - doca3.5.0-26.07-0.7.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-5.15.0-187-generic-ubuntu22.04-amd64
     - sha256:a7db8b769864a527d07c5d1bb89fc382538e725331e4079c5eff05fd26eb9b10
   * -
       | doca3.5.0-26.07-0.7.1.0-0-5.15.0-187-generic-ubuntu22.04-arm64
     - sha256:4082d86bb4700d37bbeff2d4b78ba1e66a7973e92610112d6db8079b182752bc
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1058-oracle-ubuntu22.04-amd64
     - sha256:1ee6cab407a53af5b3422255339b2383a9a0ff94f8b0e8e01a43a631a2c49072
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1058-oracle-ubuntu22.04-arm64
     - sha256:3e452ca73d3103a4a0e3b1519956c1a5d909334f6facd8e4e2ba98a1e9d05a6d
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1060-nvidia-ubuntu22.04-amd64
     - sha256:b6b87d496379f85d308dfc9b6e5c0cf3e75ac274cb6a788faf9f6ae6e6e315fe
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1060-nvidia-ubuntu22.04-arm64
     - sha256:efdf69dd25bf5efd8d0c2420cf45a3554ef618a6f42b2c8f5bef865fb83cef6c
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1061-aws-ubuntu22.04-amd64
     - sha256:90279c64a0b3dfb601b3611ace284e50a41fbb2e7856f1868ea420ef25775d4c
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1061-aws-ubuntu22.04-arm64
     - sha256:c3b46d47640f3a6e48b57880cd88af932b27ee76e3b00da6a66a753932294145
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1064-azure-ubuntu22.04-amd64
     - sha256:2202b4d5da3d386e02b1d52ec33c1c0c151384058d3ed73ece2a54cb9c0d29f6
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-1064-azure-ubuntu22.04-arm64
     - sha256:3b2ace660dce1e9f2f0725729c9b7162b3e50dabc16ba6785d695ed7dcee4bfb
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-137-generic-ubuntu24.04-amd64
     - sha256:b126d59dbb679745232eb1016cca355d71c1612898cda404d404dfc84cc2039a
   * -
       | doca3.5.0-26.07-0.7.1.0-0-6.8.0-137-generic-ubuntu24.04-arm64
     - sha256:5319c2aea4ddb7e0576f53d3af336e2278d52d33ec6207b2a3dc216415e2fbb5
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:aee1ea2b08d168d175bc4fd5413da2e364563ab0fa31e6ed0c9cc940343f9443
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:398eb9804ae72c8cc049668f1310dbb3e878e8db54d843d677b50d25f88d0148
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:f5d18b64278d83815b95eaa4955e8c60d7e8051c7312df7b901638f0fc180cc4
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:b6feede0527bcca4ef27d5c718cea2ef635f1356c4ed2cb043805024e2b12424
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1010-aws-ubuntu24.04-amd64
     - sha256:2f44ffd6fd77f34b04ea7b0f6053440c4c6e13518d699cd60a930d468550dd2f
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1010-aws-ubuntu24.04-arm64
     - sha256:51a8087ed0a320131e4ed8403f0febcb1a4c2e90732a48849c1b2a75a2f38385
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1015-nvidia-ubuntu24.04-amd64
     - sha256:6bf21ee33176d20fb9d5858221ce8454e8eed8691abb4d659e1a62811408b409
   * -
       | doca3.5.0-26.07-0.7.1.0-0-7.0.0-1015-nvidia-ubuntu24.04-arm64
     - sha256:3c3cbddf60286ed069420ae1f37754eb4b1124ec339a48486fcf6df2345dd5d9
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu22.04
     - sha256:ee68c08aa0205be109927814a448871f1d9387fe81fe7cf64657fdd28df1b6fe
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu22.04-amd64
     - sha256:603b683a02a359e9166c88b8e62a2baa58321ae1be015b0b3b6906b28d2cf0b5
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu22.04-arm64
     - sha256:1aa09a19015a5a4664dd61e75ec8516052118414064f22a2a6ddd2bb3c93762c
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu24.04
     - sha256:3b3fd070f185878f8c5131f19d23c61083381c9bb834df7ff24299c6ec1a528a
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu24.04-amd64
     - sha256:ae0dfb99401e947bddafb600ed9471f403933edfc1e5be0bb94d27f2cc32cc89
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu24.04-arm64
     - sha256:c49744c4ada98123a585c8a68f949aec812ef2d83da47aa3ead894807ce4674f
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu26.04
     - sha256:ec60ebe5d8e97254e7870254c2f20ee2377bd3e1b93a393f32fb16a35743e25f
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu26.04-amd64
     - sha256:fa6a71edd8c8da61243f14883d9a70cba7de4cfb45a3e40871df33db51994987
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu26.04-arm64
     - sha256:6ade873d0a4f31c33815323231a6b3713c3900df81195f22767679b3c0022b4f

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.16-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.18-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.19-amd64
     - sha256:cb474a37bed06572cd7301d189dec5fabcf2fe80d469ded34679818b497518a7
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.16-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.18-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.19-arm64
     - sha256:b16352643457df84c3b17d5eed5e683d2241f70209d675a1c75f5f4909fb9db3
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhcos4.19
     - sha256:f41affa058d8b378fb85560b7763a980c7d0c4cb4f1abeef49f3ef29d8c9e914

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.0
     - sha256:9e9ada932deb0d2b7b808f27dad9b73bf9a3f1047eea36f4933df512838ab963
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.0-amd64
     - sha256:ca4df3459056a48c36af18776f60a62ff0707652d05deb47db8436f4787fd330
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.0-arm64
     - sha256:fd94d0574aa2dd4f093bcd43f5969c6f58f4dd8b88de27e64a68705d956f503d
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.2
     - sha256:5f26c162f04346dfc7d2f5b43130a632ad05d913ec6c0460b71fdec9e7162fbe
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.2-amd64
     - sha256:2e7da60e30de92ea45204ab9bfc7f552570f50a3c0dabdd93fa30c1d5a400a9f
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel10.2-arm64
     - sha256:99d3099c3a034024441b13c83060e3b7b62367266ed2b533a3e47726dce13315
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.10
     - sha256:51e1a43852a960e0c53bda834bf775942022c143d57306248d33164e9be09c5f
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.10-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.6-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.8-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.9-amd64
     - sha256:634ff585c3516326a91bff40933d25804942f09ee6490b37efffdaa3a78a1a1b
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.10-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.6-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.8-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel8.9-arm64
     - sha256:c8f9c0acacaaf74450c42fb266540b27a9d851785d0c273af960d08dc9938d38
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.0-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.2-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.3-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.5-amd64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.6-amd64
     - sha256:3b592968389d20760357c97af202c7a974e0148782d2cb7732c9820bb8dcce7a
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.0-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.2-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.3-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.5-arm64
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.6-arm64
     - sha256:eaa6f123bceb914df14bd1455ab0668464c9f893bd888dff6ae78aacdbdcb0f3
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.6
     - sha256:8cf64a1d492c0471cc8096e8eecbef6973b42003bc2923b1bdef8e4a77533daf
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.8
     - sha256:aff6f9b855e133c61bfe2738020fe818d9801c1c3000a0a5ba0774988ea37bc3
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.8-amd64
     - sha256:80714878d9b8058a5b7fb9fa3e256b0667dcda470e224f80a879a212c0f3ab30
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.8-arm64
     - sha256:ae91d3ad54f3e96aa3f19e2e0a4d37bfdeb17d4ca9ea6d31c6f8cbe012d9b52c

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-sles15.7
     - sha256:25707c56639c20bf405fe08c1e07de701d355ce6e133b6934707f7a43edd5a31
   * -
       | doca3.5.0-26.07-0.7.1.0-0-sles15.7-amd64
     - sha256:8a696afcb59feda228c3680d70a6772ec88474bdd3fa80e4b016eb30dc49a9e2
   * -
       | doca3.5.0-26.07-0.7.1.0-0-sles15.7-arm64
     - sha256:37cd91f59f47d0bdeabc1a237619eddd7a2b7ccc77aca36507f3cbce0da7d5c1


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
     - doca3.5.0-26.07-0.7.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-ubuntu24.04-amd64
     - sha256:acc69a4f3dcb675c4c04deb53399d51f66fb9cc5d41d297017a989f466477e40

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.1.0-0-rhel9.6-amd64
     - sha256:28dbec2855e6386c5459c9626876e7310d40ca7705e84ff1d3b98c5725012648