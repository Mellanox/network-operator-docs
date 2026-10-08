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
     - v26.10.0-beta.3
     - sha256:0271585531207ce04c969f21284b9b0125575d23d22c9ed8d559efe37f459c7b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-beta.3
     - sha256:87c806e03d16d338c3d16eab0f6c457043cd93b1b87f00bed789844271dea2df
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-beta.3
     - sha256:6b586f876e4d412202b5c4d1a6d539f792516177ea2deef1900fad2f24fe3ca2
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-beta.3
     - sha256:04f88a2922141752115406d74b1ba99880b5a6fd42c3bfe04e6bf0aacae5c640
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-beta.3
     - sha256:22f55f28eee4c147488ea784eab1ec7f6816d8201300579f64fed5706e0e821d
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-beta.3
     - sha256:b957f11b59e9256192928803d69fedbbf447b0105ac7aff1d13657e458a63693
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-beta.3
     - sha256:1b5ed342e9c476e0c56d07c9046cbf310c2352550f693d96061e6607ca833fd2
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.4-doca3.6.0-host
     - sha256:57e60407cd7f6e9be4274748e6a118342c18c15819444d940ea7935778c4fe90
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-beta.3
     - sha256:07dfaffb8ad3f22ea9daa645a484aabb48f3854e9a31aca355d3ddbb5c41e46c
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-beta.3
     - sha256:7f14bd6b7884c88efbaaa8a6cc47db1c4afb7dc4f2f1473b2309908853dd1cb1
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-beta.3
     - sha256:e12c29c5f0846855418cfe8af5a6f40a13c12784fd5f9551b65dec1641dd9e25
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-beta.3
     - sha256:6c2cb726f5d092278667b3e7b87c0d39783e47164769c7d67ed45401f6f89ad4
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-beta.3
     - sha256:0a084cb974a754d7db7cfd64d6c22b7abf1ec32f0525edd98406b9080eade3e1
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-beta.3
     - sha256:2c185facd791b4a63e1ca2966845f99a0c5a38b8662c92f5bda361ae57bdf5ab
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-beta.3
     - sha256:e8e923b5901a1c22bf45677d90630af7df9bdb9226b76fb2aaa5e5b0095d79cc
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-beta.3
     - sha256:ce6a685b0970902038425201eb6d7c5588c6d3a20ead91e357e7f3dcea9c8e5e
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-beta.3
     - sha256:4fe2eb1b3094fc3b343ee24df8d146a00f3a5f1c46bfa6e785496870123f8631
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-beta.3
     - sha256:3cc960c28d0d7ce64da465cf18830473873f9692f9fbaf66df5687d86a123076
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-beta.3
     - sha256:9583e188a0bfaaad875106960dd273dc32373046b2338cba56fb07edd9cbbb5a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-beta.3
     - sha256:50b93469f960daf844d27254d982622881fba370e48cf297e7f9f367ea78eec6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-beta.3
     - sha256:0fe32313db1c85980a60da33952808f47195d5c83bc6192bc59ca3e520208bb2
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-beta.3
     - sha256:3d3febf214ee3c7643f3a3fc673ff24b434ce7777e53b9892815ca7974689df7
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-beta.3
     - sha256:f4552391e24417fdda95de9bc3c97fcaff15a9970f7d86c8ea250d71c6122a0d

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
     - doca3.6.0-26.10-043000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-5.15.0-198-generic-ubuntu22.04-amd64
     - sha256:6843e16f65a1da8c3cb7dde26527b5b6e9217a407592a3eaff2d28e2069ba1b0
   * -
       | doca3.6.0-26.10-043000-0-5.15.0-198-generic-ubuntu22.04-arm64
     - sha256:5d565b8f05e595ff185cfa277760f4b06d5aba4dbb4e3122ad00ddff83349633
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:33e9feb34e8ed63579f9b67fdf592d79be2dede5e206e7a77785e7625b6c3518
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:aa05159c023c8d3ca61a6a446273c1418715e35408909c3932cdd0127112e5c0
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:2b9d0888e2cf715f3cab0c46827159b29ef63b015941e91568791c37a3f1e818
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:2dcfb6e31fa54c4eb3b7f129944055c5dee819a36405e0adaa8548f447bbec8a
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:1c21e4b29cf76120512e81dc1ad4fc469f275cbd5d03232d6807261151d758a3
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:bd0508e0d7e870318890c9fbacce58e9d0ee2c2de123495fdf781b89b76031b2
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:c632414318e6e5b7ddc5ee2075b46af728a112e73d4dd52d47ac2dad452b4ec7
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:9c2d6a48567620e15b3aa08c8059aa141de46281ff7a5ea06c42f98c3f23060c
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-146-generic-ubuntu24.04-amd64
     - sha256:f0a27423836182dad6414f4f2cc688a73f93f584198167e4fb5bfd17995b635f
   * -
       | doca3.6.0-26.10-043000-0-6.8.0-146-generic-ubuntu24.04-arm64
     - sha256:c7bebec5fb5fe69231638f992bb54b1f66927e49b91cd0647f840912e7cd7cab
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:4256ae638fc44fe9a0ff24639a38f052b47782c81338bcf23c082657717fe311
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:14c5b87fc6274b01e6ec0092a458ef6048ad011e44aa8a0d4752a3e8e266de3b
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:4ed386abea952e878097e65816418e4a85b76f09a4410c9aa3aff0e7ba3bf5b5
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:8f57f83081fe4d73f176ae174ff3d13d563b6088113e6b88d1263bcc3f46cd4a
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:44caf3931d764c19cecf6e73b0c15a0128c77ec922a10888d923138cf2c67d96
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:8d6c800809dfaed6c59f3259c7976e1042de537de65c86340d9a7720cb7fbf38
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:a7c3422d25fbc6367cfba766212c40dd6d4ebfffe7d01db99c07b76cbf48b443
   * -
       | doca3.6.0-26.10-043000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:f1c4407b2921c188e1c7692ec57715f311b8db6c5cdae6ddde7b2ab18da91743
   * -
       | doca3.6.0-26.10-043000-0-ubuntu22.04-amd64
     - sha256:8b92ff499a1fe3bd928d7778fe5662c7c71ab33824bfab068d2157542bcee78f
   * -
       | doca3.6.0-26.10-043000-0-ubuntu22.04-arm64
     - sha256:f211a0c073717d324f931c9a274ed1ec2013ee63690e4ba6b18c4ffc087f7a9f
   * -
       | doca3.6.0-26.10-043000-0-ubuntu24.04-amd64
     - sha256:f1e86a4d5096f977f2b3a384800a6788824c9d7fa33404b5a7a7918b3956f87b
   * -
       | doca3.6.0-26.10-043000-0-ubuntu24.04-arm64
     - sha256:c936508856dffded5c97e38f8a3c622c7a3fe725728b58dbe012a944c0d06a09
   * -
       | doca3.6.0-26.10-043000-0-ubuntu26.04-amd64
     - sha256:0a188df8a46892c317dee23f579e14fbb43b1a8dfa660ab0ac90160031408ce1
   * -
       | doca3.6.0-26.10-043000-0-ubuntu26.04-arm64
     - sha256:d91f4649aa870b661a43e1cb998f7a8d79646b40311ce8b78a6166a04645cc54

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-043000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-043000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-043000-0-rhcos4.19-amd64
     - sha256:acfce03f012201f61032a432215c236b2cb25c3f6c2d0e7683f20bc001360f87
   * -
       | doca3.6.0-26.10-043000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-043000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-043000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-043000-0-rhcos4.19-arm64
     - sha256:3121f6378e5c101230b508b6b065493fef98a786a1141510d37242cb1866419e

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-rhel10.0-amd64
     - sha256:6b6bfb382e5d9fc595510be4276b951c4df3c904f978db5a9062f2b9fbe8670d
   * -
       | doca3.6.0-26.10-043000-0-rhel10.0-arm64
     - sha256:aa945162e2b589b91af75e8ac3db812840ab6d32ed1742b0d0e41a9c008ef040
   * -
       | doca3.6.0-26.10-043000-0-rhel10.2-amd64
     - sha256:57616ef47dcf1f2499fc19b9a01712c93487948c536869fd6307881c8b63da9a
   * -
       | doca3.6.0-26.10-043000-0-rhel10.2-arm64
     - sha256:19fc315182b7e9ebf77b434fac203f8413216228080b875a48e19a0a86a5a105
   * -
       | doca3.6.0-26.10-043000-0-rhel8.10-amd64
       | doca3.6.0-26.10-043000-0-rhel8.6-amd64
       | doca3.6.0-26.10-043000-0-rhel8.8-amd64
       | doca3.6.0-26.10-043000-0-rhel8.9-amd64
     - sha256:925865660c070556cd1c544ad2527f553e94d2959685edb07b4ba0cfa8eefbee
   * -
       | doca3.6.0-26.10-043000-0-rhel8.10-arm64
       | doca3.6.0-26.10-043000-0-rhel8.6-arm64
       | doca3.6.0-26.10-043000-0-rhel8.8-arm64
       | doca3.6.0-26.10-043000-0-rhel8.9-arm64
     - sha256:d4bae899de799891c1656099dc6eef3ae1ded2ce1679029446511fff4eff93a6
   * -
       | doca3.6.0-26.10-043000-0-rhel9.0-amd64
       | doca3.6.0-26.10-043000-0-rhel9.2-amd64
       | doca3.6.0-26.10-043000-0-rhel9.3-amd64
       | doca3.6.0-26.10-043000-0-rhel9.4-amd64
       | doca3.6.0-26.10-043000-0-rhel9.5-amd64
       | doca3.6.0-26.10-043000-0-rhel9.6-amd64
     - sha256:f387d32e4ea964b9ce467e6b4990f826a509c030a3f2f08528c913cb6deb9068
   * -
       | doca3.6.0-26.10-043000-0-rhel9.0-arm64
       | doca3.6.0-26.10-043000-0-rhel9.2-arm64
       | doca3.6.0-26.10-043000-0-rhel9.3-arm64
       | doca3.6.0-26.10-043000-0-rhel9.4-arm64
       | doca3.6.0-26.10-043000-0-rhel9.5-arm64
       | doca3.6.0-26.10-043000-0-rhel9.6-arm64
     - sha256:6f1b944c30e4dba81da4c98126381d1061fa583260bd2d832ab817651f0babc6
   * -
       | doca3.6.0-26.10-043000-0-rhel9.8-amd64
     - sha256:67bfeb27d9198ef70e3b53813f3317c284e38c68d649a88064082ba4f370d728
   * -
       | doca3.6.0-26.10-043000-0-rhel9.8-arm64
     - sha256:f287671d06339623bed0bc458b87ff63d5cb989321093d0e75f16f9d598ebeff

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-sles15.7-amd64
     - sha256:b260d1d062dfa9218ef6e9873dfa16221d9e96631d0f03ad332c514255b7c4fc
   * -
       | doca3.6.0-26.10-043000-0-sles15.7-arm64
     - sha256:cc5c640dd0581d8547b40e7c3783ff1107df1999a27184ee3a17688d35a46209


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
     - doca3.6.0-26.10-043000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-ubuntu24.04-amd64
     - sha256:e928546fd4fad2538852fd5f398577de587c78caa04da527a8b6ba16166ebf3f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-043000-0-rhel9.6-amd64
     - sha256:09acadf32a7fd749580df872816f00d01bed405b54ef221229ed983605204fd1