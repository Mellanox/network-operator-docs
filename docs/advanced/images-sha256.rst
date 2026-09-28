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
     - v26.10.0-beta.1
     - sha256:b5339feafb42c1343b56f552f292456026f0b2e1e7be206985aabf4e7b3df747
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-beta.1
     - sha256:52710062f76d4c63075b0d8a615ecc1d6d870338aef446407acba0690833d0bf
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-beta.1
     - sha256:5ba6f59a6d34f79b10ed5e780008b2be8f15aaefaeba05eb7cf0acc469480f68
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-beta.1
     - sha256:ddbf70fe3a1029398931053919c5573bb449d8ea4ca415c4980c413737d9f528
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-beta.1
     - sha256:8eab48f0ead233419e902649fb46a41d8f8787f5adc6a83bb2eee9a493963123
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-beta.1
     - sha256:94fba066de43ee417b23b451910540baa9beaffd78f9b0a9b42cba3c5a4ac3cd
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-beta.1
     - sha256:5b1dff5a22f61caf879bd22329ed95227b617ab4421781a8955a9d0b267215c8
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.26.5-doca3.5.0-host
     - sha256:3ec2bb66428e5a6c7137ed9680c03dba03618b03521d92bdcbdb2d7e2e53e029
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-beta.1
     - sha256:8f05aa112083c28c9847fabebf232f38b7b75d2522b4ea2fbda12f64cd300454
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-beta.1
     - sha256:e17c6119ff5a78d6665cd5ea8d2392ec5cd73ee8da40a91d4bac4ff5385d50ec
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-beta.1
     - sha256:b8e87c02be94382a89645868ba85dfe07465e09e89cae499f50f9634e3d7ac8a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-beta.1
     - sha256:568f0c2d8f298fcbf87cca9a3e379919d0102094a41065047a70a5c2c6e642ae
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-beta.1
     - sha256:53a79d657bcba7be0842969698a37e05919b72c2ceb2c4c826f87b7a16a150a3
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-beta.1
     - sha256:e2807990e4f0e64fcde2e32bf9599d9b0a92ca71c624c1ad59f0c34eac002ae1
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-beta.1
     - sha256:0e350b8bd395da4d37429cc33157afdfbac98569e835230e567d5600e4044595
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-beta.1
     - sha256:9b6046559db60dca5bcef6d48da3868d15460294bdb2894c5c1d30ef037cfea7
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-beta.1
     - sha256:f3b0e087a905cd8db7370e9956b04cee9e83fb2d4a50e9e995c736894db9f9a2
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-beta.1
     - sha256:63bbe0674a6babcf1f61821ebfb7c720d900f2a3a20cbaec9a9777e073849403
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-beta.1
     - sha256:f28fb46cb699c84f2d95205af31e0e9f4307c92f475fea110571d56b2fe05aef
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-beta.1
     - sha256:135fb6af3f6ff3e873fdbde6bc3081c9701b8fde7070aa4c53cf78746ba86e3e
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-beta.1
     - sha256:2a1a4a75d4f04f050b4ead872f9d2de0eccf328f29410452b3e9aac3a690eb79
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-beta.1
     - sha256:f1590fbfc6d9d98ac90578afb91e820064102ad78fd03c97ef88730023238e21
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-beta.1
     - sha256:d0abab3cfcaa32917d3e1c2f89632d3f2b48c0cd07da9c0500bcad08f2fd09f7

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
     - doca3.6.0-26.10-028000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-5.15.0-191-generic-ubuntu22.04-amd64
     - sha256:58af4b6f3f582400b3809118ba0d5587e81531a1857af1447cb87e32ec5b4536
   * -
       | doca3.6.0-26.10-028000-0-5.15.0-191-generic-ubuntu22.04-arm64
     - sha256:7cce32d969396d7009a63d49f755b2f6e62d71b985414694a1a04ef611860388
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1060-oracle-ubuntu22.04-amd64
     - sha256:397a7086bb2a45bb07de2d2535d813d3d1f1b9d4cd7042f9db259ab8e854845f
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1060-oracle-ubuntu22.04-arm64
     - sha256:1e49ef7498d5efe42b8488f1622ee4e22c06f5a93f57bd5cc0186e1e1a748e17
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1062-nvidia-ubuntu22.04-amd64
     - sha256:f44a017b49879bddd8dcb723a8101f35d1ff16183f2e4a33081405e2a70fd61c
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1062-nvidia-ubuntu22.04-arm64
     - sha256:c4a9c16d4da39772d3959fd398a51b1552d3d62e3f8a6bdcfc5b3757ed065cf8
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1063-aws-ubuntu22.04-amd64
     - sha256:8df45713870285e9d0ac6b8ab25255feb314599cf915b862e6575ebc8fa5ac50
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1063-aws-ubuntu22.04-arm64
     - sha256:6998bd91bbbf46006a434a9fade6a1a1d97f19912f912ceadee8dde2834a9598
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1065-azure-ubuntu22.04-amd64
     - sha256:4fce75d56ba55987d3d79e1d9ae187c6ce4f6a5ae1761979a803189580d12cf6
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-1065-azure-ubuntu22.04-arm64
     - sha256:50c98f4088a69cdc0ef9e2c390cf058cd08baa898a8ab9250401f9b29c9026ae
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-139-generic-ubuntu24.04-amd64
     - sha256:66d863fda6ffffeaceba8c19d7eec0f912d5dfc23ae747d338c09787f4a7e2b2
   * -
       | doca3.6.0-26.10-028000-0-6.8.0-139-generic-ubuntu24.04-arm64
     - sha256:d1b668a54d82dea53c1e0178e4d7e968758fdd233c63d316ee8eeb2204d14749
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:6879a0970abb4dc898577f435c92024bd47a62cdc034ef7b47f7fb2e663f5ff8
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:64a745fef74fad9a999536ec43a256351f0b74c02db120df9e4d44d0017a918e
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:1c98b3e116056057ae53a44563dbfbc0d7fb20a3d4f1c5efd9718cfc6adc8e96
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:9d784a223c511c941865569f9f5f8d20f595eb6c02a2854bc89230f2fad4d4f2
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1012-aws-ubuntu24.04-amd64
     - sha256:031a30a85c41cb4ca6e4cfc16d4b70f9917df78af300a8168278ba60c17ceef5
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1012-aws-ubuntu24.04-arm64
     - sha256:58959d0c5297214ee6338714d47a58f33c0f7e77372e980ddb9f6a392d7ce6c9
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:0103ea64a76f3c0b66d4db80ab5767253f0b1f54341f4a21530db086df7e0526
   * -
       | doca3.6.0-26.10-028000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:88b4721a69fecb52c13ba7928c4a06d4d0a195f68fc71fd9f687e38e8f0d0ebb
   * -
       | doca3.6.0-26.10-028000-0-ubuntu22.04-amd64
     - sha256:4efafdab38646e637711e579b1136135b1cae64a3b35df4ec455ada39344ca71
   * -
       | doca3.6.0-26.10-028000-0-ubuntu22.04-arm64
     - sha256:b781c6125c9e60d8ccfc21e958cc0a6b841420e30be59d650ca1e1ed55129843
   * -
       | doca3.6.0-26.10-028000-0-ubuntu24.04-amd64
     - sha256:a49582c229f8abe1f917b16f6eb0e9aa7e2b699620587cf857bf6dc031be9c4a
   * -
       | doca3.6.0-26.10-028000-0-ubuntu24.04-arm64
     - sha256:3c12da280109bfd73ff5ba2f1981fefadeb0808f572b8c17415338e677d92095
   * -
       | doca3.6.0-26.10-028000-0-ubuntu26.04-amd64
     - sha256:f97d996cdcb77b5c8f5a494d91563a170646d37da96867af90b4a929c91714e5
   * -
       | doca3.6.0-26.10-028000-0-ubuntu26.04-arm64
     - sha256:10530917a03284dbf101192c3fc3646e7f3adaa6c153078c0f2d29ee54c845d6

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-028000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-028000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-028000-0-rhcos4.19-amd64
     - sha256:723ca82b74df8f1a7aa7804d8a1f85e4a153058ca75945542bb38fceb7bcc3b3
   * -
       | doca3.6.0-26.10-028000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-028000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-028000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-028000-0-rhcos4.19-arm64
     - sha256:1f53154ca39a19905c0759ee87091f0f73855cbdeee4d5decf5dba086d78c378

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-rhel10.0-amd64
     - sha256:4a9c9a866e7e5a5747796a7ddaa502627a24b96179fa6e7e753b791a6b5bbdad
   * -
       | doca3.6.0-26.10-028000-0-rhel10.0-arm64
     - sha256:6ebf856ccb84f74df8b2d6d4b686e57be4e8b9a0898c00189867d76a3c1432a8
   * -
       | doca3.6.0-26.10-028000-0-rhel10.2-amd64
     - sha256:23678eb536573526100b6b52adcd4f074350e6cfd1e12253536e2c7dc4a1d5cd
   * -
       | doca3.6.0-26.10-028000-0-rhel10.2-arm64
     - sha256:41671c22375e764c6734eae56aa26876bf814d885e0fb8ee08d4c09941e64e2b
   * -
       | doca3.6.0-26.10-028000-0-rhel8.10-amd64
       | doca3.6.0-26.10-028000-0-rhel8.6-amd64
       | doca3.6.0-26.10-028000-0-rhel8.8-amd64
       | doca3.6.0-26.10-028000-0-rhel8.9-amd64
     - sha256:3fcfa405df200c7b09c2501211017408fbdbb350ad72494f8f3698b1923fa9e7
   * -
       | doca3.6.0-26.10-028000-0-rhel8.10-arm64
       | doca3.6.0-26.10-028000-0-rhel8.6-arm64
       | doca3.6.0-26.10-028000-0-rhel8.8-arm64
       | doca3.6.0-26.10-028000-0-rhel8.9-arm64
     - sha256:e195f673ed32c7b20e2865dcd104fac6e87eb8900ca6a7d260b8c1ca8e360594
   * -
       | doca3.6.0-26.10-028000-0-rhel9.0-amd64
       | doca3.6.0-26.10-028000-0-rhel9.2-amd64
       | doca3.6.0-26.10-028000-0-rhel9.3-amd64
       | doca3.6.0-26.10-028000-0-rhel9.4-amd64
       | doca3.6.0-26.10-028000-0-rhel9.5-amd64
       | doca3.6.0-26.10-028000-0-rhel9.6-amd64
     - sha256:1de76a3f1389a9fb2a56b21876c4ce2426145c35819d874794f55e193d4c2969
   * -
       | doca3.6.0-26.10-028000-0-rhel9.0-arm64
       | doca3.6.0-26.10-028000-0-rhel9.2-arm64
       | doca3.6.0-26.10-028000-0-rhel9.3-arm64
       | doca3.6.0-26.10-028000-0-rhel9.4-arm64
       | doca3.6.0-26.10-028000-0-rhel9.5-arm64
       | doca3.6.0-26.10-028000-0-rhel9.6-arm64
     - sha256:5bc86e308dbc98b0c9edf4224f1a883d73ad6696f418cd27fcb39a1250752359
   * -
       | doca3.6.0-26.10-028000-0-rhel9.8-amd64
     - sha256:0fb4b8e1003f3190c9e7c72ef6b5d4bea6aa1dc226222baf8b3a33b7d699221d
   * -
       | doca3.6.0-26.10-028000-0-rhel9.8-arm64
     - sha256:a4dad6d3afcdc35818a6b05e778bc883956ce8b1a322d8f0c0e1d16cec6c3532

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-sles15.7-amd64
     - sha256:d3d8746f1d7073bdc40f5ed6b4d67f782aa7221221c5e0f56b7f4d8fd967ff2b
   * -
       | doca3.6.0-26.10-028000-0-sles15.7-arm64
     - sha256:32333332da6174408e998edc9809012d5ddf388ad39812eb3aead058e804eb55


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
     - doca3.6.0-26.10-028000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-ubuntu24.04-amd64
     - sha256:6bc49dcc4ba450601adcd4b53f268e835e17a6b4286f3d25b1182504cf4d5666

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-028000-0-rhel9.6-amd64
     - sha256:331954300f615ad3dd9948ba181acd4acb777ab4a0c5b2d3bc3247028cc1768a