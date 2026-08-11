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
   * - nvcr.io/nvidia/cloud-native
     - network-operator
     - v26.1.2
     - sha256:9d9d560796e3cddd9c9bc1caa2dbf2cb82415d4a4460c79fbb7c010942db5623
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.1.2
     - sha256:880e992f99fe034c412b2bdf198c4c76c2e154f84764e7bfac9da97021ddfcaa
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.2
     - sha256:a2ea9cb60f1ce50d109650daca7e074b38cb9ac6a88bed78e266ef99c012782e
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.1.2
     - sha256:143112aaa5d6fb784c35bbd141745b4266aee5b8ca7b855f9be76ff1f49b9e39
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.1.2
     - sha256:f45f2cfe4c6cec38e08d7f23391130e0296b328dcdee0e4b99a77f06fbfb13f4
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.2
     - sha256:6e04e5d39ba004d208c2fdd7d4dab373295f5e3f401f70692b3e15a2fe309a5f
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.2
     - sha256:0b096999cd4093c8e70d303b2d0c0344334d2b75fea3543f285a4c648700b198
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.1.2
     - sha256:f4e0ac8aa7677c555b5585ebbe0e59830385ed64e67d809c7fa075ab9fba0448
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.2
     - sha256:29e4984a7b81f979642197d90c1aa23b567ac4e664e1d7a147fed67f555602c8
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.2
     - sha256:e5db8309ea80ec4cab1c409fb2bf22faf2054679e263f3ef42c7a5862eb43f15
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.2
     - sha256:b96f587afdbdccc20f4f497c4a7de1998e37479890a268289ebc39b9a0b09d65
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.1.2
     - sha256:6ef5de496b7a441d026fb529f71e741d8bfc67ef4932f925abb4857469d37d12
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.2
     - sha256:b7ee9de7f3ccb8e260b6268bc6a32c2817f28919bb9b62f2b4c0ca006e4e8e4c
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.1.2
     - sha256:8f3e3a935c43d56d2c14d6c2baaeb48478907722237afa0b2adc6f64f2438164
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.1.2
     - sha256:b2529774cef6dd30a5b2ba09124f880e7b0e6d88a4e40f0b94156c43b12afef2
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.2
     - sha256:90e741c4a4950df1cc5949bdf7ea4d0809dcaa2d3047c56ac4865118fde8d7f5
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.1.2
     - sha256:12bf7ade1bc7a6006ff4b785a34ed58f6ca9cd57982deaaa638392942d0c1b4b
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.2
     - sha256:abb744df698fd96b3b3ac394535f876fb6e109cb94bcc0180ece08704a2f3053
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.2
     - sha256:f5ae2b9b182962c3c08acf4003ff01aecfe69e39d76b9a7368f97c9a9ae1d77d
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.1.2
     - sha256:36414b6ea6948f93487e732080d8801c5653186ed4028bbd25522a0cab2325a2
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.2
     - sha256:908fbd43e82e335b71f29f8426f7a6f921f45c47afe97bf39880930837eb945e

=================================
DOCA-OFED Driver Container Images
=================================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
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
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu22.04-amd64
     - sha256:d21a60774040cfefcf834bec5dbfd4c1a1992ce8b5d9a9ff30a33924fdc73068
   * -
       | doca3.3.0-26.01-1.0.0.0-0-ubuntu22.04-arm64
     - sha256:f7c3746b46348468ee8a46958a17bcbcb7a4dcd801199e9b5e57c65e3f787f89
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
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.18-amd64
     - sha256:ac7f091b20c9c7cd5af5bad8d5f78f8109b3f62bc748a846f2a377beb05023eb
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhcos4.18-arm64
     - sha256:8f49ba149d43e117f21ee753a65c4a735b43bb1c57f316bb08e2f0f6e9fa108f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel10.0-amd64
     - sha256:10e0430eaca9ea1f8528f810641e6ef42901ba6e757e4ec2ba9854e916c3b467
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel10.0-arm64
     - sha256:a8bc5110e3d5c32738446b53809deb220dc8d71b37f5bd11c87e5af6887aace3
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.10-amd64
     - sha256:5999eb7175e0804fe9b48a9156932e4a657aecaa9c4315591abcc29d1c339a82
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel8.10-arm64
     - sha256:04e8293e45d7d1f518952be3f6a902d53b5cd6ae14c684dd36f4acbb51178ac9
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6-amd64
     - sha256:3bfd0a24859c3e8c0e9697d6f128855e2ab6b3731eb79ef5603673fc678c82c4
   * -
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-0-rhel9.6-arm64
     - sha256:3a6629d09fdc431594d399e1a5106920ed5b9fc42cecd501fd69664bd7e9a62c

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
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
   * - nvcr.io/nvidia/mellanox
     - doca-driver-stig-fips
     - doca3.3.0-26.01-1.0.0.0-4

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu24.04-amd64
     - sha256:44c3f0e17a2f8a476e73fd065436bb68c10af20adf5262e4591cbe50604cfa97

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.6-amd64
     - sha256:a56683db77e8d019aade4d5d97279efb9e249f3ce7d3b4b23fbbdcbd1e6c093e