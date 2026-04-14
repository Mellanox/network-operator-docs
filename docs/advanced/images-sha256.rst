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
     - v26.4.0-beta.3
     - sha256:1f9ff88131e9f7ec0607df04c55d5544d9f1efa72184c6d9668191f6e689e4c1
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.3
     - sha256:8546fd3fa018a59a0f6da610e79e2fd163f34925905fe8fcd2c52281cbcafdf5
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.3
     - sha256:189c19d882a5b5332842b40f5c12ffe7756722538ade4c9c4957481e40be4f5a
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.3
     - sha256:21b0f3da16a1fde0c748b14b4319a0f8ce5ec3d194a4a97f48d65a00b31c8aec
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.3
     - sha256:7da6081cee66977f1165dbc0c6e25a4ae423771d50a5009cbaf9c30382c4add7
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.3
     - sha256:8d8f4df60cbc8c8fd34ca16af453c4c2a371f3f2dab6570713229d01cef73a20
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.3
     - sha256:5036e2150cc074f347da3004ec11f0cd62075d0bdd15060b58866db4d40788e2
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.3
     - sha256:8b441976871e73e16e47b16389d05af56d17679c6c5f52a25a215f9dd91f6a51
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.3
     - sha256:359c6c5479bcef3556a374e5281c0a8acc20498c8894e6d06a5dbe19e907ca21
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.3
     - sha256:08e53eb7679f4e758b85678a7eeed4744ed026c2ea1e92f5e09756889d82abc3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.3
     - sha256:d0913d3941c07fb98df5d08363346953da0efbd5a2c70491002e8ed3f3f3b7e5
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.3
     - sha256:fab78cfb3e9a2f1eadda3f6ec5a82ab67f592a8ac98b73ffe67c33b2278fe77f
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.3
     - sha256:3949482cdf2371bc5038541c850da039f5d76a853ab656e48d15f2415d6c139e
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.3
     - sha256:1b022edbcef855ddf824bfded45e71869800c1442f0c527a9cce898a0063c66c
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.3
     - sha256:80c3d1611d4761ea8142f9480ee21bab6af3326c6a03bf6bb6aa43656499b097
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.3
     - sha256:e19bebf3bbbfb7b3e747d5d22efe0f80c759df5ccf7436ca69abce663139e393
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.3
     - sha256:a06d92be3293729a7b90ec70926255a50664a49a83b5ec1a7126b7ebb0a51d70
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.3
     - sha256:26cba1bcb602dce528733366db2e8ea221ac7cc395e651be01525b00782dfbe7
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.3
     - sha256:ebe5a315193baf81a2e7febe84027a3d026857c027bfd147a8b026810c286076
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.3
     - sha256:c64ca9d6514dfe082246f3087cdfb5667917588429760fcad1cf8f62f96b64f0
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.3
     - sha256:f31f887cbe3efd7c9220aeed32cec332f4294a8677f6394c45fa5a89af5c2eb7

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
     - doca3.4.0-26.04-0.1.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-ubuntu22.04-amd64
     - sha256:541a8219674cca8747cf51b79e16cbcf6f6311f07a67569bc7f3a61b7e2fc5b8
   * -
       | doca3.4.0-26.04-0.1.1.0-0-ubuntu22.04-arm64
     - sha256:09a21489b85119d98a37bb4896c642f3e135c3e120365df183eec3364d87ac1b
   * -
       | doca3.4.0-26.04-0.1.1.0-0-ubuntu24.04-amd64
     - sha256:e63004536f9ab67ee083f056a09a53fb69f8dbdb941b58d5c8cc982fea792f8c
   * -
       | doca3.4.0-26.04-0.1.1.0-0-ubuntu24.04-arm64
     - sha256:d36f6e637c433d5edc20ad44b1d466ee3ec0f9f5162a409d084c8a88fe2bb7f9

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.19-amd64
     - sha256:2f2b23f312f896ac7f89ef496bb9905ceeb24e012549ec7af6a246578c5806ad
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhcos4.19-arm64
     - sha256:089e0260e148ebc9b315433e7bacee64f0527575da22618017aa4122e39346fc

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel10.0-amd64
     - sha256:77bd9b53203f3a1d8cf5f80ec9e684580d92fb0198dc37eea4b5f4fb7e7e8ddb
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel10.0-arm64
     - sha256:f2f23bb1395c589d725ecb1062585d09522ca5f1f57607c11340d8e24dbacf5f
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.9-amd64
     - sha256:f3e8a6c86c103aa023f86d5a2d885c0467ccb1188ebd21d0804959044bda819a
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel8.9-arm64
     - sha256:76130b4d862b9f609e33cd7383021217cf6eb08c7179b2df9b1d885706e370c0
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.6-amd64
     - sha256:9971e28c60c0b84df6c16a73a936b2502c4c9ed774be65e797784ba69b658c14
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.6-arm64
     - sha256:bd4edeeba6652ea31571d377225ecdacba457f5173bc4b98f55901f281c99efd

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-sles15.7-amd64
     - sha256:9ff141221c8d83a4a9ba3205f7be86ad43724f239ec2ec54e31cb36682a99c46
   * -
       | doca3.4.0-26.04-0.1.1.0-0-sles15.7-arm64
     - sha256:f337641ff82b061757f195afaa9a751850bb8bf6a1da0e8692c5dd79c00fda6d


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
     - doca3.4.0-26.04-0.1.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-ubuntu24.04-amd64
     - sha256:8f4a35982d170660333fd95afe0930545cc3cd67aa2ec1a47321ab8da1b2f978

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.1.1.0-0-rhel9.6-amd64
     - sha256:fded6a5c1d7a74fa3fbcae9f7c68a8fff0412611e688ac574fd36241bdc0be0d