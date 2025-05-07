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
     - e1aeaf9
     - sha256:43242cbac6591aff395070b866e6b2870942c4dd2a9250776fc8eb1cad09377e
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - e1aeaf9
     - sha256:d6a67b820b3ca097172f0c6a446ca546f2b8abc727cef62ab99e4dc32d1d8a23
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - e1aeaf9
     - sha256:d151a829a4dd8a51c7a067cc6fe8bde150f87c363fe40da6b01dd760c3c7b520
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
     - v0.2.2
     - sha256:951ff8b27a21109df91314f89745f061fb2dc357094da57de98e0117ee5b7359


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
     - 25.04-0.6.0.0-1


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.0.0-1-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:4536ce6673439d83e83485d55697907940cefc951d6165469932447dd83efc7f
   * -
       | 25.04-0.6.0.0-1-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:917914b4364f344ffd18add186bbb539e546d94143cf4330528ce4a0a96a7bfe
   * -
       | 25.04-0.6.0.0-1-6.11.0-1003-nvidia-ubuntu24.04-amd64
     - sha256:d0615c55ce551ffe0289c9ab93b9686205ae4f316461de0bf98c7f563416242b
   * -
       | 25.04-0.6.0.0-1-6.11.0-1003-nvidia-ubuntu24.04-arm64
     - sha256:b81705b7bf693cf7eca532a6df80418af2d56ad48c70138eb7b650435e4cd167
   * -
       | 25.04-0.6.0.0-1-6.11.0-1013-azure-ubuntu24.04-amd64
     - sha256:0fab50f0bd228e49b3384a5fbf2d1458cfdb4fbe20306638ef35e28176bc4438
   * -
       | 25.04-0.6.0.0-1-6.11.0-1013-azure-ubuntu24.04-arm64
     - sha256:98267f1a17bf49999d031a43c1a79b0de9cdb9841551598c3d5aad9acef97a12
   * -
       | 25.04-0.6.0.0-1-6.8.0-1025-oracle-ubuntu22.04-amd64
     - sha256:c65b30f0b0d8b23ff012b263b5891e37050366e81789db0c9f7301460fde11e7
   * -
       | 25.04-0.6.0.0-1-6.8.0-1025-oracle-ubuntu22.04-arm64
     - sha256:cf486edcacd48e432f68b9925121c8fd92b7e0f0143a8998e743a4e463b62534
   * -
       | 25.04-0.6.0.0-1-6.8.0-1025-oracle-ubuntu24.04-amd64
     - sha256:8bc97407fdd1aab84d2e9d92b296a42c3c2538f180033a9b085e78e8b57a651f
   * -
       | 25.04-0.6.0.0-1-6.8.0-1025-oracle-ubuntu24.04-arm64
     - sha256:136af4f518fe3d6bc851aacd0bb3a3800fedd810179a76120cbb695b34425304
   * -
       | 25.04-0.6.0.0-1-6.8.0-1027-azure-ubuntu22.04-amd64
     - sha256:81c885887b905ff9d2d130476db7be5098240b6d332239fc7c0af73c2d416b02
   * -
       | 25.04-0.6.0.0-1-6.8.0-1027-azure-ubuntu22.04-arm64
     - sha256:dbbfb53e4c90bc3ebf7107b372a917f887ecd1caf7d31a9d2c31387314d909ce
   * -
       | 25.04-0.6.0.0-1-6.8.0-1027-nvidia-ubuntu22.04-amd64
     - sha256:bd0b95849099901f8a87547a4697f7c583133b2c4fab00e3fdc1c52cdbe949cc
   * -
       | 25.04-0.6.0.0-1-6.8.0-1027-nvidia-ubuntu22.04-arm64
     - sha256:c586523d78d7f6e68c0541615bc333d7d77f7f072717df65e5bb157492a7976a
   * -
       | 25.04-0.6.0.0-1-6.8.0-1028-aws-ubuntu22.04-amd64
     - sha256:8a200cb4802748cd0d4ccb16a427124eb42fd2326f6f047fb48a8c4ba42c7542
   * -
       | 25.04-0.6.0.0-1-6.8.0-1028-aws-ubuntu22.04-arm64
     - sha256:ffe343a6f64fcd664b34d679b3d7fc0c267db1930022ad9e5653d5500ed5916f
   * -
       | 25.04-0.6.0.0-1-6.8.0-1028-aws-ubuntu24.04-amd64
     - sha256:0eb532564c81e48bcef857db923632d2358c9e5bce942f5c1b9118694d6d9fa5
   * -
       | 25.04-0.6.0.0-1-6.8.0-1028-aws-ubuntu24.04-arm64
     - sha256:501e73c273039ef377656990255fa96bb52d9688c9fa68d1cc0500d2af0ab8dd
   * -
       | 25.04-0.6.0.0-1-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:93878f535f9366b93317e730a7759c0712bbf56f63751afae021102d6347a5b9
   * -
       | 25.04-0.6.0.0-1-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:9218ced6597573f81a097b226c0fd8b70b5edba4fc8b28813df850a06919358c
   * -
       | 25.04-0.6.0.0-1-ubuntu22.04-amd64
     - sha256:370cc5975b02f1fb29f17ee468829547f4ebec95f31ffbcbe2a2749f28e09d9e
   * -
       | 25.04-0.6.0.0-1-ubuntu22.04-arm64
     - sha256:cfc7dde518a899d094712aa433b217d0dea34d28356f6c708910f46bef155258
   * -
       | 25.04-0.6.0.0-1-ubuntu24.04-amd64
     - sha256:f19c4ff6eea3918c6dc215fb1aa1521d1686aa375453bad4b07752c9c6740bf2
   * -
       | 25.04-0.6.0.0-1-ubuntu24.04-arm64
     - sha256:7b3982264ad96330a22554f1feec8ca5e0f18ab3393be976cc765a8ce42102b6

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.0.0-1-rhcos4.13-amd64
       | 25.04-0.6.0.0-1-rhcos4.14-amd64
       | 25.04-0.6.0.0-1-rhcos4.15-amd64
       | 25.04-0.6.0.0-1-rhcos4.16-amd64
       | 25.04-0.6.0.0-1-rhcos4.17-amd64
       | 25.04-0.6.0.0-1-rhcos4.18-amd64
     - sha256:770016a0308f1f38a06ab4dab861bb670141cebf474c44eb5cff1b5736bcec66
   * -
       | 25.04-0.6.0.0-1-rhcos4.13-arm64
       | 25.04-0.6.0.0-1-rhcos4.14-arm64
       | 25.04-0.6.0.0-1-rhcos4.15-arm64
       | 25.04-0.6.0.0-1-rhcos4.16-arm64
       | 25.04-0.6.0.0-1-rhcos4.17-arm64
       | 25.04-0.6.0.0-1-rhcos4.18-arm64
     - sha256:c0828f7bce91d3a5c684958ce3a6bd5cc203327c03e67076c01c8a098171521f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.0.0-1-rhel8.10-amd64
       | 25.04-0.6.0.0-1-rhel8.6-amd64
       | 25.04-0.6.0.0-1-rhel8.8-amd64
       | 25.04-0.6.0.0-1-rhel8.9-amd64
     - sha256:7c3d37fa50cbb52dc0aa0216bbe080e3106859bb79557170c1741e6a2d3ee02e
   * -
       | 25.04-0.6.0.0-1-rhel8.10-arm64
       | 25.04-0.6.0.0-1-rhel8.6-arm64
       | 25.04-0.6.0.0-1-rhel8.8-arm64
       | 25.04-0.6.0.0-1-rhel8.9-arm64
     - sha256:4fcafdd8b26e713e0e0bf725b03348f408c9f248cb522de64ade9ddc4130fec4
   * -
       | 25.04-0.6.0.0-1-rhel9.0-amd64
       | 25.04-0.6.0.0-1-rhel9.2-amd64
       | 25.04-0.6.0.0-1-rhel9.3-amd64
       | 25.04-0.6.0.0-1-rhel9.4-amd64
       | 25.04-0.6.0.0-1-rhel9.5-amd64
     - sha256:3ad8795e69af9b23b2a451f235a988b18df62e1ff78c43984fd14c04c669a4d9
   * -
       | 25.04-0.6.0.0-1-rhel9.0-arm64
       | 25.04-0.6.0.0-1-rhel9.2-arm64
       | 25.04-0.6.0.0-1-rhel9.3-arm64
       | 25.04-0.6.0.0-1-rhel9.4-arm64
       | 25.04-0.6.0.0-1-rhel9.5-arm64
     - sha256:e4b07c77f0c4734419ad81189f069a8d65b352eef2f290f204b352675dc769df

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.0.0-1-sles15.6-amd64
     - sha256:4d4b15f0ee1993b83a834601e09cd1554bb34f6767be1300b76817436924261c
   * -
       | 25.04-0.6.0.0-1-sles15.6-arm64
     - sha256:3df01c01688f03c453c2df14889d2464f1c4f0ad24b96fe3849c39efb3758d9e