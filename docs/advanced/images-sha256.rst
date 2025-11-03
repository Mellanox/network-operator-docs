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
     - v25.10.0-beta.5
     - sha256:47bbc03247faec58cab08bc7adf7c3dc30815c767fbd1b80a97ab7781af95bf9
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.5
     - sha256:55de5e9b93eeb014e50457b8b243116688d8848d6657ac70f2fd2d1a071cb49f
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:c63fb7f3eef0f2e73d480b8aabe204eb3b3579dfce05e19e9b646502d5f7dad9
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.5
     - sha256:ca0b040f7300e45dc185e2b6fe536fb38292f5a494b5e9e3bb3f7cb0a6fc9266
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.5
     - sha256:d569b7023287283a85e32ecbce472438e08e632e607ec7e020c574e29bfc6f2b
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.5
     - sha256:f7813577f8d0c2832bbc0afee0941a0621fb8cffbd7761aa739656641300c62d
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.5
     - sha256:532c0dcd74a2241b8a455488d7def8df29f0b71ad4bde8c7fa119e6ccff41e03
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.5
     - sha256:034b6b8e173d2e2221f1b588e48f8d28b0e70b5c37cabda7ebcdc17211f47bc6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.5
     - sha256:1cec527320a93afb2df73b0879d6384a6f945b059bbb5174a4114c514a57e064
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.5
     - sha256:ac6195e97c1c3e9094d360fe0913ff7bc53f0bc9c0a0a431e37d0333bb301921
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:fd3ee5e8699cd543a7fe9640b119141a3d983e8ed2650f6bab44fcff5cb9bf07
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.5
     - sha256:6882bdce0ce177f3d4c8e41e5c2553e35ff95690c4fd932a972df2183a713f97
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.5
     - sha256:c4dc2ee97a30f331512d0b707579f3e22df05419abcad6f43114e126080812d3
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.5
     - sha256:c524884641da88bf9aa83b09690cc13f0785f8599444ca377684cef514129d54
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.5
     - sha256:4e9462eab9909a44eec0538a404828e503254ca9109a606ad0ac009c710e7a80
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.5
     - sha256:55324c9a0acea0bd37c81bac2a4653ea4982214794891903c4b7f092464d3c25
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.5
     - sha256:3acf5c0fa77d1b4e67ccee0833105d46a85f42c84451c737b4b34d38bb3c105f
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.5
     - sha256:f28721191cb03d7b6cd90e69c28828433a4229b979c5c763b54b3cc640dd916d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.5
     - sha256:5fe6cf62792de6506355c3a5348be8382f242f3571bb77244f08ef8a5fa1fb72
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.5
     - sha256:0efc413c6294c41b519897bc12022a66991cd16dee00ca9113707c2a9ad5049b
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.5
     - sha256:a80c11a636a8b29d5c1fb54d1891362f77e9777c38a16cf38fc03189a352df01

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
     - doca3.2.0-25.10-1.2.2.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-5.15.0-161-generic-ubuntu22.04-amd64
     - sha256:c385b411b98f329a0fcaa0c7cd998407143b2027dc9ed2d587282f9c79705ea7
   * -
       | doca3.2.0-25.10-1.2.2.0-0-5.15.0-161-generic-ubuntu22.04-arm64
     - sha256:76d461cb1b833a131a99eaa4ca6750da3dc60352c9e20e07588bfcf20b72e4e0
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:1b00a00a02d6dad16bd5a778daba84b9470f8f617d1d72de7da4b8d0c3e3c826
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:d70a83d2cb22de9115642ab5fa323bb40b301f8d99f16c129effcee5a984213c
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1014-azure-ubuntu24.04-amd64
     - sha256:80f70da2f927e43020d9aaedaa60449f92c3da26269b73a21b010354971d01d5
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1014-azure-ubuntu24.04-arm64
     - sha256:95cf02786d6c6d8eda4ff19da2a07da0d930d908b38031b05fc0d2bcc93cfbed
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1016-aws-ubuntu24.04-amd64
     - sha256:7f1f878c95877c4186f21875fa35e356600038f008606a9d794f40a8ea08bcfa
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1016-aws-ubuntu24.04-arm64
     - sha256:8233000f1943a8723c99173295f3e4af69b62c3e3523cab4ff0ffef0480ec939
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1016-oracle-ubuntu24.04-amd64
     - sha256:d23b55854c22c5f42ee80db97ee217e771522e0d53d5c803ae4eeac376d2dba8
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.14.0-1016-oracle-ubuntu24.04-arm64
     - sha256:483e7476d1eee5d65938ef5a25a8b3ca301b9faf9c57cee0cdbbebc7be95fcc4
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1038-oracle-ubuntu22.04-amd64
     - sha256:0395be2814474abd0d4624a43fc5060ec3a53cfe5dd7db1b87d7137fe8226910
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1038-oracle-ubuntu22.04-arm64
     - sha256:6776dbb0dc763ac1d2566ea4d5a250943b5b4f776cea98b061ed119290ce2afa
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:6719c03c2a86dd04eff872db3cf19e071b74cd3fe080198c4407efeb7a479d29
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:0e816f842c11292a8be9ea2b0125b8cdca6c067ce9307c72d4ec0af23a7067d1
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:4dc6c72757f7f4698607048e90cc59b1b7a05d6f9d05b988d8add1e7633f8c9c
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:7af2dcb4d898c7ec33b5f47aac62014422398390d099e29973b1d7e12859f6cd
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1042-nvidia-ubuntu22.04-amd64
     - sha256:13124482622a925f10348e91e1965b4062cb840012e91e5481c28644fc3d5c04
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-1042-nvidia-ubuntu22.04-arm64
     - sha256:51e2cee28e99be3e4311280f1e643c85c0713338502cae616832aa69ebf2a639
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-87-generic-ubuntu24.04-amd64
     - sha256:9cd22952526483af4950b2493ebac42c8bc8e169f3796f32d47be105121ba257
   * -
       | doca3.2.0-25.10-1.2.2.0-0-6.8.0-87-generic-ubuntu24.04-arm64
     - sha256:5e931b5649477d4c9e0507b766ebd0d6677a3efd17da25f045de690eda5f4c13
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu22.04
     - sha256:3f8e699c2506eaf2bf3d337cf4be85433fd68ec60717399317a75890015b9816
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu22.04-amd64
     - sha256:0936f74f26b9912bd51f21487e22652d8d3c5cac0af29c86159b1bf633c05ae0
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu22.04-arm64
     - sha256:c7674f0c3007a7c96a94c9e773af476fb28cf970360e64e2735611f450cafb26
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu24.04
     - sha256:9bab6e7b3b1527ae816096a82b9db4774f8f4152a05bd44e8767a4704a6c486e
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu24.04-amd64
     - sha256:3581fccf3306425780663e5dd2f9722c587654ccfc6aa6ef6928564c195b63e0
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu24.04-arm64
     - sha256:90d4b63cdbe62597fa60583d3de6964a4a1eb5e4a74908ff220601b65fd83117

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.19-amd64
     - sha256:43f67e6ae78944bd95599f34021bc09f5027fdcb40bbd8339218d48ce0bb09f2
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.19-arm64
     - sha256:2e99e7e5c32113c827c65dbbc21b0142f8292524a41fc081bb036ac44dafe899
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhcos4.19
     - sha256:92b03d6bad1adc64a81fe5e16fc2a4e6612075cf4f617cfd0de5e6003d01d3db

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel10.0
     - sha256:9b730f838ac77e53b5a2ee85a3d22d5a9e8325fd1f6ac83230a23ec8e6e794e6
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel10.0-amd64
     - sha256:79fa28a04ece24b3265c0dc11bb92dddf3650183ae0b9c8bb8353fd0cc3a2cee
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel10.0-arm64
     - sha256:24d73fc668a2b7b8e6a3b265eb2ceb4a91e27491d65eaa1c144e1c7d101b8126
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.10
     - sha256:961f8e6854b9ef937f9794177d2132de3ff2fe7a6fed11f324f0f637166d97ad
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.9-amd64
     - sha256:f630513e576d3edd27f18af0abaa6c33e76a298dfc4747e08d921e7402213996
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel8.9-arm64
     - sha256:d791ef8b550270b70be7488d323b0f826bfd200c299c424b083c4c5fbc75da75
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.6-amd64
     - sha256:5f70dec030d1fa4a5bf9373a7e23fa29e501aecfadc38f9f88fef0197471de7e
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.6-arm64
     - sha256:0eaf919493dd0a68534c749b53d6e744979bb992f7e3344efdf990b7566d71f3
   * -
       | doca3.2.0-25.10-1.2.2.0-0-rhel9.6
     - sha256:b3996a1deff0e2a9fe457889d54028652478854e83bc0cb1dc92b691360c29cd

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-sles15.7
     - sha256:345422bf1f0d27bb028b7e3a54ae9e29f00d8ba5cd57953a5aa769357ab0f57e
   * -
       | doca3.2.0-25.10-1.2.2.0-0-sles15.7-amd64
     - sha256:08a44412bc3a741b04f8b1aa941433bb6a5576cb8b31da29541486c203f12d7b
   * -
       | doca3.2.0-25.10-1.2.2.0-0-sles15.7-arm64
     - sha256:46d197701bf1e0b7990183f38cd875cf0349c8658c06b65b9475e05385339ab2


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
     - doca3.2.0-25.10-1.2.2.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu24.04-amd64
     - sha256:84edd168c0e528dff5fb32f0e83338cfcd2b905d66b3cc0cc04d0d6789d6d074