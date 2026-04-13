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
     - v26.1.1-rc.6
     - sha256:7758d332f1d25c496926cce1bb3a6a9a5c21a4b2bddd701e3613b6488f79ba7b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1-rc.6
     - sha256:6d724c8d3a41ebe130f30f3f79731e7175eeeaafb1f44da5b38bbed95543ed42
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1-rc.6
     - sha256:47c7775b3ea4e2914f6de01f009d18811a059c9e293048fb945a5197c66aab1f
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1-rc.6
     - sha256:3f85107b7f39bbaf7dfd93dd5be6ec9a584e69e5cf0cd6c5bb49ca2e105000e4
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.1-rc.6
     - sha256:b4d493a2e560a2bb1c2a492cc07c320247be61dce222be1089aee1d383a1b48e
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1-rc.6
     - sha256:c77d29bd55f42e685b9f1023f84f6a91bfd3327098e8b72c89cd0460652fe2c3
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1-rc.6
     - sha256:bb110814dc52e07a44765b0372f2ed31fcb3e3d46fc5cb591e9059ea1eabc6c8
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1-rc.6
     - sha256:d611291fbeea92cf95dcdeb9d0049649a6b6b738add9e2c0d07cbfafeab83a0f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1-rc.6
     - sha256:9004b7ecaa6ed2a83ac991bc8ed55803b5842a299c1f2b34c312a174ddf4a682
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1-rc.6
     - sha256:fdfa72b47c9aea51fc8ed946f6ca59c00f72d726b0b0d8f5ddb9838a76761298
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1-rc.6
     - sha256:83f03a8728d918ca61f4efdd10b92be854df7fc1a68a0a75bc3c8d10ff1b06e6
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.1-rc.6
     - sha256:9a7fe15b2842afd90aa8def775867de83f83ee1c840030025269d2795bc23b05
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1-rc.6
     - sha256:3fdaaf1570fb95c095320af319df739153df88dccb7b7523ab82cfa356abb211
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.1-rc.6
     - sha256:5b730ac84d96c537eb67d42f64dd0e426e99ae808703383bf3d8f6e607de6cc1
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.1-rc.6
     - sha256:8cd1765b9fc90e5346c03239ee9039a59c26009d1a99be1845b043666d7e7ab6
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1-rc.6
     - sha256:c02e392721021c520bc8ca47c82bc597c4b581b01b8b8a8901fe1e8af14f7b49
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.1-rc.6
     - sha256:cd28ebf7260cf54f4fcc455d6d2b268d9acc7d9c7e63d43ada3f55f4ec31ec09
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1-rc.6
     - sha256:df2c94255628749231a21c1769d8ded3bec90e77483e3ae08e223a775c3e8d61
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1-rc.6
     - sha256:ff1335e9241d54793036e949df207d9e382da764fedd139207c639ef90044abd
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.1-rc.6
     - sha256:1cbbb6363c6ef9dd91a46ccc7901d5f9d93c7425dadee18c87f9a8b9ffb15fe7
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1-rc.6
     - sha256:ff904f2a2c55722ee027481453d1733b831dc3c9a79d0e67320718ec688c57e6

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
     - doca3.3.0-26.01-1.0.0.0-4


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-5.15.0-174-generic-ubuntu22.04-amd64
     - sha256:bf3fc405c7f4eed770064ee4b9da393073df36db324977887a265474eae178ae
   * -
       | doca3.3.0-26.01-1.0.0.0-4-5.15.0-174-generic-ubuntu22.04-arm64
     - sha256:96d80d91f6f4dfc1420f999a1d381d98d060472d16da7cd59981f44d13c7f0dc
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1010-aws-ubuntu24.04-amd64
     - sha256:9207d8a3ed78e4e39edc0921d145da53c0dd27b7f46427f365fd539b412ae807
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1010-aws-ubuntu24.04-arm64
     - sha256:15e8c2fe6f93462a8277fb00b4b7c60f5dbd7b200f7cfc9c2b363a5141718487
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1010-oracle-ubuntu24.04-amd64
     - sha256:7b91ca12724349baddf42603641672cc2df0a3c1d9e13ea72b145ce39749bc7b
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1010-oracle-ubuntu24.04-arm64
     - sha256:1a1dd1023d99083dc0c4dc113c4ba7d5932d65c0e9cb2b8380a6cac063dbf206
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1011-azure-ubuntu24.04-amd64
     - sha256:8069c17d1dfaaf978ba3ba28074a9c680aecd8149b5300ec48b4613b58d891c4
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1011-azure-ubuntu24.04-arm64
     - sha256:27d945aaf68d2606e683fbca0b7b2ec17d639b73643c6c2fd44d86fe3f0203b2
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1014-nvidia-ubuntu24.04-amd64
     - sha256:811e1645b42a7b2d52beb8752914c9e12b628489ca47879af7e021439fa9cfea
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.17.0-1014-nvidia-ubuntu24.04-arm64
     - sha256:a9f3f54edf2979ca34e98b7d77cd6d78fac68708c8ff5986dc56cd8db7a9abed
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1047-oracle-ubuntu22.04-amd64
     - sha256:a64cade30672965701d4e9fadfdc650e1f52ee0656c162de33060c231ff93ac6
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1047-oracle-ubuntu22.04-arm64
     - sha256:2e9dc2c8e2a771996d9df01276e3df8b82ceb0706335f34464d30d5c45cf83ca
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1050-nvidia-ubuntu22.04-amd64
     - sha256:491ff4bd9c4f47e5b0fa80b68c2cbe595decccf123d2bf3a21c1b352ad1f130c
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1050-nvidia-ubuntu22.04-arm64
     - sha256:850539eaa0118be621446d2cce6196728fb565eb67c37a4abe850d69b4f894fb
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1051-aws-ubuntu22.04-amd64
     - sha256:43e318a4197f403f12f816ba425168e53a8bfefc9b87f8c05f3c337a102f7cd6
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1051-aws-ubuntu22.04-arm64
     - sha256:7858664cb1a7f3188ee02eabf6218249c62f32dd1fcb51171a6c93f3c14ce823
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:d4c75b87f24eb7807cc19b294f721e11799bd2afbc700fb061bd5c6b5e1fb83d
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:6462ec5f3e4268603ec6e4b11db6eafda7d07f353158f2e85591e1177436460d
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-107-generic-ubuntu24.04-amd64
     - sha256:ab963807b8d0879ca8d130ef43ce2df924f9e38cde41b192b759b8be7e4ce7aa
   * -
       | doca3.3.0-26.01-1.0.0.0-4-6.8.0-107-generic-ubuntu24.04-arm64
     - sha256:62b628fd470e5df974f668a0818f140bd23b24518c9d82f16814105442ea8025
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu22.04
     - sha256:8e833f81bf48a130bd74d17a9da8ea29c0b59fc9b6758478bb6d898526d87771
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu22.04-amd64
     - sha256:5ca0832698de58883a9cee4ca0beec0726773723a7b95f79268051aa28710e22
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu22.04-arm64
     - sha256:d292ece8ea40c822a70630600da62a0acba90b8ca3c26adf3cece6ae47677b59
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu24.04
     - sha256:b56d5adf77d5a678cbfd0b1fac1e0ec2bb1d450a9ea8e72406f7656a3f1d1936
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu24.04-amd64
     - sha256:226d8a583443b85a1b254f64f2c40db9b6e0729b62c0ec86c738c3352a3a5920
   * -
       | doca3.3.0-26.01-1.0.0.0-4-ubuntu24.04-arm64
     - sha256:42742906a8ba3e3fe68ea3e68b1d9da36ea07506aa52409e8576bdd3b5bfc45f

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.16-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.18-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.19-amd64
     - sha256:058873ca98db8e15ef0d3df657a8b40cacffd78aa676352d4efb00f672e27e12
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.16-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.18-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.19-arm64
     - sha256:26517f5954485bd3de267236b4d46f622d415612989c54e040275dd9e3bf716e
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhcos4.19
     - sha256:47e2fa134fdf7c881c50741d167f5b1fddf9a806345ab912aa29acbda23d73b7

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel10.0
     - sha256:1b4ca7f1be837114fbde3793fdeaa1acd508dc3030d56531eccf3cfd14947cd8
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel10.0-amd64
     - sha256:b234c6e2ec7da9e81e6b6300fea03994c16868b21f48121edafae978dde08258
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel10.0-arm64
     - sha256:f078a46ce35e3e09c87975f34bfb3541410ef111889d1da370c7705161c5d1f8
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.10
     - sha256:f6b447fc9b9d3a9a1717e1e77452793241b344bbeade0a05c8faf879d0764f30
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.10-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.6-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.8-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.9-amd64
     - sha256:46dbf0086fbe2df91e3637aae33e3c4d2fb9a41d5f7db33b08fffeaf135f55db
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.10-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.6-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.8-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel8.9-arm64
     - sha256:6ee9ea0d0ff8066c30b1d4e6227fb26400d28cd19f0c459af605a6a731add111
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.0-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.2-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.3-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.5-amd64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.6-amd64
     - sha256:3db28b477b67f3d05e99a496f47e4f208bbc02a7fcadc59b066852e45a1378b7
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.0-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.2-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.3-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.5-arm64
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.6-arm64
     - sha256:c7df8335ff7746d1b06c42ab64b19d5d856ac18ce14845d86e3f60770954ecf3
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.6
     - sha256:9b62af28e03270b00e3a209dcd5bc14cdac2b1144eb4e5f81223f28b4b8ae8b4

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-sles15.7
     - sha256:dcd2a29e2ee8ae8f0c52a58648c6da22ac1df301c05168c93d4e262c1067af8d
   * -
       | doca3.3.0-26.01-1.0.0.0-4-sles15.7-amd64
     - sha256:b84428763005a597d25e23174343d16bf8dab9ff7e96ac76bed1efe67c675604
   * -
       | doca3.3.0-26.01-1.0.0.0-4-sles15.7-arm64
     - sha256:454d2c76b8fa31f1f211cda78aefdd6a15a533c97e5b11eaff2f419766a4aa11


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
     - sha256:5e5c610165bf83f2b694fb39657de5e5687d0073d9d5d4212d3b4029c0480218

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-4-rhel9.6-amd64
     - sha256:3279148fa25fdded7dc7f8f69d0011eb4e2c5dcf688aa3150e1c719ee280f863