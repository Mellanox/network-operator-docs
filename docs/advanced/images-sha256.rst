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
     - v25.7.0
     - sha256:51270965284cceeda659fb1098e70a888b39664ceade7e9d455fb95ac85914b7
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0
     - sha256:02ee60ac6ee163acc97706bd4229d268f608a95bcbcb6fccee90ceb1d8a6c62b
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0
     - sha256:a87096761d155eeb6f470e042d2d167bb466d57e63b4aba957f57d745e15a9b2
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0
     - sha256:1fa251979b5f5201af50bc7aa6936829103d742f42bfbf752f20852f5fe44dfb
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v25.7.0
     - sha256:7564ad1142c863e61f1dd84f5714deba9a7c6f6d85efb383ac3a2566eb4f4b71
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0
     - sha256:3f692273c1598525b9c698c9d9cd463e5ddc55b638c6c031639f38786fc67475
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0
     - sha256:1330e3a7ea2491bc310bfc4766769389ceb56d050831bf9c145b7bfb6aba36c4
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0
     - sha256:b6debf7be894860a2daeaef1f9c320359a62b258b50fd2d2cf8cc9358b4992e9
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0
     - sha256:be3d98dcf1eb302b09c3282a88ffa62dbb320151a5ef29b5793ebc77dc9c7eab
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0
     - sha256:bb8a6c4d37d0c940aa645a753e6fb88cc1811e110986793c8b2924db3247a421
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0
     - sha256:7508a160f3f124e0b78d2b4d5a52deca6b9f56e226fee957c4d156e425eb101a
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v25.7.0
     - sha256:acae9a1623b1c837294eb0bf640031342d0093e4f2b0f741e9368198c0529e34
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0
     - sha256:681738005133e7816d012e8dd18b80bd0bf054a877ed545ccb7d77e4937ffef8
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v25.7.0
     - sha256:331009ceaed6c42c74e1fe8f0a22a8a4ee6b317875497e5141b74bc115e00279
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v25.7.0
     - sha256:83d21583ffe922d694af603743ab8b806c181ef33370da08fd3c40370fe164e8
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0
     - sha256:17affe6f977807e1388a5a395df5f1e030f7f049c77856c6685cde4e960704ac
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v25.7.0
     - sha256:875c9a8a32ba89d3cba429daae0df44ab7728b1eb67a5355c2a37707328a43a1
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v25.7.0
     - sha256:03f34f7fde3f65ca7b214b66c6fdbc1250d4f3863f9c02b0fba78e8aa84efca3
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.7.0
     - sha256:b78c15904cecd343fa48374757b3619b5cbdc22059d5ee9731da87e35b94a2e2
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v25.7.0
     - sha256:937dfd5f75eca2a2181734630e06d63a0357995d596b5b83c2258a7136cc6bdc
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0
     - sha256:dc785d2d517f9bc7d217afc5631684185854cae5651ffa891a2a50bf3f00460b

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
     - doca3.1.0-25.07-0.9.7.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-151-generic-ubuntu22.04-amd64
     - sha256:91e678d6763851dce1030bf8433d67c8222771d23dc66bf6e5637cc9c1283cc5
   * -
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-151-generic-ubuntu22.04-arm64
     - sha256:aed2b3f14bb4e8df79268fce197c3b6afbaffae866e99f16e3c1a937d17bce5d
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.11.0-1018-azure-ubuntu24.04-amd64
     - sha256:583327643a7c6d4d9cff3b09dfb2174d03ddcacce36ffc29148768084be28288
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.11.0-1018-azure-ubuntu24.04-arm64
     - sha256:49755f6b8e27693bd9827827c869da4e73e9d02d4d1c5cdecc0fc43cba228ed8
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1007-nvidia-ubuntu24.04-amd64
     - sha256:c9c649ea7b877d09b7f77e0d6911c52b488e424f96ad057ae3d93268d69a9f2f
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1007-nvidia-ubuntu24.04-arm64
     - sha256:b286c8f700636c0fc1c3eed97baa7aa1fe1f44e1e55baa30d30f80a9ba559761
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1010-aws-ubuntu24.04-amd64
     - sha256:c09575a6f81026c18a455895331ff02c43e4153f1ef8e9d86e7e0e4b6cbd2436
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1010-aws-ubuntu24.04-arm64
     - sha256:a73530716b883df0b62d01abcf1cc62f2098cb74b00c6f6cf40d1dbc0771112a
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1010-oracle-ubuntu24.04-amd64
     - sha256:a996c1fd67e87ebab5a9345c9c8552683f675084cbb16b2665cc6d12aaa1aeb5
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1010-oracle-ubuntu24.04-arm64
     - sha256:88504018f0436acfc9575845a12f67e074066cd475e207507eb1e436624afe6a
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1030-oracle-ubuntu22.04-amd64
     - sha256:a67b76ed187308f7e45225aa2b76e8ef3309fa49b462d77839daa96c33087f71
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1030-oracle-ubuntu22.04-arm64
     - sha256:fc31c35db4bbe5ef110feb6ff106c3ebaa9dd4058dff1e9ecd4b3c37f9d674e0
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1031-azure-ubuntu22.04-amd64
     - sha256:6ba946972f143cb6b7832331779f318a292715fde4984202f67aaf9f6b7a15c8
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1031-azure-ubuntu22.04-arm64
     - sha256:90ac83e68c433d8a19d92001b47bec8510f41729cc08b0087c4082c761ed903d
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1032-nvidia-ubuntu22.04-amd64
     - sha256:ea4b25fce9cac1bf92a21b1d57f1511e9bf1b1c8b514d62246088953918ba96f
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1032-nvidia-ubuntu22.04-arm64
     - sha256:63fb764c15ffc7d07f91c6edd1e99e43e5c7ae2e6b3aab8371cdf60f8849facf
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1033-aws-ubuntu22.04-amd64
     - sha256:dc72fda2b6e8f2da059c23b329cd0e3dd1a4085cad41056a91d4e096210c6ccf
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1033-aws-ubuntu22.04-arm64
     - sha256:97f89b9b7377e0394bc485505af57dacce15f4b6752bc17bedeae2a9a0229793
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-71-generic-ubuntu24.04-amd64
     - sha256:ed4d6dc7527d730063228327ed228c229d7e2d98e75ab60c9744f5ca7252af01
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-71-generic-ubuntu24.04-arm64
     - sha256:ad03f5912ff768fed8a68bcd9a9eb8f05c41bb79b0c4ddb14658c52683353520
   * -
       | doca3.1.0-25.07-0.9.7.0-0-ubuntu22.04-amd64
     - sha256:c2ddff70c6bc6c7217877cf2fae80a238af207c3373991535ef7ae4805027e7e
   * -
       | doca3.1.0-25.07-0.9.7.0-0-ubuntu22.04-arm64
     - sha256:ab8333fcd9f756163d82051ca421fe92ca6ef0c649c12c19e2a9179a80022c38
   * -
       | doca3.1.0-25.07-0.9.7.0-0-ubuntu24.04-amd64
     - sha256:7da8a86acbf510e5de570cceb0091a7f478f4e78aa8c653745a271b8cec12b70
   * -
       | doca3.1.0-25.07-0.9.7.0-0-ubuntu24.04-arm64
     - sha256:e839d4e4211db6092d2f610ecf692d2c67971f76c746f41841b36ad1c7fc3aa0

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.16-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.17-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.18-amd64
     - sha256:5ad37cd5ae96153e6f87670f437ff5f6e44febe7bb6eaeb1a0f219e28284e53d
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.16-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.17-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.18-arm64
     - sha256:d41eea65b102dc5bb5792871ae212b59a65dae492ca109c52138d5626eba1ffd

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.10-amd64
     - sha256:423aea08b4a0f01e2e19b6a709e14347bd08f8274f40002e0224090dfa4904fc
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.10-arm64
     - sha256:f9d4b8358c68ba28f849ca710bf769c4327a639733c0ff30282ca33a744078f6
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.4-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.6-amd64
     - sha256:9a831bfdf85f313b1f5749b7c9b2673bb8fff18b4ff768c9242dabaa4468e449
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.4-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.6-arm64
     - sha256:30354799264480e1aee057397eef2c52b277bbc6872184e2b7b811f4152b3a67

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-sles15.6-amd64
     - sha256:f178e692d664d7c6130c522a61f22b8d333a4859d6dba2fdafea5b6ef1fe2901
   * -
       | doca3.1.0-25.07-0.9.7.0-0-sles15.6-arm64
     - sha256:e70ab527ca4ed883401afa712568858933684cc337f1866b81b27119683a7c77