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
     - v26.7.1-rc.2
     - sha256:0ee7772815344f00d88914c54b3c196b0e118e7ba61bd0f30044658d6fbd323b
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.1-rc.2
     - sha256:62822c255c9bf78a8162cd9138f65b1dbefc3dc5079e9c7327cff89c0947a2ed
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.1-rc.2
     - sha256:e0539a002d8ec953afc71e728b5503d0df073e8eb9b9e7280e3024f437d2290b
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.1-rc.2
     - sha256:6e06f88f785180c060bdbfc6b31af26d833061c63eebaa7ee52ed7a81e8a6408
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.1-rc.2
     - sha256:3feb7092bb458eb2ac1f1ec4134c07d76b89043a961f1852b37e74998ce5392c
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.1-rc.2
     - sha256:fbf2dd66e03dd4365748c124163c3c995e4e1adde5e3f1cc015b252ff478b4f8
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.1-rc.2
     - sha256:450cea37f8ee64f55da5d64f8b1390bbfc4cecb7a52a0b5000733e424e80dc09
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.26.5-doca3.5.0-host
     - sha256:3ec2bb66428e5a6c7137ed9680c03dba03618b03521d92bdcbdb2d7e2e53e029
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.1-rc.2
     - sha256:2afa81a4f63d1f7e05759971503519ba2eeeb6ace0a63e735e021174ee2f6eea
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.1-rc.2
     - sha256:3f9ac6fd1417b38022a90bff2c28715f6a72a7a79effe88c68d4be36acbf9c90
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.1-rc.2
     - sha256:8faf0c8680cae82c2f5de1c315c9bd7a0e922c70922b7f4486a917d2fdfb2c0e
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.1-rc.2
     - sha256:f6b258d64861ffe1f919ab27c0a8721ffb54624d78644f4beaa48ebc601abd81
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.1-rc.2
     - sha256:82874a6408f29f17f062fb2e04e33f8fcb6d70e20f1379f907d3998668f857cc
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.1-rc.2
     - sha256:72e0ffb0402ee7c8b970f24811428ee435a8b83dcf433b4e3c572a17a7736838
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.1-rc.2
     - sha256:59d6495dc4f886accb2a4225f16e0298c94cbf155df2ca53b08e2fefd3e050f9
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.1-rc.2
     - sha256:f9db2ac6cdb6aa0bdbf413ff049d13eec94f9d58215a121fafb8372950bd78c7
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.1-rc.2
     - sha256:b7cf52f14dff3928a78e7bfc6bc5c2604a7f9ee000174c4b6c6c4d64e38a0081
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.1-rc.2
     - sha256:f6c94b4e1662d2639f486974d9fb4c6c65f9ba8e3e6e28c4019a1d1fc3cea5eb
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.1-rc.2
     - sha256:0969ff0b8862f194d4a77f66454eb436b4092d089ba25e16821963d08d2898b6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.1-rc.2
     - sha256:3e20f51335354c26f895f7b4c11e23261fd7074f8a325d172d117cd29ff240f6
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.1-rc.2
     - sha256:f7251b737fda6a422333ffdf1b0388e3ee41192b3fe22d6fb8ad393d2ab61290
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.1-rc.2
     - sha256:89c44548415526ea61a6ae13b07f63aa7df0aa95ee4756a691936dc5eeb3972a
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.1-rc.2
     - sha256:9e3cc64ec06d564ed3b007b73e7adb5d2f533537e3ec615f421b41d2de990f17

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
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:742454cfe4dd1625f30473b35a459e92c863534cb52af07bcef77460c5a2c3c5
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:8cd67089245f02f2919f96be14d3ab6f0e46bd7f7ae7c7b99fdb1bf22e636329
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1063-nvidia-ubuntu22.04-amd64
     - sha256:14e1f667568358c3f7956fdbf2ce259ce91c0f51bf8ed504446d92a6db34281c
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1063-nvidia-ubuntu22.04-arm64
     - sha256:32b9851c8da3e6995179d52129e2e9774137ca2e23364ad2439477112484d3db
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:7bc6004712be865a01c0118e5e71e30291ca58612712838b8ca3cf80aa46f9de
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:140c79fd0754143468b5a2bcfd6050c552264f3c6d3c579081f07953b49d760f
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:72351fae8d8bb8b5e84cb6c2813d5b48aa1ead2b2d00123a1287cfb8b81ed59a
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:687b2632412f8293c7efeb621308e46d54151c6d9c70b5c8a4b537418b96149d
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-146-generic-ubuntu24.04-amd64
     - sha256:19c9786257b27db72dc7768137e7c54c6d716ea9c5d3f2a33690b7aa738d4f73
   * -
       | doca3.5.0-26.07-0.7.7.0-1-6.8.0-146-generic-ubuntu24.04-arm64
     - sha256:307a293db2336c2d4261bdcc592cbca3fb5ae3d508bc8804aff2bb4bfeaba768
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:44e1044c3a12b55b1069aab1e2275a66c24be9f55b63490b972c06802bc3d56f
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:57c20e4b5ed00536e7ceaed09e3102b3eb5f111830626cf9174a05f39efca5c9
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:22fc0d7ba701f316712c0c8f736acb52355823bee217f479f1db935a9450ffe9
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:7dcd015686fbad3938ea800a9ea6b919e5f720de4a059567662e7c82c92d14ae
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:ed689f073b0a9a5376044738db1699105e3688cececbe17b15ec113621a059db
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:0a58552865d4fd6a94d38c6f9f1091cea849d727285ce35eeade74f51338fd9a
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:337ef9fb440e12c0113962584d0930a2daf1bec43d7c81c97ae741e5c8e69db0
   * -
       | doca3.5.0-26.07-0.7.7.0-1-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:5be524b3ee9a00c35d6fdb21c224bfb44b5acf78bcaa1e4723df395932cd36a0
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
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.16-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.19-amd64
     - sha256:308826e3af01eea6c42bc45ce99abdebd3559cee0bb4caed6457b31c339208c7
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.16-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.17-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.18-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhcos4.19-arm64
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
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.6-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.8-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.9-amd64
     - sha256:ca98318595c2ec01b5822e77a6faab5a20584f5987ac4ec636d07ad95d33a497
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.10-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.6-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.8-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel8.9-arm64
     - sha256:5f619078a7c67fca86591ec715ad423554fde90d0fdf65eed468d05c4ebe97f4
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.0-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.2-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.3-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.5-amd64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.6-amd64
     - sha256:9635aabe482997fc8cb9172edcae0c1c36446fcb75189bf1b829541c12990b13
   * -
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.0-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.2-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.3-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.4-arm64
       | doca3.5.0-26.07-0.7.7.0-1-rhel9.5-arm64
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
   * - nvcr.io/nvstaging/mellanox
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