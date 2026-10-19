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
     - v26.10.0-rc.1
     - sha256:ad9699229ff12369256f76bc7af958b015de56e44b303ac5ff6f2dbfe0647a2a
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-rc.1
     - sha256:c11bb0d6cdecb1bc49bc010fbf1da249e37c12c73b67e2d43fb27d9506a44428
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-rc.1
     - sha256:bacc5a0a995acbb19d0228ff38e11dad03ff1d7953a1ef64c2799bb8bbff375a
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-rc.1
     - sha256:32723026b9d7bec19474fb9205986e142c8d7d1be4b503d40aecc978b29bd2aa
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-rc.1
     - sha256:88bc18db9908adaff6feff5ec08116267ca98f8bbf9a56ea13ddd9942a065b27
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-rc.1
     - sha256:d3be8b03b44b76fbdaa1004745265da7b60e314a925a67ab2df76fa3e348600c
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-rc.1
     - sha256:598f48970ba35eaf7c3311c66ba3da53e40fe94f8b768cc22c43316faf1df350
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.6-doca3.6.0-host
     - sha256:43cd127f4fd54735a905c6d6765eac1992b38cc0e2b9946fcdca51162ce2d284
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-rc.1
     - sha256:8c3e2d38eea3f7b04fc34b878fb64f3d0f4b19fe1dd7846fbc77c9aeb364fa91
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-rc.1
     - sha256:e4b355eb1bd9cd50cb0bc380c55ad1ed8a22442b11f642dd0189da86d85615ca
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-rc.1
     - sha256:88cedfcfe42f60263bb5612146e40733d158330d4b0fceee80fd6096289991ff
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-rc.1
     - sha256:8d89da28cca2d63d8bff116e39cf1213af9a8c2b5e64ec221cc06b63857af79c
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-rc.1
     - sha256:2183c060e82e52cec0e45168ff2f36fd9980036a99cfff52c93069817cb6b23f
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-rc.1
     - sha256:0fbb8619e355cd49e745eac40e4cf027d495f0dc0d2f0c3cc3bfa5a6ab71e5de
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-rc.1
     - sha256:028259cd6de330bea3ba6825faf1bc2b195d46496c379f7ab067445d281e3799
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-rc.1
     - sha256:7dae3b709077cc05735515a56809b6be5c681ae7931590aeac1771c3376303dd
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-rc.1
     - sha256:0a69a8a3b8efbf6b4ed9acb8e808423e750de9598af116db82b895fac6f8542a
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-rc.1
     - sha256:3f07038df2ea1848d9eff6f0ce1dd42e29c118c3be20402a3fed9da082ab213d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-rc.1
     - sha256:781bb55dfe94c0eadfbf859e4b60a35b55d111e5268b2e34ad20f03bd490b6f7
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-rc.1
     - sha256:be7697a2c1185d396bc645fee793e2419da947dec4916958a0af5900cc4ac424
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-rc.1
     - sha256:9dd929f12e474bcf8cc4181593ad6a3bd2597c7875acb163ee38faf6d5b4bc15
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-rc.1
     - sha256:a8e91d3a2e3c74620cb1ca02b01abbe7556c1ecf270d6ef332a8e7b06999fd4e
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-rc.1
     - sha256:9ab9fdee08b09df55c26517c6e954b0fd2c2bdb3aa82775107620eaf6d32d22c

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
     - doca3.6.0-26.10-058000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-5.15.0-198-generic-ubuntu22.04-amd64
     - sha256:3f188545c1515255fbdc80286cbd978dc86cf3fd5c0cbf096ae0bc054c77d352
   * -
       | doca3.6.0-26.10-058000-0-5.15.0-198-generic-ubuntu22.04-arm64
     - sha256:d254817d7212f9270b75d1742642d1c7088fb109b159867b25216609e3997419
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:2c32855013d882e514e2948905aeedacfa9a5761da206db5a1f183654d5b66fa
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:a3b7112d38316d38b355d1515dcfba186067562cc21b9c19ac71ab2ed51fed31
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:e425f5b41ffb770a8aec164b77cec112ad13c7b3209b877bc16788ff0d386410
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:eb7aebefb0e28dfd196a33fd7d49900372611aa32efd41dd1f868bfc7f798f16
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:0cac9d7160c032e6fb60290194e3f1a3d592e569b4ec441a34bc2aeb18cb34cd
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:76e3b2bf71393b517e7c19a056a0bdf549a6220a9a42b7c9227355d204a3a0d8
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:23cddcd10087060423d00be675aa108ad2c3a8db68130a840a79ebcb0d18bb5c
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:de34738bc36a508c603a3dc5f21755119af55578fd08e5ffafa3e06e8a127cfe
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:308ccca687164d009b57da7add81ce7bb548868841e8af304fe953a0f85cb297
   * -
       | doca3.6.0-26.10-058000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:aafce4bea55adeefab5ae0706eedb1efa18d60fd599b595afb259eb6898b2830
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:57fa9211884d7a38365308b826bb755e262405e7706e57deb8b9d676dc31797b
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:3a10bb83aae212209d79aabfd9c0d47239913e1a25699658b00456d94ca1765c
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:26d2f8053c9d6c60bb1ede37de395e26df04e8f5ba7ea044a6fc0c19668bd4fb
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:f31594b791f04257d7530e15c731ebeb39ee0398dd87c2cda6260d064fde8714
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:7c432a29e3f8c8b0cb092fd8f9b7402c49089b685e70ceaa31683b45d684758f
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:6d2fee82e0fb9d4d0c42d5cccb32c2727f8d50ba3f9803dd216c0ebd42043683
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:a03a64d878b27ca48f0a7fa0f092e5926c28efd3c571cb2caeff35d2588f31a2
   * -
       | doca3.6.0-26.10-058000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:80662a29ddd29cc55af2fda33082a5a04fb7e0145250e22227b9bdad14c67acf
   * -
       | doca3.6.0-26.10-058000-0-ubuntu22.04-amd64
     - sha256:f5b5117260cc05587404b3c5ed4f7ebd89e495045c7a45699292b42fffd4a7e1
   * -
       | doca3.6.0-26.10-058000-0-ubuntu22.04-arm64
     - sha256:924024422afeb4620f5cd6b5118d0b252ba9bdf1fdffc27e8f3067608626476f
   * -
       | doca3.6.0-26.10-058000-0-ubuntu24.04-amd64
     - sha256:bfee202ef141361a9a199264fb23066c4af7b61d4ba3041eebb79e9a8fdae780
   * -
       | doca3.6.0-26.10-058000-0-ubuntu24.04-arm64
     - sha256:c8440d5598a25e6fae7f62385f8ce94cfb698ef35bc6624268b91bbb8427b537
   * -
       | doca3.6.0-26.10-058000-0-ubuntu26.04-amd64
     - sha256:9e43b0769582ad11cdb23bfdc9daca27b8ce10f320376c029b0a0062b7f9a968
   * -
       | doca3.6.0-26.10-058000-0-ubuntu26.04-arm64
     - sha256:636a3b946eb6dd69b3c1451649e4bc92ebe783ebfac1c8d3a52b6e4d7b122f6a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-058000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-058000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-058000-0-rhcos4.19-amd64
     - sha256:612bccf323bd1872ecedb41d39ace80c482a7eed52ec5195a4928e6bf113f200
   * -
       | doca3.6.0-26.10-058000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-058000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-058000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-058000-0-rhcos4.19-arm64
     - sha256:ce508c26eca2c2791269af5bfe7a09d572d84d4159ec65fe281afe6b3ef98bd6

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-rhel10.0-amd64
     - sha256:c1910d604af79558d60097249b439b63c8c53af0e6c4155cf84026bd4da263b4
   * -
       | doca3.6.0-26.10-058000-0-rhel10.0-arm64
     - sha256:62d7c2ec1f72de42b1e12105161cf21aa2f6a21f3f1decd990cada3df7a59960
   * -
       | doca3.6.0-26.10-058000-0-rhel10.2-amd64
     - sha256:c1d9c347c808b7ff8bef15e3933cc1abb00c4b933b06b077377d57c7be611c1c
   * -
       | doca3.6.0-26.10-058000-0-rhel10.2-arm64
     - sha256:42328902ead4fa27d0a762fbde0905b26bc69af4dcd3c7501397727bec5579f8
   * -
       | doca3.6.0-26.10-058000-0-rhel8.10-amd64
       | doca3.6.0-26.10-058000-0-rhel8.6-amd64
       | doca3.6.0-26.10-058000-0-rhel8.8-amd64
       | doca3.6.0-26.10-058000-0-rhel8.9-amd64
     - sha256:0fb5672431abac03d4828d48bf68f40d038fd905c9120fc04d7a0b8d0228b07f
   * -
       | doca3.6.0-26.10-058000-0-rhel8.10-arm64
       | doca3.6.0-26.10-058000-0-rhel8.6-arm64
       | doca3.6.0-26.10-058000-0-rhel8.8-arm64
       | doca3.6.0-26.10-058000-0-rhel8.9-arm64
     - sha256:9c31ad336e4f303695b37b25dbfb7b34995bdd6194bb3ad0a085acfc13ef8493
   * -
       | doca3.6.0-26.10-058000-0-rhel9.0-amd64
       | doca3.6.0-26.10-058000-0-rhel9.2-amd64
       | doca3.6.0-26.10-058000-0-rhel9.3-amd64
       | doca3.6.0-26.10-058000-0-rhel9.4-amd64
       | doca3.6.0-26.10-058000-0-rhel9.5-amd64
       | doca3.6.0-26.10-058000-0-rhel9.6-amd64
     - sha256:3b635439d49fadb0e7bbd5f3fc6e8303f7adedc6d2e163c860d546d0b1fecc4e
   * -
       | doca3.6.0-26.10-058000-0-rhel9.0-arm64
       | doca3.6.0-26.10-058000-0-rhel9.2-arm64
       | doca3.6.0-26.10-058000-0-rhel9.3-arm64
       | doca3.6.0-26.10-058000-0-rhel9.4-arm64
       | doca3.6.0-26.10-058000-0-rhel9.5-arm64
       | doca3.6.0-26.10-058000-0-rhel9.6-arm64
     - sha256:ed9cb1f990f66c58a2ae3ce1c35ad424cdc5f88d4cb3cb990b44405efaa91ed7
   * -
       | doca3.6.0-26.10-058000-0-rhel9.8-amd64
     - sha256:fb8eb0415f406f835ab94322d6a91380ba0f3f8be46ba3906bb705ffc790ece3
   * -
       | doca3.6.0-26.10-058000-0-rhel9.8-arm64
     - sha256:0e9feeb16da37feaeed2bf54fe616f79ef1e11873a23b62a31ff9925a835a177

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-sles15.7-amd64
     - sha256:04c148b8c0e6f3617cb50a74f4d16615799b75f5a21cefa0a8d83c611e3be89a
   * -
       | doca3.6.0-26.10-058000-0-sles15.7-arm64
     - sha256:e3a8f0142385e09952f7150127975ed9dfb346865f6bec1fcb7f16f925d19c45


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
     - doca3.6.0-26.10-058000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-ubuntu24.04-amd64
     - sha256:b8970ca46757998060f56b1065b2e7cad2d6a47432925528c0114bef84201b01

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-058000-0-rhel9.6-amd64
     - sha256:ec9326c520bdcd67cf08af5cb09d38bca2c97f92b2a8263d30d4066b8504d515