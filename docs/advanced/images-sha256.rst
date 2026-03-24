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
     - v26.4.0-beta.1
     - sha256:78ed9391f867cb991f9791e301d1cdc0ef4cf3ab3a5623e5007d33d12ca0603b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.1
     - sha256:7fa805195af948bd105b6cff08cfd4fb68ecb3d42d91beb48c754c40a16e6a63
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.1
     - sha256:a23d66adeb668cdbd90bda6e16175f4c8649459f6bff37f0dcc1e5c27d678c92
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.1
     - sha256:2e2d46823fe74a65a195cb699bd701d713a763a39b53f1be1c41bef17f375c49
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.1
     - sha256:b0722a93a4c3450b9e26556aa76317982ec4ac7f5ae0aaf81ce2f5f51e3683b5
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.1
     - sha256:1f2ebc7be14c05bc3118e7703119aa1656d7baddd64a26b67d08cf075ed8b109
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.1
     - sha256:899a06f105b7160a30786f87ecc47e85cfb437f5c416d6fc89c29f1742be946a
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.1
     - sha256:891040cc8bbd770d58c03165ef3d59353edf91f2bf02f3d872e50783de7c1db6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.1
     - sha256:fe070ef657e3b6122c5587a3b3c681a07367c0f63e3d57d9c6744a6d35335317
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.1
     - sha256:0e11b051d34fde44f0c3d7bf60ddbae4bb1d2c7a70ce12bf1eae1c47874f0e4c
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.1
     - sha256:cd076a71f3a497a8fa8374aaafbd0ea05239dff38b3823c41abeb5cc76226392
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.1
     - sha256:a981504226e9b5cf0260128fe0764458f533602187d4e1d2b9ca8387910a60a8
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.1
     - sha256:dd8cd63c0bc7941ea7be5339ed72b63f0a49c0b8f96f7bfa9b2d36a8c4f610a0
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.1
     - sha256:d18a9a71a9b1b6f5d44f5349a480a5f1b2ab05304714980154178cd87a25af19
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.1
     - sha256:4a28536c1ed8baa56d7fca743ff0d6f460de97431860a42ecb67e518c73d755e
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.1
     - sha256:b5f6b72d5d6f727d8cac9a300208c36823034b255813d245097b25d33dff2106
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.1
     - sha256:6df7c20b75539da5de8d970a865d2a8669b402e2dd2578a1e78d3da640aac7c4
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.1
     - sha256:2619350c9cb0c5ca1c04abe00f308a0ffe7b61edf4725cd28283b097d1bee467
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.1
     - sha256:0f8041377a99edaa6cfcd3dac56322cd251dc9f72c75271f668f826d80856dd5
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.1
     - sha256:8bb663f68babbaee55e002881ded82dcbc3d0ed527eaa303af2463b124c840c4
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.1
     - sha256:4a9e1c471afff5479d5f93c88cd549576c7ffb9e9478822e6edbf7bcc1dc70a2

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