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
     - v25.4.0-beta.3
     - sha256:30cf8975926940a6a813b48f9a1dd7322c5ddd87541024476aa0da0778c9bdde
   * - ghcr.io/mellanox
     - network-operator-init-container
     - v0.0.3
     - sha256:67e93ccf3ecb61f17597567faf0f72e1b8ddcf73c5d7440baeadcc1cb6bb811b
   * - ghcr.io/mellanox
     - k8s-rdma-shared-dev-plugin
     - v1.5.3
     - sha256:1eb5ab7f4b6f0cf89c954cf7ac8eb2e6fb2290a4f5f57417136a5302f20b12c8
   * - ghcr.io/mellanox
     - ib-kubernetes
     - v1.1.1
     - sha256:9774f774df6ede9ddf780b9193ca9d919618056e682d985e6b41e477b13c3432
   * - ghcr.io/mellanox
     - ipoib-cni
     - v1.2.2
     - sha256:513d88d639a01ef98b65365f711cee7fbaa166137a56245b7ab32818f745418e
   * - ghcr.io/mellanox
     - nvidia-k8s-ipam
     - v0.3.7
     - sha256:1b20b78f889339834ed74e0da621fc5da582719b2537b36d8967ddc6a04679b8
   * - ghcr.io/mellanox
     - nic-feature-discovery
     - v0.0.2
     - sha256:35b1820fe94a833a43613ef5c9db1f58b293ea0dbcf96ec0742b0987f23f133c
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.16.5-doca2.6.0-host
     - sha256:866971717cb2683f2742d265c9793f93242f55b6e8bd9a0a88a558869f9b9cd7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-25.4.0-beta.3
     - sha256:f68e5b3c9c3f1bb83714d1d5e98a355ca5f2cfd12bab833ec37f94f51a3b9e5b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-beta.3
     - sha256:86aef6b1a36f0c9231b10f71018f6e7ac35bbca4221b612b66f6eb0ee47cb534
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-beta.3
     - sha256:2d68cb4083c334107b2f47ae8a559bce76e13b5b6336232a03ab2fb709b10ad5
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-network-device-plugin
     - v3.9.0
     - sha256:cabce074d10a0f1d62135e2cc5442d65b49094b95b8297fdd024a1a5f461319f
   * - ghcr.io/k8snetworkplumbingwg
     - sriov-cni
     - v2.8.1
     - sha256:749822bef050882a8e7a466605f83b6a634e8e0e4200ceea182e890b4b3b37cd
   * - ghcr.io/k8snetworkplumbingwg
     - ib-sriov-cni
     - v1.2.1
     - sha256:2e2c1f86a401a260743cce60258f24cb50b91d8408c9900f9ad6c1aed6fcd05d
   * - ghcr.io/k8snetworkplumbingwg
     - plugins
     - v1.6.2-update.1
     - sha256:fd99966bdb5e7e7dc674aba612cecd224fffb8a4b37c0c384b7a60cb804023f4
   * - ghcr.io/k8snetworkplumbingwg
     - multus-cni
     - v4.1.0
     - sha256:aa59e65256324c83efb9eaebca9e78877b38c33ad30ff8df71e02610aa968fb7
   * - ghcr.io/k8snetworkplumbingwg
     - whereabouts
     - v0.7.0
     - sha256:2d2f73ee5af0e7fd79ea950c29ea562997584eb665ae73da2a96fbdbfb62b378
   * - ghcr.io/k8snetworkplumbingwg
     - ovs-cni-plugin
     - v0.37.0
     - sha256:d088e47f181007fe4823f0384ebae071950d105cd36c9187f9d06fd815288990
   * - ghcr.io/k8snetworkplumbingwg
     - rdma-cni
     - v1.3.0
     - sha256:2500b2795e9afb8e3bb4aa463182307c7b641f1ea511329bb0a88741e852b4b4
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v1.0.0
     - sha256:9930d7f2b5b0302b09776fbe875c60844507f9708c31d48dfe18c4325c9474c4
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v1.0.0
     - sha256:920ad0b70bdbe8b81c62feb39108bba1a1ab236be90c614b31886c7ce52177bf
   * - ghcr.io/mellanox
     - maintenance-operator
     - v0.2.1
     - sha256:cdd9ac1a953b8ad21e4ad9619aa977d52fe82f112167cb1c0bb589051936911a


