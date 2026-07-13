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
     - v26.1.2-rc.3
     - sha256:7ae9d9b629bd4b03d335cbc261fe3dfec326851aaaef81fabb8b7ea067ec57ce
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.2-rc.3
     - sha256:546a9cafdd092c2e0a89d1bdfbc9d7de1f62827cff147456a30357fbd9be3a3c
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.2-rc.3
     - sha256:00b2599c26133b9c737231ec92f16cb81f75547b8e04f0663f0d9a62f0448f4d
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.2-rc.3
     - sha256:e22110ef5dd20f1ffb2f1e75c1d2aaf99346691a7aad5b62bf396adf248f5924
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.2-rc.3
     - sha256:1c379c259c436f88e7552bcd9f2bfb34620502b396756f7e44051bfa1c1e041a
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.2-rc.3
     - sha256:4cdde8c20bbbda332f03590863080649bd5a57615973bdbc1f49d20cb6fd4ddd
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.2-rc.3
     - sha256:55fabca73dc00062c4a9e4041c496b8ca021366f40527844410f2d489f95a5a0
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.2-rc.3
     - sha256:d23c603a640053642de6c9a40261ebd5d79a4e793249fc3996f0155fe5ca7cde
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.2-rc.3
     - sha256:cc7437e2319bc5f1e9826810f36fc2e497f854ca96385a9f31001bfc7fb57dc3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.2-rc.3
     - sha256:3f63c182599c67aabf0b6d557a6a120e91fb330596f308d0ec700ad82e377c4a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.2-rc.3
     - sha256:41dd0539fcd18e91eca8381c358338279f553bb691cad666ded97a3314e19732
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.2-rc.3
     - sha256:d31e456dcac73527bc7d1dadeb4453d85ca45864e590349f3f750dc4a9f31678
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.2-rc.3
     - sha256:9c6b65375facbb0e7b4af52757d237ee5ff2b5eb48c7fe04175b907172f4544c
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.2-rc.3
     - sha256:4f516a111695d7161523996aa053f423409a6970830e683c614395337770d0b3
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.2-rc.3
     - sha256:498cc2f56b7bb31e862e95892a81769e7d75a9d7c3bdc4480e844d7d38a9af30
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.2-rc.3
     - sha256:2bd6afd3ffd1c589fd98bd93dd908a136272659db5a5d0d0b722df9b3b2078b7
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.2-rc.3
     - sha256:1e081829f634279a34c4b55ac4a5777b7d8f59ae26e86bf232ac061ae29e8ce9
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.2-rc.3
     - sha256:953df6a3f25f78df184e9c1d783e7d1d698bee1f584ad2ddceac2236af9de799
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.2-rc.3
     - sha256:70fb56637e5ae88a1ed2b9db4be1dd9dedcf75ab8f5ddcf5f21e954255a74300
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.2-rc.3
     - sha256:86b36531f0e70c7cb24ae564d52d1fde02e4a677a873324c0c55e5c5eb832078
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.2-rc.3
     - sha256:86dbbf78af75372d7fbd64662cbdcb7f4379af8ee689c9eebcaa134fb60355ee

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