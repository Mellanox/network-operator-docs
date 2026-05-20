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
     - v26.4.0-beta.8
     - sha256:198d593f1ef1da58e63ca22c7031e0dd67d6122551ccc3cc0e8aab64c3b33c93
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.8
     - sha256:aae64ab7634daca0647ccb645c59a203f3c843c6ae688455895c22a0f2deb388
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.8
     - sha256:c35d5420fe17c5dd7548d81dc873ffe3b0ab3110d4079797b0497919e7274adc
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.8
     - sha256:4c62919c738b206ec4e6a572dc261e8070c212c5b81bc9b8d560ae1dff7ed545
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.8
     - sha256:33690fb948e9d9e5ed479b6568736bf89466bbaf5055abeb72b1df03c9ffcacc
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.8
     - sha256:1dcbf9ed6ba4fe8fff1fefb43c26372b5c18e6d47b1936e6fa04d23f9ed19a60
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.8
     - sha256:639bc33a53fff338d81345b986b0965a46a0132f0cef40a7f6a851510b66cee7
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.8
     - sha256:6f831af41a8fde685fb46baa86402d011e7cbc7c8d5bed72c263382a69a27a47
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.8
     - sha256:5fa3f4acc9bf5e35119e4a9ae744d22649b355713f6bbaa51bbcc10ca5e8a2b4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.8
     - sha256:f6b8b25a55c3f9f1c7d89f328728cb6bfdf6f3f5827140967b7e1b4f4cff38ee
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.8
     - sha256:7a69bbbe53debb06cce129ae9e9233e8befd5e14d7dd0d8d70ffcc9504bd7329
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.8
     - sha256:c1e819bc2bc36ab8fd472cab18e6db9f19ff10e33ef088b8a6ffe705b1bd638d
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.8
     - sha256:c76c06e515c7ade8c0a3a0131b0dd968091c541b32310dbeee99fb18298e4bd1
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.0-beta.8
     - sha256:b227bfadb6d5483acfadbf1d2aabedd1d087ac04328811ba73c5cfeba3326b77
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.8
     - sha256:37f225c8b1a7013e79db2ed712eda407db49190056031fa4439a57051cb708ad
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.8
     - sha256:53c5c53ac7a35511eea1763c5daf317da994871069e672c8ac30a1a41b295318
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.8
     - sha256:28428750240592e451b0cc9d1cbeb5a768e21199d4721e09c401a360f0fdf290
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.8
     - sha256:f619d27ef02f71fb4aaab3148b3372cbfc98144958f96103b749f4a170640829
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.8
     - sha256:d6af506a7dd44f5fb7e07d3daa03160673ac1b51d8e018b2e7a6125a7cfb7a97
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.8
     - sha256:5bf8f3ee3a5da04e2018996de655b537163272236387581a0b1c16433caf327e
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.8
     - sha256:8633cf799f5951e901c8fb972b05f7cd62d8226cf338b58e84754124eb34b9e0
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.8
     - sha256:9dd0711af21fb28656444b943bfb57b7474fd999dde1b71f58a8bd3b0e98c789

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
     - doca3.4.0-26.04-0.7.5.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-5.15.0-177-generic-ubuntu22.04-amd64
     - sha256:f34c3d0c52c8d0e6be1cb8ffe4666dca3b253f8ef39ac67b0eb1141175852f21
   * -
       | doca3.4.0-26.04-0.7.5.0-0-5.15.0-177-generic-ubuntu22.04-arm64
     - sha256:b95eaf5982144e213d6c427fef95cfacf63c26dd36de454258dc14ccd0478e57
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1011-oracle-ubuntu24.04-amd64
     - sha256:157d2e93be57f0f99aceb77cafded514112c7ff338752c42f84732c0539d53c5
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1011-oracle-ubuntu24.04-arm64
     - sha256:aa3128408f5e38de64153360f22e034ec7a1f396b31a0cb6b4500258b24727b5
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1013-aws-ubuntu24.04-amd64
     - sha256:70aa6072f3a4989dc3796d9f27826ba0e83e1a4acae2045d28581f4310e0a00c
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1013-aws-ubuntu24.04-arm64
     - sha256:39bdd35d1e110515a4f32a60d36902406d500c1cd8b629d8c75235ecc53b23a4
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1013-azure-ubuntu24.04-amd64
     - sha256:98b51ce02e3f9676c50013ecc2ea0caa1ab91ff2edea708cb4802342d84824b6
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1013-azure-ubuntu24.04-arm64
     - sha256:92ec78afdf1bbafbdc1ad5043a15cee7e2debd5a7d5e5a9644eaa5079897f0b7
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1014-nvidia-ubuntu24.04-amd64
     - sha256:d9164180deb57a4c5f652084a9f79bb39f605e0b5e82b7bd1a9c2653fea9e391
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.17.0-1014-nvidia-ubuntu24.04-arm64
     - sha256:ed08593f5c372ad3c11b5b3967d11fd963d83d40a5ac089230e8a4e5848f261d
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1050-oracle-ubuntu22.04-amd64
     - sha256:d1650cbe6ef3d83240e57fc92cdbe03c410194d526610bceb81ceb8f5153eb23
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1050-oracle-ubuntu22.04-arm64
     - sha256:ad34dd2618962d5009b6472b3c1ccce5c48a7c8bef0221f3826505d9c3afa0ba
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:1c18696ba6c69880c95f277f5bbc7737c8cfe11e251bb1f6d11036ad746cd0dd
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:7373d0c8cc7375869dcbe978dcc8de2f484a8cde5790ce7936d629ba0ddc3a17
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1052-nvidia-ubuntu22.04-amd64
     - sha256:60bb0b266ce105a0b9479c7b8dd5b44ae595595e059e02eb421dc4271bce4b78
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1052-nvidia-ubuntu22.04-arm64
     - sha256:7407cebc551fb21a16ce163774377ce6fbfefd76330868379c4e563506365b56
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1053-aws-ubuntu22.04-amd64
     - sha256:5ab80e28b7ddda750561b04756775f852588f0c4d41f000a588d292d5f0793e7
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-1053-aws-ubuntu22.04-arm64
     - sha256:e7b55e353a8e028985517bbd25be3a067185177f044e964d9c479ebe7786c8ec
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-111-generic-ubuntu24.04-amd64
     - sha256:3b26f797f570c30bb57399e064ce95a4b22f6cfb3ff6f890a63343a94429a0d3
   * -
       | doca3.4.0-26.04-0.7.5.0-0-6.8.0-111-generic-ubuntu24.04-arm64
     - sha256:919f84474c765e1e6222cd6e35224b0c0f0fe112b9dffe9bdcb09f24bab42078
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu22.04
     - sha256:ea330a4601400ebc471e122bea05d0c5ca05f76609cbdebaebf5288754637ae6
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu22.04-amd64
     - sha256:f439d1a60774527417cc90ebb0926db8f16220ba5cc0fbc5ef42d9930d5b2477
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu22.04-arm64
     - sha256:7d674ca30d7dc62dbb5d296b1076d2f2b0472a869ecbacd31dbee1f9506ce95e
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu24.04
     - sha256:312b72d350eb24c22b9ebcfdd9130799fcfc6959409f67e079aaa512fb8f231d
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu24.04-amd64
     - sha256:934ae7c955ba148a45fc92f048985cc6b556c002aa6b5a3091e69e8c0b36ebb0
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu24.04-arm64
     - sha256:e40a2cf96f774e1cd87e738694fe306c95cab7e0825cea1f065cc485d77db130

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.19-amd64
     - sha256:fb7fc885ddda235a74591fa5a2a951cdd195aa164ce2ded6751909bc77010c26
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.19-arm64
     - sha256:de48b7e7230751faba6a80336f34dc5e6ce00526903a7509077897a2c82da5e4
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhcos4.19
     - sha256:b83441d37e582aaf5bc146f7fc697f366b73b22f135a8cb1410f78722d348381

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel10.0
     - sha256:cd456b6eec6156f7906e7feda9198d28f9a2037c5357244cb38ec2e951b0e853
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel10.0-amd64
     - sha256:8fcaca1927bbbaf9220643f7a5ae6a3ec9a5108a06dfdf648a1630b44ebcc3bc
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel10.0-arm64
     - sha256:2113e5cb1a58f113a5938445ad8d96e28aa086ab06afb023fcab0660ebb89983
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.10
     - sha256:7e2e6ae91032b5832847956668d82cc58f034985d51820df8023ef88a903e6d4
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.9-amd64
     - sha256:0998c39f506c63704b88e3f657b3fc4b66794009be84a7bd56119e89a2bbdb13
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel8.9-arm64
     - sha256:cb591163606cd7459a2c78129a626d1baf665b0736f1115b631ab203334fd4fb
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.6-amd64
     - sha256:01e45128c4a453e8e4b85056bea5ceebcc65046aa6f3d5e2c0fe32532d5af6e3
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.6-arm64
     - sha256:b16f6637659443c4eb82602c625ae2f28b7aa045aa0da59ccfdc7b5e37353d11
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.6
     - sha256:11917b14617cd0c0a5c3b013e0df04ec06ff5218b864f4d521a888ba352676da

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-sles15.7
     - sha256:27a65e15677339d3b2a4ba85fd3073064efb2b147dba66e2bba8510f3b7a34fe
   * -
       | doca3.4.0-26.04-0.7.5.0-0-sles15.7-amd64
     - sha256:bd6d57eb497d014982f9e14df3a50ae85205f80f658e3373a98e0050f736d69b
   * -
       | doca3.4.0-26.04-0.7.5.0-0-sles15.7-arm64
     - sha256:45547f94b513a844f60516fd4f8cc2c2f0e21f9f6cbe63902aebd8f4a2a14869


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
     - doca3.4.0-26.04-0.7.5.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-ubuntu24.04-amd64
     - sha256:13d5558fa11725cfa5bf59436d1193cdb7e46c18faa9458bf037cb84af5d25ac

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.7.5.0-0-rhel9.6-amd64
     - sha256:c0bb2286d91ff60a787ff24052313ac9a6db2eab0779b29d1a037439b67cb477