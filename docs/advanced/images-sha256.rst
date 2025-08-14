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
     - v25.7.0-rc.3
     - sha256:3a3033915aab0cba53bbe4d59256e86fcd336989a7f8a3b927ecafa6c35de387
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0-rc.3
     - sha256:f5fde1bcff1f48140cf93e70eceaf8bdb6e651a13094f8ec035f7942c52b20c1
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0-rc.3
     - sha256:85903b5a1b5787458a0f3bdf90cc02089e9ce463a990096c83568ce7ecdefc2d
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0-rc.3
     - sha256:b4d62e2d67123b41c263fe9678db46373fb4d0f4e1230865353a2c58807b68ef
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.7.0-rc.3
     - sha256:27dbe6a99805dd4eaa80f4178d3032a0f426c618387b5c5c598fe2a619547710
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0-rc.3
     - sha256:3613542f8aec5af171e1be20f78abad31787f585549f81ca99b7fc9aa0fa32fd
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0-rc.3
     - sha256:eca49ec208c8fb1bd90dd34203d00f2da01a9fd5083ae35c34eeffecc82aff38
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0-rc.3
     - sha256:ed6b37e0b018822ac522a58e1a417650ca764f9f4eaa6e0660264cf8367c3729
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0-rc.3
     - sha256:b75753c35ce6a602d4c5f06ff71a50730cb8af8b0800302de08e9a334f776645
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0-rc.3
     - sha256:be6f41b6ba36c0b5c06b32659fd6f4884b98bbd910c6a5201caf867065dd24d0
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0-rc.3
     - sha256:e7ddbacce5dea00e87fbd226607c69e0efc6175cf3a99544eb235214fa349106
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.7.0-rc.3
     - sha256:7d32845effe43d3adaaed99c3fee3d86c8fe4b825020f96e62c04c6d933a5d1b
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0-rc.3
     - sha256:9f39ca22ccc2bfb3c4a3a5e48f293daa3ee46891f9c5deb9b3f2fd82486e80d1
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.7.0-rc.3
     - sha256:65a2fcec71a686f6c8737f9cd0ceb5be5b0d8bc99a68fdbdd2fe0b99b48870a2
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.7.0-rc.3
     - sha256:5093ad9561453f97960f8f05d1d0740f51e5a25e9a5fc27a9cddfc16374917b3
   * - nvcr.io/nvstaging/mellanox
     - whereabouts
     - network-operator-v25.7.0-rc.3
     - sha256:802a7314fb5d02ed6f72a3a4f4f83f252d490afe864796bb90dd67572dcf7692
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0-rc.3
     - sha256:d82af8c787fa3cb8bc851f33d24de0c3374807c39431373a2c09d44492618d86
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.7.0-rc.3
     - sha256:1b50511999114d7089ab2a84ad68f787578b514595680af33bd418994099c3ee
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.7.0-rc.3
     - sha256:e2b9180e6766a6fc6e0bf5914678cc2cfaa6d8352bc28facd1fcff1e1b3048de
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.7.0-rc.3
     - sha256:097814e0b7ea7a0c5d33f45109094c1815503a710bcd6626c3d5d2f30692d9d5
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.7.0-rc.3
     - sha256:80f6647e0e23943f4a8ed13afc3a5607b7618c84748a82ce98c1108b37a8d0fa
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0-rc.3
     - sha256:ade0ecf83e42dc68ea0e38ec6d4e592a4003f997fcaf46117b432b042cb3bb5c

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
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:aa785718609c6e1840807d8394fb338d17475d7cf024012b6e5df6f492c922e2
   * -
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:d808e5e967fa146105e0d39852d68b1f03c203a839d7e7267100c02ed13c8e62
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
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1009-oracle-ubuntu24.04-amd64
     - sha256:89c11980d2cf6c111889f2b5b31a42744e09939dc8b2eae7613a362c25800cdb
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1009-oracle-ubuntu24.04-arm64
     - sha256:02a8c0311ff611db8f98c4d6e91a5a13a7ca42a878058c74095791a51fcd62b2
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
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:066e7bf6d971d62f2a450616bd52c8553d2b998256d92a1e3821291bd413facd
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:07ace7890940e13f444cb9397e98a06882ac1bc82435fb1218d03056d6d4002b
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
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.19-amd64
     - sha256:5ad37cd5ae96153e6f87670f437ff5f6e44febe7bb6eaeb1a0f219e28284e53d
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.16-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.17-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.18-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhcos4.19-arm64
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
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.6-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.8-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.9-amd64
     - sha256:423aea08b4a0f01e2e19b6a709e14347bd08f8274f40002e0224090dfa4904fc
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.10-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.6-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.8-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel8.9-arm64
     - sha256:f9d4b8358c68ba28f849ca710bf769c4327a639733c0ff30282ca33a744078f6
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.0-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.2-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.3-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.4-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.5-amd64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.6-amd64
     - sha256:9a831bfdf85f313b1f5749b7c9b2673bb8fff18b4ff768c9242dabaa4468e449
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.0-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.2-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.3-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.4-arm64
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.5-arm64
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