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
     - v26.10.0-beta.4
     - sha256:666a641baeffd991f161a97f9ec760164519ef99ee4b55e6578e498e058781cc
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-beta.4
     - sha256:be9cf6317f9df6bd725c79540ab4505e9c1946cde73064f8d1cb102c5542c053
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-beta.4
     - sha256:9240b08e0238c3abe11d7909a2c567b702a84a92680017af30aa8253853e1234
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-beta.4
     - sha256:52286b7918598fa36d8dc619c534e96f6ff308d4e5c058611e6ffad36f1f1fe8
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-beta.4
     - sha256:67b2ebf410f2e1cadbe879b1262593a5bc8986a1827ea51fb0012deef925e8ef
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-beta.4
     - sha256:386c47dcd0d58887f0539a0a168ac0026c8ec0617a2ddaf46f01cec37f703a1c
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-beta.4
     - sha256:29a556e8a4d707c03e5d7c81ca39eca8ea07e84dd1b6425f0afa22d6ed6eeb45
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.4-doca3.6.0-host
     - sha256:57e60407cd7f6e9be4274748e6a118342c18c15819444d940ea7935778c4fe90
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-beta.4
     - sha256:ff298ab978a8d4e0e15a52aeee0f5825a1db9b72ff303a282f71fd4e447fb1c5
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-beta.4
     - sha256:9e60c37f09545506a9e10bd57e691edd40ffccea6a9de2eef3a531d37c05a863
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-beta.4
     - sha256:29af08258f44eaf4a75cdba767c2f633cdd63d80105182a524d2fef4cdee104b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-beta.4
     - sha256:92f92d39f3ae6673574554292ba64f70dd15fd0a5159916cae884580d8c3cca3
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-beta.4
     - sha256:aab4a48dd249c4d85bdeab286f90420280ce33599f78f08ae9fc9525a0853498
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-beta.4
     - sha256:4b5878225e3ca1e6c19693480ddc5a174cb9ff282a3a2b1418d5d1cc4ac51018
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-beta.4
     - sha256:976a9b26114c9b8d9f262b3b525661f13aec13c80f88178eac32d9e2f6651afd
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-beta.4
     - sha256:7a39e2657c01d545ed84083416e0929fb4b770ee0f746cb21513b1fbcf049203
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-beta.4
     - sha256:2d5878548751d760f72b33160d79a3be9bffde1e4110d809e47ff027265f50b4
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-beta.4
     - sha256:18bc3018d481374fbbe2a2568b22d8d55a202ea3dbb8db192d12b50803de462f
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-beta.4
     - sha256:f0dedbc02508625ef3f3edc3b4219b3e047490abf8e67281f8799cc1eb5e8f74
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-beta.4
     - sha256:0136356b637111cb421fd4e3d21eb60b84e14e43c2fba29a72bb7f4867246039
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-beta.4
     - sha256:0314f4bf5c282f5a640fdc8008faac85909a3b8ebc917f404d89a71e5b5761c4
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-beta.4
     - sha256:e7549c4cb79742dda4b39e4b73e5f2788180a08c8b2baa302a04467e89315615
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-beta.4
     - sha256:53c10d4675855e44568ceb303d0c76d84cbd26b2eaa7a0b281f917b997ca53bc

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
     - doca3.6.0-26.10-050000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-5.15.0-198-generic-ubuntu22.04-amd64
     - sha256:76b7ab1ac3b09425943155fd960a67fc12c07acb0a53e57519e3e423b7b60395
   * -
       | doca3.6.0-26.10-050000-0-5.15.0-198-generic-ubuntu22.04-arm64
     - sha256:c1b1c0c6a3a775cc70d2cd5daad11982ebabe2d3375975322b0962219c50bfd4
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:90420f1a4862421086d4a12ce78a68b31dad75a8d92363f3836390a27da526b5
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:9be5c86944d2e35383fb51af1e191d937459f48134a906ab56bae1c4011ace73
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:17b1d8af215f86d67aeff5fc9edbe35d9043e75b797e444e09cadf2d61818aeb
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:02c0185b8d6c99148dcc95cce67934b03b8d83f798ee1180141f664f4b9eca5f
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:06bbc5ed849c5a4328de8fcb0ad6252d7a2f6837f6abf410d30b0c16b2871d05
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:90f01077dd6545a73899af3b0084b87a6794818acb30110528efda1b5e7830cb
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:1a5aa2bb235fc103dce8d4ff23dd0c1bc92acc0167546f87b06b11673535fa43
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:8e7cec21c9eacb80a9804a664a4cbc1d175e126f243e2b2558e4a942799c9518
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-146-generic-ubuntu24.04-amd64
     - sha256:981466f7f2285f81d4f3aa577d9b22351f4c1e13bbebe3f68614214ae7e7d186
   * -
       | doca3.6.0-26.10-050000-0-6.8.0-146-generic-ubuntu24.04-arm64
     - sha256:b489ff24b3076c16ed74ccfe1ad2b25469bf34343eaea5b2fdeef9a3bc17b01a
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:3fb21a5061de2c0e11a211472f256c7ec770b5d6d2591fbf5bdf7761169d35e1
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:d4d1a659e534a6656ec2e98dec482af28038b6d1395c1fc992def4d2f355d36b
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:89177406d939e7725041e36efcb27db8d4e7bdb5172ef6ae40964e8fcd5ba6e0
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:c5cdf1247bf9a85b45165b17355b3816f249b17032334b668eb81231d390f26f
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:7e551266f00f42cc8c25f85b28b1f04026731df14e9bd2075a122b2000755a90
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:dd3bf863af423207a207a48e3e358a8a420d41955d93130172aa2fde17d4e249
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:2ca2d5a696d8dcadadf2e379431057e57cda292efabb606834cb65b47daa04bd
   * -
       | doca3.6.0-26.10-050000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:26aee11381a53580e1de6301b83ee0f75781130bb2abfcee78012bb80a4fc876
   * -
       | doca3.6.0-26.10-050000-0-ubuntu22.04-amd64
     - sha256:8f8d59f20c043fc2db4d062eb395fc4c8533cf2b0c61ad853422211a41962824
   * -
       | doca3.6.0-26.10-050000-0-ubuntu22.04-arm64
     - sha256:63c144106316071e9666c5d3deee7b93005b547c6456ddd4760b83419a801835
   * -
       | doca3.6.0-26.10-050000-0-ubuntu24.04-amd64
     - sha256:450e822b93a120ffa39de3810b7c0bf2ab7e868a88f8bd356e5b6c023e21777c
   * -
       | doca3.6.0-26.10-050000-0-ubuntu24.04-arm64
     - sha256:ead7139e4f1a2e15f21ef877f36bc33b6648971ee702c8431695a77e3aa254bb
   * -
       | doca3.6.0-26.10-050000-0-ubuntu26.04-amd64
     - sha256:394fbadaaff9bc2e2c24da71bc694a1b17b4dba73028e74b2b39ae49a1fc280a
   * -
       | doca3.6.0-26.10-050000-0-ubuntu26.04-arm64
     - sha256:7ad1a4440bb2176b38d5c75eabf4d1bfca3bc0babdca47a70200c22949c541a4

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-050000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-050000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-050000-0-rhcos4.19-amd64
     - sha256:72de3e3e0947670e960cff18f764031c9bc87c6c5a7c7861a7586003b5e4a520
   * -
       | doca3.6.0-26.10-050000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-050000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-050000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-050000-0-rhcos4.19-arm64
     - sha256:d1ba7a87b104da8a472a0a240a7040127bcd898521da4f22ae1e7a23a56a30d6

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-rhel10.0-amd64
     - sha256:6f5480c2bc4b44378721da7c375060275464faa3016487aa5e9d7f0415084b98
   * -
       | doca3.6.0-26.10-050000-0-rhel10.0-arm64
     - sha256:2780fe17d364ccc02c61f91928b246e77b74f663a6d5151f344c9b690aa8860d
   * -
       | doca3.6.0-26.10-050000-0-rhel10.2-amd64
     - sha256:919ef3677aa15142f5790f72d56b33d232d4b9a8249aab44e2328b1a06998acb
   * -
       | doca3.6.0-26.10-050000-0-rhel10.2-arm64
     - sha256:9dd64bd779f62abdafffd66cfefda9fe960c662a3083cc33be321d9c0e1c957e
   * -
       | doca3.6.0-26.10-050000-0-rhel8.10-amd64
       | doca3.6.0-26.10-050000-0-rhel8.6-amd64
       | doca3.6.0-26.10-050000-0-rhel8.8-amd64
       | doca3.6.0-26.10-050000-0-rhel8.9-amd64
     - sha256:e5b1830b80f3abaa9c2650ae1bfbbb00360605aa210098987b72a08f3b2b05d6
   * -
       | doca3.6.0-26.10-050000-0-rhel8.10-arm64
       | doca3.6.0-26.10-050000-0-rhel8.6-arm64
       | doca3.6.0-26.10-050000-0-rhel8.8-arm64
       | doca3.6.0-26.10-050000-0-rhel8.9-arm64
     - sha256:3d67ea89878f5f29ba6b4ac30f090df65a03ace387fc77d8f8797a148e4f8cbc
   * -
       | doca3.6.0-26.10-050000-0-rhel9.0-amd64
       | doca3.6.0-26.10-050000-0-rhel9.2-amd64
       | doca3.6.0-26.10-050000-0-rhel9.3-amd64
       | doca3.6.0-26.10-050000-0-rhel9.4-amd64
       | doca3.6.0-26.10-050000-0-rhel9.5-amd64
       | doca3.6.0-26.10-050000-0-rhel9.6-amd64
     - sha256:38e1d43186acce92a24a8b5f8ef6905116aad40409e6d313dd593aee5eaf9a76
   * -
       | doca3.6.0-26.10-050000-0-rhel9.0-arm64
       | doca3.6.0-26.10-050000-0-rhel9.2-arm64
       | doca3.6.0-26.10-050000-0-rhel9.3-arm64
       | doca3.6.0-26.10-050000-0-rhel9.4-arm64
       | doca3.6.0-26.10-050000-0-rhel9.5-arm64
       | doca3.6.0-26.10-050000-0-rhel9.6-arm64
     - sha256:7db45d61d658439e8448b5b72f17cf4ba04f0d7c9af1655a74b930b049956da5
   * -
       | doca3.6.0-26.10-050000-0-rhel9.8-amd64
     - sha256:5db450be7f96cc53842f3a7d8cf700887180e4e9796ba89a2a2bad85b36bf598
   * -
       | doca3.6.0-26.10-050000-0-rhel9.8-arm64
     - sha256:defdba13b4e1884b8a1a952102dfa71a435288de2a1944dd4770cb54099cb1ba

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-sles15.7-amd64
     - sha256:13470c2eac13d5223f73a5cfea7cb312b0302b4b3fabdb9613427596a2491ee4
   * -
       | doca3.6.0-26.10-050000-0-sles15.7-arm64
     - sha256:9badb6965a0688a96b1168e2572e575ab59b1691f12c30ee037297d9f620b03a


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
     - doca3.6.0-26.10-050000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-ubuntu24.04-amd64
     - sha256:03839a2cf17131678afc55c60f5032ef31714d8b904d12c9c175d67904552d81

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-050000-0-rhel9.6-amd64
     - sha256:f71236e25e3f206137c52dfe652239843c96a339f6ff13f2a0e19549af0b8e5b