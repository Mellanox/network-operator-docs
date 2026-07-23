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
     - v26.7.0-beta.4
     - sha256:03026e2868bbd77d9ab3bf016e443c2286cfd10ad204946af5b2f1d29f70d70d
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-beta.4
     - sha256:1fde8855c0db3c51116ab87afb3efdbba4165cdef389ea0dad45a8b6166f5b0e
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-beta.4
     - sha256:c57eaf776d9ccef6bd47e8387111824e9336ab390b4bf899caf8ed7ff925fbae
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-beta.4
     - sha256:9c478e56abe55e9dca5ae216dea837634244394ad3f26808bdfcc93b2e22cf37
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-beta.4
     - sha256:7aefcb4bccf421ed1d4b3ffbbde6f2bb0b4e7c9d3fab1bee7b852b0972336b1c
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-beta.4
     - sha256:ace6693106ee0e0b0d4bce41b882ba27087bdf4daf565f292704b63c72054c45
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-beta.4
     - sha256:b75f82c47bfa1d7a197630384b21076409709480884c886f9139995e9a9f2a58
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-beta.4
     - sha256:38d34886977c2c2041ebccf8ef167b8dc198521d2c38358c26944a7858cec30d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-beta.4
     - sha256:8747d6f4e78813fb01659f73e925086c3cc84f05e18ded30c957d4fba0c04f15
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-beta.4
     - sha256:1837a193b353dbea11130f65de651a1fb0f55357b14516f2dc1b3b1b2c60f22f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-beta.4
     - sha256:97bbfc82a420ef1913ae13b0be25d435232bbacc39e67c85e5dfb2dbbf68d1b9
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-beta.4
     - sha256:b73da19951d75aec3535756d2010cffc066de23b681614b373c0409ae54784e3
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-beta.4
     - sha256:1e592b335da6320fc9b09ab8a58b880c763cacc3ad08d815764d79812c8d9ce8
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-beta.4
     - sha256:d3bc2a1db317039eb722a1e0770af682821c4014f0c01c01d55707e079a25019
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-beta.4
     - sha256:3bb90d2ed8639e58ca0950496a7a2cc92ba7df1408ad84c2f6214b530120be7e
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-beta.4
     - sha256:62900b89584395b424e8f329f62da1299d1e0349bd12825de6334b1d4f5f395a
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-beta.4
     - sha256:abdaf7f96e11bb7bba96f46f39eb02cf143148e63223ba26f5bc31d69b777aba
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-beta.4
     - sha256:40e0ea3cd9b111766b4ab4cbeaae3eb2baaad498aa1ff10581d509b962527e32
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-beta.4
     - sha256:eabe265c3f39896989493d3d8330e036f4e8f7f7c0be06d4f43e997297333807
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-beta.4
     - sha256:63e2d4beedb7ed5551cd83d1f0ad628e2e3aa324579211c0d716e103ce1ee8ff
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-beta.4
     - sha256:0d51f1695503882e1f615893eb006fd27370b0651eb53fda22f3ac883eed8c89
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-beta.4
     - sha256:c706f76fc0cbb8f5ad6a353d72c899fb0117544b8c213ae2a0f900f5f650d5ad

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
     - doca3.5.0-26.07-0.4.3.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-5.15.0-186-generic-ubuntu22.04-amd64
     - sha256:ba4fa160d59b3137ebed1b0e60a2f08a320affbc92b2daf88fc7539610c82171
   * -
       | doca3.5.0-26.07-0.4.3.0-0-5.15.0-186-generic-ubuntu22.04-arm64
     - sha256:9e713b4337d4616a1e92f35411c50e887ee1270ec51c301327141a304071847a
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:52bb7f50535d1f839bb2553aece77dae11f9829036e548169a506696491a3096
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:04053ad22121aac193f9779d44359aa1c4b1583be0fa71b1eaed297494a7f9ef
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1058-oracle-ubuntu22.04-amd64
     - sha256:f1d59ef599924f19f0caaba0d2d0abbaed365e411c576bff8393603ed0cfa587
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1058-oracle-ubuntu22.04-arm64
     - sha256:8ba954840310c0e51ed73d3f5e47db41007b70c6152841b5a7e194469b3e3c30
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1059-nvidia-ubuntu22.04-amd64
     - sha256:681288e992afd2d249e0736c4ca43f2fe9cba53cac8c3dc48830241112bc6548
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1059-nvidia-ubuntu22.04-arm64
     - sha256:dfc8a9cc08b1ce67d81704c69285547931dc306b0315f23fdbfcf6ddbea3549f
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:d725d5e40cb89bde2339d57597598661c2f69afa64ec7bb6120684b144af7f40
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:68ff3bd5744cda0441a705fe4f8611811585a51d56ed42d3e96c5b6d00fb7c88
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1062-azure-ubuntu22.04-amd64
     - sha256:d3c8c0b7549177d5f3eb9c43b6b5689498317b382aae422e6009eefb2ba2ed58
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-1062-azure-ubuntu22.04-arm64
     - sha256:fea6905cc1f65055078aada115c8aac507968a669bd14c49a686a938fbd37454
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-136-generic-ubuntu24.04-amd64
     - sha256:4d88f649c9b83b419917d21e487f6b5aef40dfb2796349eba5d21aac4b8e9174
   * -
       | doca3.5.0-26.07-0.4.3.0-0-6.8.0-136-generic-ubuntu24.04-arm64
     - sha256:f92b2b62ad248c9dd822fe4196bdb6023e6fafbaa1d9a7bfc0e3f4db3d33a9c2
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1007-aws-ubuntu24.04-amd64
     - sha256:a53d983bbca5957f77fed455f99f71d46422c3b4fd1c12c712e05d6268c9f196
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1007-aws-ubuntu24.04-arm64
     - sha256:2df546d0adfd02af89ad96bb09c141375e1941df6eb6c2cb0ff2fe6a3877808e
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:d5318766fcef8c71d8cdfde0cc10e33305775281ce47be3c4a18cd4ee4c1bfe0
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:ee13fb6386e02303cb6520594ba32dc22b0c26698190d3b0029596e8b5278058
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1013-nvidia-ubuntu24.04-amd64
     - sha256:aa79784cbff927c4782441f81d76c898325c69557e1c77073bab024bb0e5356c
   * -
       | doca3.5.0-26.07-0.4.3.0-0-7.0.0-1013-nvidia-ubuntu24.04-arm64
     - sha256:629261a968a8c6d6a60c730e82439c9d2428857d2f42a2a5697c54418a3fc8bc
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu22.04
     - sha256:f6ed42291635c9cbe25d8d2f4bcd4ab1b3e99a02377a33c0da87b951ba6cd2b3
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu22.04-amd64
     - sha256:4a876d26dfdb0a6cd01fa0d2533a77a50b52cf146522c3d9550fbaa9afab0668
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu22.04-arm64
     - sha256:27036a113ca5cfbbf6ba299cfdca123865bf21206c09be458ca31eb2b3300112
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu24.04
     - sha256:62920415c1c6beb3626b7664526729a886227859f9055a549f16cc25626d607b
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu24.04-amd64
     - sha256:895e6b5cde86043562fe628bb8bfc0e59b57b930746408b5532cb1fe9bab1bd9
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu24.04-arm64
     - sha256:36af55dd8c384d15b8da488c1f6a4da294ec3a80bc597313ba575e64bf8a1e9f
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu26.04-amd64
     - sha256:1fcf32d3746b9ef9d79e8346f32d457739d7641314f2f0b4d95bb1cfd4c94f6e
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu26.04-arm64
     - sha256:99d18f0e273d168468449b95b5f800364cff3209d2ca915e67180c5f75c28ba0

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.16-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.18-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.19-amd64
     - sha256:9fd7593d8d85f5ec504daddcf6abc1691bd4bc0da3ffcb798d411a2bbcc7042e
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.16-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.18-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhcos4.19-arm64
     - sha256:b47f42f4113e75eaac64220a3081787b70d01791d920a9b6d13f63f2c0ef218f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel10.0-amd64
     - sha256:b08572ac585ec4481e87f9c63be3190b3f1e66a0289b78470c166ff70e1aef3a
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel10.0-arm64
     - sha256:000fa1190de4c3a2b89dbe6182551641cb803e82fa745827129caf7228f04520
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel10.2-amd64
     - sha256:f782128b2f86a9971ca8582d40ecad98007ccba544fbd95e644a78ee52b8b218
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel10.2-arm64
     - sha256:d4129b7393791d6909f1f8b3ce5461e2332017808762b6bc2322bfb0b8ed4f95
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.10-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.6-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.8-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.9-amd64
     - sha256:b958fe7cc37b1362772df8d3c111b4dc2f06fcc1d2d3badd92b5a8ff482dba1a
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.10-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.6-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.8-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel8.9-arm64
     - sha256:6ca1a1152d300dcfef1fa8180aacc58df4b01e1e8156a344f383dd902c242f12
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.0-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.2-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.3-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.5-amd64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.6-amd64
     - sha256:7a8a08eee52a55d3f7ca5cd9f57224308abe180322e2229759225a159c862fd5
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.0-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.2-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.3-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.5-arm64
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.6-arm64
     - sha256:d3506c95429201e0070ee924d8d1a35c178a8f1034b41d8eb43f03ab13e36bfb
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.8-amd64
     - sha256:f2b6980eae1639b0a0821786637ee66d53ee6ce75cdb64dd2b71f86954ec3dbe
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.8-arm64
     - sha256:4d131ce752c643f8bf22979942839837490e6da264bc359cdc5d4cb9b3242c01

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-sles15.7-amd64
     - sha256:91f7789fecbf80b4916ec33872d243c1cda5c031199b339594310e28971105d3
   * -
       | doca3.5.0-26.07-0.4.3.0-0-sles15.7-arm64
     - sha256:813e5a3a43424a4947496097de8ba809cd37ea0693a13e636d26eb49b982aad5


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
     - doca3.5.0-26.07-0.4.3.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-ubuntu24.04-amd64
     - sha256:b853096437d9c078170f4d6d0d19b192d4645a75d0835f05bd580fcbc8dfd4cc

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.3.0-0-rhel9.6-amd64
     - sha256:d1f3431dceaa0b02d7ecf84280558db78a18be4f5c6a569b8a01848571ee8eae