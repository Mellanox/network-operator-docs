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
     - v26.1.2-rc.2
     - sha256:3d85d8aaa985e2b05014cae3bae813f180ddee1c90c0e96a0367b418579a3845
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.2-rc.2
     - sha256:c8b5b81d737cba5e67ac6aee9252760300bf4ca0fa78c0fb1947f64aed0cf3d4
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.2-rc.2
     - sha256:81afefee2b09574565356bb15fdadf2c7b3aaf0226ddef347448f7a06d9feeed
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.2-rc.2
     - sha256:947cd5d9f89ec5171cb6d363bcccdaa9fce96ff20be5f52fcbc974e465c3eb78
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.2-rc.2
     - sha256:0365bdab02e2bc6823f2d5fda8e6c06c952d2095f6ec064d00466b199f9514b4
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.2-rc.2
     - sha256:409be6ee59b4f2cae204b5635b3e7fd099d528e8d7acc8f2d4840fbcc92f95de
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.2-rc.2
     - sha256:b81ed30efd1d6d23648405e07eec68ed15ff508c9faf47ba476f3313a76cae01
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.2-rc.2
     - sha256:3b4d6a27e7ce53c9aa8d16415f53e1af9ee864c52ebe9776742c9473f3f6aa40
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.2-rc.2
     - sha256:8e07d8322f5a262539b08d4500646573f7cc2ab21562d1927f87b638944c939d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.2-rc.2
     - sha256:1847c30e38bfbe9dc047df42533ea70f7edbd276331c4830da13a36c85fd1fc5
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.2-rc.2
     - sha256:ee36df7677d804848f50f40edc8e08b552724589995b5a447e99678b22ec4987
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.2-rc.2
     - sha256:f9b50ad2c8ba3334da942ebbd7db8ddd336a8d0ba1b632fc872cd2ca09667a45
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.2-rc.2
     - sha256:bac1f22b1891749189f95dcd3b80090f7b71744b3887b5cf29be776cfebc2872
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.2-rc.2
     - sha256:c549eced466205b727a5e307fbcd4b769072fe1ba412604aaf3450ed0a790443
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.2-rc.2
     - sha256:151826d672c94436d11cbb669fd339d56a8330a56db6b300d46a20dd6054879a
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.2-rc.2
     - sha256:af61b6293038447891a1ae54c7fc05460a799964c280421f85b82ce0ba2d475a
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.2-rc.2
     - sha256:f37df380c83f82874a1e03a2827327acc59f89f4aabcd4557694ac9db1258046
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.2-rc.2
     - sha256:8cb17609bd308d16d304ead400a8d9e415ca40bc7ed4d3ead7bd62b76b3e6cd6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.2-rc.2
     - sha256:c2ccccbab2b27f86f4f359acbb2f986e5e0296ea4115abe267f464cef0ab654b
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.2-rc.2
     - sha256:7bfddd9bbe9cbd11761953bc95fe58dde9b7f45fedf2911f572b2353185c7ea8
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.2-rc.2
     - sha256:93ac64631b842b391ae06f05c4656cc2e92adc08a5e4b34694563309778dab55

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
     - doca3.3.0-26.01-1.0.0.0-5


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-5.15.0-185-generic-ubuntu22.04-amd64
     - sha256:1e52f290435750221b34570d84e01523119aaf2acc3108c5aa0f68a05f535f7d
   * -
       | doca3.3.0-26.01-1.0.0.0-5-5.15.0-185-generic-ubuntu22.04-arm64
     - sha256:96e40964fa2a651cfe0e4e06c0fddfc98efdd2b0f29b6b4628cdfdb7f6afbd5a
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:5d1b97c28f1634d3fc66400d444a56384348d7b91e27681e2032026f25fdaadc
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:a6fc3a638d323eb86fd185d11fe9ade913384fca86f300420719d96c6f11d1ed
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.17.0-1019-aws-ubuntu24.04-amd64
     - sha256:85a64e628922d5a3f5385822ab876319e6f5e07e3646d298c7596250ffe550e2
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.17.0-1019-aws-ubuntu24.04-arm64
     - sha256:01d930948ac47b9893539e5f2aee7febc039ba866551b5d2f0be473451d8b193
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1057-oracle-ubuntu22.04-amd64
     - sha256:5b5dc7a8fb75baf772fea3a40215f6cc3635ce8e866c7a6a32197f16f8317eef
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1057-oracle-ubuntu22.04-arm64
     - sha256:6ae374aebb7c9e36869a2311960f6fd0a3c64aec0cb0ceb01598ffab099849c9
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1058-nvidia-ubuntu22.04-amd64
     - sha256:37fc172997e99fe5015aad439f0a64994dca0dec961bd26494ee7bd600905e9b
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1058-nvidia-ubuntu22.04-arm64
     - sha256:16d37c80777927916411779b92078078254a04119f316377009d62ae3e2a0fd1
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1059-azure-ubuntu22.04-amd64
     - sha256:fca63080a95cfa0d59428e655c791f9a3969a0c9ee5cb47ef04f1928781e97b2
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1059-azure-ubuntu22.04-arm64
     - sha256:c2a07f92aaca7699618b62d4b05ce987d82fe2f6c3530f2e34e2203091ae11eb
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:8e611af6d3cd5e44bc6c5c5a20ea88a4e92bad1990a3d8a77ec5105b743a7ce5
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:ee1311190080085e4bb26a9fb95fa65eace0768e7df788bd181fe21c6e4079b9
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-134-generic-ubuntu24.04-amd64
     - sha256:ce125c4e4dd3edcb82326db39ff26bde90ffb091ddd48f1ac06149c696fe4612
   * -
       | doca3.3.0-26.01-1.0.0.0-5-6.8.0-134-generic-ubuntu24.04-arm64
     - sha256:996d68f11b2fd00066833740c0080e624a510e94099fec17fc6b2ca95534daf8
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu22.04
     - sha256:76d41ab07a5d8e13c80a8a0f78f8c71f2daeccf1d0a100561e7e71833bab1600
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu22.04-amd64
     - sha256:d2e002aa9043916811796dc999e9e10f3327c8e9d19d505324b36b9a471f0b84
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu22.04-arm64
     - sha256:01a7deee4c4f8740f3a69bac30677bb89a44af28c31289732a0ceeffef8b1a08
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu24.04
     - sha256:049560fec06d30c4b717a95041f41e68b259783317e8d1acd3e6e17d24d03312
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu24.04-amd64
     - sha256:bbaf635730f88e86d64e9cf567678006d5a7f994741c1d8eb53a24f16fd365e8
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu24.04-arm64
     - sha256:9973acde3d97324cc0601ba2595b8547c743465ea88d64d058db6ee98395dccc

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.16-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.18-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.19-amd64
     - sha256:526aa34e9707d1982d6e836deecff4d692f44260ae3b9359dbff64618657a520
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.16-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.18-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.19-arm64
     - sha256:603664cb3ad2ebe5315e8f289c291577005d7303492723cb775ebe46f4822923
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhcos4.19
     - sha256:34e02042fb293560a247b8d1f3b68fc63341e794b3bf1b5e1e4db896c57973e3

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel10.0
     - sha256:eedaae90f1b32c222c52e4f3fdf165afa45cb932ca71c76cda201b2df0aab2a3
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel10.0-amd64
     - sha256:a5c059df2d84ffe1334710859497b6acfc0b6eecd7f40092cf12b7c2181f9603
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel10.0-arm64
     - sha256:dc947e7cc767e2ffd2595eae084867b37cc6bcb122057bbe2b3d035c1260db2d
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.10
     - sha256:80b14006caa78470cd829d346896994a05956fee35858a4c4f377125ef446378
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.10-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.6-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.8-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.9-amd64
     - sha256:4318be5d463dc72cb2b9ca8cda592fa3ac1aa6d2e684b788c8218c7b50ce7d4a
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.10-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.6-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.8-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel8.9-arm64
     - sha256:67b1396f898ec2ddbebc41c6ec14ca9f3c082f98534e1c6f731259fb60d96b85
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.0-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.2-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.3-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.5-amd64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.6-amd64
     - sha256:f11ac9d906f1620e21b20d276e9602aaf61763abea49cef0541e87b7dbe64bd0
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.0-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.2-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.3-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.5-arm64
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.6-arm64
     - sha256:60a6b0480ff8cea59a5cacd5c257b3d3dc55ab0dec640d6899f601824179aa64
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.6
     - sha256:0eb5bfc7f00217822381f2ae8e967ee10c409709deadd1ba2b46e4a49018be3f

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-sles15.7
     - sha256:b33cdc496cce30d38d286489c18dc50dbb6ebfa5fe40f2f4478caedd0d1d3ac3
   * -
       | doca3.3.0-26.01-1.0.0.0-5-sles15.7-amd64
     - sha256:d129b08905b6d45e7d9dae147f3acd302471bc8be1f98ed25a153ce192d4a36e
   * -
       | doca3.3.0-26.01-1.0.0.0-5-sles15.7-arm64
     - sha256:1c3d61be2667cc6d9b89bb15f0c1a843afa3221dca5ab5995e4333f8c219fa2d


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
     - doca3.3.0-26.01-1.0.0.0-5

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-ubuntu24.04-amd64
     - sha256:39f0393b06321f257e2ca77fe4ed7c35c2c5ec1318050a384101573097ab9a95

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-5-rhel9.6-amd64
     - sha256:b114749ae0d279d9a7cc3cbf7074d26b734f7dab71a5e6979002af93c6137d4c