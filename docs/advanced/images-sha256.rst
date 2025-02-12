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
     - v25.1.0-rc.1
     - sha256:83e12e2182000b33cf730db54c189c4e6d05c06df45935f99cf4e2777e1c7de2
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
     - network-operator-25.1.0-rc.1
     - sha256:0fc86c55c16526d44f489e39cdab325c821fd9f278a8873dc99504911312fbe6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.1.0-rc.1
     - sha256:a57dde2d2705b2cab4b69d7fe70e3fb46be0ac3a1d2e0c123c25f6daca8219be
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.1.0-rc.1
     - sha256:8ac18015328b4914d645f57dc96454415270a17ee073b44a6a83eed3b15a98fe
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
     - v0.2.0
     - sha256:47d87129d967a5f9d947915b414931e6ba7d42be45186123b531d760b93c6306


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
     - 25.01-0.5.4.0-0


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.5.4.0-0-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:25b8a08734587b7061a33c3da30b64ea843bc9c5b849b5fea9519d8111ba4988
   * -
       | 25.01-0.5.4.0-0-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:aef1525ee306d9dbbdb571f34502150db8c6217e36413071a863125e886ea57d
   * -
       | 25.01-0.5.4.0-0-ubuntu22.04-amd64
     - sha256:40e0f4effe05d84d97ad331765129f7ca7e4013ea3c359b7275366aabf91048b
   * -
       | 25.01-0.5.4.0-0-ubuntu22.04-arm64
     - sha256:84150cb2d1ac8e343489b7fd46eb59320de5b7deaa014f6255d16763bd7f5098
   * -
       | 25.01-0.5.4.0-0-ubuntu24.04-amd64
     - sha256:a3c491f283344373980c55be8a7b6e63c5e119a4509152c75121326e22eef2c6
   * -
       | 25.01-0.5.4.0-0-ubuntu24.04-arm64
     - sha256:3d914105e980f2aa7a0b526bd92f162e39f5a75559b49e663f4df6c8671b0282

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.5.4.0-0-rhcos4.13-amd64
       | 25.01-0.5.4.0-0-rhcos4.14-amd64
       | 25.01-0.5.4.0-0-rhcos4.15-amd64
       | 25.01-0.5.4.0-0-rhcos4.16-amd64
       | 25.01-0.5.4.0-0-rhcos4.17-amd64
     - sha256:f5fe09d79b86fa76bac26ae0d24813887ab9c7549814edc1392d4c0ade0123e3
   * -
       | 25.01-0.5.4.0-0-rhcos4.13-arm64
       | 25.01-0.5.4.0-0-rhcos4.14-arm64
       | 25.01-0.5.4.0-0-rhcos4.15-arm64
       | 25.01-0.5.4.0-0-rhcos4.16-arm64
       | 25.01-0.5.4.0-0-rhcos4.17-arm64
     - sha256:2a91b449aa0c7b44b8e86391e4846381287688d51cc45049cb3bf874e2da826a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.5.4.0-0-rhel8.10-amd64
       | 25.01-0.5.4.0-0-rhel8.6-amd64
       | 25.01-0.5.4.0-0-rhel8.8-amd64
       | 25.01-0.5.4.0-0-rhel8.9-amd64
     - sha256:b20fdcbf8a9b626d5653470b0254f6dd6880087b26adf2da5a611efd0c7e5d50
   * -
       | 25.01-0.5.4.0-0-rhel8.10-arm64
       | 25.01-0.5.4.0-0-rhel8.6-arm64
       | 25.01-0.5.4.0-0-rhel8.8-arm64
       | 25.01-0.5.4.0-0-rhel8.9-arm64
     - sha256:8c132819ed6f4b4f5f684d7d416daef5ad52a42f1215d928ac8e439212417cda
   * -
       | 25.01-0.5.4.0-0-rhel9.0-amd64
       | 25.01-0.5.4.0-0-rhel9.2-amd64
       | 25.01-0.5.4.0-0-rhel9.3-amd64
       | 25.01-0.5.4.0-0-rhel9.4-amd64
       | 25.01-0.5.4.0-0-rhel9.5-amd64
     - sha256:43d2a51d10d5d00e0e995f6c7827ee005a443ae93a86c1ef4922a0207637cef7
   * -
       | 25.01-0.5.4.0-0-rhel9.0-arm64
       | 25.01-0.5.4.0-0-rhel9.2-arm64
       | 25.01-0.5.4.0-0-rhel9.3-arm64
       | 25.01-0.5.4.0-0-rhel9.4-arm64
       | 25.01-0.5.4.0-0-rhel9.5-arm64
     - sha256:39536e5a26430474ab550cec1e7b19e1b75426923441f818d4d8c638e64dd708

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.5.4.0-0-sles15.6-amd64
     - sha256:237cbd23de5cc93aaad7a63831dd9655e52aef8417468fa8d0cf178d12f80d43
   * -
       | 25.01-0.5.4.0-0-sles15.6-arm64
     - sha256:a29b564ef23ca154d92892d6662e4a6ba4ace407b2f70a07100c807e5bc80c34