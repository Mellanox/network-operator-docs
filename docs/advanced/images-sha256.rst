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
     - v25.10.0-rc.1
     - sha256:c9a6fe3116ac62fe5bc966bbb3fc820abab51ed1ab449f7ab892ad7d66117a75
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-rc.1
     - sha256:d64222ace40cd2d17758e749927c07935fb4f750be2c7f3bd2334c2f12aa7ff3
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-rc.1
     - sha256:8e32dc30fb53c2e5861ee99e7cc78e6a76032ed9bb3c3ab2f7aea3a61239983b
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-rc.1
     - sha256:0e8c0127e303713ae8cb19186bf4a3ee64ca427af3524ba5b2b286e0f18b5f69
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-rc.1
     - sha256:0e9e8b7420f8086ffca780c68b4334c605725a9773a870182f098c7ef66174f0
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-rc.1
     - sha256:3abfe39fe3e4c63141a41a186a4c7d1b588ea5a60fd1dfcbfdeb249abe9f1061
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-rc.1
     - sha256:1a164d22941912898555e60e28d55ac3a03ef426001327155ac0b7f86b6401b6
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-rc.1
     - sha256:e0fca0398803a2793690b7aaa4f10ada25025cedf03bc498824407d9b0f4eb09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-rc.1
     - sha256:eab2997b699b7749757d0e63191bbe624d30f194ba20e76d6df38321cf0c6fef
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-rc.1
     - sha256:7bf450ee5741cb39305ba0f50f4b1c041c9cd33190441d9803ccbdcca8918880
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-rc.1
     - sha256:dd9fd88ab1220e1b49e67ce1010dae34fe548ebebe31f1160b09b7472f268e42
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-rc.1
     - sha256:9a492b76122353b3baf78c8988010acaf3402b16b0711f650f9ac4602e521764
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-rc.1
     - sha256:3d5fc8adc8c7f3f6cc6397b446cbb4e12406111e3ec71be21d7b346063a1ace1
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-rc.1
     - sha256:4be87e8f27e93fd8640e716d0ec0757b457045fc46f255b4250c1e4880e26c17
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-rc.1
     - sha256:998a9511fbe083abc25da49937ad5198c1100b37188f72d076ed2a53e9d8b63c
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-rc.1
     - sha256:05b15d7b4e6e254a1f757b613ee1186253abdaf18d8ccc6bb0f7af85483c2aab
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-rc.1
     - sha256:c6e7e92c4c6e1ba69db393c61fd547021fd847bf8221a6f848a4cd1585072e66
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-rc.1
     - sha256:bbbc3ea6e3759fcff4dcfe87a175b59904c0cda6fdefb02324ad0654d681c357
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-rc.1
     - sha256:d4155f006c37021ce08cf023ccfa9eb061aed820aba27e010c4b3d8a1095d2f3
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-rc.1
     - sha256:55ac88beeda9146a8fdac6c6fc7fb05c74ff6c87c0d72d7fd071987af659a169
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-rc.1
     - sha256:90911cdb15f1f4e248c8115d5fd8d434cde9ef00d85352eebee42742db1bd580

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
     - doca3.2.0-25.10-1.2.8.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-5.15.0-161-generic-ubuntu22.04-amd64
     - sha256:f7d359b1ff48a75250c5b909b1dc91ff7d3d31b7366245a533baa02b5b9b3df0
   * -
       | doca3.2.0-25.10-1.2.8.0-0-5.15.0-161-generic-ubuntu22.04-arm64
     - sha256:ca059757016454e1c47675480ecac6610e3b73a145a37245c7ee8c3bd1ee8721
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:78ea34af1f1b3e3cd39ab5314a2593f4748e6a0f5994efd6f96dbc92ba391b47
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:ceaa9499c32d614f212818eb3cfa64ba804c86706ab2b44867a67593891c893f
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1014-azure-ubuntu24.04-amd64
     - sha256:df8acffd730dbc25da8cc75125d91a9b3541058ad1f30dd9483bc3f387b9072a
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1014-azure-ubuntu24.04-arm64
     - sha256:1ef919ab364a7f23c1fbf0b7cf1b92dacd5b77ded95a758f60b4cff575105b7e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-aws-ubuntu24.04-amd64
     - sha256:86e6a51508f5ef0a1ee93346cf1d5cab8ae72ea655580ed283b85516b01ca262
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-aws-ubuntu24.04-arm64
     - sha256:371afa4affaecddd9963fdd93028ddb2a629e74784936db2a1118e65c5426306
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-oracle-ubuntu24.04-amd64
     - sha256:e11934963ac826681d5dfb01b1d4a427c18b2283256f388e1e1dbfdd6a6f791e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-oracle-ubuntu24.04-arm64
     - sha256:d193f0b018d42faeb7138020e074b0cb80da0d36a41056204c0a4c71dfa847bc
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1039-oracle-ubuntu22.04-amd64
     - sha256:feb9165ac3ba4f284fa933eb78bed265bee0f76390a68cc49df206d383049151
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1039-oracle-ubuntu22.04-arm64
     - sha256:3e4ebfafd32bc1fe30857430a0d93847ea7f4e6cf54dbdb7e36247dfe5258f0d
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-aws-ubuntu22.04-amd64
     - sha256:5fc1bf307c47f17bdd2fa116c64e93d6ca0f5d12a3b33c6721f22788d47fa527
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-aws-ubuntu22.04-arm64
     - sha256:cd3b938e071b331b8e3e9cba1adc5612833e23a3c02c6327ec3a4938182a13a5
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:55b598c6dc8a697ec8afd6de002695dede27a4f279c3b207476adf1ff22d9070
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:3eda37de453e31cf35c57e47218a9059b1cbcb83cd44ca4eed57e0e13d60b31e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1042-aws-ubuntu22.04-arm64
     - sha256:3f8e726aec487a6991477624ac86e5e4539bfda24da3a2c9e3e656ddc97b8f40
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1042-nvidia-ubuntu22.04-amd64
     - sha256:939b9a9d7e6bf7afc4d1feb0f71089f730c80c184a971e08038f2e798f8a1f68
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1042-nvidia-ubuntu22.04-arm64
     - sha256:413909f334b3a4f03def455e8d321f200949c3c76ff7e0ae4b537b86a79cb1f2
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-87-generic-ubuntu24.04-amd64
     - sha256:89825e7a4534eef8b33c1caeeafd680455b8ff6dc09435394bed557b66057a81
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-87-generic-ubuntu24.04-arm64
     - sha256:48d7571708e94cee61f2cf9bc4b67e3224f550c17d89f1e0fa74b5af62fa2989
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu22.04-amd64
     - sha256:d061b55c22a17db0c173e93a9f344e0628c7c529449143b834a04c563576bd15
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu22.04-arm64
     - sha256:eaed94ef3bcb1f54ec131a6ed16b5db6e4c78ff2228aaaf29cf3eabe43075c29
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu24.04-amd64
     - sha256:27d224fce213c2a2769ef0a9e4103318939dbbe04db1533ad9070d406196c1c3
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu24.04-arm64
     - sha256:ecaa9db6f70d7ca404d60f67d9e704f96de962fe09b869d96f399c112445590e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.19-amd64
     - sha256:19f2a24b802d65d4cc2100db6361d4aa7b57279d629eca02305eb946955357c0
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.19-arm64
     - sha256:de4f780f6dd559fc514e0c947ed46641aa4b3101e05595babe70d8122063457a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel10.0-amd64
     - sha256:4412c93edbf154c0ece56f61d29901e2eeab60ce16fa94b45f7e32be1f348f40
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel10.0-arm64
     - sha256:1a585128df361910b77fe6d54edea69a487cac0cf5bcb1dde2b5221444cb0423
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.9-amd64
     - sha256:85470b670d530d7d0ab1cb471aeabe91bf38c9ab21faf427d56d9ac483afadbe
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.9-arm64
     - sha256:94269c12b6f74027a2253620d6d1d61d93202a20bf8944122a9630d85248e53b
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.6-amd64
     - sha256:7ecf142d43dd242453471f311cdf9fa1e4d27e707aaebfd323756caf7ed3f47d
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.6-arm64
     - sha256:463a4edf892175559397aed64a83bef6c4fd77fe40b3d7e259897c421d4c6a91

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-sles15.7-amd64
     - sha256:7383232338713ddb6c4156b2e67a217b3c819b0c03f590c703b657f37166ce46
   * -
       | doca3.2.0-25.10-1.2.8.0-0-sles15.7-arm64
     - sha256:d78dea23c989a354a77d04a54f7a1efd391bd657ae33bc939b564f600e09db78


=====================================================
STIG FIPS Compliant DOCA-OFED Driver Container Images
=====================================================

.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvstaging/mellanox
     - doca-driver-stig-fips
     - doca3.2.0-25.10-1.2.8.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu24.04-amd64
     - sha256:6c84bd94c76c4ab0e1ccf0b1d746a67e41069052fe47528c2da2074676b83444