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
   * - nvcr.io/nvidia/cloud-native
     - network-operator
     - v26.7.0
     - sha256:7647afe6b48137de7574f5aff0fd06b52f169c1c02f3a3c1a56948185ec5bd4e
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0
     - sha256:916e812d0db507a01e5d093d23ce25544dd53e3d3dc5349ca0cd81c05f10d5b6
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0
     - sha256:2d28133fdee8c263e19b4d0656bf58d30513c9d13e47ef84bd68c5499b3c18ce
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0
     - sha256:9770dc01185e0c9e1e6a600af2eccab5756985fbf665f553845c5a9e67dac84e
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.7.0
     - sha256:538c30c540c3bc69a95c44da8f7048aedaae39a61fa73a0c20a390942510cac4
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0
     - sha256:9f80b77238e67229b3849b803d076e6b4c8d3514c428d8fa8ab46769932e1785
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0
     - sha256:c17e530aba4fa28c0403de72fd3b5b05638e8aa74f456d53527df89b2f4a6a52
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.26.5-doca3.5.0-host
     - sha256:3ec2bb66428e5a6c7137ed9680c03dba03618b03521d92bdcbdb2d7e2e53e029
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0
     - sha256:cd83fa929f18e34f5324ec8e3d8d454fe520997e8b477fc16d1eb72dd1b8df20
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0
     - sha256:4efd27eb7203373240eee566977a49c0c6751ad29f80589f34f2f7e44cc5b3b1
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0
     - sha256:a6d46f173e6ce9484d3d51ca112f1719f7bb959404329c98ea285a0c76d17697
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0
     - sha256:36367997ead028a1713d46ac3f0552e2cae4349b3c070d03a2d0d31e3c620ac5
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.7.0
     - sha256:da9ed046056867d7d149ecf2da0a752ec315e2000f88c1c7f437d921d1db9968
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0
     - sha256:dd09ce0b52d26e9484e4cf92a818a0b66a323633d11111c5109bdd30c0a155c4
   * - nvcr.io/nvidia/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0
     - sha256:f8b00465362f05019bfbe41cb431c1a59efb3e9c5a756ac35b730dab679ce629
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.7.0
     - sha256:ae947249ab1fcad77464fbbbd12c851ae905872f76ef4dda3a5944a32b3a2dc1
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.7.0
     - sha256:2c9761eea72bb1ac06e288ee1982b835e8ee9e93d141a6436c3fa8d559be4163
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0
     - sha256:a5c0fcaff6a8a3be71707e86600064023336cab036c91477b5184d403761d286
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.7.0
     - sha256:d3235d1f7be1fe825f23feddd714bc44acd0bad305ca598b365cd134f14ae28e
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0
     - sha256:c1cf537dfcf1b7e80cfcbc8e0c0c81a417202a8cfb79c0a60f0350165dd01843
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0
     - sha256:84c144425685560bd5855166d78a541c65fa3a83196fa3d2171ef7efa3a202d6
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.7.0
     - sha256:581cfecb65f7b2b63f21b4ba1eb907cb3617bb9b066d4336f56ece2a86d224ec
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0
     - sha256:ed081b849befe0def7b2a6fea095ee02d73757e8b8b8f3dd04156a4c61ac8bee

=================================
DOCA-OFED Driver Container Images
=================================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
     - doca-driver
     - doca3.5.0-26.07-0.7.7.0-1


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu22.04-amd64
     - sha256:79aca7024df168e3b7e846cc5404d9d83dce92d4542e452951cbd6c47fa3b86c
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu22.04-arm64
     - sha256:85666ec7a9d60b371f1f6830b61cf82052305cd41e46d6c43b115a7609509175
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu24.04-amd64
     - sha256:423e43e617f673afa52a94bbec2a204b166a6ecac306f0b15c1b7441ef9b5bd6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu24.04-arm64
     - sha256:078eda21ec5d6883b4e11684872b2016da8afd3add683381600ccac6bb6300b7
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu26.04-amd64
     - sha256:8ef90df6673fc431431f83ccf22a15ee7af6eda317bd03cbb1bf24a97cc6cccd
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu26.04-arm64
     - sha256:1a04dff923a966d94c2de5ce1d894e5c8ed6839a4fdb3ce9e046182c60f46d1a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-amd64
     - sha256:308826e3af01eea6c42bc45ce99abdebd3559cee0bb4caed6457b31c339208c7
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-arm64
     - sha256:4e49fe49626daaf613d036c090bcb0cb5f46bfaff9be930b65854612ec7265cc

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.0-amd64
     - sha256:d9f9f2dfd935ad9190f2b60f370a3513598d8b5ba56d33fe24d1c2c8c6dba75a
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.0-arm64
     - sha256:3140a8517b2c9d8ea06f9e45664f2ba86484e55f4111a950cfffc0276ef32339
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.2-amd64
     - sha256:c6a37b347b470cb2eeb1e7c736a586fb8ef953eda8cf9b6cca6ceb9642a23de6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.2-arm64
     - sha256:23b2eaccf7060e0bbe31e9144c95210fff7e5ab2740bb2a88877fbd13686658f
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.10-amd64
     - sha256:ca98318595c2ec01b5822e77a6faab5a20584f5987ac4ec636d07ad95d33a497
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.10-arm64
     - sha256:5f619078a7c67fca86591ec715ad423554fde90d0fdf65eed468d05c4ebe97f4
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-amd64
     - sha256:9635aabe482997fc8cb9172edcae0c1c36446fcb75189bf1b829541c12990b13
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-arm64
     - sha256:6ff9c6d39bac92202ef44a9ee2d7a99ff354070482f05dfc26f48af1fcc3cc88
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.8-amd64
     - sha256:3598650ae89100f8f43713a906a50eb50375a776e06a19d71e214d6959b9dd3d
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.8-arm64
     - sha256:f50b90c9bc651ec9f9abc814b395ccec261a024f195efd476500229f423eeba3

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-sles15.7-amd64
     - sha256:707765c29ff83294d4b67c2f46bdcae0a1741588c95ce1f9063a7816d5c95bf6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-sles15.7-arm64
     - sha256:c7587af27562a7afdde60f113bf6eb88f92ec3115c11ce4387d21c34620b32de


