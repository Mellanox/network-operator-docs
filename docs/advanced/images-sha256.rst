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
     - v26.1.1
     - sha256:de6dfa3b87bf66d3e2d4de205f072a866bff7f4eb49cff5a6391f0c77d046139
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1
     - sha256:1bb3d668df54d1b1d459b0411ab06efe4dd9ab59fa6e00e964f393d1f84063da
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1
     - sha256:3ae8700da2abbf7a5628cff6f45b28ff72dc1a8c5549f4093c986813a3089e72
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1
     - sha256:8fb6f0a5abdd49664220dd4e8613663fcca1de2462cd1ea21917195d8d4df963
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.1.1
     - sha256:93e56c99cfe7aff10fbdccccdbcb680e9f835784c5d8f665810d3f909c42d51a
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1
     - sha256:ce16569571c0652487ad536c5f8ea9c7eb7a4eba7a6844318c1cfde59b8b4d00
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1
     - sha256:9146591022028e490346fe6ced58cb9c56c21ee5904208a81ecde1b542feaf71
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1
     - sha256:d08a2392ea394f891c4864f6d1fb56c1b75533ed79f8b51aa754108a3beb17e7
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1
     - sha256:e29792364dc8ccc616d262d0c384ea36a7c06c467e9cc9726e68944745bbb9c8
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1
     - sha256:275c334dba4d11e4d7ab74afc8f3e2ef381d7f3d8764bda920ee6c8397b4e63e
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1
     - sha256:540b05d020dd6cd464e830a3de4e73d441b44c32a7f79645fd4494a0b25e3d09
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.1.1
     - sha256:691fe58d100b61f3bc1536ab0b2f55119afc82b96db5a40087e694f2a8f7a8ec
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1
     - sha256:f37dc08c68e9baca9653338a9f8dd2e268d5d5e395b11aa2966616b86b2fba72
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.1.1
     - sha256:8ec35312756be0c6329adf802d07654b953559185f9e9496ea62893761edcdd1
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.1.1
     - sha256:8167840a2a7f172694b2d2e77b5ce62a7ede8c31881453d5a895499df849acf7
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1
     - sha256:95e63fd7f77a71d02c2d699f1e3829f1f8e142e8cf0a935a2de3cf2fcdf57b65
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.1.1
     - sha256:a1b2b0de2bd0687a86fc49e65419c71d8281d707edcd5053f8c9804cf5a27cae
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1
     - sha256:efdf04d9d3f056c6880c1bb370c029533314a7fdc989646fbad33caec65ed393
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1
     - sha256:862429c1cea7c0c9fa9d9ee78d799fba4478a3c20cc6aeecef89dc060ad2b1fc
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.1.1
     - sha256:65ad5f388e5e0b9af4844c82109e50593e3c08551d06eb9aadfeb67a0ad75596
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1
     - sha256:cd41564b6c1e5bba7c816066a87a678405553ea4dd0b34380cc71a3377e3be54

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