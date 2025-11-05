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
     - v25.10.0-beta.5
     - sha256:47bbc03247faec58cab08bc7adf7c3dc30815c767fbd1b80a97ab7781af95bf9
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.5
     - sha256:55de5e9b93eeb014e50457b8b243116688d8848d6657ac70f2fd2d1a071cb49f
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:c63fb7f3eef0f2e73d480b8aabe204eb3b3579dfce05e19e9b646502d5f7dad9
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.5
     - sha256:ca0b040f7300e45dc185e2b6fe536fb38292f5a494b5e9e3bb3f7cb0a6fc9266
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.5
     - sha256:d569b7023287283a85e32ecbce472438e08e632e607ec7e020c574e29bfc6f2b
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.5
     - sha256:f7813577f8d0c2832bbc0afee0941a0621fb8cffbd7761aa739656641300c62d
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.5
     - sha256:532c0dcd74a2241b8a455488d7def8df29f0b71ad4bde8c7fa119e6ccff41e03
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.5
     - sha256:034b6b8e173d2e2221f1b588e48f8d28b0e70b5c37cabda7ebcdc17211f47bc6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.5
     - sha256:1cec527320a93afb2df73b0879d6384a6f945b059bbb5174a4114c514a57e064
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.5
     - sha256:ac6195e97c1c3e9094d360fe0913ff7bc53f0bc9c0a0a431e37d0333bb301921
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:fd3ee5e8699cd543a7fe9640b119141a3d983e8ed2650f6bab44fcff5cb9bf07
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.5
     - sha256:6882bdce0ce177f3d4c8e41e5c2553e35ff95690c4fd932a972df2183a713f97
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.5
     - sha256:c4dc2ee97a30f331512d0b707579f3e22df05419abcad6f43114e126080812d3
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.5
     - sha256:c524884641da88bf9aa83b09690cc13f0785f8599444ca377684cef514129d54
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.5
     - sha256:4e9462eab9909a44eec0538a404828e503254ca9109a606ad0ac009c710e7a80
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:55324c9a0acea0bd37c81bac2a4653ea4982214794891903c4b7f092464d3c25
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.5
     - sha256:3acf5c0fa77d1b4e67ccee0833105d46a85f42c84451c737b4b34d38bb3c105f
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.5
     - sha256:f28721191cb03d7b6cd90e69c28828433a4229b979c5c763b54b3cc640dd916d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.5
     - sha256:5fe6cf62792de6506355c3a5348be8382f242f3571bb77244f08ef8a5fa1fb72
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.5
     - sha256:0efc413c6294c41b519897bc12022a66991cd16dee00ca9113707c2a9ad5049b
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.5
     - sha256:a80c11a636a8b29d5c1fb54d1891362f77e9777c38a16cf38fc03189a352df01

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
     - doca3.2.0-25.10-1.1.7.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-5.15.0-161-generic-ubuntu22.04-amd64
     - sha256:810456a71698da79de0714ed381e0dec917d5b8e3f2fed9700040e34ccfe155a
   * -
       | doca3.2.0-25.10-1.1.7.0-0-5.15.0-161-generic-ubuntu22.04-arm64
     - sha256:d0fe0deaaff8d4fe8c3a7bb672f63cfb9f4c65d8f030784e313d781197bcce0e
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:b70efba98566ff806a8e8c6c7db880420c333768c04d33639ed09ae9f55efa45
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:d0d3646338d7e64164e9a03442cab36c45ef03623d54118308c3484b491a23f3
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1016-aws-ubuntu24.04-amd64
     - sha256:4fde2f0a5e95e886f101202d05de228df47ba8618666e8fbab4313fc953b4e78
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1016-aws-ubuntu24.04-arm64
     - sha256:f8f48a7b59bb3be31cc01ca7d602137ef37fb2a951e51450fd05099ca945add6
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1016-oracle-ubuntu24.04-amd64
     - sha256:7d409b2ffb49bb325105c77cbff85a0c2a4f3bd9963f35778bfac187d5e9110c
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.14.0-1016-oracle-ubuntu24.04-arm64
     - sha256:441b3749bef5d5f42168b757fc2e5b183df63d34333ecf3375649a8a4f365672
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1038-oracle-ubuntu22.04-amd64
     - sha256:47ee69f8555675365e8d097ff30f0ddbdf144d22c0fdae8561c741bfdb4dd0d8
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1038-oracle-ubuntu22.04-arm64
     - sha256:e09440e9eeedfc19d9aeddac0bb90df5a77301b89b4c357415eaa536fde97b7d
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:77492097e931ec21398ac48347dc563c46d71edd99a95045f985ed1704c8bba6
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:9df27fa57d62688379dcf2101bab6310329b70250424f82607fe8e336181df09
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:5099bc9feedd296b3dfb583380830035ba436b888cb1316db250b594a2427dc5
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:28f60a5c9914bde2a6606df0b262c492bd8a7e940d4be8ba9c4918baa4ff282a
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1041-nvidia-ubuntu22.04-amd64
     - sha256:9f551b30c2c1482881b6d764a7185ef0944365571ac49fd272472c435586988b
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-1041-nvidia-ubuntu22.04-arm64
     - sha256:78c4dc1002a87eea05a3e9deee99b193aa55b5511f99aff63f10449b5b8c847c
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-87-generic-ubuntu24.04-amd64
     - sha256:5b9efe9acaf6076b4e08585eced9da3818278c912be15aa93d68ce135492495b
   * -
       | doca3.2.0-25.10-1.1.7.0-0-6.8.0-87-generic-ubuntu24.04-arm64
     - sha256:0b1adc23b3abfa2817097ada81ba8ae38ae2b018e9ad59ce35d8ad09e767ff94
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu22.04
     - sha256:aa4db3025fb6190ed07c9fa8d1e38b753263a39985c16c4148989529614b91c4
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu22.04-amd64
     - sha256:974be03bf91c815f49a79ab73ff457ab5f7a8208fbdc1ff79f3f4e2aef777595
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu22.04-arm64
     - sha256:ef674df1764a66182cfc06e9c426a41d6c5a21dbbd6a629820da58fa7632b744
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu24.04
     - sha256:3e2a98ad6d812a355f3f4a5117e850549d6bd9b9885c7574233396cb0c3abddf
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu24.04-amd64
     - sha256:6ff80ea7aeb711b1fcd9893889943250b356a99869ef100e531699dcf9756476
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu24.04-arm64
     - sha256:c0aac5b9d07ef069ee55e163e5539835c9818101f8993debcd77949ec13cc907

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.19-amd64
     - sha256:2cfd5fe9d828f4e7778c07248fe0caefacbf6369b328d1f7964b43ac60ef7cfe
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.19-arm64
     - sha256:c9674d0cf1e0c41ee71a7da014db20ce5037a38522188e4852127ce3a296009a
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhcos4.19
     - sha256:0477f8cf48c949d62e6907300574986c615313efe7ea65dd52b839d956c655d8

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel10.0
     - sha256:379cedb08d0986a21723b9c55d4e2fdfadee894e9d7fff08b0cbdc4a44f2e060
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel10.0-amd64
     - sha256:94eaadc4b1a06d254d5fecdb34070481aa98687a4bece4fe51248a68d79ff4f9
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel10.0-arm64
     - sha256:9e46a2f3614262a5fe26690daa387fde75366c943db1dca6c72fef72a0e96b46
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.10
     - sha256:79efd77ab4e4a35b6a1c46fd2890c00574f528efc95cacda63b384ff0300274a
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.9-amd64
     - sha256:1b180e1efc9a359385536f878380712b648503cd488d3d5c6c7d369062d582a8
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel8.9-arm64
     - sha256:5d23e106f41f27f67c294ded74487874f2548830e820fa58bdd6e730e419144e
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.6-amd64
     - sha256:f9ffaabf8fde2caedb46871340ab7014bd636760d782e2f1ca0e069d97883479
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.6-arm64
     - sha256:09f483fec05bb1f6e5ae4b7841a173bf0c0148eb86eba67b583cea5b62e740e6
   * -
       | doca3.2.0-25.10-1.1.7.0-0-rhel9.6
     - sha256:45d2259d3a80cfe74e1ea438010d0d9652f0130f422ecd79904bbe905ec4ac8f

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7
     - sha256:745dd3b1cbadd95d14d2380701fd6fdf33063f59ffc97adb65f25c1d36445a2b
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7-amd64
     - sha256:7acc610a42faa91aedfc475df4004ba39f705b45af1681fe9456d05dbc3afafb
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7-arm64
     - sha256:45a7c8d21e9efdf59461862c964d30c05ddd86a303c4bbe2f89e75e2919e5a62


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
     - doca3.2.0-25.10-1.1.7.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-ubuntu24.04-amd64
     - sha256:a32c7cb63e0c3cb401ebcc0dcec4b2ac7f351abd357f1a8cb184957824dabfcf