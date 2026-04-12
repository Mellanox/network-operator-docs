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
     - v26.1.1-rc.5
     - sha256:4b94730f8d0c0b320d009bc4b4c141690c6f5998ab3a8e6c921000d30bd604df
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1-rc.5
     - sha256:3a65c51df65b26e3733eb4c573d6cbf1060d707d7576cbf6d00a8cca2a7c90b5
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1-rc.5
     - sha256:7d3d366344a4b1da67dd8d7fa35dff99f4b08d1207290e23abad83d6d4ff744d
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1-rc.5
     - sha256:efd2eb1db23556431d9a2847e80b86b940760be668f05f4110563f9e84ee99c9
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.1-rc.5
     - sha256:2f4a6e99678ee51cd660b24a36bde2dc37063df736e4483d1ef19e7c98cbedb4
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1-rc.5
     - sha256:90ad0b33723ea9aba5435507fd4727331e267ede50a2dedb8bd1b3b3de7f1d3c
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1-rc.5
     - sha256:5a4152d870f7f0dc79a6e29ae36dd51f875d2f0e5575b1b15072f5e54bb71def
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1-rc.5
     - sha256:f2c58f56c7cd8486bd3af99f163bf441cebab5d9935a9d2494c54451f5756546
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1-rc.5
     - sha256:3d295c77bb0903d350ad77ba0c3c674b4bed25feb039980c6694a73374e21eff
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1-rc.5
     - sha256:46907964b698611e5c216b887296553a16c65361449805cf06d8f3e2c9a345e2
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1-rc.5
     - sha256:1605eb454ac6495e900291acb1db4e71ace543b5386f2e0922d6e422196f9a9c
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.1-rc.5
     - sha256:fc2a490023e1575dd55c4b28aad9e7f93c4590bee9ecb81e4efd3856e1ed2503
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1-rc.5
     - sha256:e15f96fc72d4c866f2253090c7505e688116669cfb1b9b518c52216148f7837f
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.1-rc.5
     - sha256:1212cf84ac3ef69e608c54773c801e8ca9afa3a5fd064e8c5b7c95b59710d653
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.1-rc.5
     - sha256:4fbbf9b8ffd948e595ef29c8c60081c54815177280a03e64f1d5b0eec08d60b4
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1-rc.5
     - sha256:ebbf2f2410493bc934786b9b8c8da412c3fa1e2ed9a717338b0d29d224b0b71e
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.1-rc.5
     - sha256:92e97b9fefc860a467ddb55c91557f5ed04f9eab71c1e120407915d0392ce4a9
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1-rc.5
     - sha256:7f0a46bedf0f2657f246a1913fd7776903e7ef26ba5cc0bb173bf45624d4394f
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1-rc.5
     - sha256:eea22571a652a9d57d4587abff4e5b120f8f5bb16ba842e65bebe642ebc68efc
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.1-rc.5
     - sha256:e7475acf38d59d801d8b82a2cfed597c5bbf3304a46d99e56213b4579bceb228
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1-rc.5
     - sha256:07d0014bcb70067ed9b4f9b820bdf9a7dce623f0e37f459488c9259fe027adc9

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