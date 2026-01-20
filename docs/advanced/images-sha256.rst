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
     - v26.1.0-beta.3
     - sha256:0e8c33cf83aaa0eee88b53131a009d39dec4e1c397cdaf67061eaf6b5746c8fa
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.3
     - sha256:a9da9285b16fc065b8b983ad8bf8ddad80220974aa45887a24771f68c54ed0a9
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.3
     - sha256:0ebd70730b711fc84b63f9de1f83fec209bf16321d1bb77190692c19c891f876
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.3
     - sha256:ddffbcfe4c98051c54d6820cab6a58695131faf00f1e1504d435cbb6d0f8d3c8
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.3
     - sha256:80d97218dc5538f5202e9c7fbd792615335f920a636d433a5557ed8f4d4393d7
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.3
     - sha256:d9e0ac366a0283ec8e3f4ccefd4ed3fc48b092155aeb9b2cf8859719e45d1dd9
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.3
     - sha256:0d360d04efc002272ae1178a2e8304af8cc95649080b163c3ddb76c7b272483d
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.3
     - sha256:f7555ad30946d8f53d92d0a79a984892ac285b20066ac4806c3d952c9f7ead6d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.3
     - sha256:bd0b7df6d507b91a1c2a0b2d8d6ded8c6bdbaf00bf241ac7633919b99fb2d915
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.3
     - sha256:82fd598942b99e795ca4b5c4542fb6113445f352bf1ed8168a5614ca9b1bd230
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.3
     - sha256:444bddf8ff9b1a776510778c99f06619621d71c6ff2057c2a4794fb4bf43728b
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.3
     - sha256:14eed62548beb5718077e5558cee4fb4b43d4d8c95836e79a412af9886de4f3b
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.3
     - sha256:c5e3de694f3384750f4b664d431d08957fefd999747ab027a19d2a2f723da518
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.3
     - sha256:81c713763f2a1c25c473ea8f9e33552e43fc31988372a3ba808ed30da8fa7fc3
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.3
     - sha256:a4ab6b77b0c05bee42ccad9b4a023c4e5c419ca084253ba492dc9cccb5f6cb91
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.3
     - sha256:11831bde40f55366122f8f8c6fdf55eef6568e1dc1a2e220c584c3d8a48eee30
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.3
     - sha256:7c1a6ce3155a9200408eb816577fe9ef55a36cc158c0627cc65cdb28dcf2a75a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.3
     - sha256:32770da17bda9126e083b0240b33662db6af3c270312956055740692b2df5428
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.3
     - sha256:df20cab05f1f116843b9662be07b7c8b3cedbf13f72be8d906803f4ce01d393c
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.3
     - sha256:7652d85d4bf61c84575d454816064ded7ff0356d7002d3c016a1bfad3b636c23
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.3
     - sha256:82711a5bcbe8560d635656fc8836d0ecefa8594100a5b50cbfa7787fac4e809b

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
     - doca3.3.0-26.01-0.5.6.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-5.15.0-164-generic-ubuntu22.04-amd64
     - sha256:2d0d3410cc224c9585f0da43af93dd6ec4eaf147bd19f0ba9bfc1e5c4afcc02d
   * -
       | doca3.3.0-26.01-0.5.6.0-0-5.15.0-164-generic-ubuntu22.04-arm64
     - sha256:d95e05e30c6bb7a6b20827a85c40bd2c4fe7f240c69730d72b13a47678943801
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:e1ff07ced519a4694a60ba7de8c97c6700227cb9fa32aef5ad0669596fc21c56
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:5559db66677e83affc510410c93be0c1b9b3dfc5ab04772f75343d1a8eccb1fd
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.14.0-1018-oracle-ubuntu24.04-amd64
     - sha256:d0cbe2fc3cfd873756863571be9af69b9fff8b6f9c3538f3d54c84a65a401d21
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.14.0-1018-oracle-ubuntu24.04-arm64
     - sha256:987c73d1a884babd135e7b6f2a8e879a57870ae72bd40a051690390d14fe8c97
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.17.0-1004-nvidia-ubuntu24.04-amd64
     - sha256:17d00e1072db27ca8a20609d721b6078cdef4813ff87c0f6a4c0aee8ff23054a
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.17.0-1004-nvidia-ubuntu24.04-arm64
     - sha256:0a0a95755083a93eecedc797d59d8463497ab56d425a26d9cb77e8aef81ecaf5
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.17.0-1005-aws-ubuntu24.04-amd64
     - sha256:b9496a811739202677178952b87ba2c06ad2377691af4de978896e32439bd3c2
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.17.0-1005-aws-ubuntu24.04-arm64
     - sha256:28dc08da97f9357ce7fc7e9cad143754d2be448efbcee53d60e8a7d5904fa4f0
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1041-oracle-ubuntu22.04-amd64
     - sha256:73b1667d52f3e4a5a3c2ad918181d008bb3d545ff56e910c9afb36f7b44d3d69
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1041-oracle-ubuntu22.04-arm64
     - sha256:5c3fad38a5ead9988639d17ce9e1e73e901541005e70ea2f75209468b4271212
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-aws-ubuntu22.04-amd64
     - sha256:9ad10f91ce9e38969a14766a90995530f3385b68d7e25e69674b7dd8aeb0a506
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-aws-ubuntu22.04-arm64
     - sha256:97d96262448609d22146edeb1e0e03d9a566a08922a0c6a7829a8d4df6ea0e96
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:78e8992aea41f1a16338526204e802f8c22f742b10e61bd662a212c06d3f3d8e
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:5c7f44bd59ff77dbe255cd249d6171d1425d44abe24e01e0a1031e7cf8042e25
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-nvidia-ubuntu22.04-amd64
     - sha256:0c54f3df538eb94ed26c9cbf611f70c8aa41302f7dfcc6931af7f2bd3ba2c756
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-1044-nvidia-ubuntu22.04-arm64
     - sha256:a75a201c9fe4c3de9809fa9de4a8c5684901eb3a25b1eb04fc81db4b192a6425
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-90-generic-ubuntu24.04-amd64
     - sha256:8752a47ee76aade2380acb2fa2e6c2eaa7cb25fa2fffd8fe235b73cc5465944c
   * -
       | doca3.3.0-26.01-0.5.6.0-0-6.8.0-90-generic-ubuntu24.04-arm64
     - sha256:f64ad51e7a5086f69d3af12b835f474b6460c6e467c0abeb7bd695a482fd0947
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu22.04
     - sha256:4386216a2488c1ae428ea540ced242a2a32d4cc265bb0db16a41aae264948350
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu22.04-amd64
     - sha256:43ca6bc08cd43d3a0936f88789cf45df50410905fa060eed045631fedaa7b5c0
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu22.04-arm64
     - sha256:09983d4d90186845ef8fbff5f1b5cd5a6bf6e737d3bcfc773d7e20401ee3bfd3
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu24.04
     - sha256:b79d5a650d007966d6f5e81a274b6641ecda8625b773022669b76f3baa27f356
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu24.04-amd64
     - sha256:ac64f001f92bbcb3b7acbebc1e0788f81c1f9e113da4ed944f1758ad018cff1f
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu24.04-arm64
     - sha256:0cd3c99cc005d181f5ec37ed6adf4e0e6853c61d2d6040c37a740f5fc342e3cc

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.19-amd64
     - sha256:620586bb6c89cfe6cec50fbaf3a0f4589e1e8fac1647af70985cc5e48c81dfe5
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.19-arm64
     - sha256:4be7b56fd50b20f3e92ea32b80115cb162f46517fba9b6a30b4ee86edef8e01f
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhcos4.19
     - sha256:d3d4d83fea0eb01c9b7577b65ead632d2c883db2e85fb77929c13f056372723a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel10.0
     - sha256:85553cacf74e34636ff585e59575f84418df104738a0587fa5e7a3d3890b4304
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel10.0-amd64
     - sha256:71889155211956727ffda49890ad71c4d74bc12207d6009aec2291abd9f1b61f
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel10.0-arm64
     - sha256:2c1b24f6f1e7b5ccc41073ab9012af47e5f96e5b57101933dd8530ba32e2cfed
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.10
     - sha256:ef12ce33418930fc1cc00cd3ee01d035208ebba45607c8d32722ed7d0a62dcb8
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.9-amd64
     - sha256:ced95109655cade2ee0494382156ec86eab795074ec7678d0b4d0acd98f1db7d
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel8.9-arm64
     - sha256:5739fbf58353a657198c21e171efb6c7897de1f3817a0b04b7a2f5e85b31d691
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.6-amd64
     - sha256:e581402978b381c1832bc7a6db3c615abc944b82656a33c6babae4ed3dbf120b
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.6-arm64
     - sha256:fb8b152a026c29ee3a076b1bfd273c0c17577229bf17dd37f6dcf64972e46697
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.6
     - sha256:8ebb0ce39e99e982e2bbc1d74eaf3680f464f90c1ed8ec289c7b079e08730bd3

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-sles15.7
     - sha256:af73c1c0d74be5fa00d21d4f76fda935419294608676e2929effb242f85323fc
   * -
       | doca3.3.0-26.01-0.5.6.0-0-sles15.7-amd64
     - sha256:0646f03e4e6ea39ff93d8623360d7a8b947253e6f67dddc9ce524ab6ee6a999b
   * -
       | doca3.3.0-26.01-0.5.6.0-0-sles15.7-arm64
     - sha256:729f7b4b4028a34dae450acb93cf2cebf89f18cf3570eba750be2fcd0d4f85e0


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
     - doca3.3.0-26.01-0.5.6.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-ubuntu24.04-amd64
     - sha256:13b845ea9cf3a89679ded5197b66de26737df2734c66369143dc80b24dff6429

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.5.6.0-0-rhel9.6-amd64
     - sha256:1245a84578384e7ef641cdf0a1b40129658a71ce1eb7b416dec399d5829b88aa