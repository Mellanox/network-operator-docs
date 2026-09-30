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
     - v26.10.0-beta.2
     - sha256:c335e370eeb4ce670594c4f787f6b3e4e7ec65a146e95c28bdce20818bcfe6b6
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-beta.2
     - sha256:d3289c38469fcd11f65ffe09ce179d6f0915518bbea97f7e3d77dce43a08342a
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-beta.2
     - sha256:fa1e12d1083e81efec773be8e5e277ef862e085b0568317cd45c18ccb87653ba
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-beta.2
     - sha256:1d488db60b83da4eba5ddd86d17438ab166a2e289493505f4509ecb069eac167
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-beta.2
     - sha256:5b604e2cf3aedb41ccd10b636945d7ae786ce639d85e20a03ddfbaaffa080bf4
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-beta.2
     - sha256:fbc6ab5d0cb7787d4cd7bc0d2866713012eb132a1003837f515dbbbf3b08a585
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-beta.2
     - sha256:ed974dc9fadab73c477f62fbc88b953b922950ec54ad1a641b71f59d7611c69c
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.26.5-doca3.5.0-host
     - sha256:3ec2bb66428e5a6c7137ed9680c03dba03618b03521d92bdcbdb2d7e2e53e029
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-beta.2
     - sha256:31dc2a892a6892c7ee2a565df51b6cfe9fdb3b4f39326dca76f8cb2aae6a613f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-beta.2
     - sha256:d77ea0dccb1c552392a5a8114017ec92df9376640918bb54cd7f35e128228544
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-beta.2
     - sha256:13a987b7caff28d430d26fe059c874c4bb255de87d9c6e26a9e8819a91bf3a5c
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-beta.2
     - sha256:8e89227af28831222299f24f8d5ac21af419fc36ef7fde56456e212667168285
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-beta.2
     - sha256:563645bdb80c7629db9159f0c7045cb8c81ca0cf0054f86dd1830cc8ad5e5f28
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-beta.2
     - sha256:02d0c02433f1b89397e05f4672d740d2e860d76753ec1baaa7c5ad659afdef00
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-beta.2
     - sha256:be242da3dc7a20e40c928ce0031a52b989e66b209eb99bfaf0e92e4a5a109265
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-beta.2
     - sha256:dbddf18d692e4a30a9692610c7bbeac98b0b8cd0880015564a1cb741b4cd7747
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-beta.2
     - sha256:da8fb0881435872f684375015603a722b30e8005af75b3d4429b1471fc40242d
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-beta.2
     - sha256:8b969db3abeed3d2ea9147193f43160485807aec278b4d7278ae7046f6c346e0
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-beta.2
     - sha256:ef5d454821cf2278a1504416bd4e23d12b64d38cc6cf3349e8687409fc72675b
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-beta.2
     - sha256:9521c8ecb7ddb44d01de77bab50b233d7bfb1a6c7d74c18f707ed8b7cc05e19d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-beta.2
     - sha256:b15cc59967c678de50bf31e8135bd9cca9e7c96ac503bb113fa97a933e837c6a
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-beta.2
     - sha256:2de1ab332d8d440efbfb6f02dcb0ec2e1b955c542ee29e32fc5402bf882fc490
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-beta.2
     - sha256:30c2d12e2220f51451d85c046b70087d28ba290ad9007197eea50a8ed184599d

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
     - doca3.6.0-26.10-032000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-5.15.0-194-generic-ubuntu22.04-amd64
     - sha256:2077e5a4f0e3fee545e2b8bd53bf6b0fa87603deecca2a1ac51da0fd74c12409
   * -
       | doca3.6.0-26.10-032000-0-5.15.0-194-generic-ubuntu22.04-arm64
     - sha256:b50d7326626be72af449ddf5dbef1162286db6760508013745db33b7b6ff0da7
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:62ed778256d9965facd85d04309d3d6a95f32e542b07c6e2f4bd4df55fd87dc0
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:cbb40e0f5670b9c2611db788c153ab716981b6445115bd75641b4a3cc007b6c7
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1063-nvidia-ubuntu22.04-amd64
     - sha256:35903f974447812b9202ff4d76a0b0eebf572c1bb2aa3e1cda191b33dfc49368
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1063-nvidia-ubuntu22.04-arm64
     - sha256:6008a13ac4521671e52d8516bf21233a3214a7a1fefa2c1f0d2f7d0038b5b4dc
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1064-aws-ubuntu22.04-amd64
     - sha256:b9a79380c7afce7b86de2d38fd7ef13108dadbe6fc362ce458b55f22271dc085
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1064-aws-ubuntu22.04-arm64
     - sha256:e82dd914531758f950163e8676af1f3f9a06ae9c3601ce6880edc3512ece3163
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1068-azure-ubuntu22.04-amd64
     - sha256:dce85e1f428ba6bbbe6b652447c329e7abd6859ac320f8480e9095965ba200a5
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-1068-azure-ubuntu22.04-arm64
     - sha256:cd85a678bd29f4548404370c93ae28c88d9a94c000ea60443b5d5b43788d7a1b
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-142-generic-ubuntu24.04-amd64
     - sha256:f753994d4fa9bfa19421b0f625fb8337eb8fc5b5b252fc299753f4ec28c17abc
   * -
       | doca3.6.0-26.10-032000-0-6.8.0-142-generic-ubuntu24.04-arm64
     - sha256:fef045dbe9a1785018411e8e0fb2b13a1c13e9c9e26d1f24f8b6aac3857a040e
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1011-oracle-ubuntu24.04-amd64
     - sha256:a9b31575bc3f7a0b4d6b55b60afa936f84a21c1e59069d8f64a2d253e176aa7d
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1011-oracle-ubuntu24.04-arm64
     - sha256:33a89ac8b3990fc0908fa94f512304a57bfd5eee29c4ef941032d9632c5a82fe
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1013-aws-ubuntu24.04-amd64
     - sha256:ba155fd349841dbf29ee098a89c3521ac8ca6f50a69f394ffe123388322d757b
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1013-aws-ubuntu24.04-arm64
     - sha256:95146e30b491ab26598010bfd8dae332aa9ffc68405fed2b46e0836a4641a7b3
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1014-azure-ubuntu24.04-amd64
     - sha256:34d776b7eec0aba806bf7d3f2f01e36e456a3172435df5212771c30740960c72
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1014-azure-ubuntu24.04-arm64
     - sha256:5b28516abbcd9087e7e38c83d4460b442d2f91c145adce98fc5490f5176cf1f8
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:3656d9366560edb5d687e5de79b2cfe9f3a64994028e2017933e63788439848b
   * -
       | doca3.6.0-26.10-032000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:57ac72d165afda9bfd6247be3ff052b4286897e22825eff06f41725132248e43
   * -
       | doca3.6.0-26.10-032000-0-ubuntu22.04-amd64
     - sha256:4c33f9070058dcbf0277ec59efa2b0e9abac39675ef9329f2d298dda6289f7bd
   * -
       | doca3.6.0-26.10-032000-0-ubuntu22.04-arm64
     - sha256:d5517c41b154f947919004d0e0d8405fb4f8e298cf78789eb9c3a87cfc760b6e
   * -
       | doca3.6.0-26.10-032000-0-ubuntu24.04-amd64
     - sha256:04061b8547c7853c3c80fa21dd9ce719dfb287214517c981b3db54cb624059bc
   * -
       | doca3.6.0-26.10-032000-0-ubuntu24.04-arm64
     - sha256:39b83b24cd73b1303d9d8900c3e4d8a84527e4bed7d0fb2ff11f81c9670027a4
   * -
       | doca3.6.0-26.10-032000-0-ubuntu26.04-amd64
     - sha256:bcb30d8f38e2cf3d81552fc2f5a7c1d972357bf131e135f18029878cd8b57852
   * -
       | doca3.6.0-26.10-032000-0-ubuntu26.04-arm64
     - sha256:ea175c84dbfa62104effc6ec0848972ced2b40edd482521b471c0941b5953412

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-032000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-032000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-032000-0-rhcos4.19-amd64
     - sha256:0852d40ad48e15c78cf44539f931fcebd5913bded8f4bff49c952f0b06558d2f
   * -
       | doca3.6.0-26.10-032000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-032000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-032000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-032000-0-rhcos4.19-arm64
     - sha256:0296969db9c8ae549cd6ce9cdd9b0cf185a91e530f8f600a95ee4f55e2e42bd2

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-rhel10.0-amd64
     - sha256:58bf6bf12e9ee0f83885d1e0d475d3966ef86a447b4cacbf53de806ea25da103
   * -
       | doca3.6.0-26.10-032000-0-rhel10.0-arm64
     - sha256:f315e7df08b8f0abe08cdd77cf68705d409349d30ec8a9f8dde9d5ec297debfe
   * -
       | doca3.6.0-26.10-032000-0-rhel10.2-amd64
     - sha256:28786cab4cbd075d1f0309fb472ebb6b5ff8fdcfafdb3860e40f6c4687f29faa
   * -
       | doca3.6.0-26.10-032000-0-rhel10.2-arm64
     - sha256:8011242f2975d87a9a01d2e45bf964a22460a6453177910805c19a595e638902
   * -
       | doca3.6.0-26.10-032000-0-rhel8.10-amd64
       | doca3.6.0-26.10-032000-0-rhel8.6-amd64
       | doca3.6.0-26.10-032000-0-rhel8.8-amd64
       | doca3.6.0-26.10-032000-0-rhel8.9-amd64
     - sha256:b7f1707202cbe731a9fa6034e5742d8f350274d7925c52878a54d3021b73444b
   * -
       | doca3.6.0-26.10-032000-0-rhel8.10-arm64
       | doca3.6.0-26.10-032000-0-rhel8.6-arm64
       | doca3.6.0-26.10-032000-0-rhel8.8-arm64
       | doca3.6.0-26.10-032000-0-rhel8.9-arm64
     - sha256:54957ab92834b2afde6403a8cbc76c3b6aaea7d5aca55ce5ffc5b6922ef27cbd
   * -
       | doca3.6.0-26.10-032000-0-rhel9.0-amd64
       | doca3.6.0-26.10-032000-0-rhel9.2-amd64
       | doca3.6.0-26.10-032000-0-rhel9.3-amd64
       | doca3.6.0-26.10-032000-0-rhel9.4-amd64
       | doca3.6.0-26.10-032000-0-rhel9.5-amd64
       | doca3.6.0-26.10-032000-0-rhel9.6-amd64
     - sha256:7f19338f25e632f48b09e059221acf16492b0656d51725b84fd6074156a4d581
   * -
       | doca3.6.0-26.10-032000-0-rhel9.0-arm64
       | doca3.6.0-26.10-032000-0-rhel9.2-arm64
       | doca3.6.0-26.10-032000-0-rhel9.3-arm64
       | doca3.6.0-26.10-032000-0-rhel9.4-arm64
       | doca3.6.0-26.10-032000-0-rhel9.5-arm64
       | doca3.6.0-26.10-032000-0-rhel9.6-arm64
     - sha256:93eb1e4ecbc7a108a8046869f74dd5d5f23a4ed95457d4ad48bcdfc09363bca7
   * -
       | doca3.6.0-26.10-032000-0-rhel9.8-amd64
     - sha256:85092465b477280bb00c0d6db8c53ad400a6de93765a1930aab0331796e7e9db
   * -
       | doca3.6.0-26.10-032000-0-rhel9.8-arm64
     - sha256:7490e9d72f333d166be35bc7e0d1b90a95c41e0132f398949d546d0122febf9f

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-sles15.7-amd64
     - sha256:ee288080179c55e85a10a7cd6f009c5d0afbd8c824f68f7d061d7ca5bdde1e88
   * -
       | doca3.6.0-26.10-032000-0-sles15.7-arm64
     - sha256:2b11e92cb840767ee42ab3039f6c726b222f824f9059ced71bfc4c71af6e8b43


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
     - doca3.6.0-26.10-032000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-ubuntu24.04-amd64
     - sha256:e045722df9d252fabeec47d17306f2c79b29d14fdcee67b279cd2f390bee863a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-032000-0-rhel9.6-amd64
     - sha256:0d4d378b04ccb5d1bd4b86cfaee320f8eeeeb39213c3e03918471e86ce8625cc