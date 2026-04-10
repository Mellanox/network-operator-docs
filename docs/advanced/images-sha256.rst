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
     - v26.1.1-rc.4
     - sha256:f98750228180f281749ed04f6aec0666927e30ce2ade9f7e82ea0fb742a98433
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.1-rc.4
     - sha256:f692232b94c2dcd92af6af4d2842f76c4cef0e9b9297746fa4596702d46bc33d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.1-rc.4
     - sha256:cee4a47e9a9e7500c8656ef71669edab98674447e180316a09f4253e31ee2518
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.1-rc.4
     - sha256:4b854fc6f0bcd76fd43d580bc5641a0dd28a0627929cb30c18719dc9997f2397
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.1-rc.4
     - sha256:1a1caa65f302333485c9ecb8809358d78664c2fe4dd2fea6c1a3dba84db961f8
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.1-rc.4
     - sha256:282be3474366cbe320896c33f8eb87077dd84b4161650220b3793d799f8c9063
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.1-rc.4
     - sha256:8c82129453138ee1d289120cadc2dad3106e7dbe08b73f1fcae7d6649de5856e
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.1-rc.4
     - sha256:595a1f4698342164d093e086eef344bd4ca79d354ed87faeb5673acc030b3943
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.1-rc.4
     - sha256:e7ee133db9912a6e190ad30896ba9061afb4690078640c4cae42abafe7b8a2fc
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.1-rc.4
     - sha256:908d3703ce8b6eda19c9cd926e568611a2cdf14849243691ac3ea5e603ee2264
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.1-rc.4
     - sha256:16376eac4efa61929e8b8a8b156ff61067873d0ffd1ebf7fa27a069279cd22d7
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.1-rc.4
     - sha256:2ae1959b12ea5eacbe7908987da7c929e8dfae280a413840c4d5acaa6ddde973
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.1-rc.4
     - sha256:14a53eb47e8e3d2193c4d627e176b9e3070dc5365ab576df52aee4fcc8d2cd8d
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.1-rc.4
     - sha256:9a73bdbe3a3d38d658a75bd609587c44505ed7341402f3b1c68dfccebd9021ac
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.1-rc.4
     - sha256:7bd62a96f18bbe45cda0dbfd0de6f3a4fe5a106779c2544a8223edcb5f10ed15
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.1-rc.4
     - sha256:4d660baf27136af9317ebf45218c16cc0c72d4f5ca69279c72e810f9450fc812
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.1-rc.4
     - sha256:d60224d7ead2cf9bab312d7528c5dd6e07e64e9455e1db02da5873707deda7b2
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.1-rc.4
     - sha256:6547b671173dc9d1f1823e6f397a102949f8119cbe2ef14d753ea17c4fe4741c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.1-rc.4
     - sha256:6a0067cb48c0da15443094522e7377fb6a049ee24e616d5c52b859e600b33bef
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.1-rc.4
     - sha256:80a1aadef97cbd055ace485715bc1137e8482a33d445b986e33e1b89e05ce3f4
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.1-rc.4
     - sha256:e682436d7c7e8d174c83bf9133d55fca5f4f8c1da821e80f02b670a2f9ba36ec

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
     - doca3.3.0-26.01-1.0.0.0-2


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-5.15.0-174-generic-ubuntu22.04-amd64
     - sha256:d912279600d116a9e04378ec81a47909ef7e406483a4ebecf1da531b466facbc
   * -
       | doca3.3.0-26.01-1.0.0.0-2-5.15.0-174-generic-ubuntu22.04-arm64
     - sha256:4d753af6f92522343de6b23c7a8bafb3f6a0d9b026c49509b55c52fbea0a916b
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1010-aws-ubuntu24.04-amd64
     - sha256:adaeb0c0e074a60da9968581e61cf0a440c13ec3b729ccfbe2f693117752bc0c
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1010-aws-ubuntu24.04-arm64
     - sha256:d3df5e746c873a2261b288591746b229f61297b8c319464dbec2756bf829ff89
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1010-oracle-ubuntu24.04-amd64
     - sha256:d2848a7f51b511151d012adeae50e2ea71bdc3caccaddc5ae3a7024afb036b8b
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1010-oracle-ubuntu24.04-arm64
     - sha256:8e6fdd007e367b8f5c14bb78213415f1b610fe29e69531841274be7af819addc
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1011-azure-ubuntu24.04-amd64
     - sha256:7f4cfa579c380c9abfcecf5511464fee9115fc04d819bec461fad8052d1f1674
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1011-azure-ubuntu24.04-arm64
     - sha256:7fbc4328face6a8d13b71c2f2c20dad29c88246f57b4b9bfa0c704dcec7aea29
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1014-nvidia-ubuntu24.04-amd64
     - sha256:f7eae89bd6410e7f52daac2707533ba8271307d927ff60b3c51c6a7aad3e57c2
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.17.0-1014-nvidia-ubuntu24.04-arm64
     - sha256:7f2f52cf403fa439a16384ea72e50ec4df5b2adc870a02f26ac6ebbeffaac89a
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1047-oracle-ubuntu22.04-amd64
     - sha256:87424ed2e6c5d269ddd656a79bf759442944221e39c035fb400f63256b14ef61
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1047-oracle-ubuntu22.04-arm64
     - sha256:aa20931cdf155c2e6325f408aa1751b41e0a78c17e69cf38669314a71d11a505
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1050-nvidia-ubuntu22.04-amd64
     - sha256:9f764ed96061b1f63a946d239df553657446e8034b59c7d1cf910a500122191c
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1050-nvidia-ubuntu22.04-arm64
     - sha256:86283fec9143042a413dca9773ebb5ba3933ac7b87780f3140a10e335ab0a2a1
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1051-aws-ubuntu22.04-amd64
     - sha256:87ffc233a7d596bff3d39859f3f97352d2617b5454f9ba0d79e394c03d4204dc
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1051-aws-ubuntu22.04-arm64
     - sha256:9d2f88d96db448369976c317e21035e623441734eb1a7dee76db8e8b897f9ecf
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:7dbfb71015066841bacb18e4e8ba658507179069b85ab6396ba1b4cd0f19896f
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:e2490ebdeb4ec8eb551e69cb152939618470f9aff52f5cf05b19655aea683d97
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-107-generic-ubuntu24.04-amd64
     - sha256:dccde80593c94808e2f5b94898916fcd41c19c54f49f7a5fe97f4d942cd83819
   * -
       | doca3.3.0-26.01-1.0.0.0-2-6.8.0-107-generic-ubuntu24.04-arm64
     - sha256:7618d51aa689b02902edfc351ead8dada89bc67d199b9fafd3caaf8d0fdfc92b
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu22.04
     - sha256:c9e59d64c69755ddff2795b9094214b5b3258bbd3c2b932a8f74fe377e21210a
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu22.04-amd64
     - sha256:8fe817aa4f567bc7bc98acd6543f6a13f4b89b217dab2af0d325ef16e7117148
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu22.04-arm64
     - sha256:faa7f14a5df53ab24456dd70f441fe8ef71e9d5bc841456e7dfcf4b4ecb0ef90
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu24.04
     - sha256:aa29060bf0913f9279ec1ce5cae1ea597e941f6c9cd4ca47afe461892977d898
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu24.04-amd64
     - sha256:45ada0c9d451909b7b8262160d6937fbc1187321e94bd87308ee2c29f911e0e2
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu24.04-arm64
     - sha256:5bc1f4fa87ef3b16f2438eb266806927d2de4c982152feee5e339eb1a655699b

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.16-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.17-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.18-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.19-amd64
     - sha256:3d0a9a6f225da10858a675b265babc0ce4e82cb98840a323f74aa6ffee853ba5
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.16-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.17-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.18-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.19-arm64
     - sha256:a5d3df1b17ff3a1a110de9285008cfb660d4134d985cffe1d4361b88f5ade14a
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhcos4.19
     - sha256:18f8862f44fd209108b6bdcee20567c3c07d39fc18ac5acd14845354a0c8376f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel10.0
     - sha256:39de8ee8579f17381d7cbc4985d88908386d36b6048c4566e161bdca50b6c842
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel10.0-amd64
     - sha256:b761fa9a707aaa53040c637c4b8ce93a0e1b2444f983a6dfb877d19852cc9888
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel10.0-arm64
     - sha256:f67cc6c10ee09d95ed5168335e012c64cc9aa52236a570c8c145058e2738602f
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.10
     - sha256:652892fd9e8f420b1a4fac377425036d3f6d2ad41791f06ba55c741c85ce7c8b
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.10-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.6-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.8-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.9-amd64
     - sha256:f8d4c8e2d69326812b66e7d4031d05abc5c032fca77ba1ff859e4c3867a35b5d
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.10-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.6-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.8-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel8.9-arm64
     - sha256:c998c3534de6fae21539cfb5bf4a69392703dd054539ea2216022af2d6968f7a
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.0-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.2-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.3-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.4-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.5-amd64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.6-amd64
     - sha256:820f3047e1a7f2be8626d00bea62a321d88257ccdbbec4ef11f20c1484b7dd22
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.0-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.2-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.3-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.4-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.5-arm64
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.6-arm64
     - sha256:c9bd89ed2372bbd55afc574159bbf0ac24740430a7fbb081ec92e5708a184827
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.6
     - sha256:69800d3c49a5addfed3a010659e15cef4616228e525832e049164bfaa070aeef

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-sles15.7
     - sha256:7a57ecc8cf12c9bc87049e8c2e4383d3a7cf6e8e1d31da73dde8ea615f6dbb61
   * -
       | doca3.3.0-26.01-1.0.0.0-2-sles15.7-amd64
     - sha256:880f186835184071829a0d161630be3f4db6c7a47b88af0a5eb84419ccf8e9d9
   * -
       | doca3.3.0-26.01-1.0.0.0-2-sles15.7-arm64
     - sha256:c651bdc022ced4427bdb528338d8c4915abef698c0c77129d08779cadd8ef21d


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
     - doca3.3.0-26.01-1.0.0.0-2

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-ubuntu24.04-amd64
     - sha256:af28e5d503d19e2c379948de76f164c47e146a05c5e57e224bedb093f6d1ec54

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-1.0.0.0-2-rhel9.6-amd64
     - sha256:eeb10571313d3577d7c6b7bdd9008e71fec960953d5b093754054ed97e40e308