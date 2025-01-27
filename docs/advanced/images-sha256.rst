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
     - v25.1.0-beta.3
     - sha256:a9c46141dc62b201c36ff9f7696c88a23fe310bcbeda6fa0e15fba07cc62da94
   * - ghcr.io/mellanox
     - network-operator-init-container
     - v0.0.3
     - sha256:67e93ccf3ecb61f17597567faf0f72e1b8ddcf73c5d7440baeadcc1cb6bb811b
   * - ghcr.io/mellanox
     - k8s-rdma-shared-dev-plugin
     - v1.5.2
     - sha256:9f468fdc4449e65e4772575f83aa85840a00f97165f9a00ba34695c91d610fbd
   * - ghcr.io/mellanox
     - ib-kubernetes
     - v1.1.0
     - sha256:100e6addf99d5b44e81cb3aa8d2fc892fced1de3183190931961b92ee924207b
   * - ghcr.io/mellanox
     - ipoib-cni
     - v1.2.0
     - sha256:81646c07e27ce1df2603050a75dd267f264685fdc64c285eca3925ae98ed5392
   * - ghcr.io/mellanox
     - nvidia-k8s-ipam
     - v0.2.0
     - sha256:47e1bb84ac97f9af49f97b49c2de44b4ba82b890b487880edc5c9adf86a176f7
   * - ghcr.io/mellanox
     - nic-feature-discovery
     - v0.0.1
     - sha256:92dda9434519de39be0f94c80787766e3399e8b238d14839360aff4d6232a09b
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.16.5-doca2.6.0-host
     - sha256:866971717cb2683f2742d265c9793f93242f55b6e8bd9a0a88a558869f9b9cd7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-25.1.0-beta.3
     - sha256:e4a8e6ab2dcc5b44b161cb6690060722bd1c92c8c33e663ae3f0866b812fd65a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.1.0-beta.3
     - sha256:9c947070de1c05921ddaaa0287634f4af44f10528e46a6dfb88ac1b474dfceb0
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.1.0-beta.3
     - sha256:80522ed044b0014cc8b85c0df413f0aa4814b5962adbcad49a6dd9bf2faf96db
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-network-device-plugin
     - v3.8.0
     - sha256:77e3b946c20f45728dfa6dd1d115356de5ea317f91cddfd1540b7121550f66dc
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-cni
     - v2.8.1
     - sha256:749822bef050882a8e7a466605f83b6a634e8e0e4200ceea182e890b4b3b37cd
   * - ghcr.io/k8snetworkplumbingwg
     - ib-sriov-cni
     - v1.1.1
     - sha256:0b1a0de216f46e667d9a326cdf2391fa1e4b4e40d911dcb266faae4464d8e1ff
   * - ghcr.io/k8snetworkplumbingwg
     - plugins
     - v1.5.0
     - sha256:fe8efec170b498922b3367aabbb6dc57966eb930c8aa086a5f5fb369cefa6064
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
     - v0.37.0
     - sha256:d088e47f181007fe4823f0384ebae071950d105cd36c9187f9d06fd815288990
   * - ghcr.io/k8snetworkplumbingwg
     - rdma-cni
     - v1.2.0
     - sha256:220af56ef977c63f93ea3eb9cec6cf3ddc363147b9d1053c742b7c793a70400e
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v0.1.15
     - sha256:079fdaf9a81be03292a74d50f63d1031d4595f7f2353040781044cf3808dcdea
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v0.1.15
     - sha256:f23eeef38844eadfab4300f284d034671c37ebe224a9115b42a8778396a9c26f
   * - ghcr.io/mellanox
     - maintenance-operator
     - v0.1.1
     - sha256:7a9bb354429ab982a056088c1bd1d221063502970a4d5590602b7f133f5f531c


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
     - 25.01-0.3.9.0-0


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.3.9.0-0-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:8545c2b58559ba081da0941ad7e4b5d22f43682acd7a8c956ec7e79c574400ea
   * -
       | 25.01-0.3.9.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:9f47d41f9ef66741617aab2cac63be64cee8630bfa8fc46ccfb71666aafbeeb4
   * -
       | 25.01-0.3.9.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:03be3ffcf8cd4149a191f9bf063b7188d3e55f2142d1e1d60a8dfe6a532652a7
   * -
       | 25.01-0.3.9.0-0-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:5e5720aced7e721f2653c9826339db4db980d9d5b26821595e61418e6cb5fcd3
   * -
       | 25.01-0.3.9.0-0-6.8.0-1018-oracle-ubuntu22.04-amd64
     - sha256:2b23dc1ad27b844e4c3619b81fede2bf63a2f1803a2b2383783f823dcf3cd0c8
   * -
       | 25.01-0.3.9.0-0-6.8.0-1018-oracle-ubuntu22.04-arm64
     - sha256:18f7b1e10b33165b29a679a9f889e751f1535a3984f1b66aecacff343e050a82
   * -
       | 25.01-0.3.9.0-0-6.8.0-1018-oracle-ubuntu24.04-amd64
     - sha256:e071b59d230880e79ac4cee27a0f637aa1ef60276ba6c79c4533e8e9953b1143
   * -
       | 25.01-0.3.9.0-0-6.8.0-1018-oracle-ubuntu24.04-arm64
     - sha256:4e42aabe25ab4aced1aee80cac4ca37f331f5522dacca479224490747e3fc341
   * -
       | 25.01-0.3.9.0-0-6.8.0-1020-azure-ubuntu22.04-amd64
     - sha256:e43eb1652ea2a395a03f3c08bcae39208d9d1a2a614091006cb144679edb7366
   * -
       | 25.01-0.3.9.0-0-6.8.0-1020-azure-ubuntu22.04-arm64
     - sha256:7e73c0785e724fbec1fc22ef94653a0278049e46959fa2fb697c60bb9e15532d
   * -
       | 25.01-0.3.9.0-0-6.8.0-1020-azure-ubuntu24.04-amd64
     - sha256:4fe9306a226c5887b54f29288ba35ea5afdc65fd9464d92f5ab6ebdc7cb35b33
   * -
       | 25.01-0.3.9.0-0-6.8.0-1020-azure-ubuntu24.04-arm64
     - sha256:5195f0d7bdced2a5862f8b53aa6b0470ea8d39918bd44ce77c2e254c49f2edb1
   * -
       | 25.01-0.3.9.0-0-6.8.0-1021-aws-ubuntu22.04-amd64
     - sha256:4c0259c1ba00c8527ce402b528efe6843f6bd37aa1a728de3828ba970ee84b6c
   * -
       | 25.01-0.3.9.0-0-6.8.0-1021-aws-ubuntu22.04-arm64
     - sha256:9a240aa55ce14a57c36e0f617d7923fd0860c3dc2678bdb8cc239701dce29442
   * -
       | 25.01-0.3.9.0-0-6.8.0-1021-aws-ubuntu24.04-amd64
     - sha256:202af9a398a9d1af1dc57964529830a8027a662685fd792318f562189b250ecb
   * -
       | 25.01-0.3.9.0-0-6.8.0-1021-aws-ubuntu24.04-arm64
     - sha256:5f3266dbfc3fdc03097969847c54122e7d4989bf8c2e567e1bc018a2bced7438
   * -
       | 25.01-0.3.9.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:e61c1a0771232658cade1fd3e3971c495a1a20d9875a0c392dea3d7a15f1e82a
   * -
       | 25.01-0.3.9.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:b26c7ed83d355f52c0815b083f278fc89c93d45bb50a06677646cdb013f4c622
   * -
       | 25.01-0.3.9.0-0-ubuntu22.04-amd64
     - sha256:dab74b38c3364972e6165920688c27699bac386f9dc432f11e6268bbce1def8f
   * -
       | 25.01-0.3.9.0-0-ubuntu22.04-arm64
     - sha256:f29a377304b2d601ed88ec44585a54e99d5da383bd67dcb608833b18c9770485
   * -
       | 25.01-0.3.9.0-0-ubuntu24.04-amd64
     - sha256:b4afaabab60956d3b6bfd500c0c8ad7aaec97ee89a0cd23994fbfd49bd46a96f
   * -
       | 25.01-0.3.9.0-0-ubuntu24.04-arm64
     - sha256:90c65bc28ad186909b44ab141c02ebecf823c98dc3d87da89393549021f9881e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.3.9.0-0-rhcos4.13-amd64
       | 25.01-0.3.9.0-0-rhcos4.14-amd64
       | 25.01-0.3.9.0-0-rhcos4.15-amd64
       | 25.01-0.3.9.0-0-rhcos4.16-amd64
       | 25.01-0.3.9.0-0-rhcos4.17-amd64
     - sha256:aab1789f03ebb6379ad201a50656c87560d18f9e1a3186a6afd5d7810bc4699e
   * -
       | 25.01-0.3.9.0-0-rhcos4.13-arm64
       | 25.01-0.3.9.0-0-rhcos4.14-arm64
       | 25.01-0.3.9.0-0-rhcos4.15-arm64
       | 25.01-0.3.9.0-0-rhcos4.16-arm64
       | 25.01-0.3.9.0-0-rhcos4.17-arm64
     - sha256:904c4f2165bfb5d647f10d6c4ab23a95284bc0ead5bf4ba3e20b90557ea62166

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.3.9.0-0-rhel8.10-amd64
       | 25.01-0.3.9.0-0-rhel8.6-amd64
       | 25.01-0.3.9.0-0-rhel8.8-amd64
       | 25.01-0.3.9.0-0-rhel8.9-amd64
     - sha256:74d0e44b934689beb16edd17bf3d79184952b0688550d4d9c2d2b7c187ac453e
   * -
       | 25.01-0.3.9.0-0-rhel8.10-arm64
       | 25.01-0.3.9.0-0-rhel8.6-arm64
       | 25.01-0.3.9.0-0-rhel8.8-arm64
       | 25.01-0.3.9.0-0-rhel8.9-arm64
     - sha256:76ca7adc7ccc7144b057d4f8da352234a7edd650ba019ee6e20423733b2c379a
   * -
       | 25.01-0.3.9.0-0-rhel9.0-amd64
       | 25.01-0.3.9.0-0-rhel9.2-amd64
       | 25.01-0.3.9.0-0-rhel9.3-amd64
       | 25.01-0.3.9.0-0-rhel9.4-amd64
       | 25.01-0.3.9.0-0-rhel9.5-amd64
     - sha256:0a951b0f9ae8063aec2b69be67d8d744decb49d9552e639fb0308d5e29c4cfc3
   * -
       | 25.01-0.3.9.0-0-rhel9.0-arm64
       | 25.01-0.3.9.0-0-rhel9.2-arm64
       | 25.01-0.3.9.0-0-rhel9.3-arm64
       | 25.01-0.3.9.0-0-rhel9.4-arm64
       | 25.01-0.3.9.0-0-rhel9.5-arm64
     - sha256:b884ee18c7a67a3b8224d6ee43aa8a3ad47b9e2926843390d8fc1c0ae0371d51

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.3.9.0-0-sles15.6-amd64
     - sha256:250f2da00999588fd4c95729bef7f4ef317b1215f9d500f6c70d49d76cb125a1
   * -
       | 25.01-0.3.9.0-0-sles15.6-arm64
     - sha256:1933b1664250738b4b8d727761b9dae5aeaeb987d388cbdbaa8b98e8a55856b2