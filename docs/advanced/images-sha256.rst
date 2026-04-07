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
     - v26.1.1-rc.3
     - sha256:ffe2039dcf993c34b05cb9047536e6b28ca2ca8fd4b8b7c06c4faf09fd061a79
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1-rc.3
     - sha256:7c15d26908963bfa0b72776492f25e839a35189b7675dab58048db3f230a904f
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1-rc.3
     - sha256:5e752968d2a3dfa546bb6c0271d92091e8ca49d28ba743ba1f2783c241ed3689
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1-rc.3
     - sha256:906e73c3e6781c92a0ab0b206f5e58055a709f283e12c4cb7c82f5957d8df575
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.1-rc.3
     - sha256:642cb459e2ee78a229a2e9ce4ac8670c473a35232d2e0aeaaa5190916f5d73ab
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1-rc.3
     - sha256:ef18334f9611bff25b00c4cf82a08533d2c1b7534e24cc65dee7ca170ebdf1aa
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1-rc.3
     - sha256:9e9df0f1cfa53b7b06993a0c8eb514799ff8b25241a879bc9b922cac4ee980cf
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1-rc.3
     - sha256:618c129e8e4dd134200a6b015af5f9fa0f5c235646818c145adcd56eae86f1a4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1-rc.3
     - sha256:a735a0b5a2389e1e338f42e2ace990281180f343c87a409ef1e13d14ca222310
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1-rc.3
     - sha256:c1fdc42a55349571b4139d2248db793f44a693d7264bababee663312bf22b18d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1-rc.3
     - sha256:a8cc37a83db6ab9f72fd3c4e54bee1559612204f853a90ca285ccc6c5accc65e
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.1-rc.3
     - sha256:7c7c129ce2664bf112807fb0c7da2da85cdd298030b00d40440159439691800b
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1-rc.3
     - sha256:4aca9a73f87aa0ca38725dcdf0cbd4c1ca4e30b9bc44c85da84d141d11ac59b0
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.1-rc.3
     - sha256:0118b2699fed7a91fce30137d81539623e3d84d4c519f037f026e1ebca3795e5
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.1-rc.3
     - sha256:afc9d9b6c876cb30d1fc9945a3d30b80c516ebac0f346154951667c256f1da42
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1-rc.3
     - sha256:8ba8a2904815b4996863fccf0667d6c2dd192316b30041b5ded902e027016c45
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.1-rc.3
     - sha256:32159322ca0032e124c54979e255bf38a0d10d3eb310e905d4ed5f255dc92b66
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1-rc.3
     - sha256:cdbe4ca44382988b9d5137dc476ec2f1d8c305f3fc4cfe51274db84351e00461
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1-rc.3
     - sha256:a91c90dbc41e84a8382a29fc1ac66fe8eb605bab875ed6c1d13faa805cfdfb5a
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.1-rc.3
     - sha256:8e1178a2f3f46d455c32a7e37c35eeaad5305956ab3d5ad9373547a61490c04c
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1-rc.3
     - sha256:b33bbbc67cc524fe47387e3f44912430bdfffcda84ea0719fe1a68e1260fdb19

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
     - doca3.3.0-26.01-1.0.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-5.15.0-170-generic-ubuntu22.04-amd64
     - sha256:1fa6419eb5a038aaa69733b4fcb7623dae5acde09bcfe4b84f1a198f243223df
   * -
       | doca3.3.0-26.01-1.0.0.0-0-5.15.0-170-generic-ubuntu22.04-arm64
     - sha256:bf4479de7f60c7c4d5db808ace2e0e2130e375dc9b0158fd989f44f5d0e52d33
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:ada2baa666c3dbeccec342f8b13f8b576b806d422081d717aed3c45bf3dd83a3
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:fa6fcc19cec7f8d93f61e092a3891267cc76f83324e40a0899c4ef75f59eb085
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1007-aws-ubuntu24.04-amd64
     - sha256:c0d7f186d97b40d437d5231b2021c6cdcc85bc31bedbff405d6d3fa7c09e2611
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1007-aws-ubuntu24.04-arm64
     - sha256:8bd02bdc0b63903d701dbcbbe69beca115b9c5e45eb6794d4e64ea9e59710b65
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1007-oracle-ubuntu24.04-amd64
     - sha256:d533f482954333888d09068a1715d3c3fb171df2a5d6c0a35c13100f3ee2acf6
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1007-oracle-ubuntu24.04-arm64
     - sha256:a9e21bf47aa86fc9a3cc280cc9f5523f9243f3bd06024c0d9112447259795e70
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1008-nvidia-ubuntu24.04-amd64
     - sha256:4d161686f5c8d936021517753c4cccf24b9cb9da655e3f05a58be21ce2ae1834
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.17.0-1008-nvidia-ubuntu24.04-arm64
     - sha256:12fd1ada02a888c782d7c4ecaa050e1990646321a6c51aa62bbdb646c10b85db
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-100-generic-ubuntu24.04-amd64
     - sha256:3405071164a25e4ad72c4a49bf1b5ff71eee1239cbc053c19762f4cba6931ba0
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-100-generic-ubuntu24.04-arm64
     - sha256:8d9c04d2c135d39f14db12c3b81cd66a1962ff37318f7f51d7366a989a558652
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1043-oracle-ubuntu22.04-amd64
     - sha256:9ea6a22fa950d438cc4bad5d696127c482db8078c0641e2eb6891925f3cbe72b
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1043-oracle-ubuntu22.04-arm64
     - sha256:e7b1460fb6fede194387feb017c95858feef40a1c00bed506f335a8ca3662590
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:4512cb56164c7c1fec5aa5e90d129316e8112da30aa02a1a0e7eb572c850adcf
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:3d5cc4db0979d56a53170aef9533c90b8d6e0bf67b77b95c709bb0509dd4e0f9
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1046-aws-ubuntu22.04-amd64
     - sha256:d38f03f5726789060f96f906f74757f3482e78a419e6b48ee0e6fddb0283e192
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1046-aws-ubuntu22.04-arm64
     - sha256:358fc3032e679ffe2d013346c3515179be58717d8666516fe58a463d25680859
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1046-nvidia-ubuntu22.04-amd64
     - sha256:8831ff92d307923942c396f72153d38d24b39928e43bb61830c04fd8dcea114f
   * -
       | doca3.3.0-26.01-1.0.0.0-0-6.8.0-1046-nvidia-ubuntu22.04-arm64
     - sha256:b7a2932e3cc83c08d50b6c860c6d6db6c9669f5bb9dca08cdf4b4b17b5233962
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu22.04
     - sha256:46fe5465039b492c9da06f1f5888345278bcc1b062fdfcbcb9d49c5796f00597
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu22.04-amd64
     - sha256:d21a60774040cfefcf834bec5dbfd4c1a1992ce8b5d9a9ff30a33924fdc73068
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu22.04-arm64
     - sha256:f7c3746b46348468ee8a46958a17bcbcb7a4dcd801199e9b5e57c65e3f787f89
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu24.04
     - sha256:2ecd7469b23ce1a3a15bf69842dbc1f75d93704f8f2dadc5300165a9a698e1de
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu24.04-amd64
     - sha256:ec3f771597a821c1ce2eb16e3e5be53df067d91429d22c1db34ee4257f174c96
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu24.04-arm64
     - sha256:285d637e0d8f54c1da3891bb39748991b2bd1d43fb4de2a2bfb6d2521aba3d2e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.19-amd64
     - sha256:ac7f091b20c9c7cd5af5bad8d5f78f8109b3f62bc748a846f2a377beb05023eb
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.19-arm64
     - sha256:8f49ba149d43e117f21ee753a65c4a735b43bb1c57f316bb08e2f0f6e9fa108f
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.19
     - sha256:8f0364d7b1f01d7a4c5c640e014d32f52839c9757e28059e9402790030e007f2

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel10.0
     - sha256:d49f8a1cd0482c6d9e49ab637f04dd634065470e1d8245640144c3e13636ceeb
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel10.0-amd64
     - sha256:10e0430eaca9ea1f8528f810641e6ef42901ba6e757e4ec2ba9854e916c3b467
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel10.0-arm64
     - sha256:a8bc5110e3d5c32738446b53809deb220dc8d71b37f5bd11c87e5af6887aace3
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.10
     - sha256:8eaff502d4cc3319f3335c9548869fa3fd344e79b3e3eff096eba2251284040a
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.9-amd64
     - sha256:5999eb7175e0804fe9b48a9156932e4a657aecaa9c4315591abcc29d1c339a82
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.9-arm64
     - sha256:04e8293e45d7d1f518952be3f6a902d53b5cd6ae14c684dd36f4acbb51178ac9
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6-amd64
     - sha256:3bfd0a24859c3e8c0e9697d6f128855e2ab6b3731eb79ef5603673fc678c82c4
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6-arm64
     - sha256:3a6629d09fdc431594d399e1a5106920ed5b9fc42cecd501fd69664bd7e9a62c
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6
     - sha256:c83c2424d503ec67424f94a75dbf3e138b7f73bedd7cdfd784e0bdea43b924bd

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-sles15.7
     - sha256:e05875a3fc3333f6abaec0eac83614c27ef0e1022dd7b75628b49b1a0bce9893
   * -
       | doca3.3.0-26.01-1.0.0.0-0-sles15.7-amd64
     - sha256:990f81022eb0fd213d823ecedb821f83145a9db7e708b365d3f063259fb0c4dc
   * -
       | doca3.3.0-26.01-1.0.0.0-0-sles15.7-arm64
     - sha256:633ec9b617770dab3eb779a167262a94326e2005aded41edc0ca706d1555e95b


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
     - doca3.3.0-26.01-1.0.0.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu24.04-amd64
     - sha256:884cd8ace16fd82ee53b05a278419dae07bc358944bb5a64e9c1890f75ac2a05

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6-amd64
     - sha256:6dd981eba1a8cd33735ce2471caf54b42523c0b846a087010cb1f60c31f3f75a