=============================================
Precompiled DOCA-OFED Driver Container Images
=============================================

.. note::

   Precompiled driver containers are published for ``doca3.5.0-26.07-0.7.7.0-0`` only. To use them, pin the DOCA-OFED driver ``version`` to ``doca3.5.0-26.07-0.7.7.0-0`` in the ``NicClusterPolicy``.

.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
     - doca-driver
     - doca3.5.0-26.07-0.7.7.0-0

The followings precompiled tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-5.15.0-190-generic-ubuntu22.04-amd64
     - sha256:1eed4f36e0e1baa17a13e3ee5af0792388d7fe6ee7ba100bf72ea4312010e5d6
   * -
       | doca3.5.0-26.07-0.7.7.0-0-5.15.0-190-generic-ubuntu22.04-arm64
     - sha256:5b0507612df12cb6d1ef5cc436d2054f6fdc7f3bf525aa50b07e8e347ee16ba5
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-138-generic-ubuntu24.04-amd64
     - sha256:4811f2cc9d822fa9032e43734f313a19013cd49acb1af971efb18113ac6dcc8c
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-138-generic-ubuntu24.04-arm64
     - sha256:0063f39093bdc732884b855e22877cfc962e4741e609aa88e3eab905be5afc72
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1060-oracle-ubuntu22.04-amd64
     - sha256:0ef071d91899e47e400f8e6b3f066f674513faf2a71afc61c0abb72774f8de4d
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1060-oracle-ubuntu22.04-arm64
     - sha256:b49f2280bdfc7891e9f903ba7c5de25f8bbee08f3d228889a7459d8cb949977b
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1061-nvidia-ubuntu22.04-amd64
     - sha256:67f60e713ef63759a9cb3485250f8faeda7717d9692f7f51c695d721e6a24117
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1061-nvidia-ubuntu22.04-arm64
     - sha256:8b0d79e93e86624bd795a601c2172ec2adbaa33b11b2da22979c13efe1f0c807
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1063-aws-ubuntu22.04-amd64
     - sha256:e1410de1e22a3347067f3160136943ef114658bf90c8f243bb3ff92d1f0d6095
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1063-aws-ubuntu22.04-arm64
     - sha256:709ea019db41882ac632de9575f8166e587ee4309d5e8bc5c0329bec1b96c9ee
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1064-azure-ubuntu22.04-amd64
     - sha256:947d061f45d75bc7a0aeb1d841dadd4546469c7336c3a6688c3dcdd80500ebda
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-1064-azure-ubuntu22.04-arm64
     - sha256:3c555ca7b7898975bd6388a29b425323f6588e6f2b4a146515371d225075751e
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:2022c6a78c71c2e35905517549df0130b031ca1587b79a20c5ed052983dff0c9
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:2022c17cdd0614385758534672d5a787edc012ead9fbf6eeeaeec78187592ca7
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:8cfb05ffd3ecc21edc18593ee519d14c647b748df5abbd54df2156a4de07ffa7
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:a841dd8e314fe1dba63dd6e78a07c981e8fdfe0f430d597bc8b75ffcdecdf10d
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1011-aws-ubuntu24.04-amd64
     - sha256:41532320b297290203828df5000b37736874b852a60d31da69e3589f667d994c
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1011-aws-ubuntu24.04-arm64
     - sha256:c26ce629fdf653c3ce06a07a5f46df5de422464e72988cca435050b4cb2c208b
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1016-nvidia-ubuntu24.04-amd64
     - sha256:ad15b0db3bcf272b1f3c8ce63a67fe9fedb099501981975102e95c781a139e34
   * -
       | doca3.5.0-26.07-0.7.7.0-0-7.0.0-1016-nvidia-ubuntu24.04-arm64
     - sha256:63e39e771f791338989c90b93b1b31b7e5a68aa4bd5711605b0b9995ba82f92a


=====================================================
STIG FIPS Compliant DOCA-OFED Driver Container Images
=====================================================

.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
     - doca-driver-stig-fips
     - doca3.5.0-26.07-0.7.7.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu24.04-amd64
     - sha256:b88aec358926ab6efafac0a9b3d53bf4891dd8cce85f41c98560d655fe3aed73

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.6-amd64
     - sha256:79ade4782ffa5ad62076588c893d98202fb1c997c91a27f60a1217e040015c83