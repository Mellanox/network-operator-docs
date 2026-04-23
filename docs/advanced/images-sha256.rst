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
     - v26.4.0-beta.5
     - sha256:2b09e00adbbe11183535fa7c246ca95ffc3dea8f4e423a07667eb04a47dc09f9
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.5
     - sha256:e74611fcfccdbb1bb4bf958bb9f8c9374410f51bab74d2ef673c94e97537a367
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.5
     - sha256:9b77d9044003d1562e06928d995ffd43f023dcf1926951d62760d42ea28bfcac
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.5
     - sha256:80126d31ad39342d82d94b6a7edd828c99acd93b7e84d832bc95a56c4f5e1f37
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.5
     - sha256:b8a3a737c5966b820582c8751ce9cf1a73a737d94a5ad431ead46535feed4511
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.5
     - sha256:a43385bf27c18e912588627cb4e184530b6ca94a4232c8d30da579d31e03c27e
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.5
     - sha256:583370edf4c061931fcab7d0162db5ebe686689c8538d63574843ad2064aea27
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.5
     - sha256:bd9ba4f200a454b9f6cafe8f7c74b59d156e3aee2263a5b991e00afc1b318d70
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.5
     - sha256:7e602a83164b40d9147938c0b372431b025e4a6cb844c48d981048dc0b957d2f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.5
     - sha256:e05210429ce9c69e0702218b027e90ac283f9b3215d20f1697b4657e70cfdd47
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.5
     - sha256:541af85314e6482278c349246012a7cd13e17770ad3e41b4f3c4727f9de11e8d
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.5
     - sha256:69994ad04a366e6c864d33dc9cd16f44d8dc8974f8bda2df77658fa872137b87
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.5
     - sha256:62371ab1a6e97dbde08f117f781ce9819b10b49996c4dce0607e61faa5d2baf0
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.5
     - sha256:78ff1fad75416b98deaed8f362cdf480932735e67f9acd32376ad19f43d85876
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.5
     - sha256:ac68a25eac6104bf9d9f1d3585d5e23ad717f1b166a87b6fc6636648b557cb01
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.5
     - sha256:16780dd89ff4d11db7f844dc7ef741a0ca86440ef3d5441a4dd27bc18cab8df9
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.5
     - sha256:5fccebc12674a63be7f21e16c71f2f558abf72ff07314665f9f0341c795ab29c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.5
     - sha256:c56b762602a0dc3306eba30cf207ab981ec37ee0408f11b5b958cb48cf003733
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.5
     - sha256:6f63fa21881c61d0d8161f19104d4329a53b0e54db4f49cac0a69e782f58bb8d
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.5
     - sha256:f2542b73927fce332f3837614d2236f1e3784995633da8f8c6150783babb11ce
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.5
     - sha256:45749b5b389446c71957ab99f1e21b1462120d4343c5891af2011010822f6f07

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