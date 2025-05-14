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
     - v25.4.0-rc.2
     - sha256:59ce50970650cc9063ce21a6afc631f548f5e168c5eaa7e5b66be0cd14444821
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
     - network-operator-25.4.0-rc.2
     - sha256:a043115731240a55cae1f3ddf5c2593d1f004491e6782427f91254cdd0eaf397
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-rc.2
     - sha256:542b05e4b9924ba5d90b499b12758b8089bb5317bd3142cb7c40fc604af9d0a5
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-rc.2
     - sha256:811d521ad3e95575c64edbc80b205c815dad7b2d83ac4d381875e4bd586126b8
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
     - v1.0.3
     - sha256:353ab27f5f5fba08197cbe8968222e1c115431cc1b9b8d8445f1facb3c3c4d7b
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v1.0.3
     - sha256:0e8478898e0b30aec13030b11081b205308666c2a9c5c5bf2c00121079901b41
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
     - 25.04-0.6.1.0-1


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-1-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:81a8df3a7439b7109cbffb7537b9cd4a4b92281be9db083f9491acba50afb7ae
   * -
       | 25.04-0.6.1.0-1-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:202fc8712a6bde4fe0ace522f44c341e4933458ae26a2a93fb5fdca5df619b13
   * -
       | 25.04-0.6.1.0-1-6.11.0-1003-nvidia-ubuntu24.04-amd64
     - sha256:09f3af4ee1e2cc8ca1ff57e2bab0c5890a8dbf2d9005183034c03182f36339a4
   * -
       | 25.04-0.6.1.0-1-6.11.0-1003-nvidia-ubuntu24.04-arm64
     - sha256:64e362da3ed4120eb69e9ce4d1507462efc804e513a1f39c6867b3735fee4c5c
   * -
       | 25.04-0.6.1.0-1-6.11.0-1014-azure-ubuntu24.04-amd64
     - sha256:2534e7988a78b61b95d32dd0da94259573bc8e75d75d83f6e43d3a533aa10259
   * -
       | 25.04-0.6.1.0-1-6.11.0-1014-azure-ubuntu24.04-arm64
     - sha256:e61d9d8d7edaa1977795547a0a5420221741fb8db6db09b59c2b5dbeed96ec15
   * -
       | 25.04-0.6.1.0-1-6.8.0-1025-oracle-ubuntu22.04-amd64
     - sha256:5e2abb51382c633b2d82449861d37d5efe0de47a361842a469f0f354688e2d33
   * -
       | 25.04-0.6.1.0-1-6.8.0-1025-oracle-ubuntu22.04-arm64
     - sha256:d80aa867501e04a157795355b840ce920c87f8713e8f84c933164a8e5cb40a3b
   * -
       | 25.04-0.6.1.0-1-6.8.0-1025-oracle-ubuntu24.04-amd64
     - sha256:e8f5ab19b4ac5b274209d3818613519d081c6d81769cc05de97d1a0d5afff406
   * -
       | 25.04-0.6.1.0-1-6.8.0-1025-oracle-ubuntu24.04-arm64
     - sha256:bc4640f7d4ebd60c20a5fa0946402e4a1b5cceb183458b6cff85b4f79e4e6446
   * -
       | 25.04-0.6.1.0-1-6.8.0-1027-nvidia-ubuntu22.04-amd64
     - sha256:ef7136f15236d86ce2d2afb44a617b034d8a0cd89b5ead5c228f463aed1988d7
   * -
       | 25.04-0.6.1.0-1-6.8.0-1027-nvidia-ubuntu22.04-arm64
     - sha256:b274f796ca962e9d5d77070921fd2ef4d90bdad5836d0e2eb7166d3f4615983a
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-aws-ubuntu22.04-amd64
     - sha256:e2b2a35774214360add41f8a103b246d094134f985593a5f11f1bf0d9073b9ea
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-aws-ubuntu22.04-arm64
     - sha256:c26b099361215676839766ab61519a88ee85bccd48fb3f0d294725d3cd8dad95
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-aws-ubuntu24.04-amd64
     - sha256:47c75483c449f0b24dbe6735c01df24369027f29f31a52232a3cb53074df0448
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-aws-ubuntu24.04-arm64
     - sha256:10fa7493e692e40b8ee17fac17a28544e57c3c52cdec4f0138528e09a9314dd5
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-azure-ubuntu22.04-amd64
     - sha256:c3d455a05c76d8fd5ae13b436e2c6b57ea1d6d2a859759309e107bde083a458b
   * -
       | 25.04-0.6.1.0-1-6.8.0-1028-azure-ubuntu22.04-arm64
     - sha256:2aaec695a1f13d567c65a3767d0780fc0ae6f14ceb8593a64a90f9bc55401b76
   * -
       | 25.04-0.6.1.0-1-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:2b13d754008453cb04010662b2a91e18b3fbbcfba09983cd9a52e5b0f56a7372
   * -
       | 25.04-0.6.1.0-1-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:86a079e80e429458ce980de368e1cfe5dd3b7006372c7eaa8058eec93c3b42e8
   * -
       | 25.04-0.6.1.0-1-ubuntu22.04
     - sha256:19009926bc08df1b6b20211e758f8629e1d0bd365d7802c9df6699232d9a2eb1
   * -
       | 25.04-0.6.1.0-1-ubuntu22.04-amd64
     - sha256:a57c42e53debbc36767c36c0705d7541046a6e2166b32109a71ed1793ace27fc
   * -
       | 25.04-0.6.1.0-1-ubuntu22.04-arm64
     - sha256:cb1ac71cb1aae6a2ae83d4b914eb51ae62a72751a7c6589799870a66b8c96418
   * -
       | 25.04-0.6.1.0-1-ubuntu24.04
     - sha256:a9f30ea19de68890755a3ff678e41e4d8b88536cabbe74c5ec30109f9ea1b69f
   * -
       | 25.04-0.6.1.0-1-ubuntu24.04-amd64
     - sha256:0d8a1cd876a858175c7f6e105ef33f83f8f99bbd273427c47bb8c6c5b7b4feee
   * -
       | 25.04-0.6.1.0-1-ubuntu24.04-arm64
     - sha256:c222c59f8c17c4dcb5f7586e2fb4318c47ff3caf092d612b9d1097511fd47763

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-1-rhcos4.13-amd64
       | 25.04-0.6.1.0-1-rhcos4.14-amd64
       | 25.04-0.6.1.0-1-rhcos4.15-amd64
       | 25.04-0.6.1.0-1-rhcos4.16-amd64
       | 25.04-0.6.1.0-1-rhcos4.17-amd64
       | 25.04-0.6.1.0-1-rhcos4.18-amd64
     - sha256:e6b86d2d61a01dfb16b0a023516c73b7e4860bcdbf4e3ac874d083f7f46bf2b6
   * -
       | 25.04-0.6.1.0-1-rhcos4.13-arm64
       | 25.04-0.6.1.0-1-rhcos4.14-arm64
       | 25.04-0.6.1.0-1-rhcos4.15-arm64
       | 25.04-0.6.1.0-1-rhcos4.16-arm64
       | 25.04-0.6.1.0-1-rhcos4.17-arm64
       | 25.04-0.6.1.0-1-rhcos4.18-arm64
     - sha256:5b2a0ed63bfe5315e6ceeba6133da086ae406fb30d55caf8791044a8e245c7fd
   * -
       | 25.04-0.6.1.0-1-rhcos4.18
     - sha256:5b85a98cd0095a9a268abf16258e9f69f8b386e0adaa3cb0ec4a9d1327d4ea52

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-1-rhel8.10
     - sha256:8bf7f79ddc25485bb6f735606a971e1b23dee46f40a98141f4f245a09c9f07fd
   * -
       | 25.04-0.6.1.0-1-rhel8.10-amd64
       | 25.04-0.6.1.0-1-rhel8.6-amd64
       | 25.04-0.6.1.0-1-rhel8.8-amd64
       | 25.04-0.6.1.0-1-rhel8.9-amd64
     - sha256:43cee386a2353b818b24ecaac485e26e1ab38db125638af56392924bc10e4a44
   * -
       | 25.04-0.6.1.0-1-rhel8.10-arm64
       | 25.04-0.6.1.0-1-rhel8.6-arm64
       | 25.04-0.6.1.0-1-rhel8.8-arm64
       | 25.04-0.6.1.0-1-rhel8.9-arm64
     - sha256:5180421705bd40b14650c673730814607c191fe0c8c6b205df1d9ac559fdf089
   * -
       | 25.04-0.6.1.0-1-rhel9.0-amd64
       | 25.04-0.6.1.0-1-rhel9.2-amd64
       | 25.04-0.6.1.0-1-rhel9.3-amd64
       | 25.04-0.6.1.0-1-rhel9.4-amd64
       | 25.04-0.6.1.0-1-rhel9.5-amd64
     - sha256:2856f10636041e6c9bb8d1a2f62c5391d4fc77f70d900556e9bc62e1f88e3bdf
   * -
       | 25.04-0.6.1.0-1-rhel9.0-arm64
       | 25.04-0.6.1.0-1-rhel9.2-arm64
       | 25.04-0.6.1.0-1-rhel9.3-arm64
       | 25.04-0.6.1.0-1-rhel9.4-arm64
       | 25.04-0.6.1.0-1-rhel9.5-arm64
     - sha256:800497ecc31f59ff0ef4d475f84bbef73e8cd5ba37fa79aea333ae043e672b45
   * -
       | 25.04-0.6.1.0-1-rhel9.5
     - sha256:3a9c5d3ade18e1224cb6b769e7571a75b95ea2b11b40f81d18d16100f13ad30d

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-1-sles15.6
     - sha256:a0bcf41ae980ed42e025e91381e7936109d1db8273e7c3ff3b4f7263f12022bc
   * -
       | 25.04-0.6.1.0-1-sles15.6-amd64
     - sha256:7e634b28e2ad63ab20ec86118f0b7c8a5d42b0c217f66b77a2b1125696d0637e
   * -
       | 25.04-0.6.1.0-1-sles15.6-arm64
     - sha256:fa60f6022cc4b28ef7499cd21a8dd4373a3a33e880fab64a5c74404a309aa1f2