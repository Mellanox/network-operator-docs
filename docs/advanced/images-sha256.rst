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
     - v25.7.0-rc.2
     - sha256:802d5a198416901caea35f34d7afb02f4a61bb36a57a90d35a63563a33bb17e6
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0-rc.2
     - sha256:62c2678fef1e04d0421ab8c15cc5a04f6f88e9bc511de635b4c6695094bd6d8f
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0-rc.2
     - sha256:6cd7ef01adabe3e7502470508270198c479c239a94240a953d5f16a604477913
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0-rc.2
     - sha256:27f0e7df8cc9bf027b6cdabfa17d58e417ff9357b1f00e5f3c85c6e421006727
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.7.0-rc.2
     - sha256:1be4c2ffdcd98e84ad43d4cc56f5877f989e10bf32d2c3223902693ad5512f48
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0-rc.2
     - sha256:0082d40b3e568a4866f059475fb722afc494fad0a43ddc6c183e4854822a78d2
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0-rc.2
     - sha256:bb6a820033a8dd3c4ed61578d9fa58d3ab8dce2913d43ebb14744b21fe559a5b
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0-rc.2
     - sha256:a13ab02e1c2feea1ac9f6b37777a12df35ec67a53c1b7a4062e1ca4cf64480f8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0-rc.2
     - sha256:25bf34612c8dec3f3c1efd88803e2c6cfae693eafc26de70d768a90cb00dc702
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0-rc.2
     - sha256:8301bc680fea77b1b5a502fc92c46a836131de1655efb2696260737f4ec79396
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0-rc.2
     - sha256:7db397fa1567f6fc9073a54182327d89c197ee64637305219c727ad80e05b4e7
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.7.0-rc.2
     - sha256:0084632c52b1b6e7771d7ef32fef79c31c6f997b34fcf97acb37a210c6943d33
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0-rc.2
     - sha256:0cbc30dcc9bdaf1c1c448bce1489b614a5244baa34c6ae97e09e56884f3562f1
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.7.0-rc.2
     - sha256:d259762d3252c0e073cd46d85cee4fda067fbdd1f3cc694a0302b97f6a6175df
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.7.0-rc.2
     - sha256:4ed331fcd9e06dbdc0b1cc1161a109acd143137da00d06b32029421856c8b9fc
   * - nvcr.io/nvstaging/mellanox
     - whereabouts
     - network-operator-v25.7.0-rc.2
     - sha256:e7de8d9a1cdf1645d69b014a5eb07d33777dcdad15b9e4e81d1a8e02e60baca5
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0-rc.2
     - sha256:8b21d1e8f4a7627f063891d8c6b08e38d2af5db60110c74cada7e1ab3d4096f3
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.7.0-rc.2
     - sha256:a83424fc37a466edd2bffbe930ce4ae3e3ac79c800d4d0f2613697771bba946d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.7.0-rc.2
     - sha256:0afe8162ba1c9e508e8036966e9f8c19a7901b1fe1e2cd239cc051a22d3f68b4
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.7.0-rc.2
     - sha256:dbda283e2dfb3c16cd0df7697b7caf7e9117bf6db69fd6092120eff135a9bfc0
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.7.0-rc.2
     - sha256:9fb2b262fef5a6758e337760b576f8028d5dd932d1d5b59ce46f5fb6100ee276
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0-rc.2
     - sha256:b84c68afb0520601130d9e157a5f1113c484ffadfe25563388561948643b3c57

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