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
     - v25.4.0-rc.3
     - sha256:079126a18048667e4f0cfc43fcf4195443d053c5612a342dfdb34914b80d03c0
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
     - network-operator-25.4.0-rc.3
     - sha256:9ea8538ed3753222d058d9c096892b758414d5f41e2fb8344e4a6d3e88136e7b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-rc.3
     - sha256:ba2c58118f3b3d0b578c2c2069905e63336a161c5f217335d365c1f679fc1a12
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-rc.3
     - sha256:8c12b637827410561c9f2c53d5f90411f0c6eb17631926f990e76df267d6822b
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
     - 25.04-0.6.1.0-2


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:2410568bcac94ed18fc4fadc596ff8b7b38602afeaef5d761117ae875d8b69eb
   * -
       | 25.04-0.6.1.0-2-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:b2dc16d8ca360a6f17694d9bbe68d2cb8217d05877069068d0bd2eb71f4e5e33
   * -
       | 25.04-0.6.1.0-2-6.11.0-1014-azure-ubuntu24.04-amd64
     - sha256:a33c333eb12d76d40801e83284af0beb0ca90264722dc1096d77ad6d86df54ac
   * -
       | 25.04-0.6.1.0-2-6.11.0-1014-azure-ubuntu24.04-arm64
     - sha256:0e717a9ced009c3798a9f46daca646ac6922c46f84c3c34914b55e7e5ff6c36c
   * -
       | 25.04-0.6.1.0-2-6.8.0-1025-oracle-ubuntu22.04-amd64
     - sha256:59c46cd0061f5c87c7ee736f82116c38ab734eda3610fed3575493712476b719
   * -
       | 25.04-0.6.1.0-2-6.8.0-1025-oracle-ubuntu22.04-arm64
     - sha256:3355578f4383e6c252038f4fb26e1b053ba2b3e1b2144bfff26ded4054566efd
   * -
       | 25.04-0.6.1.0-2-6.8.0-1026-oracle-ubuntu24.04-amd64
     - sha256:7b4aa05954c3dfda02ebeacd70c4ef5c74ddaa5a952aeb06dc5a7130eb393eac
   * -
       | 25.04-0.6.1.0-2-6.8.0-1026-oracle-ubuntu24.04-arm64
     - sha256:8a94e1509f8ce6bd26be9f9f4fab98dd2a1535a0efac9b4bd1aa34aa630a18a0
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-azure-ubuntu22.04-amd64
     - sha256:435aca1744a8bd436d5dcd030357d76454313dcfbed83e8136658562ab607948
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-azure-ubuntu22.04-arm64
     - sha256:37da7ba7a44c2516dcb8bbec44f124f37b597d58631b06acc4fb3a81e44b8c23
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-nvidia-ubuntu22.04-amd64
     - sha256:13fbe5d4ab7d6604382c797d555277b4f4da01411f64e2763b5de6da73dace2d
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-nvidia-ubuntu22.04-arm64
     - sha256:f10b7ee8b3b06f2512f43f4f3feae00d186005fb4acb43eca5f5e61aea6a4489
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu22.04-amd64
     - sha256:d04b62a02470467f2832c5925d23a74de1d9a214c7308bcb02cc692c20f8ce0b
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu22.04-arm64
     - sha256:50a416ebbde3ee801c83d0b500b8b9dff6db924b85613dc8cc6ede7385a1dd3f
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu24.04-amd64
     - sha256:b7a4819d30e25867a37c9bab4a3e7b23d3d6962f265c17fd1ef31799328d323f
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu24.04-arm64
     - sha256:e72030c760add213d268bb8fd28851b6d149a3fef3a04a342befa1c51c279f51
   * -
       | 25.04-0.6.1.0-2-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:dce95980169e469ab235c8419d318c55fb0ef5b8fd6c17773669a71e7b766dcf
   * -
       | 25.04-0.6.1.0-2-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:50bca7f9910a15baa081445f62e5a02f3a04f376d28301fc3117f3163f7935cd
   * -
       | 25.04-0.6.1.0-2-ubuntu22.04
     - sha256:b3561383f61423fc5e312fb0bfdd30345cbe32e8c404482c329ca9fe929e9905
   * -
       | 25.04-0.6.1.0-2-ubuntu22.04-amd64
     - sha256:cb436254179a539a33c31b97c3eb84f78011e5eba3b7a49780245fed233076cf
   * -
       | 25.04-0.6.1.0-2-ubuntu22.04-arm64
     - sha256:b434c8d20f9fee8c590bb34375da751d25a0d9e249b9f67640264afc2ca54dd3
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04
     - sha256:86122f68639756d7565b0f12368ffe872fa487d09aff874a736c1055e2b22588
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-amd64
     - sha256:c9d12598ab699d29a04d6fadd89fdf0b2515dd5947f414baa704bc20f0d790a8
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-arm64
     - sha256:97c311b6cf9b973b65767b5520cb0a76077837599ecd1b8581c774deb6ae50db

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-rhcos4.13-amd64
       | 25.04-0.6.1.0-2-rhcos4.14-amd64
       | 25.04-0.6.1.0-2-rhcos4.15-amd64
       | 25.04-0.6.1.0-2-rhcos4.16-amd64
       | 25.04-0.6.1.0-2-rhcos4.17-amd64
       | 25.04-0.6.1.0-2-rhcos4.18-amd64
     - sha256:69e6ab6a0249be918f60c1e04fc53a07f280b33563f8edc953806538a9cc3c30
   * -
       | 25.04-0.6.1.0-2-rhcos4.13-arm64
       | 25.04-0.6.1.0-2-rhcos4.14-arm64
       | 25.04-0.6.1.0-2-rhcos4.15-arm64
       | 25.04-0.6.1.0-2-rhcos4.16-arm64
       | 25.04-0.6.1.0-2-rhcos4.17-arm64
       | 25.04-0.6.1.0-2-rhcos4.18-arm64
     - sha256:9bc09051aca763f83cde99ee8909cf989b1d6c5d6ab683fbb1ca441d47f61fdf
   * -
       | 25.04-0.6.1.0-2-rhcos4.18
     - sha256:6bee03b26e7abf7e61b69522ece35e35648c6f4d52a89519bca2407a8c6087b9

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-rhel8.10
     - sha256:9ffc93fa12782ea7bf064d2d3a199072510ceab5d0af18d34ec95b1980c1f733
   * -
       | 25.04-0.6.1.0-2-rhel8.10-amd64
       | 25.04-0.6.1.0-2-rhel8.6-amd64
       | 25.04-0.6.1.0-2-rhel8.8-amd64
       | 25.04-0.6.1.0-2-rhel8.9-amd64
     - sha256:35ff3b173b2694198e57b61720545be67e944c1da18ac004007a5b4e68562adc
   * -
       | 25.04-0.6.1.0-2-rhel8.10-arm64
       | 25.04-0.6.1.0-2-rhel8.6-arm64
       | 25.04-0.6.1.0-2-rhel8.8-arm64
       | 25.04-0.6.1.0-2-rhel8.9-arm64
     - sha256:76529c24ea17e68b89a2c0d4823d66504fa6f53759760a449308fda396574097
   * -
       | 25.04-0.6.1.0-2-rhel9.0-amd64
       | 25.04-0.6.1.0-2-rhel9.2-amd64
       | 25.04-0.6.1.0-2-rhel9.3-amd64
       | 25.04-0.6.1.0-2-rhel9.4-amd64
       | 25.04-0.6.1.0-2-rhel9.5-amd64
     - sha256:4a620bd39bc70928cd6e249855176ced0f4feb585c8c7624c0b9f5a3e57664c9
   * -
       | 25.04-0.6.1.0-2-rhel9.0-arm64
       | 25.04-0.6.1.0-2-rhel9.2-arm64
       | 25.04-0.6.1.0-2-rhel9.3-arm64
       | 25.04-0.6.1.0-2-rhel9.4-arm64
       | 25.04-0.6.1.0-2-rhel9.5-arm64
     - sha256:56a41010b4dbee0dc31e8f9c1467a739241a2d248ed8b5054d4b418f7f79f04d
   * -
       | 25.04-0.6.1.0-2-rhel9.5
     - sha256:861eb503c13cf4246aacefdd5deaa978eddce1cc6bf1d83beb1a7b38a4b2631b

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-sles15.6
     - sha256:18d789efefea306f42a87f08df8cc53075f274abb3ddd5d10da2974eaa0e5a98
   * -
       | 25.04-0.6.1.0-2-sles15.6-amd64
     - sha256:ea2b07942daafa8c08cacfcf8ba64f783a39fd6f8644458952fd582325e4a7f0
   * -
       | 25.04-0.6.1.0-2-sles15.6-arm64
     - sha256:e3389a26293b3f2fa291b87c66f97819325359c61055fa3e360227bcddfe7f07