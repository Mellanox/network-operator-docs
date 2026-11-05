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
     - v26.7.1
     - sha256:972fbdbad2d2b8bb1f9c332cf7c84222de722210531ead31971a30f370e422f0
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.7.1
     - sha256:5a881cf3ea2905b10b8b1bf232c3adacf02a441d35742ecc1cf1d60abec4b86b
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.1
     - sha256:842b3816c66623cef061daf9d904c411085c525898e8b95777e531d77b3a7b4e
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.7.1
     - sha256:e2169292307db5230acfd340e8944db534059c97299fbb0859f4e9debcb2e12a
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.7.1
     - sha256:fe3a0d5253e3c953fa627b5e585118ab2f649f0dbc5cae9eab13b80b7a78400c
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.1
     - sha256:f4012b9c5ee18603def8e842c58861b2524c8da5a946ec9c3e5957de7395a22c
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.1
     - sha256:52ff9b1923736f8765c5dc4630bd97f95845db452487943177af27dab387141c
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.26.5-doca3.5.0-host
     - sha256:3ec2bb66428e5a6c7137ed9680c03dba03618b03521d92bdcbdb2d7e2e53e029
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.7.1
     - sha256:c1f760cc35c7df9bcb4053a2630489ac32080e901ed065787d8d39715b006844
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.1
     - sha256:c5c474a34d198814438fe306a2f4082c730637cec3ac356b2e72c666489b1ee0
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.1
     - sha256:f7a351c7cbcd8757a95da3d3ec004c70bb30b971b020055b83693729f1d82823
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.1
     - sha256:600364b702a9a78f5830143cd39cf2c26cd56fc5d289d4030bcdc13f11a7c1b5
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.7.1
     - sha256:11850db67dce1625ee85b1d65490363706e1e4f01ac8b7c8f7c9a9a737a15d96
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.1
     - sha256:cc398523a95b4384431c1f6df732a8f95dfb46aea35790fc37fe904253943877
   * - nvcr.io/nvidia/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.1
     - sha256:f44ad6551c6e44e54d75c2e818a3b0b79fc86c01845ff9585618a6e286a60c1d
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.7.1
     - sha256:9758670f426e238805aba61a1c83a96ae10506dd973845b60477230672c06163
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.7.1
     - sha256:19279347b71a1077eaed8479f8fff491fd9a578bc0ff8efcf13ea08270574fd0
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.1
     - sha256:2531666db4d04dcd42eb57470382d6b3b5530667ba5892907e9d507a2c2a3223
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.7.1
     - sha256:7e5935818437bdeb3461f1c8a7107e2725dcba30a62e14bffcdaa4ea703d70f3
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.1
     - sha256:3f2d82afbe9e850ff0ace3d1ebff43cef70f83256a6c9632640c7c2f7e7840a8
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.1
     - sha256:908d278e140b1276b978acf26c3f8d4a1bbc22c7085cc86bda94644987d3d74b
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.7.1
     - sha256:5f80104997ff86c468c4265bb6499e843f084973c6395ffb40b68f0c6f45c5c6
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.1
     - sha256:ffde2c5c44e50218a7237cff96d53d3068d6ff5d4ec602653dcf6cae2e6d25da

=================================
DOCA-OFED Driver Container Images
=================================


.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
     - doca-driver
     - doca3.5.0-26.07-0.7.7.0-1


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu22.04-amd64
     - sha256:79aca7024df168e3b7e846cc5404d9d83dce92d4542e452951cbd6c47fa3b86c
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu22.04-arm64
     - sha256:85666ec7a9d60b371f1f6830b61cf82052305cd41e46d6c43b115a7609509175
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu24.04-amd64
     - sha256:423e43e617f673afa52a94bbec2a204b166a6ecac306f0b15c1b7441ef9b5bd6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu24.04-arm64
     - sha256:078eda21ec5d6883b4e11684872b2016da8afd3add683381600ccac6bb6300b7
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu26.04-amd64
     - sha256:8ef90df6673fc431431f83ccf22a15ee7af6eda317bd03cbb1bf24a97cc6cccd
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu26.04-arm64
     - sha256:1a04dff923a966d94c2de5ce1d894e5c8ed6839a4fdb3ce9e046182c60f46d1a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-amd64
     - sha256:308826e3af01eea6c42bc45ce99abdebd3559cee0bb4caed6457b31c339208c7
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-arm64
     - sha256:4e49fe49626daaf613d036c090bcb0cb5f46bfaff9be930b65854612ec7265cc

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.0-amd64
     - sha256:d9f9f2dfd935ad9190f2b60f370a3513598d8b5ba56d33fe24d1c2c8c6dba75a
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.0-arm64
     - sha256:3140a8517b2c9d8ea06f9e45664f2ba86484e55f4111a950cfffc0276ef32339
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.2-amd64
     - sha256:c6a37b347b470cb2eeb1e7c736a586fb8ef953eda8cf9b6cca6ceb9642a23de6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel10.2-arm64
     - sha256:23b2eaccf7060e0bbe31e9144c95210fff7e5ab2740bb2a88877fbd13686658f
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.10-amd64
     - sha256:ca98318595c2ec01b5822e77a6faab5a20584f5987ac4ec636d07ad95d33a497
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.10-arm64
     - sha256:5f619078a7c67fca86591ec715ad423554fde90d0fdf65eed468d05c4ebe97f4
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-amd64
     - sha256:9635aabe482997fc8cb9172edcae0c1c36446fcb75189bf1b829541c12990b13
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-arm64
     - sha256:6ff9c6d39bac92202ef44a9ee2d7a99ff354070482f05dfc26f48af1fcc3cc88
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.8-amd64
     - sha256:3598650ae89100f8f43713a906a50eb50375a776e06a19d71e214d6959b9dd3d
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.8-arm64
     - sha256:f50b90c9bc651ec9f9abc814b395ccec261a024f195efd476500229f423eeba3

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-sles15.7-amd64
     - sha256:707765c29ff83294d4b67c2f46bdcae0a1741588c95ce1f9063a7816d5c95bf6
   * -
       | doca3.5.0-26.07-0.7.7.0-1-sles15.7-arm64
     - sha256:c7587af27562a7afdde60f113bf6eb88f92ec3115c11ce4387d21c34620b32de


=====================================================
STIG FIPS Compliant DOCA-OFED Driver Container Images
=====================================================

.. list-table::
   :header-rows: 1

   * - Repository
     - Image Name
     - Version
   * - nvcr.io/nvidia/mellanox
     - doca-driver-stig-fips
     - doca3.5.0-26.07-0.7.7.0-1

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-ubuntu24.04-amd64
     - sha256:a3de74b0e4ed95cbac6cc8b731c36eb6056d15c722ee3c63a42b341ea42c6856

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-amd64
     - sha256:6184b978c7dc82e862323a5d42857e287d1cd538f69e5211afe1c7a292fbbddc