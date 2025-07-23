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
     - v25.7.0-rc.1
     - sha256:19024ec2f46acb63c2ea7ec986d09048990a4490b284dd90e08bfcea9415e02f
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0-rc.1
     - sha256:f02108a5ed459f0a878b34fd6cfc5d99a171d5ca642755d0c86a45a004fac5cb
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0-rc.1
     - sha256:2a178dcbd5747793cd12166749e510529d944212e2cae7d823ebd68a7388cede
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0-rc.1
     - sha256:3ff7363ce1e617ac78f75673465abce12408a677daae3336f895af69d5878a64
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.7.0-rc.1
     - sha256:f068b7a3149ad4be8f147a9cc814ef9849e18766cd7de14821c2006d5762bdaf
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0-rc.1
     - sha256:b15ad0fd90731c4d21d857ca240172e521af81b240a7f0539fbf4df3a53367be
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0-rc.1
     - sha256:6358090a16cb3932d459471965e87deddbc693f87226745b9f2c5ba68927f4c8
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0-rc.1
     - sha256:cb673d2fe255040a6447767c399b527e052c964f50ba7ca705b1ba05c45190a1
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0-rc.1
     - sha256:9979a9ff9c01bc882939b3e409f1ad937e070637f735aa546c04a8ecea2dadae
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0-rc.1
     - sha256:6e6ffa079b0253cca293eafc1d229387c345c4baf22acdcd7e72adf3fba1d8f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0-rc.1
     - sha256:cee12a6669aed565761b2026691922a7012d2ee9aacc21086217770a1904f142
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.7.0-rc.1
     - sha256:bb603aa34124065d18d9a23279e15f2e002e79900109156eca6f97f925c96619
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0-rc.1
     - sha256:a21cb773d29f9e1f7c825456a45f22beecf2fc12f1b6445d491f98a3952fcafc
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.7.0-rc.1
     - sha256:6182737de7c44c27cb2c5db7545387ded321f74aa00758f3e99113bc1ca41439
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.7.0-rc.1
     - sha256:6fa69b232c61448a129828869dff40241a9490d9454d9968f20373b2df86c845
   * - nvcr.io/nvstaging/mellanox
     - whereabouts
     - network-operator-v25.7.0-rc.1
     - sha256:7ff734e8a42ad4604928239f291d33930bd6085fc90be930b2195862a1ab1cac
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0-rc.1
     - sha256:850eb3524f62b2519048713121ab85ae54a1720a68b0f4fbddc9c28fcb0c623b
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.7.0-rc.1
     - sha256:699475862ca2f70fefc8343a1ac1d09cdd0e1639b138edb1cc38032353e20675
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.7.0-rc.1
     - sha256:a350d09877f2241f141fe9dff81f132b21a1c6158a9d91b1e72c57cfd57ec0fa
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.7.0-rc.1
     - sha256:26700e21dfaed8be1706b5fd4409df662b6e6b91a89803409d703d1d81c090cc
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.7.0-rc.1
     - sha256:57f0e83b7e0a0555c040c2c7cb3d05d822ec52cf797d3249e486de8fef92d4df
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0-rc.1
     - sha256:2dad94a328d085eb8b67f7db0618c4bc33ab96a734c2d649981d6e229aebe9a6

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
     - doca3.1.0-25.07-0.8.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.8.0.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:3b0615bfad72a63bb9a49bc127e3560a1baa548eed595a046789aeebaf8e3937
   * -
       | doca3.1.0-25.07-0.8.0.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:53e62afb4642210c684e0bb0f3c04a0ac025527ba6781bf48790c7a7b2b36169
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.11.0-1018-azure-ubuntu24.04-amd64
     - sha256:5359ec487db57ee053fffce2a53f141a12445367d4aef8c2cb8442d969e6b250
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.11.0-1018-azure-ubuntu24.04-arm64
     - sha256:0576cbe0ba6d996f731210048b89200719a4127c316f724aca8e46d603ccfd6c
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-aws-ubuntu24.04-amd64
     - sha256:3c6f7fe69b4940bdb731d2e8522f7f8ef8878511eab47798730b6a04939391b4
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-aws-ubuntu24.04-arm64
     - sha256:2d14267c4cc861069325cab2aca364701c804bfa7b8285454a1ff659cfa81f8e
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-nvidia-ubuntu24.04-amd64
     - sha256:e99876c8f3d81f08d1cf137f9baebc09cfdb53c6bc2c8a50bb07b0e02fe14c2d
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-nvidia-ubuntu24.04-arm64
     - sha256:be5a248284fe4dec2b21060b5a04373a8a26d5453a5ae9e6ee7daaf9c946fa79
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-oracle-ubuntu24.04-amd64
     - sha256:6d23141f541709d5247d80ba50bf179f856d9fa7aa1bf645817ac8a3084584a2
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.14.0-1007-oracle-ubuntu24.04-arm64
     - sha256:d887b1be8c5515f7d24db895e78b2bbc378b9fdb4e8b31d6ae35de745ebfd0ac
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1028-oracle-ubuntu22.04-amd64
     - sha256:b8411ad65de97bea340979b01b8cee281f243f55fe643b33231664cb6abd046a
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1028-oracle-ubuntu22.04-arm64
     - sha256:653c8231fa8f4d886809cd01aec58fd115af7827d2b1c5a15e0ef02676381f49
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1030-nvidia-ubuntu22.04-amd64
     - sha256:7827ce42ce3b86e664fd625e8885ac7885d229064374abbb2e47cd2dc8ae041e
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1030-nvidia-ubuntu22.04-arm64
     - sha256:5b95794e95fc7a755956b30d1d4fe079d59b2062d83c4c62be075e6acbf23634
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1031-aws-ubuntu22.04-amd64
     - sha256:ef914cc5c328bac82cd53203aaba482d93181322c07c8305d743385a0369c459
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1031-aws-ubuntu22.04-arm64
     - sha256:6ed8ca8434705d91c1f139887a1150eded45d414dbedec2cc423e9ceb4f7a3cd
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1031-azure-ubuntu22.04-amd64
     - sha256:3e7b3825794b2b47c235d1a246b9d5201e4a2bb3681701f0dfb94372033675ec
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-1031-azure-ubuntu22.04-arm64
     - sha256:ff94deeac5c5d7057d0af5aded14c590fbb4fcade22149ffcb7aa021692b407e
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:b18aa8ea8c06b8212b4d699657ec2d2d794dae2c6ad2a02f033e2bddbb593b79
   * -
       | doca3.1.0-25.07-0.8.0.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:4e75479720447def065e56de73e4278cbe375e0f16f30f1bdf4df48434be7aa5
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu22.04
     - sha256:d3611f72019967994c3f7ae956e5033bb51d9b5b5df7b010901b941b29089e9e
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu22.04-amd64
     - sha256:2b28892ee646f7eb76abd1dd4bf156daff5ddcbf06a78a48a9634c5fd6b709a0
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu22.04-arm64
     - sha256:13c198be9fef7fb96fb69480d2da7cd5e2775e483b4a20cc2c8f814a2c1ad36a
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu24.04
     - sha256:a191f2784cfb7fe2418efc3e7a4fc5323e282888cedc716e72b282ea88b0fcf1
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu24.04-amd64
     - sha256:614851f255d7b68d3448760ef02e6824fc0a31551dc21578468ddd749bd20204
   * -
       | doca3.1.0-25.07-0.8.0.0-0-ubuntu24.04-arm64
     - sha256:eb3d25462a86e4c4be8dac3bb71a7fcc29851ed3353280e04dc59b2b64610446

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.16-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.17-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.18-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.19-amd64
     - sha256:2a2b430975b4ed2f7e3150e97677a80c1c9cf7de7cfabc7c798fbb91f8a680c0
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.16-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.17-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.18-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.19-arm64
     - sha256:2066dae1d69b221ed5a4d2dc4246c34f2635d99d04fea6c8c570a8347c2e02e1
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhcos4.19
     - sha256:7dda03337f7ec4f22502c58bd66dcd30d216759af415173c52afab3fb80f45e7

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.10
     - sha256:a4059768b26673c0f03acb8eebd70b62d522cd442a7f922bcf8adffb1ffcc220
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.10-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.6-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.8-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.9-amd64
     - sha256:21dda4f65466b246327e930301413b14bf612ea44e9e01b775c2d790b39f3e6f
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.10-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.6-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.8-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel8.9-arm64
     - sha256:687fe908eace17060d98dcb5e94b17907eb7257562d1e16ccc4d4f3f1759b36c
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.0-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.2-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.3-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.4-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.5-amd64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.6-amd64
     - sha256:1029a4bf0283f3b704a8b8fda5329ac41797febc097d487046098e8d03645e4f
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.0-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.2-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.3-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.4-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.5-arm64
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.6-arm64
     - sha256:4684b237b1cb0d540ebc231dbbfc2876a735ffc06d6d00c9327ff19999735f88
   * -
       | doca3.1.0-25.07-0.8.0.0-0-rhel9.6
     - sha256:60039bca7ad73bfefd56704915e0e77cae7701ebb5dd36ea4c7ac20cdcb396a6

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.8.0.0-0-sles15.6
     - sha256:f983fd17c2175647d8f06db3bff6e7613975b7d853c5ed6c90291ae01b0a654c
   * -
       | doca3.1.0-25.07-0.8.0.0-0-sles15.6-amd64
     - sha256:18247c37594d4c432345e11e484b4719d4c66f7d6d74163dfe029cfe939d0524
   * -
       | doca3.1.0-25.07-0.8.0.0-0-sles15.6-arm64
     - sha256:54eb6a03ab06445172d8a312a0c754538abd2d2751324acb63e3c17962feb37e