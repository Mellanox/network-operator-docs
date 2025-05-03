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
     - v25.4.0-beta.4
     - sha256:1948e3b36fa40c6235363920001ca0d55229418c5bca49ee0a2a7c6aa734b445
   * - ghcr.io/mellanox
     - network-operator-init-container
     - v0.0.3
     - sha256:67e93ccf3ecb61f17597567faf0f72e1b8ddcf73c5d7440baeadcc1cb6bb811b
   * - ghcr.io/mellanox
     - k8s-rdma-shared-dev-plugin
     - v1.5.3
     - sha256:1eb5ab7f4b6f0cf89c954cf7ac8eb2e6fb2290a4f5f57417136a5302f20b12c8
   * - ghcr.io/mellanox
     - ib-kubernetes
     - v1.1.1
     - sha256:9774f774df6ede9ddf780b9193ca9d919618056e682d985e6b41e477b13c3432
   * - ghcr.io/mellanox
     - ipoib-cni
     - v1.2.2
     - sha256:513d88d639a01ef98b65365f711cee7fbaa166137a56245b7ab32818f745418e
   * - ghcr.io/mellanox
     - nvidia-k8s-ipam
     - v0.3.7
     - sha256:1b20b78f889339834ed74e0da621fc5da582719b2537b36d8967ddc6a04679b8
   * - ghcr.io/mellanox
     - nic-feature-discovery
     - v0.0.2
     - sha256:35b1820fe94a833a43613ef5c9db1f58b293ea0dbcf96ec0742b0987f23f133c
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.16.5-doca2.6.0-host
     - sha256:866971717cb2683f2742d265c9793f93242f55b6e8bd9a0a88a558869f9b9cd7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-25.4.0-beta.4
     - sha256:e72457715bfeed015d5c095741725c9aff8f8a0a8544029d8256963007dddab3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-beta.4
     - sha256:50290c1dd8102252c74b894c1e68827794518c3abcd7a388bd94dcd2def843d7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-beta.4
     - sha256:0b6fbb2ddad5d5d4ed56efc26d9f1905c7c90df32e9a0a082bf05e3529837c4b
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-network-device-plugin
     - v3.9.0
     - sha256:cabce074d10a0f1d62135e2cc5442d65b49094b95b8297fdd024a1a5f461319f
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-cni
     - v2.8.1
     - sha256:749822bef050882a8e7a466605f83b6a634e8e0e4200ceea182e890b4b3b37cd
   * - ghcr.io/k8snetworkplumbingwg
     - ib-sriov-cni
     - v1.2.1
     - sha256:2e2c1f86a401a260743cce60258f24cb50b91d8408c9900f9ad6c1aed6fcd05d
   * - ghcr.io/k8snetworkplumbingwg
     - plugins
     - v1.6.2-update.1
     - sha256:fd99966bdb5e7e7dc674aba612cecd224fffb8a4b37c0c384b7a60cb804023f4
   * - ghcr.io/k8snetworkplumbingwg
     - multus-cni
     - v4.1.0
     - sha256:aa59e65256324c83efb9eaebca9e78877b38c33ad30ff8df71e02610aa968fb7
   * - ghcr.io/k8snetworkplumbingwg
     - whereabouts
     - v0.7.0
     - sha256:2d2f73ee5af0e7fd79ea950c29ea562997584eb665ae73da2a96fbdbfb62b378
   * - ghcr.io/k8snetworkplumbingwg
     - ovs-cni-plugin
     - v0.38.2
     - sha256:64baa43b7149add55d7dc814ea180a3bf5480ac44c838cf4b5c4e3fff95aa84c
   * - ghcr.io/k8snetworkplumbingwg
     - rdma-cni
     - v1.3.0
     - sha256:2500b2795e9afb8e3bb4aa463182307c7b641f1ea511329bb0a88741e852b4b4
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v1.0.0
     - sha256:9930d7f2b5b0302b09776fbe875c60844507f9708c31d48dfe18c4325c9474c4
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v1.0.0
     - sha256:920ad0b70bdbe8b81c62feb39108bba1a1ab236be90c614b31886c7ce52177bf
   * - ghcr.io/mellanox
     - maintenance-operator
     - v0.2.1
     - sha256:cdd9ac1a953b8ad21e4ad9619aa977d52fe82f112167cb1c0bb589051936911a


