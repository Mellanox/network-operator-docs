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
     - v25.10.0-beta.2
     - sha256:2ed87445af37ae952f8bd2a2c1a43225c764bd5bcd898720e7446684e4207400
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.2
     - sha256:dd491e71f8a1c0d2e09061130c3c282dc60a922e9154204de9ccd3af3e4f265c
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.2
     - sha256:d9adaabc8f69f8a9571e78f6265232818a7c646d7a249d2522f5475bec582615
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.2
     - sha256:a80c7afdbe9d1976d0ce6caab965d02063add9d310f6abf8fbb439b121d4f1b3
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.2
     - sha256:e6cef9466dec944e30d90029b68b79226bef1d57f118d31429c44d45de9b1ed1
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.2
     - sha256:77af38c94022bfce734faffd914163179945b3a649e1ad60bd13d1d779482d40
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.2
     - sha256:29cb0f9d11f14f6a6839f96230bb6c6b8d3c9c1cea1ea559f9ee0ee8b619e0db
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.2
     - sha256:6459b892a5539213cd8034e738f0e55324068548a1f0b671b49d349a826b3806
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.2
     - sha256:211c91d45f21dcd001d91f2b1b08a490e65b4c7e6ea9b70462e4990ef49d46a6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.2
     - sha256:41faf8f9019b3f706ecc57b3f8ac5411e5859d46d9504f2833b29a43367fe7a8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.2
     - sha256:b9161fddfbf281b8d887d6604af56662ed5301600cb3881acc2a6719542fbade
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.2
     - sha256:50d9cef6698daa33695a65b09114f892b07bb7176d9a05055554faa2da8ba745
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.2
     - sha256:85e766a8e081e949fb58a91f4e809ad0d184602e56a385cdfecd9216506a2c84
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.2
     - sha256:fe4b12ccad3a5499a3a6204ed052b715f6dfbb391fc970e6bbf77d274517176d
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.2
     - sha256:253e7610ef6f804a577ec9fd99098ab937346584808ffbe83659a8af0c1228f8
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.2
     - sha256:22df66149929c0b2afb54f3e507d57a3c3043a237c83d15dbe4c83c34010246b
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.2
     - sha256:dc9be3bc79f93062fc36ee3652dfa5e397b9201e5e400b65b706c36e9f8a6b9a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.2
     - sha256:501795ed6e42b3296979ffb4b9e5275936b8335b286d20abf3e1db88ea0ff5d3
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.2
     - sha256:f7a447ba295502b9cd867f835401248a1fc3c796ee24c3d0ec3a23f075cf6ca7
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.2
     - sha256:fa600849e45cabe81c25279f25785fc8e7810d90f57916323103fbe612189fbf
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.2
     - sha256:c6cccf0887226dc5bc2c3b7d608994bff662a2afd064761460fc314738ae8007

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
     - doca3.2.0-25.10-0.8.4.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.8.4.0-0-5.15.0-157-generic-ubuntu22.04-amd64
     - sha256:3c42d7a3af18d96eff5ca8ef4fc0113bf5ec0c13cf10ebd0b397cda16a8583e8
   * -
       | doca3.2.0-25.10-0.8.4.0-0-5.15.0-157-generic-ubuntu22.04-arm64
     - sha256:1eb444e88f107df7cd65854da2eaa1d825a1529ceb8cb4367e62321d1fda7d1a
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:32d9a6872a5d6ec686e21b805e6f068fd1a2ea6357a691d3a5c1bee20ab8fc99
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:4035dde50631c20fd1f71867177dea97d6b2a87a23af4b329f2a22f2dd340b44
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1013-oracle-ubuntu24.04-amd64
     - sha256:4ce97c14c8eb2e1084041ec521d08a890f3800b39d78c81ad09711d4e23df2b6
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1013-oracle-ubuntu24.04-arm64
     - sha256:a0e7a1f2d0f7e802db262abb84ecdd37054615ae66632cf7a063d7417a6d1d0e
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1014-aws-ubuntu24.04-amd64
     - sha256:cc77be8ce719a068ed85b08d98e70bec176cf57258ce1cab979c73d268cb3dfb
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.14.0-1014-aws-ubuntu24.04-arm64
     - sha256:88d59d0c68409152b364070b7a643227811af3fcb005e2955d0038c4daff4c2d
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1035-oracle-ubuntu22.04-amd64
     - sha256:45e8eefb9aa82ce224c0d8d3e46cc95ddd2955bb0bd3a2463fd74bfb3b4d1a1f
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1035-oracle-ubuntu22.04-arm64
     - sha256:2973bce91b197ce95d6036a8eb087fee4b1aea3875a35c8e5f0f963b11dce0e8
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1036-azure-ubuntu22.04-amd64
     - sha256:b61d29ccfff416a9d5607d4ad6929272de132eefb36f0d3bac0de25aa00c2d07
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1036-azure-ubuntu22.04-arm64
     - sha256:08ec6606538b3aff45678179b1ecb530f45abac50bcdb3c7ce851e23530ebf69
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:4981648b3ed603c7a9b6ff99c559344438129ba1b10a13f350cbd035f026a806
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:82d89302423b9bdd45071bcfb825d57a30d146b3378e1016f150c879dd3ba34d
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1040-nvidia-ubuntu22.04-amd64
     - sha256:9ff315967e5291f7feceec1528761a00054ea4b8cc2ebafd49275287d90da596
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-1040-nvidia-ubuntu22.04-arm64
     - sha256:54e58f91212d9e4ecf0fd08af08571710607f03d26b58e89605b07d8a060aabe
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-85-generic-ubuntu24.04-amd64
     - sha256:f5e4e8802a7a11bb1e364ec1a10e88d9a70c68c6ff4af728d8d3b92209fba7d4
   * -
       | doca3.2.0-25.10-0.8.4.0-0-6.8.0-85-generic-ubuntu24.04-arm64
     - sha256:03d3105a61443d6411e99711dae63078d7a18cc73e14949da2e078b3e21f4a43
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu22.04
     - sha256:a7bc99237fb45677b389901f6241acdb673ab875ab7875bea8197093a5ca791e
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu22.04-amd64
     - sha256:ca0a97621d446fa5b899715deb3f620bd066a2cd96f215df662a45b17dd88bd7
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu22.04-arm64
     - sha256:11c440c0d776793245bbd7f7e7bd614455f934d5feac1c41ae71204abe17e920
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu24.04
     - sha256:952604f4d45ed3d75c388b6d8b987d129c0e44ee4d2c8431d9ec5b10a5a0f7dc
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu24.04-amd64
     - sha256:cd050bb8cedb975affae2ada2cd79c3904bce94f310b70750ae81c01bfd23b4d
   * -
       | doca3.2.0-25.10-0.8.4.0-0-ubuntu24.04-arm64
     - sha256:af2f29ced09329923048f98c7901cab65c5fc0e14da33b92115dc6883e30a941

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.19-amd64
     - sha256:38c0eea5d8ab5c21f201953cd24a98115b594c8e4be087e58b8d990a714d25ed
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.19-arm64
     - sha256:6e13a8a61cb89c23c305015c9f207b27af670814b8ca79cf4e09d527467bb170
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhcos4.19
     - sha256:232902fa1d7f26d57bd0bdb8df19f1420ef88a731a4af9095d5e4a26f6ba1146

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.10
     - sha256:3b1646ccc38faf344e76b8ca4edeea2787ad0693f13e85d92e47274c935ea8f7
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.9-amd64
     - sha256:eb4e1bd364bcfaa09b7aa737d65ed4df85a911f00bdfd5d18e8112eb6192d65b
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel8.9-arm64
     - sha256:4f19831fb522e7e1b015abd392833a293fcd13bd0c20cd86c53b601f6e93e587
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.6-amd64
     - sha256:5a27695852fccb8b80cd943c5ac3015eaade4caaddde070c60bf09fc876d75eb
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.6-arm64
     - sha256:a98b1140850944f19d4eae0413cda882e96e5ca599dfc264bc56a3827da53f45
   * -
       | doca3.2.0-25.10-0.8.4.0-0-rhel9.6
     - sha256:04687f3b6aff89dcfc9a669a3cd6a3fe8120522a459fb1c690754d855b94a5e6

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-0.8.4.0-0-sles15.6
     - sha256:65d2c548086f5a086449352b649a7905eb39bb53819922704eec0912a86820fa
   * -
       | doca3.2.0-25.10-0.8.4.0-0-sles15.6-amd64
     - sha256:7642c84420b086ff284d10f91cc14209ac2b3fd407690c7dfc26b6d2003ed8e6
   * -
       | doca3.2.0-25.10-0.8.4.0-0-sles15.6-arm64
     - sha256:c8c9a0b1b583878610efadafc911b0b3c0d980d79bfdbdc5b647fc791723a199
   * -
       | doca3.2.0-25.10-0.8.4.0-0-sles15.7-amd64
     - sha256:dd97cdaffcf78975fa916c9d81b96df94a14b513abf6504ed58fb222caf0a19a
   * -
       | doca3.2.0-25.10-0.8.4.0-0-sles15.7-arm64
     - sha256:b358a4aa9e34248d99c253a14e971827f3e5b1044830b81da7a492726bf6a8da