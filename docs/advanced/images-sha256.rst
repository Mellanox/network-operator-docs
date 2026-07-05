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
     - v26.1.2-rc.1
     - sha256:333199838a1767ec36cd1af67c40e4e09936fde82982d14cc92643c11c5e7c29
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.2-rc.1
     - sha256:d610c67d5bb3ba40bc71cc76ddfe763cab05c87a8727f0ba66a69e726e951591
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.2-rc.1
     - sha256:915fa9f125d1f589c22241107a028dcc89dd02ffc2816a8ca9bf3fa52d36aa9c
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.2-rc.1
     - sha256:73cf17091ddc09c9762e00ef7d25719c477cf2aa97a8e2c7bb6dae487f390912
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.2-rc.1
     - sha256:2ecce096559e07915866f840b7f4fe0a72f5b90000c25afdac275f66c8ae008e
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.2-rc.1
     - sha256:2ff103effddb50e59951a35c4cac0badb432de604fee0047aaa8955410a65d7a
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.2-rc.1
     - sha256:5322c8ffdfe6aee6824a6f8895bf7f7955afc31cf8986fb8e04ea5de25e6e2e1
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.2-rc.1
     - sha256:f070a7cbfa5872e81d4e1c82649417f6b3a5d8e8eda68133633ae1e1104f1f8b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.2-rc.1
     - sha256:1a30ff0da3184a24373a80d34cd3bf5e346a178e345bfc29850fd52212db7e4f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.2-rc.1
     - sha256:e17dbbb10160b2b7a129393c9e89ef23f64794e6fb6c71150fd9f1ca7dee95cf
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.2-rc.1
     - sha256:c9153d3b8043c62e8854417f0cbd5e244ecbc668171a585ce2a5ca7ba7abeab7
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.2-rc.1
     - sha256:8f91f186e32ee1c387d171fe93347e83067fcc15919485fdf12888e1113d9769
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.2-rc.1
     - sha256:1c57c5c4987f7f5a0cf41de91d84f84c15cd9bc62e70b2c0906351fe7684bd3f
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.2-rc.1
     - sha256:23a92feec399bc898fc8b2e855ceafb2b811d080709b0a7111acbfec2f582a27
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.2-rc.1
     - sha256:b51543d2ad46d31ad54844719194cf39e5ce1d1c32154bb1eacac353d2f54b3d
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.2-rc.1
     - sha256:0e6a3b06b2060427558db6dc8177902aa703a07162507d05c4ef76f2638b68f9
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.2-rc.1
     - sha256:36d5c9529564b7d7b52f5b5d064f586e7ce25387469ced6924ca09984fe7e74b
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.2-rc.1
     - sha256:4abba2d9de5c0303eed05e2d2e281c8c6b916b2f6a3ca0d7b54be4c1d6998156
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.2-rc.1
     - sha256:df1974c2cb2c61c6b736559fbaca505e512dff20b684aa9f7edfa0fea8141cbe
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.2-rc.1
     - sha256:444b6b566d4105dd6809c4ddafd3de616f2c6b76b4d5bafd041cbeb73bd90116
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.2-rc.1
     - sha256:811ac680c919db94a18dd73f422720fe3286e4c4df6783f659dc45d91062f70e

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