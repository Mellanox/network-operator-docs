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
     - v26.10.0-rc.4
     - sha256:094808dc43f93fcff62e5035eb7c1303709a9c31786dec4df1e7bfcff055e203
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-rc.4
     - sha256:e24b7414ad7a4cb2fdb30847bee72d6348f711d44cfc7e0f137501a385ca8fcb
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-rc.4
     - sha256:f441784bb69b0e52e4626be6ed3e9d8eea78105d0b7e40073847b2c9aa2e11e0
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-rc.4
     - sha256:d956592154027c00ebee1f81c8fc16f1703b2e7283e70f299127c09cbea6e238
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-rc.4
     - sha256:e5745497b22c4a3b899bb5843296e19c1d2ee2236523e77848cf77094210c8cb
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-rc.4
     - sha256:7125ef41c383686b222344ea052f03aa521a9dbb1532bcc320e46a140cc05361
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-rc.4
     - sha256:b95fa45c6e7eea2d8262ccd3f789df32d673e3722c41d7b4dbd9b4815ccfe982
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-rc.4
     - sha256:89dcfdd54a8b97d81df1eaab69e891bfc277eeb1812789fa3292f10f03530bdc
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-rc.4
     - sha256:4346ab5f4b4ea664c4b9ef9bdfc459eda6179ade1ee07fc61b08d743d09b4d3a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-rc.4
     - sha256:7444f124f266bc9704f3e90c476479989893e46592ca9db04bd24dbd90214834
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-rc.4
     - sha256:1dd81fca95d28637dba5d1a40e18558f36268c0b22de7cb2784de1fa2e36c003
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-rc.4
     - sha256:7a74f89cef64a9c7a64d8bb70aa003eae48c35d276628c8f53acd9975effb00b
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-rc.4
     - sha256:ffede8b89881f8c9966829f2b9ce19a15c8736f90a228d0f9d3d2fe34b62da3d
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-rc.4
     - sha256:72b2c4139188837d3f18194f5dc24cd3ddea49d36b4bb354fb981cf90053d7be
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-rc.4
     - sha256:c6460b20b9f2b291190f8b479aa15aa481a230aefb278f2323d5b0c8ed26623b
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-rc.4
     - sha256:e8ccaaa612db899a428b7c2c963bc21a663363cf3d38e76f001cb4dbdb6ae31a
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-rc.4
     - sha256:f071aa9ebab4d549af6ac78607bfd1fc95dcd13fbbcb5c4c87f7c6cbb0eda98b
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-rc.4
     - sha256:3270dfcb233b725899abb4634442baa97bfe141be9cf2459908f2c45b3a76a7d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-rc.4
     - sha256:9c44ff68e41df8c59d4e6498cd23fbb8e852e0bc252a9c00ad67169ac91a3643
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-rc.4
     - sha256:173d05a282506f3cceb8ff112e2569ca7c4ba29b6d61dfd5f8519544f7838db2
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-rc.4
     - sha256:50b2bdaea925589bd66cac687ade360aff9383fe6938a5591b9c22ba3c6657c3
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-rc.4
     - sha256:2c44a3c923b8d53c2d944a912e2dc1b5fb5dae88e0690497617e6ef6af50045b

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
     - doca3.6.0-26.10-065000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-5.15.0-202-generic-ubuntu22.04-amd64
     - sha256:1b69ee4931802a2e8419b06c1c0b9c1f060b557aecd06bd224c0f2366f177398
   * -
       | doca3.6.0-26.10-065000-0-5.15.0-202-generic-ubuntu22.04-arm64
     - sha256:d186e01d6bdb9b7d8be2642c97796f5797e376bdb19de17abb86516e163b54ca
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:06bca9a0f8b9fb2f87481aaa378ce6c9687bba61f018ed9959874c4d0df57444
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:d4a22fc64fe9628425976df6fecdddd031b2036faaa6e937733936c26dfb9372
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:2b14f3eb05f411a8d84041f7af76cf39980241c96bd077518845401b5c503c4e
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:73f86e2894fe30d6149d10bc90aa7709c513fdec85327f045abd720b300adbc2
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:75289f6fc0010e0e265dc96d23728a216f1eab139d4a57146fd9c630be8e12ce
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:b7bce24dc75f190297d944de5c68f59226e1b0709e7a038f4f98d7a8c1ccc4d5
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:a8320d7463a5cb97d5c0eedb33e41a949877e4eea22954128906a00a13f3f034
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:bc2bf689c585025ee949b38d94184835784eeafdc3dad5f5b89c5ccc0e990ac7
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:cb88634c5769404c67045cf40dbdf21e28ad3932d8f40937363659ff4f253706
   * -
       | doca3.6.0-26.10-065000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:a69e0b9748f39855be9dabb68124d9535082e08212808887eea1eb84018bfb32
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:28222e5d3fe28591e75c5eb6d0ecf448a325e7940c277099577f65527f658d95
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:6b89033e9a2660a179a78ed003954181d1b9a1b595433bfefd906aa840327664
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:0441aa7c0a548d2ed57783043aaeac9d5a1e84e0a29a5584fb0fe0151ba4dffd
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:2d17fa10aa54b47f3425f132d7cfab71fdcba4661770013a7af3ecf6fbc4991e
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:ab7e59026430d8c996ab22188dda8daaf5b89f41c666bff58f2e8ad56f002b49
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:6826ffa98c0b3ab5859e87420dba2c52c2dc5ff5fcb8e3f79bfa1260570f2879
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:4ec99a865b67c9d1efb6b8966b35b4b4b08df7fc3f440effc1555da9da1de445
   * -
       | doca3.6.0-26.10-065000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:a813302515f25063748c075ea92ff7b4bd341d1d30a430db0ab686984692ccd2
   * -
       | doca3.6.0-26.10-065000-0-ubuntu22.04-amd64
     - sha256:c5a273054dcc824964892f53ba62fb86f6692c5e2eb73e902ed0332e5c869f3f
   * -
       | doca3.6.0-26.10-065000-0-ubuntu22.04-arm64
     - sha256:92d978c334f5b88883390f53c4bd8996c8afd4d71419bb8ae53020fe09a41897
   * -
       | doca3.6.0-26.10-065000-0-ubuntu24.04-amd64
     - sha256:8ed411aae8b66a7d9d675ac1a2da94a32bc8650da2b0e543719462db348262eb
   * -
       | doca3.6.0-26.10-065000-0-ubuntu24.04-arm64
     - sha256:71e7cd1ec3f81b5213ba27b7e9200a9847aa8e1ff1d95992ceda430e5b5f0bea
   * -
       | doca3.6.0-26.10-065000-0-ubuntu26.04-amd64
     - sha256:eb8ab95bf506ddc6def83f88ceefb0bce8ca58913fc45824cfa954951c3dfbb2
   * -
       | doca3.6.0-26.10-065000-0-ubuntu26.04-arm64
     - sha256:bac595ff4519d8445d781f74937f105c38ea3d1c80b9b68229f3eab95cfa3344

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-065000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-065000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-065000-0-rhcos4.19-amd64
     - sha256:9373a0c10506a54cb5b56aa03acd64c111a444945834e967195f96da67644ea1
   * -
       | doca3.6.0-26.10-065000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-065000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-065000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-065000-0-rhcos4.19-arm64
     - sha256:52a66e2f8a2b3f198b45dc33d9989ba96c00cf741f9ef0d9383535f0280e2fee

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-rhel10.0-amd64
     - sha256:2039354189b346c204238f8e0dca22a67e00686c895a3793f94838fb2f7175e9
   * -
       | doca3.6.0-26.10-065000-0-rhel10.0-arm64
     - sha256:a04ee0f31bfd2d4c158df71bba868187120294f9daedd21fe2da9edf9767d9e6
   * -
       | doca3.6.0-26.10-065000-0-rhel10.2-amd64
     - sha256:19d4a81cdcb79261f50224e6949adad0651f59d7a7703a48eb7072e0208cd3b4
   * -
       | doca3.6.0-26.10-065000-0-rhel10.2-arm64
     - sha256:36f0f6aa131606990c4c306de1b9467d2951d899a61e5a844d363a17931bb5d3
   * -
       | doca3.6.0-26.10-065000-0-rhel8.10-amd64
       | doca3.6.0-26.10-065000-0-rhel8.6-amd64
       | doca3.6.0-26.10-065000-0-rhel8.8-amd64
       | doca3.6.0-26.10-065000-0-rhel8.9-amd64
     - sha256:09895ced591d1cbbc856cec0509a49104193b6112fe3bb1bdf9e6264b6b07dca
   * -
       | doca3.6.0-26.10-065000-0-rhel8.10-arm64
       | doca3.6.0-26.10-065000-0-rhel8.6-arm64
       | doca3.6.0-26.10-065000-0-rhel8.8-arm64
       | doca3.6.0-26.10-065000-0-rhel8.9-arm64
     - sha256:3aa9fa0f44632e6b323326df0fac7d5d9d41291e307746d0a5bb08836c4d2583
   * -
       | doca3.6.0-26.10-065000-0-rhel9.0-amd64
       | doca3.6.0-26.10-065000-0-rhel9.2-amd64
       | doca3.6.0-26.10-065000-0-rhel9.3-amd64
       | doca3.6.0-26.10-065000-0-rhel9.4-amd64
       | doca3.6.0-26.10-065000-0-rhel9.5-amd64
       | doca3.6.0-26.10-065000-0-rhel9.6-amd64
     - sha256:ab0d94fb394546195900882c5b32eb6b0e1dccffdc006e7471a8a60ed88e5662
   * -
       | doca3.6.0-26.10-065000-0-rhel9.0-arm64
       | doca3.6.0-26.10-065000-0-rhel9.2-arm64
       | doca3.6.0-26.10-065000-0-rhel9.3-arm64
       | doca3.6.0-26.10-065000-0-rhel9.4-arm64
       | doca3.6.0-26.10-065000-0-rhel9.5-arm64
       | doca3.6.0-26.10-065000-0-rhel9.6-arm64
     - sha256:78b41e76df964d6edecdf1dc9989afe80319826046e128fbb5913260cb89df0f
   * -
       | doca3.6.0-26.10-065000-0-rhel9.8-amd64
     - sha256:54cdaa48f47a0e95392acf47caefe0fcd141499f7f5234f6387ace6f66953a90
   * -
       | doca3.6.0-26.10-065000-0-rhel9.8-arm64
     - sha256:1cbd26d25ea28d7295700bd4ae1bb9ba3cf4a4963ebd12cd82deebbd58f81cd0

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-sles15.7-amd64
     - sha256:7f64b86100da7a4cacb221d2d9373009987096eac13263407f6aa52dcce714c8
   * -
       | doca3.6.0-26.10-065000-0-sles15.7-arm64
     - sha256:bf8e0f34f1bdaff4072e847f49e06e75706d60b7386db3d4dee27da55bd544a3


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
     - doca3.6.0-26.10-065000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-ubuntu24.04-amd64
     - sha256:28f2a4cf241b226dc4684b100f0d6128d0920727f78c3746d80dde96d3f446e5

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-065000-0-rhel9.6-amd64
     - sha256:225c98f1a533c9156f034aa1d4c63a00b1cb4399eab5e5ec3473ccf916092903