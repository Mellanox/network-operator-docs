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
     - v26.4.0-beta.4
     - sha256:877a9679dfedf9a3555994f0eda8c3737c8941c234da81fdc701a5043abee312
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.4
     - sha256:a1ad93ba895b99da23cc02427dda4a13f431313d483de99161c475f56d254acc
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.4
     - sha256:b668d0b4665b974d2d5dbd718a0c3cbdb64a384043f0956f5cee436974623c56
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.4
     - sha256:20cd6123220b5b1048f2d2438fd8e9f603c6bd110a92fca1d9a73da83dd11e52
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.4
     - sha256:a7e97bbf4634f71e3276e215bbb46c670087c98d8ba88d8a0d371c1d1a7d4e32
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.4
     - sha256:4f24f9709499f748589eb8e0946c80c59ce14b555eb88061023ce38f26bdd6db
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.4
     - sha256:0b00534f85d7f4859096965a5bcacabe62c3222c642f6c06379b9d06e49c803b
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.4
     - sha256:c9759527939edbb18122d736d66fd0f485f255c2d9f96e8d4f4481eff50114cd
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.4
     - sha256:a710a8339946f5458c45aec5b154f1f4dc33b1c0d661a6a5b14b9d81fff52e16
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.4
     - sha256:9db6e7c80daaf2c4d02daeb1f77258dbeb1baa237efe897620d845e5a4d10015
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.4
     - sha256:112563e2fe2d0f2ff19e084debfa35d4acc72c5ecf344b1fd7f5b2d26be16193
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.4
     - sha256:d7a6e2dbf3d76ec333b874a729ade06bf755ca98b87ed5f5f9cf1378363e8ac4
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.4
     - sha256:a75292635e638fb61cf6e895ffa7c90ab357bd46204966a7650eab5b46c98ce3
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.4
     - sha256:fd535b5c1835a625225a5e84f99d631b01c922eebce47cd608c6c2db2ccbdf23
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.4
     - sha256:8a08c6ebbf91a841d91220f43fdbd7fceaf3371679ddc4d5bba68c6082300a47
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.4
     - sha256:5b3bd0d6be1d75d47722bf5402692436e718f68d18f6ec2043348b1865827b11
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.4
     - sha256:b59957a9061ad5f684616662a9769c625c6d0c22bdcfa7b8f0a38c7e3fcecfe6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.4
     - sha256:e4f44693d6c23f49feee4b845f6044452a7b431efc83acdf8eade7a9e5efa9b4
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.4
     - sha256:c7a56ead30648a1bd9a87643b3060d066a014844010dee2143555b57d3d29e18
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.4
     - sha256:ae8f4f3115f6a27bd03383a00f9f582d76a2447bbcd8b2a136cc3498b1f06385
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.4
     - sha256:4de3f3e5bc4533af8609745ec0dd0bcdb9860cc8806931c24b57ec421bf6cf36

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
     - doca3.4.0-26.04-0.4.2.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-ubuntu22.04-amd64
     - sha256:335d8ec00a8ccd6fad24d39bb1dc33df0e3fd8b8cea209a0bb4d173247b64d7d
   * -
       | doca3.4.0-26.04-0.4.2.0-0-ubuntu22.04-arm64
     - sha256:7c2694f3b66dc3bd6d768061f403bdfc9557a3aed0b8f32ea5b2788dadb6072c
   * -
       | doca3.4.0-26.04-0.4.2.0-0-ubuntu24.04-amd64
     - sha256:e47b32112ddfd543f49b9d3fb815ba72132afb9fd85761b50da318bc78657dd1
   * -
       | doca3.4.0-26.04-0.4.2.0-0-ubuntu24.04-arm64
     - sha256:6c848c6a5be317b438041c927458003ffad0d93d59c96ba182bf2001d59203a6

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.19-amd64
     - sha256:ab15d903f4a8fe88ab66eba7953562f9d182f8587dcb978fbeb42eb2a3da00f7
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhcos4.19-arm64
     - sha256:8aa2ff3b937704c3f4e7922bd2f5279e675868b0b48292d106e77b2b159e11ce

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel10.0-amd64
     - sha256:891088ebf4a0de578d1e209372840346e24b57df079afd120897f0e4eb09446f
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel10.0-arm64
     - sha256:d8f0e69338a65128ff84a6b88a86fb0291d615800488facfb194745a58f35771
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.9-amd64
     - sha256:bd1845c36c74284f49646a43473a7283274174c57a4d71e973fb8c4dab5a0753
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel8.9-arm64
     - sha256:f435b8ab0592c4a76762829018b9631fba222dce118b3b67779a64fc73b3a73f
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.6-amd64
     - sha256:fe09b135969f6dd7811917670e6e081d323ff78dc046f178cd05c58b612e969e
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.6-arm64
     - sha256:94634b88e3110e6c20a174b20b903d394db7268f95170bbd2a5b3c97e4adaac5

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-sles15.7-amd64
     - sha256:5d114189da3e6a2793b80a991070f1c66caf92d962a5cbf6eea9c2a741c486f5
   * -
       | doca3.4.0-26.04-0.4.2.0-0-sles15.7-arm64
     - sha256:965b8a8843040a533d51ca6b00b1e75dfd94d70ac34faf7c783ea2f85dbbbf03


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
     - doca3.4.0-26.04-0.4.2.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-ubuntu24.04-amd64
     - sha256:74a70f75a4b6d4189f432c29b59b6141396842a30929d55e2f725213e56e2c68

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.4.2.0-0-rhel9.6-amd64
     - sha256:d36b110c5572290071c66a50b471993bbd1f8e3a369eadb37c6bf9c792e42d91