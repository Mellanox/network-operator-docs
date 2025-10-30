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
     - v25.10.0-beta.4
     - sha256:d4fa79e6398edf027ea90a7902a955c07836ba6491aa9eed8b146f8683c7e175
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.10.0-beta.4
     - sha256:a36fd21880bed0d3ded5fb7b5e32277a998665e676a666daa73bcdf87809601d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:6d26c1daef6a9d7afae22c22388f33603432c942373c68e616ceb30b108eecc0
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.10.0-beta.4
     - sha256:5817a72db58c306494c594e52cf78a46ca95c47ae5cef80e365e9f21672af678
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.10.0-beta.4
     - sha256:5477d5f823407c3d66354f682f9d71e581fbdeb985c740324632cc9503ff5374
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.10.0-beta.4
     - sha256:04ad1bf506d5e6ee2cfe2e88f91a05956156d9f07adeb3ec26b841d2ba4485f1
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.10.0-beta.4
     - sha256:a0ac64e9d7fe45080c82500d6e8c40452557c266f61287c0c390c9707c160401
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.22.5-doca3.1.0-host
     - sha256:f0d3c4a00616343e74e465e259a7475d69920a8dbff530117253cb1939e366f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v25.10.0-beta.4
     - sha256:95fbaac387521bdca0911da2afc27aac9ed7f2ac173310d87906136318590792
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.10.0-beta.4
     - sha256:08186e48d2d93bba9647f7a347923b04ed9ede676eec17d89d6b0ff49f174f3a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.10.0-beta.4
     - sha256:71aa8587b4cc2c9a0513e30f1c0402146d3d759e5b86601972b0d7e4e1e7b3bd
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:624da410d4f6dcced81dfb1b829ddb90ea9d8b026f85c6fe27b6428009614bf4
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.10.0-beta.4
     - sha256:226ca09063df7cebcdaef124a11087e8c67220a2a8ead0ec3a64d71e8e848fc8
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.10.0-beta.4
     - sha256:00e31fcc5d658e3e625f6518b4e89f99f303d7c2bc8b1f2da9c7430b52fcd4e4
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.10.0-beta.4
     - sha256:d4fd534e168f7944a89e3de515f37778dde8297e4f12c27ea2eea03680e8e228
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.10.0-beta.4
     - sha256:2617fe70f702ce593c264473ddd0350f1974d7414b4f396acc8c9c32537396ef
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.10.0-beta.4
     - sha256:06848e09b1ac57caa59fa6cdd0ef74e6d4cb38bc5c478796b21715b33d2acf03
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.10.0-beta.4
     - sha256:a6f17efe0f341b3ce487ac3c8d603c9c7f329a6ec0befa8041b9c3768b280162
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v25.10.0-beta.4
     - sha256:dd2445e7a9ef0f82be3300067852549f8738acc6b2fabf22ba1d484a635ca327
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.10.0-beta.4
     - sha256:b8c89e2ec0c678e5d735177dcd4ac5c0d3f538cc9f9eb62a642700e153d69302
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.10.0-beta.4
     - sha256:d19c714b1002e799e4d027668044d2bfbc01140ee93d650908e644892fe4fb82
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.10.0-beta.4
     - sha256:8946b5823efcd74e85826acb0a79c5af7ad6f1e81954a642ebf6d5f09136c7b7

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
     - doca3.2.0-25.10-1.1.2.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.2.0-0-5.15.0-160-generic-ubuntu22.04-amd64
     - sha256:ea835c03c4f5c8393c9e64ca0e9339ae4cc7a276b4d201d68b9e0110e289f251
   * -
       | doca3.2.0-25.10-1.1.2.0-0-5.15.0-160-generic-ubuntu22.04-arm64
     - sha256:5a4bdb4aea3751125941e512902af8a9c832bd73573ac56ba150206eb0cfc876
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1011-nvidia-ubuntu24.04-amd64
     - sha256:6950a9008702528abcd54618217071f0f6c1623547ff0c973135ff251c7b4cf1
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1011-nvidia-ubuntu24.04-arm64
     - sha256:991bc6029d8edaca83c31a7dfc2e2cf827a66548fd244249c635c4c4ded2910b
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1015-aws-ubuntu24.04-amd64
     - sha256:28f5d945fbd650785d7dd00ef2c464a00b2811c82bfff89d076a4a0459daaebe
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1015-aws-ubuntu24.04-arm64
     - sha256:d93543c724c2321d43d3440c46dbb2a18483e016c863af411f16d6ad11cbfedd
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1015-oracle-ubuntu24.04-amd64
     - sha256:5a5892515d33cff5bf3535c5db9b6e8262c4d5c8660463544a677c9953e374a7
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.14.0-1015-oracle-ubuntu24.04-arm64
     - sha256:670d97b3bffd9f965d22452b6b3c64c00098e40c38172f50f284799ec382f8b1
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1038-oracle-ubuntu22.04-amd64
     - sha256:9124d431e15ca6aab253b19259c5a45d65f5de52379d1bd826a03e4bbe3dafe5
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1038-oracle-ubuntu22.04-arm64
     - sha256:42f61edfd3846094a81e1d4afbeaf2e70809cb3470e8a34bdd8c84ab3e40ba19
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1040-aws-ubuntu22.04-amd64
     - sha256:02ab19947e66f43644ea4379bfb00f8b85d924f810a560f4df7c77d86df8bcc5
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1040-aws-ubuntu22.04-arm64
     - sha256:697e9f843c39e8077e8899089e11238d2233eeae1b11a5f1ee639ad249e1dfad
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1041-azure-ubuntu22.04-amd64
     - sha256:8154439a957211309f7ec19eee8730b47f9d73f4ff4d06aba4bdf29debdc3fe3
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1041-azure-ubuntu22.04-arm64
     - sha256:72d62aba6bfe4b2a13ef26e40d98aecf2986aea313160e927c8ee6c748cad9a7
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1041-nvidia-ubuntu22.04-amd64
     - sha256:ff6174c934af24bb32e5064e7429cf58a5c8901bca9cfe520a7d0c905c73b987
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-1041-nvidia-ubuntu22.04-arm64
     - sha256:06c676b5d5be4a0222e9c033bfc41373573d1c14e7cf3eb82dc8bfd6bda8499d
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-86-generic-ubuntu24.04-amd64
     - sha256:60603042dcc5b7dbba6b8133c87b6f3285202a125c15acdbbc8041c15ab74e84
   * -
       | doca3.2.0-25.10-1.1.2.0-0-6.8.0-86-generic-ubuntu24.04-arm64
     - sha256:7f0ceaf52876d75e52faf8f3ff3d3a311ce404fc2f4373c2c0567d413dcf25ec
   * -
       | doca3.2.0-25.10-1.1.2.0-0-ubuntu22.04-amd64
     - sha256:42b4fbd29bb6b98b41fa6fadc4047f91cca98e99717b029fc8b6d28df433e25f
   * -
       | doca3.2.0-25.10-1.1.2.0-0-ubuntu22.04-arm64
     - sha256:3333862aa22ba1af49b52c0cf4ad66c03a4c4dbccaa63d3964a2edc92bfd3bc5
   * -
       | doca3.2.0-25.10-1.1.2.0-0-ubuntu24.04-amd64
     - sha256:1da985fc0b6ff3a479fdc7d4e92c7b14233f92e9d644866da88134a1ae5b96fa
   * -
       | doca3.2.0-25.10-1.1.2.0-0-ubuntu24.04-arm64
     - sha256:ebf609dcc7656ac01de557e1fa8b027f644329740210900cb8831d503c86375c

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.16-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.17-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.18-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.19-amd64
     - sha256:59929f71ddd715f234feec8002dc2379917399986382bd388859b4feac08abbb
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.16-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.17-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.18-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhcos4.19-arm64
     - sha256:2bd9b14642239d37b715dd3ac604de681ad03d81e509195246ee25f5d1b1ea47

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel10.0-amd64
     - sha256:e506342d36013c9e041acd535455ab99b0cbb3652d9e828dac4904c47e9749d6
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel10.0-arm64
     - sha256:d66629fda2412f1ef73dac47a03edeaaa8a2bd13635a4804d844d36fd52ec68a
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.10-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.6-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.8-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.9-amd64
     - sha256:29de09d93292249ee421636eddb214faa38bda8f15a946f69ce764ed142ac0c4
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.10-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.6-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.8-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel8.9-arm64
     - sha256:ee185ec518139d738617f6959a63f446012456321dd7bae64e3112eda1742570
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.0-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.2-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.3-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.4-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.5-amd64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.6-amd64
     - sha256:028ba3c451bdaf87d14aabb775d08b346a86ff9366196e88d2085846c4d7ded3
   * -
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.0-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.2-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.3-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.4-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.5-arm64
       | doca3.2.0-25.10-1.1.2.0-0-rhel9.6-arm64
     - sha256:1849d79b36df71b3676db802b997e17bd0895a6b0dbab4fc41bb80e932cdfd05

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.2.0-0-sles15.7-amd64
     - sha256:fc65ba808f9c2c59dcdd71b17e4bbf7e54897e805e7b841031b73371e3c0c3de
   * -
       | doca3.2.0-25.10-1.1.2.0-0-sles15.7-arm64
     - sha256:c5059ba0b1e326495597c4eb87916fae772c0becb1b9fd77951436f5e0fcb6f6


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
     - doca3.2.0-25.10-1.1.2.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.2.0-25.10-1.1.2.0-0-ubuntu24.04-amd64
     - sha256:55f711787e4bc3381f6b76097d13b030b52f055afb06080334d2ea6b32aab71e