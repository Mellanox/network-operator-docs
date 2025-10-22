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
     - v25.10.0-beta.3
     - sha256:507ecd46466dcca7a08dab8ea82b7876069a8b9df57a30402019825140920cff
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.3
     - sha256:873db3573c6ada7485219ccbe890f9c01d3afd209e803b4d15aa485285217301
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.3
     - sha256:c086ae3a6d6e074793961a8da568532833a24df33015e9166cfc4dc79208da4a
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.3
     - sha256:1eb9a3b01e522c5784387ac9728403efe531afd203b1dce59f84b94217d03f66
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.3
     - sha256:6e7a0c95c746c1b061b2beaad82aedb1a6464b2f1fb4f3514fa382628fa4b970
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.3
     - sha256:9baef2df2706982de40a489fc649d8cec769876532055208be4be57ef82070ef
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.3
     - sha256:970df6ce501aa2bdb213a6fc351dcbc9e592496c851758ac405fa42080285dde
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.3
     - sha256:bcb06d89253eb763c6d97613165aa0fcccc8bddd71e24401be88a003e8bac90d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.3
     - sha256:e516e045a5470b0bfc105b4b3c13ad53607f0a67282ce047dfe1cb8283d4fe53
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.3
     - sha256:8e82363e30a911d8ea77bfcb279ab598420e7c4a0f2846bdcc84a45d3335e50b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.3
     - sha256:6ee80136729f1dc3ccca1079629db62b2671da1a08b36ac03d70fb8ca575d48f
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.3
     - sha256:22c954758719c753c8602417ada0ca945244bdb112c2962e2b9e5e09c56a5dd7
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.3
     - sha256:f9d0ba4fc8ee0fc2cad4d76268c98f6f7843b1cd4550f52181bec4df8902c04b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.3
     - sha256:1398b0a1587f38750c9e02b5241bf3e317b13ff0c3f174405916a0dac667bb96
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.3
     - sha256:7c8136553cfdb6029b0e3098b4448b04dfa6f143bc1979aaa0549e09cf761244
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.3
     - sha256:ca0d5e8a6abaae511f29bce713a64122c1d40a3e45fc50b5125b87634babe010
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.3
     - sha256:6fc452fd7b74d283b789ed313f61b88b3b7acc548c4ba86bfd62567df117ea68
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.3
     - sha256:f3d25b3230a4e27d6a3479d209917dab4e85a3e0eb53830550e6af341c7d641d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.3
     - sha256:6fab02374d02261c4efa3bd0bd2e8ae4f1156479b4938e5ffffb92210803f85e
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.3
     - sha256:19d6365118093c768bda250eedf98f4b2180b2000935a145947f857df02e7121
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.3
     - sha256:c41f77ec943397607b29c0ceaae5e84008b31b13cf18d81f530e3154f4767104

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
     - doca3.2.0-25.10-1.0.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.0.0.0-0-5.15.0-160-generic-ubuntu22.04-amd64
     - sha256:cdbe716ab948638d33265d410e01281882431f790b86b567ced8bb835ec23221
   * -
       | doca3.2.0-25.10-1.0.0.0-0-5.15.0-160-generic-ubuntu22.04-arm64
     - sha256:3cbc5f1c1193c8cb3f525fe1e2e87e395ec08554c0845bd0b272d5de2ad4df0f
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:9f32ed5a78991bc46144cd97f5ceeb7b9ebc0e42494cbd800089d8ba8c57c1f4
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:446a2fbad370186d82c137a81dd34906df1b268667c47fcefc208774dc9abf2b
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1014-aws-ubuntu24.04-amd64
     - sha256:b646da369874d3c522b2b6d17a258ac72b8220f42fb50016267095d32b4fcea5
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1014-aws-ubuntu24.04-arm64
     - sha256:5e74612ff7f18741eee232fad1447ce3b1f1838a56debc08dea4ef84c3533be5
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1015-oracle-ubuntu24.04-amd64
     - sha256:ffdc5390b5d3f13d3bf41ab7b0d61704fbe4d4f6ab4f57ce9a63e08264d7e28b
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.14.0-1015-oracle-ubuntu24.04-arm64
     - sha256:8f000e3d8b45c56a7e71c0f8d315c13aeb0e8d652622d86594f590adbece3a53
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1037-oracle-ubuntu22.04-amd64
     - sha256:d15fa2eb8cddafd155d8bae0802e8d9cfddd5b57be2be85b97be323ae8d34be7
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1037-oracle-ubuntu22.04-arm64
     - sha256:dc080a940565991830d0bba0fee90f55df28a746aa7c7a39c35773d82591ed20
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:8b4c963eaa0b50991f3f5b0c2a3e4406d4b107276603dfe0957be8c9f9b66d7c
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:686829df475f3b4435278bfe2809b0235a0ce36b1f56e9b674e48048548e3ece
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1040-nvidia-ubuntu22.04-amd64
     - sha256:e5eb32314805f576e1a7db46f83bdff0e090c78df606ee6b16b4eb3315aed8f4
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1040-nvidia-ubuntu22.04-arm64
     - sha256:95cc5a0bb1e040ecd20ec67daa2ed5873852f5af96c4da7e0cb2a97472267ca8
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:9adbdb72adaa3849227dbe3102d3dd0fefe17b5e9dc61ee91b190e3e6701443d
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:87809147220755c6d352ebc8361d7476e9624e42bd085988aeda974fb13813b7
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-86-generic-ubuntu24.04-amd64
     - sha256:7f0292f191c00e5502703d79b41828a61788eb59f1a1304a2b9c04329bd2ec32
   * -
       | doca3.2.0-25.10-1.0.0.0-0-6.8.0-86-generic-ubuntu24.04-arm64
     - sha256:ab34b1ed4e012e7c2177a4e504838dd6ab765b00778a6b9d65eabe29022fe3cd
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu22.04
     - sha256:4967b4f6fbbf60360238c7e67a34dffaf4dceb01b43078c0a18a4cbb105f8272
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu22.04-amd64
     - sha256:b86e79e3c075552e4f01e9045fb08ccfd89d3d6bece84afc2245dc5cbcb7c475
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu22.04-arm64
     - sha256:e9790eb5eb936e5fb8fe75283ce815bb31ad560969429e170bd24d36e0516680
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu24.04
     - sha256:ae1c5a7bfd9dc9da7fe9f26b4f47a8f72b8e0a69a1de65c75625baf9c04829c1
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu24.04-amd64
     - sha256:ef61c15a0627d0d25314a6ccbd5a6b94938cfa117c46f4d65ad4f380bba6679e
   * -
       | doca3.2.0-25.10-1.0.0.0-0-ubuntu24.04-arm64
     - sha256:83ded666214ab88fc79206a13ad8ff45507952f0e343f23e5ff59f86ce7e5b48

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.19-amd64
     - sha256:914114c3e45846bcdfdeb2953a33193394bd8a7e84b783e8913fd84b4122a47c
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.19-arm64
     - sha256:2fa97ee41e2db6f661b89067df3874dc914e8e4ce2aee6385bdac1f9762b8c4f
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhcos4.19
     - sha256:23fc3387dcb71acbe8279132a8a238ebc156c40ff735182bd5ad3b1e6db8a742

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel10.0
     - sha256:d68e96a9a0e38803261b72ef23fccff1d54f29ca1c4ca268edc99f4e6b82db47
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel10.0-amd64
     - sha256:b26369f855108802fbe847cf0ff746961986276b214d94c69080cda6f3fb575e
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel10.0-arm64
     - sha256:9595d13c8e7a03c05463717b6c4a197ce723a2c34e27d766b80b573753bb39c1
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.10
     - sha256:5cbe8127f36a3d6f89a26880d61c0be3059b9a71768f1bff86a92abd9e3879cd
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.9-amd64
     - sha256:c00260d02320ca87d555ece2fa53a0ac5d71c1a7ee1f9ff56ab3625fab5f14b8
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel8.9-arm64
     - sha256:6ff8c8c5ac87ebe9ab2850b3d1ac10af3fee2890498b7d5f16b5ce0360f0d254
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.6-amd64
     - sha256:90263d36ea81633c658d7aaf5152b8e60b0ea078db9ad6ce442d8d1975042086
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.6-arm64
     - sha256:61856bef2e92b8b8447ffabc44f21ebf3309dd0079f1b1be8c13eb9be6bf64a6
   * -
       | doca3.2.0-25.10-1.0.0.0-0-rhel9.6
     - sha256:5d361349589156fce80455831f45c58a10f3362237689f40aac15a940b1f639c

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.0.0.0-0-sles15.7
     - sha256:1bc32924b7d79588ffebccc62181310269b88a8b56777668e74b8af58c15ed3b
   * -
       | doca3.2.0-25.10-1.0.0.0-0-sles15.7-amd64
     - sha256:b82a0947fd3a046ac24a8e5a37a5acc9d338d18afc04a94d1ce4d82e455878cd
   * -
       | doca3.2.0-25.10-1.0.0.0-0-sles15.7-arm64
     - sha256:4a357f3118277a640069f1b898b99c34b5fe47d15fb0c903459b314c2b2cc180