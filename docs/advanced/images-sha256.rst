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
     - v25.10.0-beta.6
     - sha256:3fe176673d2af5a37e0db3be63aaf63a52c735983e603d59772abf456e060dbb
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.6
     - sha256:71352b39a9ff8556b95f6fd159f3764df2fcb7e6ab4739f81294dc09ab535eb2
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.6
     - sha256:3291d13cc223f64dafce5076c36d441930f7cf405da023030acd47a98bab8e29
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.6
     - sha256:1128ea6253272193656e4c4f53b03c0190c0879bd3ed18b0c89b795a1973e43c
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.6
     - sha256:d4c6f89e1d881e465f957037e5865520505e9506a9b1798f9f4e6696e02ee90b
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.6
     - sha256:0270f35e73f170ca74560a81117d3b350a9d7718773f7436e5634bbdb15104a4
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.6
     - sha256:3b54ee443998069f9849ce410a496cf923d9f7c44501bdfe42f9e9706a2fa09d
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.6
     - sha256:3ca495215ceaf656cf2eb4ef27d83a1fd880141f8e9b2b24702a501389e6ab4b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.6
     - sha256:85fcbd58ff093e7393857a30ae5b45c8b5303a3ff75824b34f99f8a9b6f479ee
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.6
     - sha256:930330949c6f6d504793de874d9b009c8998aa178a9f43ab8cb7c91d81716157
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.6
     - sha256:ed3e5c83ef98b3298f8301eb353c3eb6428755687dbc889d0d61e2f52eeec571
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.6
     - sha256:137e37e8b3de097f1c234ea0492b705e1e2ea7dcae01bdc2e5034943ef57729e
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.6
     - sha256:be15a53349b1965a6ee1133c3bda1ce37230f1bd618a08188b3c298f4c3152b5
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.6
     - sha256:949e10fecd86ad8b05c9d67f517bb6c7eaaf40cd44e661afe848335cf49454b6
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.6
     - sha256:7c42a3b221d3332ee5912ca717a43ab4a14adbe8a576b3d781fb8ae92537a5be
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.6
     - sha256:6132f24c20eb8bf492c07b92971ff50741de33b49e28a84af2d5ebb19926208d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.6
     - sha256:50b68cb515c02e7c4eda0d50103b0839d02b56da72e582d31140bdbb0938dab2
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.6
     - sha256:19d842aa0125e2d597a30e0c11448037313ecee0f655c6b64f4f2ceb8b13b6b6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.6
     - sha256:86eb6452f219c2ff4e2c260fa22e79a532b30ef4336ff0d4cf35127d801ae9f8
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.6
     - sha256:23765491b63b8f8b700b72c3526221f0899904c9d32cc35fd6fa709170fa9efa
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.6
     - sha256:28d5bdd5e7b152fc6715c3184a22ec2c0adc9d04d8ef8e9244d07c3241faf6c0

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
     - doca3.2.0-25.10-1.2.8.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-5.15.0-161-generic-ubuntu22.04-amd64
     - sha256:f7d359b1ff48a75250c5b909b1dc91ff7d3d31b7366245a533baa02b5b9b3df0
   * -
       | doca3.2.0-25.10-1.2.8.0-0-5.15.0-161-generic-ubuntu22.04-arm64
     - sha256:ca059757016454e1c47675480ecac6610e3b73a145a37245c7ee8c3bd1ee8721
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:78ea34af1f1b3e3cd39ab5314a2593f4748e6a0f5994efd6f96dbc92ba391b47
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:ceaa9499c32d614f212818eb3cfa64ba804c86706ab2b44867a67593891c893f
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1014-azure-ubuntu24.04-amd64
     - sha256:df8acffd730dbc25da8cc75125d91a9b3541058ad1f30dd9483bc3f387b9072a
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1014-azure-ubuntu24.04-arm64
     - sha256:1ef919ab364a7f23c1fbf0b7cf1b92dacd5b77ded95a758f60b4cff575105b7e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-aws-ubuntu24.04-amd64
     - sha256:86e6a51508f5ef0a1ee93346cf1d5cab8ae72ea655580ed283b85516b01ca262
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-aws-ubuntu24.04-arm64
     - sha256:371afa4affaecddd9963fdd93028ddb2a629e74784936db2a1118e65c5426306
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-oracle-ubuntu24.04-amd64
     - sha256:e11934963ac826681d5dfb01b1d4a427c18b2283256f388e1e1dbfdd6a6f791e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.14.0-1016-oracle-ubuntu24.04-arm64
     - sha256:d193f0b018d42faeb7138020e074b0cb80da0d36a41056204c0a4c71dfa847bc
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1039-oracle-ubuntu22.04-amd64
     - sha256:feb9165ac3ba4f284fa933eb78bed265bee0f76390a68cc49df206d383049151
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1039-oracle-ubuntu22.04-arm64
     - sha256:3e4ebfafd32bc1fe30857430a0d93847ea7f4e6cf54dbdb7e36247dfe5258f0d
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-aws-ubuntu22.04-amd64
     - sha256:5fc1bf307c47f17bdd2fa116c64e93d6ca0f5d12a3b33c6721f22788d47fa527
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-aws-ubuntu22.04-arm64
     - sha256:cd3b938e071b331b8e3e9cba1adc5612833e23a3c02c6327ec3a4938182a13a5
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:55b598c6dc8a697ec8afd6de002695dede27a4f279c3b207476adf1ff22d9070
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:3eda37de453e31cf35c57e47218a9059b1cbcb83cd44ca4eed57e0e13d60b31e
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1042-nvidia-ubuntu22.04-amd64
     - sha256:939b9a9d7e6bf7afc4d1feb0f71089f730c80c184a971e08038f2e798f8a1f68
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-1042-nvidia-ubuntu22.04-arm64
     - sha256:413909f334b3a4f03def455e8d321f200949c3c76ff7e0ae4b537b86a79cb1f2
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-87-generic-ubuntu24.04-amd64
     - sha256:89825e7a4534eef8b33c1caeeafd680455b8ff6dc09435394bed557b66057a81
   * -
       | doca3.2.0-25.10-1.2.8.0-0-6.8.0-87-generic-ubuntu24.04-arm64
     - sha256:48d7571708e94cee61f2cf9bc4b67e3224f550c17d89f1e0fa74b5af62fa2989
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu22.04-amd64
     - sha256:d061b55c22a17db0c173e93a9f344e0628c7c529449143b834a04c563576bd15
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu22.04-arm64
     - sha256:eaed94ef3bcb1f54ec131a6ed16b5db6e4c78ff2228aaaf29cf3eabe43075c29
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu24.04-amd64
     - sha256:27d224fce213c2a2769ef0a9e4103318939dbbe04db1533ad9070d406196c1c3
   * -
       | doca3.2.0-25.10-1.2.8.0-0-ubuntu24.04-arm64
     - sha256:ecaa9db6f70d7ca404d60f67d9e704f96de962fe09b869d96f399c112445590e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.19-amd64
     - sha256:19f2a24b802d65d4cc2100db6361d4aa7b57279d629eca02305eb946955357c0
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhcos4.19-arm64
     - sha256:de4f780f6dd559fc514e0c947ed46641aa4b3101e05595babe70d8122063457a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel10.0-amd64
     - sha256:4412c93edbf154c0ece56f61d29901e2eeab60ce16fa94b45f7e32be1f348f40
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel10.0-arm64
     - sha256:1a585128df361910b77fe6d54edea69a487cac0cf5bcb1dde2b5221444cb0423
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.9-amd64
     - sha256:85470b670d530d7d0ab1cb471aeabe91bf38c9ab21faf427d56d9ac483afadbe
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel8.9-arm64
     - sha256:94269c12b6f74027a2253620d6d1d61d93202a20bf8944122a9630d85248e53b
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.6-amd64
     - sha256:7ecf142d43dd242453471f311cdf9fa1e4d27e707aaebfd323756caf7ed3f47d
   * -
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.2.8.0-0-rhel9.6-arm64
     - sha256:463a4edf892175559397aed64a83bef6c4fd77fe40b3d7e259897c421d4c6a91

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7
     - sha256:745dd3b1cbadd95d14d2380701fd6fdf33063f59ffc97adb65f25c1d36445a2b
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7-amd64
     - sha256:7acc610a42faa91aedfc475df4004ba39f705b45af1681fe9456d05dbc3afafb
   * -
       | doca3.2.0-25.10-1.1.7.0-0-sles15.7-arm64
     - sha256:45a7c8d21e9efdf59461862c964d30c05ddd86a303c4bbe2f89e75e2919e5a62

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
     - doca3.2.0-25.10-1.2.2.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.2.2.0-0-ubuntu24.04-amd64
     - sha256:84edd168c0e528dff5fb32f0e83338cfcd2b905d66b3cc0cc04d0d6789d6d074