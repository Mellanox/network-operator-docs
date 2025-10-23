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
   * - nvcr.io/nvidia/cloud-native
     - network-operator
     - v25.7.0
     - sha256:51270965284cceeda659fb1098e70a888b39664ceade7e9d455fb95ac85914b7
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0
     - sha256:02ee60ac6ee163acc97706bd4229d268f608a95bcbcb6fccee90ceb1d8a6c62b
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0
     - sha256:a87096761d155eeb6f470e042d2d167bb466d57e63b4aba957f57d745e15a9b2
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0
     - sha256:1fa251979b5f5201af50bc7aa6936829103d742f42bfbf752f20852f5fe44dfb
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v25.7.0
     - sha256:7564ad1142c863e61f1dd84f5714deba9a7c6f6d85efb383ac3a2566eb4f4b71
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0
     - sha256:3f692273c1598525b9c698c9d9cd463e5ddc55b638c6c031639f38786fc67475
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0
     - sha256:1330e3a7ea2491bc310bfc4766769389ceb56d050831bf9c145b7bfb6aba36c4
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v25.7.0
     - sha256:b6debf7be894860a2daeaef1f9c320359a62b258b50fd2d2cf8cc9358b4992e9
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v25.7.0
     - sha256:be3d98dcf1eb302b09c3282a88ffa62dbb320151a5ef29b5793ebc77dc9c7eab
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v25.7.0
     - sha256:bb8a6c4d37d0c940aa645a753e6fb88cc1811e110986793c8b2924db3247a421
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0
     - sha256:7508a160f3f124e0b78d2b4d5a52deca6b9f56e226fee957c4d156e425eb101a
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v25.7.0
     - sha256:acae9a1623b1c837294eb0bf640031342d0093e4f2b0f741e9368198c0529e34
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0
     - sha256:681738005133e7816d012e8dd18b80bd0bf054a877ed545ccb7d77e4937ffef8
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v25.7.0
     - sha256:331009ceaed6c42c74e1fe8f0a22a8a4ee6b317875497e5141b74bc115e00279
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v25.7.0
     - sha256:83d21583ffe922d694af603743ab8b806c181ef33370da08fd3c40370fe164e8
   * - nvcr.io/nvidia/mellanox
     - whereabouts
     - network-operator-v25.7.0
     - sha256:5635df1f0cd35a1ee026093e763f469f58536aca48289b043c1381c6b9c0ea6b
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0
     - sha256:17affe6f977807e1388a5a395df5f1e030f7f049c77856c6685cde4e960704ac
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v25.7.0
     - sha256:875c9a8a32ba89d3cba429daae0df44ab7728b1eb67a5355c2a37707328a43a1
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v25.7.0
     - sha256:03f34f7fde3f65ca7b214b66c6fdbc1250d4f3863f9c02b0fba78e8aa84efca3
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v25.7.0
     - sha256:b78c15904cecd343fa48374757b3619b5cbdc22059d5ee9731da87e35b94a2e2
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v25.7.0
     - sha256:937dfd5f75eca2a2181734630e06d63a0357995d596b5b83c2258a7136cc6bdc
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0
     - sha256:dc785d2d517f9bc7d217afc5631684185854cae5651ffa891a2a50bf3f00460b

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
     - doca3.1.0-25.07-0.9.7.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:aa785718609c6e1840807d8394fb338d17475d7cf024012b6e5df6f492c922e2
   * -
       | doca3.1.0-25.07-0.9.7.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:d808e5e967fa146105e0d39852d68b1f03c203a839d7e7267100c02ed13c8e62
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1007-nvidia-ubuntu24.04-amd64
     - sha256:c9c649ea7b877d09b7f77e0d6911c52b488e424f96ad057ae3d93268d69a9f2f
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.14.0-1010-aws-ubuntu24.04-amd64
     - sha256:c09575a6f81026c18a455895331ff02c43e4153f1ef8e9d86e7e0e4b6cbd2436
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1030-oracle-ubuntu22.04-arm64
     - sha256:fc31c35db4bbe5ef110feb6ff106c3ebaa9dd4058dff1e9ecd4b3c37f9d674e0
   * -
       | doca3.1.0-25.07-0.9.7.0-0-6.8.0-1031-azure-ubuntu22.04-arm64
     - sha256:90ac83e68c433d8a19d92001b47bec8510f41729cc08b0087c4082c761ed903d

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.6-amd64
     - sha256:fd1c28e9dc6fa43380ad8d17cbfeab88a9ed37f64b8c4ea91a96057228beb435
   * -
       | doca3.1.0-25.07-0.9.7.0-0-rhel9.6-arm64
     - sha256:a14af8a1206b8718cb9e671748101f1c3124965800e780d8fc1c2d3da713a029

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest