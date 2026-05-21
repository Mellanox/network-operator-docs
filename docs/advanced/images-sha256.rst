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
     - v26.4.0-beta.9
     - sha256:99bb0f5ae26aa6e1d131f052dab95bf07af79a785f43196063715ad7a1463a15
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.9
     - sha256:4c877e2fee565b632eb8000c616055ea210bf8b6c8b097db795a55d4e6b3618d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.9
     - sha256:a92466c8d1757965d5ca5538267231eb0d39c6ffa870451d49bf261079b09919
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.9
     - sha256:32ed00f05352129c188ca1b5197c9dc474fef92ac0ab2ba7c206daaeec523286
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.9
     - sha256:4fc8574fa9ced0a70a273d05d1fbca7404279a08870e25330d50bd2d0360da95
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.9
     - sha256:b44deeced4ebcacaa57b4ed41fbe331d4f168d6b8dbecaa18f59675b85428cb2
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.9
     - sha256:1edc08e5ec5a942c9183326c42b338c5df74036b164128ceeebd339b25bc14f7
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.9
     - sha256:9fe8d173948207b1759a6f935b54313b16eb9a167d6f6c6ed35bdd9f3db7dc14
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.9
     - sha256:870db5e396b038197d01d91ed7a9c4510860fb46f5ff2d7b8348f05c79b17f28
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.9
     - sha256:2e6b3c6a226cee5fb9e4ec1f4b6fee836751908ac61958ea42585c55c7b0e601
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.9
     - sha256:a4625696e420329c19426af406438d10d28f9f9da0fa90c4b4b3991c9a5c29b8
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.9
     - sha256:795acc0f92857c38d4bc1f614db2c62da8262cc2983f48a670da54e361d986fc
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.9
     - sha256:e02639b498a11331a0719bc6c2cc0d6febf11f98ed8172834b63e20fc5af0635
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.0-beta.9
     - sha256:de9a1d2572e6195f213e0014a755c6523ba545a95b0af219edbeab6e6a16619f
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.9
     - sha256:1241f72483d2856a44e399613b1a7e8395bed02513025f475705aa25b5a4c890
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.9
     - sha256:4cb8f55ce0e0ae59e57ac120ef09c87ea5c449e3c840d7c4751171d5b1261d4e
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.9
     - sha256:66d231707d35c96ea282b68a2ea72107717e447607a5defbb39d08669c84e5fc
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.9
     - sha256:6ca9a5f25aafb3e1021ab207c4dfecfa2fd1d63c9b7071348b5113c8dbc61812
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.9
     - sha256:ad9dd6cf3e140aae8e13382084bc9944989e6e8c31459cbd69138d744f527bcc
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.9
     - sha256:1e54c44c8b320dbaa0d9513065e205781a91d777580eb7a996bc3c018f4ef687
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.9
     - sha256:a60b40bfdc2d67403150b611d75be939307ffa93d6ea61d25511b45a9e92a7e6
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.9
     - sha256:6bb44306dc5cbf6dd821ff37894ef346ba694badbffb94751980314b28f4b2d3

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
     - doca3.4.0-26.04-0.8.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-5.15.0-179-generic-ubuntu22.04-amd64
     - sha256:e8028c26851229b4435d206852bceddc895a0b1bacee704b96ba07a789b9706c
   * -
       | doca3.4.0-26.04-0.8.0.0-0-5.15.0-179-generic-ubuntu22.04-arm64
     - sha256:67ba75e2ef80a19058d24002fd7337c29b78a3ae93ee936105f3e011dea570b7
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1013-azure-ubuntu24.04-amd64
     - sha256:221916f64a8ca612fbb8e1a6a8aab91a1d223e468381bcb3381cbccbe5c057c7
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1013-azure-ubuntu24.04-arm64
     - sha256:2851d13b9db5a7356bee198a8635690e271e50801125abd727995ee2cc600625
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1014-oracle-ubuntu24.04-amd64
     - sha256:1df455dd4e8f296737ad38a636bf0adc9c1f04bcbf80cf95862b516db1867091
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1014-oracle-ubuntu24.04-arm64
     - sha256:a1377427e625c2679748c4f11dc9e747617297261d494a61dfa6bed49804b4e9
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1015-aws-ubuntu24.04-amd64
     - sha256:67b98b7cded291f4f8a6cdc7fbacf3080bf3337970063db1517e412ad3969f29
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1015-aws-ubuntu24.04-arm64
     - sha256:34a333355d0fae0b7997b3c32a6167c7c7b45755c60cc0a8f2f897876710d06d
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1018-nvidia-ubuntu24.04-amd64
     - sha256:21c26eade45981a6ee7f01e19905d5ea65deb46f87baeba191dbdcc913484b8a
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.17.0-1018-nvidia-ubuntu24.04-arm64
     - sha256:41558c7500e7ddc0b6c24f663fb1fd35050c53e250a5e1fe0261921658afd651
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:92aab6dc5f33b4cc3a56993bbfd45f184f20e3bb808b2796461a1c6314f11450
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:df1cf51b9bcdf201026ad554e76093e482070a1eb145d6768a790daeda00f147
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1052-oracle-ubuntu22.04-amd64
     - sha256:44d071dcffa4ea0963bebb47ef247495f1b4d0d3a4a8ef140d2ae5aa56e982cb
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1052-oracle-ubuntu22.04-arm64
     - sha256:a6ca60fa7d1cc44e52b7bf27910c5c262bf4419417540a5880e95ca194fa9244
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1054-nvidia-ubuntu22.04-amd64
     - sha256:3f11328bacdf3ae588f1f4cb247be2377c4cdb6513e9994bfbe393948f5a56e0
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1054-nvidia-ubuntu22.04-arm64
     - sha256:d2116d59a0b2a2219aa2078d9a28db4064d1cdd5e22c7cdd20b38a3725a33ed5
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1055-aws-ubuntu22.04-amd64
     - sha256:8a27853599dd133c5fa9ace3ab3d38f6850375a3e65f605e548a610c4c4a8539
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-1055-aws-ubuntu22.04-arm64
     - sha256:b47bd5e90444c979628e84c94d6f58ef19409e140b26d02f3e548ddf9f76c5ff
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-117-generic-ubuntu24.04-amd64
     - sha256:b4e7bf4f7ef45aafcb1bd67de263c592840409af0c2beceae0c8abcb0974e201
   * -
       | doca3.4.0-26.04-0.8.0.0-0-6.8.0-117-generic-ubuntu24.04-arm64
     - sha256:f8b0d436219094d5ac7a8dedab0cd1ad01a2bea5979ec9c20d84717978f00280
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu22.04
     - sha256:37845c87d9000311af84b6593b120ac9b8084d9b97dd93c56e6815c96e2ca9ea
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu22.04-amd64
     - sha256:dd23cb2556674c89ad4b7f81b594ed4f8872a6116f20184a108be1282f62fdd1
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu22.04-arm64
     - sha256:0341feaf3e206f009bb0515336985d4a0ecaa9ea341b8884521e330f7b31bc56
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu24.04
     - sha256:f2e2b98c31bd8f51e409abb7de77abb2b95013c8f746ce7cf3ddda7ee172c22c
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu24.04-amd64
     - sha256:3291a5d2e35bc191eaa13f4d7e7dc5f819b7728d18cf7e6c98f76d9db24126e4
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu24.04-arm64
     - sha256:9cda249fb139e5d198c8f2031ca9b4d44657bcb269f06901775008c25622d13e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.19-amd64
     - sha256:2a6b618d8e1b7cfa2fad264cdf9bce853a02146730d3647a174dee7f2e226339
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.19-arm64
     - sha256:e973aff143b3ae0d8f34c19ad63bed426ba6f918a79f3c7fbfe4d03946c6e24c
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhcos4.19
     - sha256:e08f4478a5978d6cdde20fe37b4487c08480ecd57eb33e212383d118b16f650f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel10.0
     - sha256:d8438a455888491765b4cb7eaf183038d3371f85344fefec0531412ef9fd4587
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel10.0-amd64
     - sha256:347a3b3c635e04804d87f5f845e25968b3c508327b843a4db93cea452ed4c2b5
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel10.0-arm64
     - sha256:00e3aea4a210a92d30c541cd47e15178c8af6d297c5b555a985febc4ede222c1
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.10
     - sha256:9b9f0538b03e366dbe1dcd654474c0e01a2d985b30e5e71aa78a7aaba639159b
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.9-amd64
     - sha256:9b7579f8f5d978aa81bc3b8f2604b10b108ddbfa7f5a3dd71259571f32e038bd
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel8.9-arm64
     - sha256:1b946fcee212a7b1f53ce6bf2187d0e0479e6932eefab024ee0b21421c4b82b7
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.6-amd64
     - sha256:60c910b4740b11acf55fe2a9d8f3077fa8bd209c63605c714d91365da4ef2ac9
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.6-arm64
     - sha256:df1e6eb49403586f05beade537f610a10e9ec2b21ab425b92e09cdcef76de7c9
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.6
     - sha256:273f79f7fe31510cb8a42fc5a1cc20a1129d8bde7ce172267f1990a4a0897e4c

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-sles15.7
     - sha256:9186897a512b844984b6bb096945e9398540278e19da46f8b5501a972ffd8d08
   * -
       | doca3.4.0-26.04-0.8.0.0-0-sles15.7-amd64
     - sha256:7eedfe373a1d406d5a504ab3e7a9e38b5d432ccb3aa73783c91a3eeffe3eb291
   * -
       | doca3.4.0-26.04-0.8.0.0-0-sles15.7-arm64
     - sha256:0e1043a7c3fcb3c60173ad19fba3442a1e6f267541d0a39505807f93dcfa9b94


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
     - doca3.4.0-26.04-0.8.0.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-ubuntu24.04-amd64
     - sha256:e5258f3e4e99ca8cd608a5efea1b7619ab38154ada6402460e50dd46af20ac06

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.8.0.0-0-rhel9.6-amd64
     - sha256:526e700ee945bc08875712b0393852e9bae63f7bfdcacc0e6863eec4302c8e46