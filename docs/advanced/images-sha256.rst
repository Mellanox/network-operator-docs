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
     - doca3.5.0-26.07-0.7.7.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

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
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-138-generic-ubuntu24.04-amd64
     - sha256:4811f2cc9d822fa9032e43734f313a19013cd49acb1af971efb18113ac6dcc8c
   * -
       | doca3.5.0-26.07-0.7.7.0-0-6.8.0-138-generic-ubuntu24.04-arm64
     - sha256:0063f39093bdc732884b855e22877cfc962e4741e609aa88e3eab905be5afc72
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
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu22.04-amd64
     - sha256:f56af38fa5a232b21b3d170bb0345a1f687f0ebc88aa2466445635a741a358be
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu22.04-arm64
     - sha256:590a82cfe01fb87d3f8a7a67fe9ca34a764c20a70cc0ca60c8c1223a65d2a690
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu24.04-amd64
     - sha256:b9e75f514aea9c90b54cd689b1756178c9003c54c8b6ee8eb9c0d11dd3f18425
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu24.04-arm64
     - sha256:30a20839f9892fb96b53474dcbc4bd19ae55f8f0fdbb2186b03c1388dfd2dc30
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu26.04-amd64
     - sha256:ae488f7c5996dc5b8f50798ec7f5166ba8e113d3e416a1dff307b5e48e2535f2
   * -
       | doca3.5.0-26.07-0.7.7.0-0-ubuntu26.04-arm64
     - sha256:f6ab3740ee7ee51427e5eb1d3f9cc3d1473f3d186319551ccb852f42dec65a3e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.7.7.0-0-rhcos4.18-amd64
     - sha256:0714d39e688335f1a303b77c24c9747f84ec148ee8db8e97406b0e34e9dbb26b
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.7.7.0-0-rhcos4.18-arm64
     - sha256:d69273531bbc0ce0c78b9a0b30f5b138b8867a04b09c727c43b78a0075a6a5b3

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel10.0-amd64
     - sha256:92dfc2d6c6687fdb3e9c9ff524695d72b4b791f7c1127f9799633eaa15a4d75c
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel10.0-arm64
     - sha256:7f0be6c284b8e565a87e811a83c11f69dfe3d6625679748040b24c5b246c0a1f
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel10.2-amd64
     - sha256:8d19fa70116cdfb23754c92c5047bfe1de9277a9852fd55a0619fcf2aaba54cf
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel10.2-arm64
     - sha256:72a596f2a3bee99f8ab842aab80e2b1b6918716952b4e533c79727e4874870d6
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel8.10-amd64
     - sha256:899ab9209f555392aee8a0da86d894dd4ab42d36e2fc7f1e21eeadc2dce4164a
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel8.10-arm64
     - sha256:f1509cb991a9c6dc18207ab00eff7806755f674bc0ef04a332169fa037075402
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.6-amd64
     - sha256:81472ef09dc1633450ed16ff150fb3c9c4b12c4f0d3e965837185429ec65028e
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.6-arm64
     - sha256:4abf24a5167b14db33fc7ca7122b1b4d1167ed2a2a42630ae4aca22b6f0ad3bf
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.8-amd64
     - sha256:310ea3186839c158029f0ee0e5d118e2c1e8bf8012c37964e8a449cc48a86cd1
   * -
       | doca3.5.0-26.07-0.7.7.0-0-rhel9.8-arm64
     - sha256:eaf6ce1d2622de5ad59bee1a577d14d362a96077980d6c6d2d72148e1eba4597

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-0-sles15.7-amd64
     - sha256:8d3f99918ff29e4864e53faf60800dab980cb040774c8eea431e86045444b32c
   * -
       | doca3.5.0-26.07-0.7.7.0-0-sles15.7-arm64
     - sha256:9b274d61dd6e8de146ea06f48f8b664c8acc28d51841a82937c148e5d10bf1f8


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