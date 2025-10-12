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
     - v25.10.0-beta.1
     - sha256:ea9b9164e13c58cedd4a1e1b36c18f4b37e2f6e329947dd6aa787b885499e613
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.1
     - sha256:7e7591330221ab510c92b40e63c5433fe66f1cb165fa89311176e53cb0d4544d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.1
     - sha256:6bf82152d179052df6918c1d97c27ebc616f725b062454c6052555f3d2a0fa0d
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.1
     - sha256:d3c1d306ad3b84284359c9b1b68b7a0d004cde5234cbfe2620cd67791f75453d
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.1
     - sha256:4409688c267d87916a6397d2f214a2da404d881746488363e2c2bdfad90ae756
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.1
     - sha256:a4287519b30d2578aa17f0f342139fcba160dd5fce27988d38082886755a7c82
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.1
     - sha256:237032546fac4cf04885a3c46fbd576c18729c3e98aa22b114816a9487ab017f
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.1
     - sha256:eabea4ddcc9a78b38f64ef15ca464d07b6de161534ca33ba77205ffe1382304a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.1
     - sha256:e5a1c1917f8efd51bb0c316dcc1f41d65307eea7aa58853094168572a09560a4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.1
     - sha256:e2413b856fb977adb216aa8d2c14632c3cdbd223fee29620e1edc61943778826
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.1
     - sha256:6ad824281f635852d49d84f12152d01b0601fd51abbbfa6a9fabae6fb9d6bcf6
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.1
     - sha256:7623c6d605eb9c2f95835272ac46e2d2311c45e74a1adaf3a4547b78c7611cfe
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.1
     - sha256:849d4b668e8f2b11c65708f93848cb408b57aa7c4e94be70407aba8d0b4fb297
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.1
     - sha256:ea08110b1aea832f1a615acbd0c355a0fecf120eb4aa615c4277157908cc7191
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.1
     - sha256:5a56e5fa6cad825841b8d75a1a289c47a876ba2497e67e60739439c32a91c5c6
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.1
     - sha256:a5bdee8048fcdcb4f88f30c21be08c817478aa7fc07c25455974d95da74a76bf
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.1
     - sha256:f9b91a967768bc358f5013fc7c3e6bb58facf6dafb5aa434da5f7317ae9f77a7
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.1
     - sha256:d02732f74828e1bd59646f04e4210fbe6c786b105c410cedbacf8c986702b01e
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.1
     - sha256:388737486e17d9a4bdacfcf3d09d24c66611562ff6376413c725fabc3a09acd6
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.1
     - sha256:8a402756c568fd1e1f12effe51b22b71e1239b841101e2f1f22e0d6c17e39946
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.1
     - sha256:8cfc8030236a826ba8b6b06a9ac817057c766913524e4ecd9eb297e0bd883248

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
     - doca3.2.0-25.10-0.4.2.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.4.2.0-0-5.15.0-153-generic-ubuntu22.04-amd64
     - sha256:54a4aa3523fcda2f8351d2fa18d518aa43026d91fdd1da3c9c1113da6bd58c63
   * -
       | doca3.2.0-25.10-0.4.2.0-0-5.15.0-153-generic-ubuntu22.04-arm64
     - sha256:d7e60592e187b4b83dd01fb3a36b8b53d2b016504b2a754fa9704c209a1233d3
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.11.0-1018-azure-ubuntu24.04-amd64
     - sha256:c86131b29e199c41f7737970c836716d6210d5f4dd9ec88b154a67de534ef1fc
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1008-nvidia-ubuntu24.04-amd64
     - sha256:3b4826142b85d4df7ef5cec662bf16ba590ac1f83c0224425a2a289dbfaa10e5
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1008-nvidia-ubuntu24.04-arm64
     - sha256:c8afe8682bb3cdbf75dd6334b022439507ba57d5aa061e04df3cd08950e4fb28
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1011-oracle-ubuntu24.04-amd64
     - sha256:7df5f7639af47f9c2e07568edf1aa3f2cc57bc77eb8a25d9f80621be5aaf362a
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1011-oracle-ubuntu24.04-arm64
     - sha256:4a1ecdfb7cc6b75cff21e6802875cd4eb2a0cec2dd8f05519b4792540220ff03
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1012-aws-ubuntu24.04-amd64
     - sha256:1a735ddb89536c94cafb077938d1edb338a0ae420fccf8354022cd2fe9e67026
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.14.0-1012-aws-ubuntu24.04-arm64
     - sha256:04675d3ff326a3c125d03ef91ba4222d2b61893752f6c1e812ef6053bfcbeece
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1033-oracle-ubuntu22.04-amd64
     - sha256:06a2e8c6cf046637a0a3c03258d633cebea2d7d2fb4b91e4d0351aaea4ce331b
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1033-oracle-ubuntu22.04-arm64
     - sha256:ff8662e69e4332617f47b3ce5346dd685e270e21f87148a69cedc7e927b9564d
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1034-azure-ubuntu22.04-amd64
     - sha256:68827b3853c5be285f6230204cf53784ad4571daa0587ec70ce90621062834bf
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1034-azure-ubuntu22.04-arm64
     - sha256:48b6d80f9acf11e17294ed8fa131d43651228ce3e9a511bb881b36c4b043b620
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1036-aws-ubuntu22.04-amd64
     - sha256:b48b6249a322c45f37f6ff3b8b6ee590b6c7975694b8c6b1477f724d056844e1
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1036-aws-ubuntu22.04-arm64
     - sha256:a5c3064e388b5d9820bec4623dd720fb17d0a42594d7b9d1ac5e7d7b035ff275
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1036-nvidia-ubuntu22.04-amd64
     - sha256:4b3a3e75bc95ceb7303c840fda4d24a4dd93ddff5ebdb8c40d5c943d52cbfa4d
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-1036-nvidia-ubuntu22.04-arm64
     - sha256:94fa3dd970a41b221d3ce7c3f785430c8e794a5594b4b0df4c3e33693e826269
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-79-generic-ubuntu24.04-amd64
     - sha256:50a7d1b7216905ad5b40cda0b198879e8ca5c21563cc77c0184f5c1f4b5b9f52
   * -
       | doca3.2.0-25.10-0.4.2.0-0-6.8.0-79-generic-ubuntu24.04-arm64
     - sha256:faf1358397d941e9b6aa0ef34239435b0091d8b2349866d6f8c8f514296e8575
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu22.04
     - sha256:64d3e4cae80cd6a1322b233a924d1e78dd40956079389092790f8b82f0b2417c
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu22.04-amd64
     - sha256:388437e9d78362066aa332f6b098594d84cfe0b267e2b734abf470cd3d42f488
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu22.04-arm64
     - sha256:458250f0dbcfb3b0ecb2c7a93bff78d151bfa66385b7bebe6d9e1f6b3e30f456
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu24.04
     - sha256:13f7eb92dcf5d3d2cc9aafd022baafb23b98bbd5b1fe66772f01ddd6569d776a
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu24.04-amd64
     - sha256:a626565dfc60bf6ec6864275371be85d8a214b0b4a8b9ef2d1d9b5839210fbea
   * -
       | doca3.2.0-25.10-0.4.2.0-0-ubuntu24.04-arm64
     - sha256:d8e3fa4b9093eb15f34457c1b835c0a2216806b6279dc83f2b2fe1c2c6763564

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.19-amd64
     - sha256:e518fcc0fb7f3c774f3f69d4eac5c9afb49968ba0814a6bd681efd6971588f59
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.19-arm64
     - sha256:96a2c77f3104a21e5b9c30064fe84c18bea829713edbb03e7baeee7d021dd8fe
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhcos4.19
     - sha256:09aca25dfa022128ddda116b46c16c1750a31efc3eef45c36845a9ae2eec942c

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.10
     - sha256:fa78dbfada4a7f9358f0470416992677704dd15c38463f5b641296321236d5ba
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.9-amd64
     - sha256:2381d8463f613c721b058b733c1de7a1202e6a49e237d43f79e7981326a48e04
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel8.9-arm64
     - sha256:0c6697321d2f65ae3c699b75ad24d5cefae7ad0bf2b68991e854e411449e8845
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.6-amd64
     - sha256:9d19eaf294c423634cfa5bf313d17226c1ef7849ba9cea073c7df8142a7fd72e
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.6-arm64
     - sha256:af4c7bbd68823a694efa1a63d61990dc83954592d77ed3e88d17152ceb9ba3e3
   * -
       | doca3.2.0-25.10-0.4.2.0-0-rhel9.6
     - sha256:ace2fba13d8ac355fb5ba6a6666fccc8eef0cd45ac0b2ad3e7033723e681fde8

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.4.2.0-0-sles15.6
     - sha256:0cc040c95c5a361c9c275c10b16d52a3fb6a00081e2344191163f4a0f40bc94b
   * -
       | doca3.2.0-25.10-0.4.2.0-0-sles15.6-amd64
     - sha256:fe69f2ee0dfefdde2282d60a36571a9634484b3ab1f640f20f25babb0f6fdcc5
   * -
       | doca3.2.0-25.10-0.4.2.0-0-sles15.6-arm64
     - sha256:f6fc0f25a7487efb8ed651d46d2215a10797896fa21997270aeddc14301fcab4