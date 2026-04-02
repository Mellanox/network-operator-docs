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
     - v26.1.1-rc.2
     - sha256:f61cf1a3846801156d366cda3d2c9b9e7034497cf71186a41f5e41cdbb7fd68b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1-rc.2
     - sha256:a59175229e102b676133617a76be44dcc6a5e14923e0800d3995e4280910c47a
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1-rc.2
     - sha256:5c1d1bd2762f7418c50648cf307682e5a2ca75cc9e63234bc5b32a7e09f951c9
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1-rc.2
     - sha256:a7b37dd230b297884553143772ab62b30f4e2634533bfcdbc140cdeb6c47faf7
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.1-rc.2
     - sha256:7068287a1e73b37bbc37f94351d0bad84b510df262e4740296850684157f0e8b
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1-rc.2
     - sha256:e7db93044259f910191c0cafd7d0d67c427f2389d5089a3391ccb4a49fb9879d
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1-rc.2
     - sha256:d3a9faa79dfef27a1e7568426d3c3cd7d3ed3083db0de8e1fa68d07f44f10f1e
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1-rc.2
     - sha256:80e9c9c921de258f732afad974e94e8c62c91a9e5fb22e8d9de3ce9b528803d5
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1-rc.2
     - sha256:a802c8d6a1e84151a9eeeb0f02e318b8621b97109bb5d10dd45ab47f53cd3bb4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1-rc.2
     - sha256:359957ccc919285d9dd5c4665737b6bc832a74068fc3cbbcfa7aaef1a27570a0
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1-rc.2
     - sha256:ac3cd3377f7102621019c608d1ac2097e42b06c05219bfed7666a46ca0f1439a
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.1-rc.2
     - sha256:677666055b8e3fce038a9c6f677b7f57baeddc7f4f4e760ea8d3021bb569c22c
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1-rc.2
     - sha256:aabf14900c8b54a65d3e0b389f6897a3ffecae8ead9c628131318812faa68a53
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.1-rc.2
     - sha256:9e04ee57d4bca2bddc5d0583321b0535addf71a06c3620c2acc4d1bbffd8a81e
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.1-rc.2
     - sha256:4696011872889721defe830315d96e79faa74567f89cdead4c3c8862c50dbb10
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1-rc.2
     - sha256:dcfbce034b31da1d5ce5ce31bb045c7117a202682520b0b54b67dfe58a353b92
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.1-rc.2
     - sha256:854a2e1710b5aa79682aaab5a872fa43918fa3c71a5a4ef4cbc7e123d7147941
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1-rc.2
     - sha256:f5c2afacd0e92288f1c7798e8bdb8befe3d44f9d2beb33deb132db548cab0d57
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1-rc.2
     - sha256:4e0f2101561e9dcb96aa1bd3ce35ddbdf7b1f8698d896a50d01979398fee1a9f
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.1-rc.2
     - sha256:cbc296f81ca1b2c02f67fac1659062a0b370dfa446cadcca9895be79b2dec624
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1-rc.2
     - sha256:07e52552d97d292545ef24eb2ec981be7b87c04302c829381795c22e1791edcf

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