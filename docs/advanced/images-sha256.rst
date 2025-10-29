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
     - v25.10.0-beta.4
     - sha256:d4fa79e6398edf027ea90a7902a955c07836ba6491aa9eed8b146f8683c7e175
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.4
     - sha256:a36fd21880bed0d3ded5fb7b5e32277a998665e676a666daa73bcdf87809601d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:6d26c1daef6a9d7afae22c22388f33603432c942373c68e616ceb30b108eecc0
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.4
     - sha256:5817a72db58c306494c594e52cf78a46ca95c47ae5cef80e365e9f21672af678
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.4
     - sha256:5477d5f823407c3d66354f682f9d71e581fbdeb985c740324632cc9503ff5374
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.4
     - sha256:04ad1bf506d5e6ee2cfe2e88f91a05956156d9f07adeb3ec26b841d2ba4485f1
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.4
     - sha256:a0ac64e9d7fe45080c82500d6e8c40452557c266f61287c0c390c9707c160401
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.4
     - sha256:95fbaac387521bdca0911da2afc27aac9ed7f2ac173310d87906136318590792
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.4
     - sha256:08186e48d2d93bba9647f7a347923b04ed9ede676eec17d89d6b0ff49f174f3a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.4
     - sha256:71aa8587b4cc2c9a0513e30f1c0402146d3d759e5b86601972b0d7e4e1e7b3bd
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:624da410d4f6dcced81dfb1b829ddb90ea9d8b026f85c6fe27b6428009614bf4
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.4
     - sha256:226ca09063df7cebcdaef124a11087e8c67220a2a8ead0ec3a64d71e8e848fc8
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.4
     - sha256:00e31fcc5d658e3e625f6518b4e89f99f303d7c2bc8b1f2da9c7430b52fcd4e4
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.4
     - sha256:d4fd534e168f7944a89e3de515f37778dde8297e4f12c27ea2eea03680e8e228
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.4
     - sha256:2617fe70f702ce593c264473ddd0350f1974d7414b4f396acc8c9c32537396ef
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:06848e09b1ac57caa59fa6cdd0ef74e6d4cb38bc5c478796b21715b33d2acf03
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.4
     - sha256:a6f17efe0f341b3ce487ac3c8d603c9c7f329a6ec0befa8041b9c3768b280162
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.4
     - sha256:dd2445e7a9ef0f82be3300067852549f8738acc6b2fabf22ba1d484a635ca327
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.4
     - sha256:b8c89e2ec0c678e5d735177dcd4ac5c0d3f538cc9f9eb62a642700e153d69302
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.4
     - sha256:d19c714b1002e799e4d027668044d2bfbc01140ee93d650908e644892fe4fb82
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.4
     - sha256:8946b5823efcd74e85826acb0a79c5af7ad6f1e81954a642ebf6d5f09136c7b7

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
     - doca3.2.0-25.10-1.1.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.0.0-0-5.15.0-160-generic-ubuntu22.04-amd64
     - sha256:d9a255ca0aad5e3d241c86510b1a677e6a10ba5ae4c0a4f36baec4ac3aad68cc
   * -
       | doca3.2.0-25.10-1.1.0.0-0-5.15.0-160-generic-ubuntu22.04-arm64
     - sha256:879c36b505848457a89067d8cac40d0c648b2474745dece67c08fc5b8ca38863
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:153fedb3c20c3e67e44f3f213fa5c23985f6ea03512f617c68713ea4cd6009fd
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:faee7da422c3e4dfcc140d938cdedfc19a7e01179e18cfad8699832a69cba1ce
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1015-aws-ubuntu24.04-amd64
     - sha256:687b7bfbf6beb1fefd402142d027fbb5844ab9089f0198f8519e4724c3dddb88
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1015-aws-ubuntu24.04-arm64
     - sha256:81e486d0d4e1cdfabe7b3b17a04eef54b686af20bb75c224cf34f0361de498b9
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1015-oracle-ubuntu24.04-amd64
     - sha256:095a0eb06c2e3be1314e841ef6501b32d1d01400a1f84c8c710c5a9336e8d7ec
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.14.0-1015-oracle-ubuntu24.04-arm64
     - sha256:84bcb42b5d6ec0170c7114103461dbcb4026990d12e0a2d7e464713263865845
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1037-oracle-ubuntu22.04-amd64
     - sha256:7133712b4eafa9e25326764e6fc293a07b76cbbde12d5734b29d55b2c3256366
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1037-oracle-ubuntu22.04-arm64
     - sha256:cc1d4edc4c82e750eb8aba9b41ca530699e4e760a8658328f4895a62510371fd
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:6ae7b43d734b86236f3c2d8ca849b7a004b35e43cd9dd0312690ba1906ff662f
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:70d8a02f569ec7f015fcd72a8debc2233cf0cf251abdf6ac61cd1b533cba7ad2
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:3b537d0d50c86681c4c8d1c03e398f4284dc81a181b15e6f2f99e0284fb6fc53
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:7cc35343a5530df9daa2c0d8de3ef52a72bbffaa922bbab3b7f25955c9ddeb0e
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1041-nvidia-ubuntu22.04-amd64
     - sha256:7d98595285f85db2cff9a0ee38d6c82dbbfa5c0d44f8e5c433d8c3883f149eb6
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-1041-nvidia-ubuntu22.04-arm64
     - sha256:d2a26bded5fea7943e71dba7c4ec7ee18e35821f2d6e791f5eb19fa1bf8f5318
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-86-generic-ubuntu24.04-amd64
     - sha256:ae64995213817850e3e6694202c676c84cd4ebcbc1094df339fff81230d5e19c
   * -
       | doca3.2.0-25.10-1.1.0.0-0-6.8.0-86-generic-ubuntu24.04-arm64
     - sha256:860fb422dba5e874ff4a56e84bcec497b0a7ca2a61657eb06262a086b56247dd
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu22.04
     - sha256:5f59b6cd2026a4f2921efe098e0cf4b37cf23ca1c11b48a7b26fc2d5c031ac18
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu22.04-amd64
     - sha256:1d8dfc5f6f2d4fed7f74e134ebcc876b656501d636d66209a2dfdc8c377030ca
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu22.04-arm64
     - sha256:efcdb4dd9fbb016558e0e4ffb1acb39de22d2fcb6ef1ce2105aa315837aeb412
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu24.04
     - sha256:ed71987137886ac8bb8f7632c9ffe53fc4dbffaf0c7b5930009017e6f70bde2b
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu24.04-amd64
     - sha256:063c759c5227f81461c7ab9bfe7be343d8a47a3a5a948ec0540f36b6eb68892e
   * -
       | doca3.2.0-25.10-1.1.0.0-0-ubuntu24.04-arm64
     - sha256:bd6eff18248ef180e6004a1a97feaadeb1a08ada4270af5c5eaf5f25876bf3c7

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.19-amd64
     - sha256:b42a5e1d2c33e9573da0e8b1c9d12b2b3099ba604323a8fd8fa5c8bd520cb2ca
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.19-arm64
     - sha256:0e194ffd47f061c9449641d5a8e6f14d0ad131cef820d3329fd6735b720a2bc6
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhcos4.19
     - sha256:72213a91591d2efa9f7eab538bdc728d078438b850d902381ca95eda81a8cd08

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel10.0
     - sha256:f75c7af0b31a66f04de437ceed585db94a56650970d22be22a5235f401dd8f7e
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel10.0-amd64
     - sha256:bc0fb732e434120c30b57b3f2b7af9d631fe4a1be382ee0f6355a141b9f84d35
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel10.0-arm64
     - sha256:80a2717aba253c115b8c93e266d9477c210d752b167abec139f6bf615b47615b
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.10
     - sha256:0f01a4e733adedfc6fa95ce272c68500d48a4c5fe0ef0b0f3d3accb4b052592f
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.9-amd64
     - sha256:8ed3a1caaf0e9df6f644a82f1fe840727e9d2728a512403ad395c561f9c80c4e
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel8.9-arm64
     - sha256:35cb75ce0016a86bf1c9b3e8e78e452a66700261bea6bb2354b455ab3df52377
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.6-amd64
     - sha256:cd64fab601c6191eaf563a54f1e3df039bc427e93df48283346c2dadb8ee4c1b
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.6-arm64
     - sha256:0d64274ed121c9528e8e881534218238595b35fb3d475063dd048f5ca0467b29
   * -
       | doca3.2.0-25.10-1.1.0.0-0-rhel9.6
     - sha256:872cc3579aab5e16fd87ae789f3072e9c4578d62619da6bef78666ed8bcdbb22

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.0.0-0-sles15.7
     - sha256:e432e09267b7a53dd3ea97f0aa4d9977a6d4a45755ae430e932fd6de15f96606
   * -
       | doca3.2.0-25.10-1.1.0.0-0-sles15.7-amd64
     - sha256:999b7b1bf01d1064102f0f8b8351b7692a2613883760ad15ef1ae2f4a6df3671
   * -
       | doca3.2.0-25.10-1.1.0.0-0-sles15.7-arm64
     - sha256:8a94449efa702bb91368c5ace61b9d1b98d8cae390acc21db781284b87a092f5