============================
DOCA Driver Container Images
============================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvstaging/mellanox
     - doca-driver
     - 25.04-0.5.5.0-1


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.5.5.0-1-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:f5d04db9ae9afccb9e79106c5ac9636c758b1b35f898c57a681653d6317a95d4
   * -
       | 25.04-0.5.5.0-1-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:d4e7ccdb16a03636312668aef36aadfaca7acc29a5e009e708402bdaa87b05ac
   * -
       | 25.04-0.5.5.0-1-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:a2f197ba0265dbf678c9880f27b25c1f128dda82f22b3409c78af8fe33902a58
   * -
       | 25.04-0.5.5.0-1-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:261eb3302d81c258c5a50fa254a401adde46639114023a6135b28fc30b6b75a3
   * -
       | 25.04-0.5.5.0-1-6.11.0-1003-nvidia-ubuntu24.04-amd64
     - sha256:fe2128177d5a089a74ee40c3376573f77999ba64ab65d97ce7ddc348b46c0253
   * -
       | 25.04-0.5.5.0-1-6.11.0-1003-nvidia-ubuntu24.04-arm64
     - sha256:428b17f5122ff160de6c86a6eafe5137e93cb45a56f6ee06cf2188edf3af88f0
   * -
       | 25.04-0.5.5.0-1-6.11.0-1013-azure-ubuntu24.04-amd64
     - sha256:3f9ba380ee9045d220ea5654e23b2402d8abb0ed5710272054473d990b91ce6a
   * -
       | 25.04-0.5.5.0-1-6.11.0-1013-azure-ubuntu24.04-arm64
     - sha256:1ac050f730a408befa4e64c8f60dee91fee4f0e5eba26cb9fd1adb4dfc912d63
   * -
       | 25.04-0.5.5.0-1-6.8.0-1024-oracle-ubuntu22.04-amd64
     - sha256:761836866825b5967ee7fd3eaa3d7c3e10aaa7e06d7a3f0c7f9294a8a0475fce
   * -
       | 25.04-0.5.5.0-1-6.8.0-1024-oracle-ubuntu22.04-arm64
     - sha256:3f5fbfcc397909aa8a4e8840076341ee4f38437b9a759ec039d96734eed916dd
   * -
       | 25.04-0.5.5.0-1-6.8.0-1024-oracle-ubuntu24.04-amd64
     - sha256:e0076cd85c659407c2399038300c4eca06855e1e4da5bd7692ed4a13c931d7b4
   * -
       | 25.04-0.5.5.0-1-6.8.0-1024-oracle-ubuntu24.04-arm64
     - sha256:66186dfe4887ea23ad88deab62454b21cf91b68ff17a78d191a866c0e44e600c
   * -
       | 25.04-0.5.5.0-1-6.8.0-1026-nvidia-ubuntu22.04-amd64
     - sha256:2dbe874cde5cdb0afd0bb462931202d5ceba63624be23a5c37c6bf786cd7334c
   * -
       | 25.04-0.5.5.0-1-6.8.0-1026-nvidia-ubuntu22.04-arm64
     - sha256:72f5ddf33e4c887bad602ce2ca5ac2e099a6a286dd8c2dc3597c847d81498dba
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-aws-ubuntu22.04-amd64
     - sha256:94870afdd349a33c0fe822109cda7923cb54484a7a5c56b419df7f0b09f88fdc
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-aws-ubuntu22.04-arm64
     - sha256:5b29ba2763cce360d3956177cb220dc5b97c53bef8f844207091f5660930c58b
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-aws-ubuntu24.04-amd64
     - sha256:38d51e8dbe11eed03a4b98aee1ac2fcc0b1dbdfc0889ce59152765413a0d9ebb
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-aws-ubuntu24.04-arm64
     - sha256:00e35f6033067c3635e3d9415d35de0a8516c2522d05e92a84634db16831aeb4
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-azure-ubuntu22.04-amd64
     - sha256:47e7a40e5b089bda5e6715da56573d3d5c5080d476aba4be1e1c35c4de5d3302
   * -
       | 25.04-0.5.5.0-1-6.8.0-1027-azure-ubuntu22.04-arm64
     - sha256:15ecbd30665e9e598a1de1550ff267953b318b7c3aa89335c19a309b20e15ae0
   * -
       | 25.04-0.5.5.0-1-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:7813852ded94bfae2f0d2ceedfdcb41e6906ae65154b63b08810a9ca413db7a9
   * -
       | 25.04-0.5.5.0-1-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:7b58dccf71a7c987ca0f90e246a2cf7d24f538d2bfa02553176c070411b400f0
   * -
       | 25.04-0.5.5.0-1-ubuntu22.04-amd64
     - sha256:f0f633d3ebdd3174aecd18059bcad79d69ec2c54c59d715101b5226c51bf6139
   * -
       | 25.04-0.5.5.0-1-ubuntu22.04-arm64
     - sha256:a025479ff74fad7751e92fab4cc961fd2965035b4c20a679fab8b4c7204d44fc
   * -
       | 25.04-0.5.5.0-1-ubuntu24.04-amd64
     - sha256:68b05c6d7631fa273ec4705f881e13323b3de382f191ddcc420a260ecb9d4768
   * -
       | 25.04-0.5.5.0-1-ubuntu24.04-arm64
     - sha256:1d083ef75a5826ad774ee36dcc6f2b6ad69347d0018bbf25c62ef72d2b6276a4

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.5.5.0-1-rhcos4.13-amd64
       | 25.04-0.5.5.0-1-rhcos4.14-amd64
       | 25.04-0.5.5.0-1-rhcos4.15-amd64
       | 25.04-0.5.5.0-1-rhcos4.16-amd64
       | 25.04-0.5.5.0-1-rhcos4.17-amd64
       | 25.04-0.5.5.0-1-rhcos4.18-amd64
     - sha256:d17d472955227578865d9fa19602170958ae45346bfc1ba4e8dafce25de4c729
   * -
       | 25.04-0.5.5.0-1-rhcos4.13-arm64
       | 25.04-0.5.5.0-1-rhcos4.14-arm64
       | 25.04-0.5.5.0-1-rhcos4.15-arm64
       | 25.04-0.5.5.0-1-rhcos4.16-arm64
       | 25.04-0.5.5.0-1-rhcos4.17-arm64
       | 25.04-0.5.5.0-1-rhcos4.18-arm64
     - sha256:fff46b13832152304970afcea96dd9f75e611d020ffd3b63602b29fc8b81b8b5

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.5.5.0-1-rhel8.10-amd64
       | 25.04-0.5.5.0-1-rhel8.6-amd64
       | 25.04-0.5.5.0-1-rhel8.8-amd64
       | 25.04-0.5.5.0-1-rhel8.9-amd64
     - sha256:5373bb1c201bcd0fdcf5a6544749acb1e0f0f5ffba476ad6b0ae7cebaa0d78a6
   * -
       | 25.04-0.5.5.0-1-rhel8.10-arm64
       | 25.04-0.5.5.0-1-rhel8.6-arm64
       | 25.04-0.5.5.0-1-rhel8.8-arm64
       | 25.04-0.5.5.0-1-rhel8.9-arm64
     - sha256:a73b6067002fa55c295fac9032f7fd038f4b324757d134d53702a0572a0f1c3f
   * -
       | 25.04-0.5.5.0-1-rhel9.0-amd64
       | 25.04-0.5.5.0-1-rhel9.2-amd64
       | 25.04-0.5.5.0-1-rhel9.3-amd64
       | 25.04-0.5.5.0-1-rhel9.4-amd64
       | 25.04-0.5.5.0-1-rhel9.5-amd64
     - sha256:88a5d3bf133c204ba50a91d58cff31ea9b500a7536b49c02e3909f1702495901
   * -
       | 25.04-0.5.5.0-1-rhel9.0-arm64
       | 25.04-0.5.5.0-1-rhel9.2-arm64
       | 25.04-0.5.5.0-1-rhel9.3-arm64
       | 25.04-0.5.5.0-1-rhel9.4-arm64
       | 25.04-0.5.5.0-1-rhel9.5-arm64
     - sha256:b1a56f8b070844b401cfbcc7351b2e6ac55f742f0f1fcd6a8444667e0d870a45

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.5.5.0-1-sles15.6-amd64
     - sha256:968b25b9123b6778101e2de4301f62e7b106d81519473f10b2a13e2da4b73ce8
   * -
       | 25.04-0.5.5.0-1-sles15.6-arm64
     - sha256:92a0852e2c2a969d5758b4a245bb64b65027dfd8f3d403fa958b1cf65377c7b6