============================
DOCA Driver Container Images
============================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvstaging/mellanox
     - doca-driver
     - 25.04-0.3.8.0-0


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.3.8.0-0-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:8b69ba3c7c07c95efe6275916e329b91882842f9c9648b86af6f2600b836a2f6
   * -
       | 25.04-0.3.8.0-0-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:51281878297a170e90b3fba48c73ca7115208a19a2be54548624ec2fcf33f008
   * -
       | 25.04-0.3.8.0-0-ubuntu22.04-amd64
     - sha256:900fdc031f43523fe42c24156ef553675a9861af27599df6901aa548daa4217b
   * -
       | 25.04-0.3.8.0-0-ubuntu22.04-arm64
     - sha256:9137056bf704ae4651f0081caf17cc95e503245295ea624d5af4e7ccfc18a973
   * -
       | 25.04-0.3.8.0-0-ubuntu24.04-amd64
     - sha256:6712f319b5fa771af45d0975f9cb8378551d257975d34fbe60a4a88c021bb437
   * -
       | 25.04-0.3.8.0-0-ubuntu24.04-arm64
     - sha256:fe49f65b6a538c9555576d8b2f4b13766a87318f95226c6eef639383a8f29915

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.3.8.0-0-rhcos4.13-amd64
       | 25.04-0.3.8.0-0-rhcos4.14-amd64
       | 25.04-0.3.8.0-0-rhcos4.15-amd64
       | 25.04-0.3.8.0-0-rhcos4.16-amd64
       | 25.04-0.3.8.0-0-rhcos4.17-amd64
       | 25.04-0.3.8.0-0-rhcos4.18-amd64
     - sha256:09e2615fc8beea388a005503f25217f90ebe36f15d2722934bc4fc9d3d626006
   * -
       | 25.04-0.3.8.0-0-rhcos4.13-arm64
       | 25.04-0.3.8.0-0-rhcos4.14-arm64
       | 25.04-0.3.8.0-0-rhcos4.15-arm64
       | 25.04-0.3.8.0-0-rhcos4.16-arm64
       | 25.04-0.3.8.0-0-rhcos4.17-arm64
       | 25.04-0.3.8.0-0-rhcos4.18-arm64
     - sha256:899dbd4405e102dcbe460fb90df9b0cc3b09211b2cb0e86ff31a91917ad8d4ae

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.3.8.0-0-rhel8.10-amd64
       | 25.04-0.3.8.0-0-rhel8.6-amd64
       | 25.04-0.3.8.0-0-rhel8.8-amd64
       | 25.04-0.3.8.0-0-rhel8.9-amd64
     - sha256:00d84e3c9afa3190147db08c7d5b8b79c49b1129cfe80fe3d81a890d20016a50
   * -
       | 25.04-0.3.8.0-0-rhel8.10-arm64
       | 25.04-0.3.8.0-0-rhel8.6-arm64
       | 25.04-0.3.8.0-0-rhel8.8-arm64
       | 25.04-0.3.8.0-0-rhel8.9-arm64
     - sha256:90ca17c6b8fcc7cd0beaf7c65af11861878fea2f864df52f66da6e8ae36ba150
   * -
       | 25.04-0.3.8.0-0-rhel9.0-amd64
       | 25.04-0.3.8.0-0-rhel9.2-amd64
       | 25.04-0.3.8.0-0-rhel9.3-amd64
       | 25.04-0.3.8.0-0-rhel9.4-amd64
       | 25.04-0.3.8.0-0-rhel9.5-amd64
     - sha256:98243a038f1f91ea1f884646e5efb06fdf9be9b3e40b22fcc30ae42dec5999f4
   * -
       | 25.04-0.3.8.0-0-rhel9.0-arm64
       | 25.04-0.3.8.0-0-rhel9.2-arm64
       | 25.04-0.3.8.0-0-rhel9.3-arm64
       | 25.04-0.3.8.0-0-rhel9.4-arm64
       | 25.04-0.3.8.0-0-rhel9.5-arm64
     - sha256:6c8e5beea0e8a422995bee863b491564a8b007efec8beb6529388f53c042b6df

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.3.8.0-0-sles15.6-amd64
     - sha256:fc3a2af36fe133f82c887da98f9d84a9377dcedf979c3fbd0d6519611b71873e
   * -
       | 25.04-0.3.8.0-0-sles15.6-arm64
     - sha256:191f4e3c61dbe721c96f4dfb638230542debd2ca7b878d473274bc975a7e2db7