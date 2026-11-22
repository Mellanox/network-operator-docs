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
     - v26.10.1-rc.1
     - sha256:0afac10e06037b19f75ea550fe0d03f1878a7fbafb0b7ad528be832d722fa588
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.1-rc.1
     - sha256:b61b44405426d916db617106ae4649cd7fc8f9f2724fbd9ee5c777e24455f582
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.1-rc.1
     - sha256:66e849b8a14d11d578c7976f2944d165f88a73647d675221fd8322acb38e159c
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.1-rc.1
     - sha256:398fc748bf0bdab169af31ec9b0335e0135cf9f1d08a8b3ac716a2e5b5f0ad93
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.1-rc.1
     - sha256:7560d9fb582032151260a71090093f10c7ea6e2b4d21054773787975bdd7cf50
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.1-rc.1
     - sha256:c105a663deeccb8204aad7d1414c07bf2064879f69551a17da2e2217cfbd8ff2
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.1-rc.1
     - sha256:55bc9392b8eb712b5ee4d2e037ea9189079a6786e36880465c30ee917efd09b5
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.1-rc.1
     - sha256:f027aad3a1661b4e8432859f5e811470a7d4cff7325350a6232d9e9aa6cb9aef
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.1-rc.1
     - sha256:1bea710c69854e1a9057177274feb9c5e4507b29145e3c2cb4868b46626eefa4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.1-rc.1
     - sha256:5e28d01c607aac9868a72c2de5883bfc64f3c687f7c3ae711a6ef12daf7c2ceb
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.1-rc.1
     - sha256:b222eac308f7f88447ae87fb129457af4079135d7ed02bfe59b21b75d6bdced2
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.1-rc.1
     - sha256:34d063938f128aaf05c0e6f56a34b615c0a20433a117fa5ba7da63dea150d7eb
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.1-rc.1
     - sha256:f5ceeb3528dc6554cb4b12e57e024f42032613702a28a2c4944e59ffd26c740f
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.1-rc.1
     - sha256:9b2eb16b5bda53038d738e62952639799494116d2be91fafdcbebdcff7d1e554
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.1-rc.1
     - sha256:f13c3d33e1a3641cc54b0a4ce6dec5602ac74b6a0c9b93563c0c260114ac4ea8
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.1-rc.1
     - sha256:5dda0b38eeb89984abf9712b6b4b6b9089f8c6169861fdfb6b845e866d87987f
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.1-rc.1
     - sha256:cb89adf7a3a4c72b7df1637d268a1bdc212e9810be2206a38be6ff51e1f6a0e0
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.1-rc.1
     - sha256:f68dcc8e7a98d818b3aba33f2b9306c86c7de8ca6e63205845e379c04f532188
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.1-rc.1
     - sha256:7b14e175a7d41306d86b1a36686b571ca5bde1d28c6bffee94854befab3fc543
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.1-rc.1
     - sha256:53706ad26d0c0f70a39cc104e0e6098a4c338f72e2bfb50f87125d8eeed3388e
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.1-rc.1
     - sha256:ea7778b445209357373c3af6409305707911f1aca2c0a2c16c4fe44a884e3442
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.1-rc.1
     - sha256:73b4a53b91d95ad031f6b9d3bc570f9ab629cca116d1c523ab888aa7b9af674a

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
     - doca3.6.1-26.10-011000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-5.15.0-204-generic-ubuntu22.04-amd64
     - sha256:786bc7783e64b4585a8cb9dd0dc915d4e898e29b2a3f7cf58610f07cb7569fe6
   * -
       | doca3.6.1-26.10-011000-0-5.15.0-204-generic-ubuntu22.04-arm64
     - sha256:c7918b72469ba6ef4b7700c93d2b369ddd9e407e3e3494028c63a40811030c81
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:6c36f3a70c3fd7afd00a46b548de5beea99b859039526228c14e442e04a0790e
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:cf513d9322334160cf72cbe3538480bcc475ae0c5647260b3eaea9801456d7c4
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1068-oracle-ubuntu22.04-amd64
     - sha256:f388e5f777a116d1bcca1cf665470642119897c08e5fdae3eb8a678864df4dd1
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1068-oracle-ubuntu22.04-arm64
     - sha256:1f3574bddbe918fde84758337ba94f1f2d0ca4ab0dd2b6ff50ebd293db8969d6
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1070-aws-ubuntu22.04-amd64
     - sha256:35badf09199b51044af0f76fa03557ba292db157899750168304361c65303af4
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1070-aws-ubuntu22.04-arm64
     - sha256:e197f5fa1ba39be2a2456d1b4d9e9b844d3f38bfc67653deb6bdccfcce6b5ca1
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1073-azure-ubuntu22.04-amd64
     - sha256:58f69d50c6f944b8fa81378e51ec4548ed0288891452691d56170006d016d54e
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-1073-azure-ubuntu22.04-arm64
     - sha256:ea0182f85af7cb8fcd7de724749c0f1728001b40047ac783a26cfcf76863014d
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-151-generic-ubuntu24.04-amd64
     - sha256:3b456d2a8eb70eaeb345eb96600cd75d0508f99d96bea3f2215795673bd9cdc4
   * -
       | doca3.6.1-26.10-011000-0-6.8.0-151-generic-ubuntu24.04-arm64
     - sha256:7f1b58ec0d65905cd1d8e81d252d0ac3a74544076bd23db90824e46fe20933bf
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1016-oracle-ubuntu24.04-amd64
     - sha256:00ea265b59d28019c4a7b95c72790367751ee928f4e6008e31ce811caf5186a8
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1016-oracle-ubuntu24.04-arm64
     - sha256:785e5dbb355f8b876d79812bb02c9b596cef154f967f3b212ad1403324b8c509
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1016-oracle-ubuntu26.04-amd64
     - sha256:d8e6901e4d3649b92963f8037e84b24ef0bdc0e7da4a9084ebb343c903d17921
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1016-oracle-ubuntu26.04-arm64
     - sha256:3ec0f93e6c3e9852f5a3d604c65ea02f756a405dee68d74b73eaf3050ad7f681
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1018-aws-ubuntu24.04-amd64
     - sha256:0b851ddb92bd7b8d2647db666cd1034b42d8d538ca4aa8f0604afd921e50ed87
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1018-aws-ubuntu24.04-arm64
     - sha256:47d152167d62b9ce9178f677c467e6d44619177f0309b2061d3e05371b4f5ee5
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1018-aws-ubuntu26.04-amd64
     - sha256:df97a03473a9b679a1a8f42b6131bb909c861706e0d96595d582efafd66ce574
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1018-aws-ubuntu26.04-arm64
     - sha256:6385af10a2f2ee97b0d29be0ea37064b6a4aed86eac84f6c24eef74e09fdd694
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1020-azure-ubuntu24.04-amd64
     - sha256:cc89a7ca1b47a0a90a9685e776a77def96dfd0ea8add3d60832f5993a42861e9
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1020-azure-ubuntu24.04-arm64
     - sha256:115de31b9655e98605428ee79d6d5cb06af9aa5cc4fc584262dc34e3f4d35c5b
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1020-azure-ubuntu26.04-amd64
     - sha256:d95e36a2f7db066209ea1556c28ccb7ae201a12305de182f1ab89d4259e7bd58
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1020-azure-ubuntu26.04-arm64
     - sha256:a0854e9f05bfaf98f612181d4f957fc90204fb0773ef0829b6569b21aa087802
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1025-nvidia-ubuntu24.04-amd64
     - sha256:99f1c8b10d7e5c58d8b0e988fae33e67d911b2be1ba41f92bd75a9542c015b45
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1025-nvidia-ubuntu24.04-arm64
     - sha256:a3f956ab171dd46a656c386c5dab4802dd0e3b4f9542e64553b665b0d9c0aa48
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1025-nvidia-ubuntu26.04-amd64
     - sha256:99224033246774b3033e97e963fd1a56d16dc6542cbd7287f210920e9f2914f3
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-1025-nvidia-ubuntu26.04-arm64
     - sha256:f0c2a1f8c5c41b5d1a5ad2167bfb6738b01a9ad1180439a3eef9a2bec61f6839
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-44-generic-ubuntu26.04-amd64
     - sha256:e53fe2dbd72ba6d54429d374b88b3e0ee36ea07d91fa36079ddac9db635b9cff
   * -
       | doca3.6.1-26.10-011000-0-7.0.0-44-generic-ubuntu26.04-arm64
     - sha256:bb289bd8664cb3bbc1ff4b8d5d496d1d4da454784641d84454ab36ce5eb49f3b
   * -
       | doca3.6.1-26.10-011000-0-ubuntu22.04-amd64
     - sha256:b201a72a4bac3df98d9527f7ce89807f9f94b74db6af774c0bd9f4bfd1229ccb
   * -
       | doca3.6.1-26.10-011000-0-ubuntu22.04-arm64
     - sha256:0cc4eb3e90b7921e2854046aa30d7017192b87b20c4a78ff31a5df8380cdc08e
   * -
       | doca3.6.1-26.10-011000-0-ubuntu24.04-amd64
     - sha256:f13cd6910cdc4684e243497d13e595840c69b0199c97601818368d7cecd2315b
   * -
       | doca3.6.1-26.10-011000-0-ubuntu24.04-arm64
     - sha256:fe84a9eafb2cd931bb6cfaf8a998ea6411809c1f97aa9699bb5ef8e05f9c9d01
   * -
       | doca3.6.1-26.10-011000-0-ubuntu26.04-amd64
     - sha256:78b581caba866094c71ac21be8f6e7e0dc5aa89899ccfa49e783a001453c052b
   * -
       | doca3.6.1-26.10-011000-0-ubuntu26.04-arm64
     - sha256:60758c8e2506609b6f9276e1c11971834e8b83125547853daa1a7e70d085d21a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-rhcos4.16-amd64
       | doca3.6.1-26.10-011000-0-rhcos4.17-amd64
       | doca3.6.1-26.10-011000-0-rhcos4.18-amd64
       | doca3.6.1-26.10-011000-0-rhcos4.19-amd64
     - sha256:3d748df76e15f072a4ef984af9bf4cc4b1fe59f1f2d698179ab6e9783cc87f78
   * -
       | doca3.6.1-26.10-011000-0-rhcos4.16-arm64
       | doca3.6.1-26.10-011000-0-rhcos4.17-arm64
       | doca3.6.1-26.10-011000-0-rhcos4.18-arm64
       | doca3.6.1-26.10-011000-0-rhcos4.19-arm64
     - sha256:7dd870bf085d43606908eaf7ccb468306d468bb3735981941ac68addf67eec0a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-rhel10.0-amd64
     - sha256:e90b75ad442ec105c6f1301077d7486c523f48736a26b1e4398bb00d38250542
   * -
       | doca3.6.1-26.10-011000-0-rhel10.0-arm64
     - sha256:51a4678e74607889f0c666f4e5562e5f073e8e30b7e07c04bce759f67389c768
   * -
       | doca3.6.1-26.10-011000-0-rhel10.2-amd64
     - sha256:2c76f4cfc48302a38309c90f6a56d43a9600f63de046c581568f7045ac091aea
   * -
       | doca3.6.1-26.10-011000-0-rhel10.2-arm64
     - sha256:244782e756d66eef8dcdb385936a83ed0aa6cde3e7dbe3d68a77edbe7c82a332
   * -
       | doca3.6.1-26.10-011000-0-rhel8.10-amd64
       | doca3.6.1-26.10-011000-0-rhel8.6-amd64
       | doca3.6.1-26.10-011000-0-rhel8.8-amd64
       | doca3.6.1-26.10-011000-0-rhel8.9-amd64
     - sha256:3c305ce9fec742c61c489a32053be2395cfa6b51e4418957128c9b13c5903df1
   * -
       | doca3.6.1-26.10-011000-0-rhel8.10-arm64
       | doca3.6.1-26.10-011000-0-rhel8.6-arm64
       | doca3.6.1-26.10-011000-0-rhel8.8-arm64
       | doca3.6.1-26.10-011000-0-rhel8.9-arm64
     - sha256:6c65b3d1a16eb99abaa793fb728fde91524b5bde44e0d7104051e943a7d17e38
   * -
       | doca3.6.1-26.10-011000-0-rhel9.0-amd64
       | doca3.6.1-26.10-011000-0-rhel9.2-amd64
       | doca3.6.1-26.10-011000-0-rhel9.3-amd64
       | doca3.6.1-26.10-011000-0-rhel9.4-amd64
       | doca3.6.1-26.10-011000-0-rhel9.5-amd64
       | doca3.6.1-26.10-011000-0-rhel9.6-amd64
     - sha256:03ef9c84b6c20b44f40e02494aabe21593aae8903acaf6c111b978f911e333da
   * -
       | doca3.6.1-26.10-011000-0-rhel9.0-arm64
       | doca3.6.1-26.10-011000-0-rhel9.2-arm64
       | doca3.6.1-26.10-011000-0-rhel9.3-arm64
       | doca3.6.1-26.10-011000-0-rhel9.4-arm64
       | doca3.6.1-26.10-011000-0-rhel9.5-arm64
       | doca3.6.1-26.10-011000-0-rhel9.6-arm64
     - sha256:8c1d321bbef6f9ce67b608e62db88fca3694cb79bfceada34392c8b379c0343b
   * -
       | doca3.6.1-26.10-011000-0-rhel9.8-amd64
     - sha256:87401deb1e804a3d9d31e2a53444df77f5af24d84bc1823bb01d0ca665619600
   * -
       | doca3.6.1-26.10-011000-0-rhel9.8-arm64
     - sha256:c36a3579205e0396f6c6b2d28f33f3e2b12376ecd5d123c209d866325f54f9ab

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-sles15.7-amd64
     - sha256:8897a5592c2192d736c95dd3cea137cab0d5890c4335a621be7ad68281f792cd
   * -
       | doca3.6.1-26.10-011000-0-sles15.7-arm64
     - sha256:961166722c407223c2d728aa0d07de8d6e2f52f27c9f810455a594a694008925


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
     - doca3.6.1-26.10-011000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-ubuntu24.04-amd64
     - sha256:70d50f5a93d0df9940296b0565d5f7b5f5a9a19e8981f8ebd1e37d900d31a3ee

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.1-26.10-011000-0-rhel9.6-amd64
     - sha256:74923f05a7606ec023e3dd3861ce6a610135b229ab9bd4b9912a4f135736f902