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
     - v26.1.0-beta.4
     - sha256:4a42574b4c9c9d8d3d2e43206aec8a50a255ba1cdbc03c21cfb254b964444350
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.4
     - sha256:6eb2aee526866cb7b75acdfd620b4987833b3f15e79fb7480371467f866e07c5
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.4
     - sha256:f4ad9c8cd1182a633a834c4e2dbae963a2fa166310349aaedba047074488e5a1
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.4
     - sha256:9b49ca0ffe5a100053f4e73cbda2036b5ead0b8178db1152c52f9eb5b6e8e248
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.4
     - sha256:163f9f9b14729197662ce5dfb7fd8ac8ead669ce4f38a41d8fcd53fd73e4d0b5
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.4
     - sha256:39dc533983ca91edbf69d4b09492ba21e96a4576722cd0377bd45e4b48c6846a
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.4
     - sha256:bf1ee9d60550c48be74b0c25e145a4bfa99b881e0696a58dbad2a219c8bcb0ab
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.4
     - sha256:81f7510843219d5bc0e63a6b8f0e94abfe15f9672c8edb429bc4c3017c82f188
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.4
     - sha256:8cee4a649d34387a5f22f924575cd68055d2b328ea15b5df788d222014ab662a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.4
     - sha256:44202ce64cf09138593825a28ba3d9bb333c17aeff4a1e41e1b1ee735d8fe3bd
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.4
     - sha256:9398636b9a5b7db45aa8e3b906371ea5c40a5c895d27ad542df73f1822bfff01
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.4
     - sha256:df0487776c4b81495fb90229eb86d59ed7591d1bcd9b57a5f4aafeba4bb8d07e
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.4
     - sha256:86b954ae630ae1b033a829153c68b9b9a573b66a21282d96617cd6d863a78371
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.4
     - sha256:2945a57f18ec750e46e434359f3a415c9b3d04360f9c3dbf621029eaee84f518
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.4
     - sha256:1d42fc0adc9134176fc126417e3e313e281ffeb85f4dce32859704ae5769a6da
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.4
     - sha256:4aacf77964d107ab7e249871a61cc9928cc275fd2dd5c413efc1ff47e09d64c2
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.4
     - sha256:b287397bfe21a0030abd210199a179eb63bc94fbac14f0ed68a473db6ac85d0c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.4
     - sha256:cee4dbd6f578246405a9481a1b7c83a035757fb79ee1516e9f4f1769db51482d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.4
     - sha256:2e8b08207b905e3222b7025a59037ba36f8c8e2ad1130a98b07a4a9f34c7ce8f
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.4
     - sha256:0b70e9286a5cf10f3bc8a6864455d14716b21f5759816c30e2872b163e4059ad
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.4
     - sha256:7899b5d1d555f9a9f4b6ee0ee1f7b2c4f2b6546552ccc1a52d0d9073e02d78fc

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