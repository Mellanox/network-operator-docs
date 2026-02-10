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
     - v26.1.0-beta.7
     - sha256:d9a3c90d0687ed3fd869a8b45345a931dc4edf1d78275480327a294d085b79d1
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.7
     - sha256:d91bce50c0b9872ff969dc93e84f6b3b6034bfc702279dcd42c4424ec9668052
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.7
     - sha256:1550a01b9825571092ef8c006058472142e3b1337a34f28db5a42c364045317b
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.7
     - sha256:71043e757fd9ae251c9f7a11f4d412c6c1baeb365c61fcdfb9e64856b3c10a25
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.7
     - sha256:f7df2e3f8b6ddbb00e966d64176a6049bd78d27b881d7a8aa5ce051929967a03
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.7
     - sha256:4f813acdfdb2862dad77d0f8abbf2f3da492d84796b44f185fd28a52f635f924
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.7
     - sha256:bb3ea4b1dfa29d18d69c6962d710231334b6ed9586e29fdb9411df7b60b2bafe
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.7
     - sha256:6164009ee0f7a86562871782ad60636df86d4ff99ee8477a94b65afa3907fa0e
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.7
     - sha256:cac84b0220fdcec227e8c0adb1ce11435cf9292edf26dec4c45481ebf284951d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.7
     - sha256:ca127604e70e389e61ce5a33903b98ec57d87bbefcfda8a24c1eecf07c4463ae
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.7
     - sha256:ab2f8d9e77641ec8e504f90bfa8c830df7358d2ee66c1069d5abf2bbefa72bc1
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.7
     - sha256:72d11f3d4a493fe4f83f88e0b12abd7b79da4a44b436c471b9fb1b804685700a
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.7
     - sha256:76412c592a36b93cb6af6c45e210363670b96e692e53e127cf85bb6c2457664f
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.7
     - sha256:d1b9d587b0d8292bb206d023dd5224dacdef8b178e8399ca4c975a30f9c23e35
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.7
     - sha256:9a3070bb52461ba7f10a393d4a7e628c873ed0935a3a92d575d6b59aaff956b6
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.7
     - sha256:84ef69a8b36871c7e5ebf49a79f1ca06ab871b4fd88f50ec8f0f8055ffb15db9
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.7
     - sha256:a7bf5cf746b7d375acfc2d9a728a67541bc68ae06fc818b98c645cbd511277da
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.7
     - sha256:1af4109e6f6e2fb5a8c15c9582551c4936aae86dafe9ad5774da3384fd38ef2a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.7
     - sha256:d30b87d10dc3820ab75dee9560b64f626ba111d0f8394d789fef7567f9ed4b53
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.7
     - sha256:fed6b2a553a65b83cf6c1e271d8abf2c4731026948f55ba400af5286bb79951c
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.7
     - sha256:5ca08451f953f0f024d5f317feacd42fd9a11ea14f2f47a056c19c01f7d2e71b

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
     - doca3.3.0-26.01-0.9.2.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-5.15.0-170-generic-ubuntu22.04-amd64
     - sha256:f4d5868486d783c8f18e80e466822ce0dacb70ce2d7bf0ccbaa16b16fbcf166a
   * -
       | doca3.3.0-26.01-0.9.2.0-0-5.15.0-170-generic-ubuntu22.04-arm64
     - sha256:51582a7813b6298df0b55201551270216fa8fd82c73d3370dc6839e1dad722e4
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:28614b8df260dc0731dc88161e30f36eb89f4cc873f84b796d60c20cc7958360
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:beb4163802266b2ae10145f17219b80b3b5f693413044498403aa722983ba7bd
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1004-nvidia-ubuntu24.04-amd64
     - sha256:452fba5edf54c31b7ffb637c38ab92bd90fd4e9465cd874394bf6525fc217d7c
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1004-nvidia-ubuntu24.04-arm64
     - sha256:ba202be32a3e7bb9f76089eeefb4110234ed6d4f76ca175311047097c994044b
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1004-oracle-ubuntu24.04-amd64
     - sha256:130ef49f8e09ac8a58864cb66d67b92c3f8ab5b144811b714b475b90f4f50a89
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1004-oracle-ubuntu24.04-arm64
     - sha256:3db569967276e362e6985743384010ff74ef201fe004884930b93815f3d9f38a
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1005-aws-ubuntu24.04-amd64
     - sha256:86d9b1d21d33a77f30d0e1f85f6ac653458d8cd91880faeaf6ae5c9ccc4d446b
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.17.0-1005-aws-ubuntu24.04-arm64
     - sha256:455078e1fc0a42d20aacc4e25095ec2f758778f4135c60bb69a641e1306264ec
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-100-generic-ubuntu24.04-amd64
     - sha256:007c6fcf7fe313b6f8fd454bba738c2559b72817c185c5f10bfdca6ebda49165
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-100-generic-ubuntu24.04-arm64
     - sha256:f01a58ddceea92bbd07a2d05a0a63249c13982afbc3f7437943e459a3269fb51
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1042-oracle-ubuntu22.04-amd64
     - sha256:4360dfd6c5ba3fe8bd7dd0b105255790e7c0fb990fa98a404c5a7b11021edfe9
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1042-oracle-ubuntu22.04-arm64
     - sha256:d42a4eaf34d5d5c86bb2d2dd5a5e274cc16a8652b891572cf44b798aca6f3bc5
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:3d0329ef90d7f20c5e4cfdcaa5aa79ea643d94707dd3bcc0f18a3af7717e0462
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:959d188574c5196102f1504e217a96ae69417e552f54c28947046e56f7e63acb
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1045-aws-ubuntu22.04-amd64
     - sha256:fbef8c612acc1146352930337bcd749ea4fc3fbad73685aad57618689e234f3b
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1045-aws-ubuntu22.04-arm64
     - sha256:88c2811eaf89194c1816201d5350fd7004b3ff7c6e39d86740e07c8402266ed9
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1045-nvidia-ubuntu22.04-amd64
     - sha256:ba653f795bef2babe57863538b21edfb1313afa1312509865d7caa97849a2c5f
   * -
       | doca3.3.0-26.01-0.9.2.0-0-6.8.0-1045-nvidia-ubuntu22.04-arm64
     - sha256:e2f73efe9801d904dacfe4cc534f71c7ea76125dadb3944a416be3d54f43f360
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu22.04
     - sha256:3d9954badac5a4ef09f633e18fc3a5bc8968ae111c93ca8d65af2e9854c0f0fd
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu22.04-amd64
     - sha256:1c9de66802536e604cd026f8fb25401cf973919eb995a2c9f9017f710166082f
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu22.04-arm64
     - sha256:d7f14a587d53be9b9f94de9c853c72b9174ddd6a099caa83e1e79eef45c6a7e6
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu24.04
     - sha256:72dea2d1a8a1746f3bd24f8d145b7cdb40733179bcc6c1ee924c3b4461a09be0
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu24.04-amd64
     - sha256:b29a058e318cc7cf62784701f6fc39ce4b66c53fc0bc315f87110548e4f33c35
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu24.04-arm64
     - sha256:26b071a8a14959f9a3dc1f807580634bacad966b3b2f73b708a8c9c296b9956c

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.19-amd64
     - sha256:80d576023316058dfdfb1b93550a4400f35600840157726ebf5259e8e8d925e7
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.19-arm64
     - sha256:32881c26fcc872e3cd2bb78f7ef75b7188ccace0fc62d28fcca20821dcb55b8d
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhcos4.19
     - sha256:657dcb627d577e919fe10354d304a8fdd1afe35f2b7f8d47e4a04c760a8ae7ae

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel10.0
     - sha256:4331a41c02a089678405102c33b1b0f35369a4a55ce7dcce681a7c71604674e6
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel10.0-amd64
     - sha256:349c2c4746f8e52265d6f99fa764e302a355c17df80c93edf187c91f230c410f
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel10.0-arm64
     - sha256:4b52993e1a864a06ca93f0d073bab0ffa165127257be3385a91cd46f33abb690
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.10
     - sha256:dcf17ecb710114cb844866c5518f9daa4307d838b8a6856827533c069df5e391
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.9-amd64
     - sha256:8940b97d6419ea4398914f62b94ab2cf628354cfb1353832c97ebff92eef24e6
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel8.9-arm64
     - sha256:31531f3a4e2474f6d77b190d10739bf8f3f769dc57370dcb318e33c93c6bc91e
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.6-amd64
     - sha256:9d8302d488a6778275f43d5d87ac36a857c79adc355ae1f92f41a41a92d42751
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.6-arm64
     - sha256:fc73df0b2e9e93c6e9273178ca748b303e7af5525a56b6a75dbb109615969160
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.6
     - sha256:b8b5616cd78da258f6f516a25458349aac7237511ac8057fb476e12ccd99f0cd

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-sles15.7
     - sha256:da3e42d07b68044049e1bb05e4c2924690ee2bc495f4a9848bff2c4349b11c89
   * -
       | doca3.3.0-26.01-0.9.2.0-0-sles15.7-amd64
     - sha256:4085d90aa136dbe2b924e8e984f159819282482bdeb196281acfd8a8f40740d1
   * -
       | doca3.3.0-26.01-0.9.2.0-0-sles15.7-arm64
     - sha256:93e9a23f33cdfdb63af01b755e7d4e7560419aab3dc1e7bd140418647255797b


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
     - doca3.3.0-26.01-0.9.2.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-ubuntu24.04-amd64
     - sha256:bbddec1ff54e2186e0f9892adc076d13152f765334e6cf50872c50b7b09b30ab

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.2.0-0-rhel9.6-amd64
     - sha256:98a4c64eed81a76e3c7c60b19def5bd720a0137f9619221a5cbf8d461d55b9ef