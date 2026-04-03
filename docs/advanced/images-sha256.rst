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
     - v26.4.0-beta.2
     - sha256:dfc1953db56de3cbea44eaebbb76e09b8f7da9224fb59e1c3ce58552623e6c53
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.2
     - sha256:20e687b857e0df6bee05b34177cf832441444a600cb94c353625e5b2bac8a5e7
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.2
     - sha256:ea969e611a91d60e5c3d4ec83026fef4549faf01095cac64efe8200e5d9d480a
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.2
     - sha256:54465d7876e7f65493915c759a0ddc444b021ae4bbf007994fa518f1a44f298d
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.2
     - sha256:b1bd6a96d26e97c859de83c4ae39a9860761f245bbdaa76cfcf8edd2c06618f8
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.2
     - sha256:c963462b4b9ff7ace1968fb2e49edabc4a3d33d2a08de44eec8ba8e4316fe0d9
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.2
     - sha256:81f63467075c472fd3a8ef469c94f27f14da42e240bcbb41f21c35ce12bcce14
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.2
     - sha256:294720b859a46a9a9d7d860c257e31312887e48526f5f8fbf916eae8689f640c
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.2
     - sha256:d6951e2aa2742db45ccd46ee256f4e44473e673a69490a1f32520bf5d89a9638
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.2
     - sha256:d8e46d3e0d2c9cc8aa8991ec0fedc51d6200fea9b36480a844e2b2849b8e23b0
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.2
     - sha256:d45e63057d69ae916834e58d4fe7d092dc14dd1f7c089fde84797c785fb3182d
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.2
     - sha256:3b26227eba2fa9fd07df148f55b2de747b78476a80b38df1319efaa2c4275029
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.2
     - sha256:fcaffb4001ac46b14001ec7761500a8aaff981db7352e38d43c8402b58403e1c
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.2
     - sha256:21629f128af7b3e8097dcbf6c711f8ac7c3472dc457265e7ad89841edd3399cc
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.2
     - sha256:0f3132e6143acd344a979273bc4416e9c024134e08e501b67e36928e81b69967
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.2
     - sha256:5005616a9d7d60d3bff3de365a8a29f10cb588a198a978015d9955222d24090b
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.2
     - sha256:1d6b12f1a5954136ddf0811ae4fa20ccbf70e21f542e59beaf07d1bfd9fc19aa
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.2
     - sha256:14b5a27747123cba55859c1cf26176a2ea05f1d2583ef46932f0226de6e8b82e
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.2
     - sha256:38a129ff01a03ee8a18f3d92ddf0ae91990bb039b93f9b3fe27a868d3e61ddbc
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.2
     - sha256:d9d3a51bee6e0811312b08ad42c4f31dc0b4e408796bbeefefc54248716d9cb2
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.2
     - sha256:304eba88345885783d09ac992c5ff6e3a9fe4abbc518206a89c660fe01af038f

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