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
     - v26.7.0-rc.1
     - sha256:e5de653650d1b498a5e957db45c68ae2cbe489cdaf20d7ab5e8ce49384d7988c
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-rc.1
     - sha256:f23ae7023d4f558e9c9f99cc10813c2d39592a5aef02eb18bf26fd6f81107651
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-rc.1
     - sha256:50c9f41b6fba8457260ac37854a86c6f905dc9e7ad7b19d6a70b07578da95379
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-rc.1
     - sha256:6ce8f4128f5c3ac4be3ddfac9ab9896661ff3423b24280b6e4242abadf6c905b
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-rc.1
     - sha256:f517f66fd024b6d685b5156fb4042d5cc533dd6dfdcb5525d6aadc2039ad123f
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-rc.1
     - sha256:d21beefab87ff51a88543bc0133c7ea5609d3b52ce122e9d6b7a6ee04b05e1bf
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-rc.1
     - sha256:3d9f4f86a1f4d7bc85ed939be727ad0e354bff850f917d874d177caeb4f1b694
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-rc.1
     - sha256:a14ba41139c80fe25ed6ef9a69af83cfbf2a5f82fcd6330ad02516101807accc
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-rc.1
     - sha256:42d934999afb7bc185e3419b94c042b83a1abf43ce170c01edbc7c71be0bafae
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-rc.1
     - sha256:0919b7ea36d93e4dab06c5276b11e01e0df36ec2e040eeaa1961788ef0e09478
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-rc.1
     - sha256:e743f2d53c5fdfff3cc6da27db9651731fd0f59e7fcb06a2144a4990a2e4571a
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-rc.1
     - sha256:045d5c42ac5bd5a3bb9dc14144b805a47d2bd4341e0583f2684709aba8889481
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-rc.1
     - sha256:e6ab9618a944d86343454ef85720268bfafc39d271e1696724c7c2574740447d
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-rc.1
     - sha256:3f0fad7fe2872b660422f15ae60eef8e838bce9d2741dee102edcef4ca0234d1
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-rc.1
     - sha256:dbce7723e7188a56fecacd49cdad1bd0f33d29320cfd01bbdfa9ff4bedca1d84
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-rc.1
     - sha256:df39ccab5f84d52db128906b38580f9a4b07c385d83552a709cd69b481539c4d
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-rc.1
     - sha256:0e9d10bf07907373c1b410567563d9895e4d7147ddd83ed4eb78d5ab906f44d5
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-rc.1
     - sha256:e74d3bb3c61bee3aa382b60dcc48236c986943703eacdaf2418f0d22c0488a88
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-rc.1
     - sha256:345616b046a389e352e9c3731977c90afffb7d1940de12f1106f58f41df2e8df
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-rc.1
     - sha256:d0ad73ca054676b3cca3a75ba51890c4a3c282f1cdb056acd61c5575cd000a19
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-rc.1
     - sha256:6a3822f7c2d59418e12706a30c10736a9964888ce39ea48e490430d684a5c738
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-rc.1
     - sha256:9a32c82cfdcc80e2676e59e84405eefb83b6c1dbaad6e5188f18d9a50af016fb

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
     - doca3.5.0-26.07-0.5.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-5.15.0-186-generic-ubuntu22.04-amd64
     - sha256:467ea637565710d2e6ced4ac65dcfb5fb43c310e44ccbe495e11c0a5b3d0d420
   * -
       | doca3.5.0-26.07-0.5.1.0-0-5.15.0-186-generic-ubuntu22.04-arm64
     - sha256:7019a756471f29cf8be49693a1135a41b8861a9b6c9a9a40ce721b4a0142aa48
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1058-oracle-ubuntu22.04-amd64
     - sha256:e6a27a5ef0618a40f801c47a494ba4fc1d10654da3fc378e158407e772f7c3d2
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1058-oracle-ubuntu22.04-arm64
     - sha256:bfaf8a4a101bb5c40847920871cb50a92510d25effa683378571c9b122680549
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1059-nvidia-ubuntu22.04-amd64
     - sha256:c5a147f9ed78bcd5115fbaa97dd8662d490ed6323aa8d14e628c1c818bd29f50
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1059-nvidia-ubuntu22.04-arm64
     - sha256:92686fe99f363c3a76d6ae57fa286c490376ec00999edfbae5f8ef0963d08106
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1061-aws-ubuntu22.04-amd64
     - sha256:eac657fb2ec1aad52ad6aee43fe8b59636c17e663d215c02a677a84939e81a00
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1061-aws-ubuntu22.04-arm64
     - sha256:dd4bcea7b19d06c541d342418980b2473ff75757e27be8c88bdf74ddf41af135
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1063-azure-ubuntu22.04-amd64
     - sha256:28b1e2e3ded5e7cfcf078d759717fbab26f34554036092e9f6f258af8f087653
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-1063-azure-ubuntu22.04-arm64
     - sha256:3f0f898cf41d720ccc844587303fd8e12ce65039c0502c2659048d837cf2e9ae
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-136-generic-ubuntu24.04-amd64
     - sha256:d7846d2d855807388a63e937c519df6c8b3cd0e0fb7ca5b59e9acdbbfdc00090
   * -
       | doca3.5.0-26.07-0.5.1.0-0-6.8.0-136-generic-ubuntu24.04-arm64
     - sha256:61489701e95a8c268554cbccaa791152e065006421853344ff567e516b9de949
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:e6e5f78505aea96689887723fd6a10bb163b5f0af03d62b13529091b3a3520ab
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:ff8deb6d79e3d26fcde310609c0b75e457a87aaeba97b69d3eeaf5682ff5a3fa
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:ba8a854559ef6f01af23bd4b283426ddb0ed700b6a7175e808eb612224740f7c
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:42f47f393795dadc69aa8e5e44923afbbd28e5c43536fdc199aceafcdde3c8bd
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1009-aws-ubuntu24.04-amd64
     - sha256:c6c8732741ef7fa3d3ef961b46ff677c4fe944ba9e4e2af47978e192c6c26bc8
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1009-aws-ubuntu24.04-arm64
     - sha256:8c1280afdd614b2bb4d15cb9451c08fff22267b6010344fa6218e3fd283edaf9
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1015-nvidia-ubuntu24.04-amd64
     - sha256:38d0519dab1f37f118c00ccc521ec3eed84800427ace474c80fd23e69b5b7b0d
   * -
       | doca3.5.0-26.07-0.5.1.0-0-7.0.0-1015-nvidia-ubuntu24.04-arm64
     - sha256:9d66100f9db006a2952794f5b47f343af7f4a82337ef7a282163ff22bc72e2b0
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu22.04-amd64
     - sha256:85eca875bccb4e183550aa79f6773171294876ebbbe750e9491fea0014add933
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu22.04-arm64
     - sha256:83dd8f1e606c55ebcb31ca545f7863800237bae4b25dd1e168c631423552368a
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu24.04-amd64
     - sha256:a32e209446cc5c443d5dd50958ba33be393618758ac9a443e16fb561c27ef050
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu24.04-arm64
     - sha256:36ce810589f9a953c5c685480bb514b04593ed871e211b62eae14a47fd13c906
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu26.04-amd64
     - sha256:fc1d7574cd842c3619db2fdfbfe9c53c86c2d6fd3e5818018452b0ab1332389f
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu26.04-arm64
     - sha256:89c02a8963dbda67ff1a2a66e58a7989672ade00f9c37329572bb70f0c62e8ee

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.16-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.18-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.19-amd64
     - sha256:fad0a4590dea38202abdff5e63381f639ca8cdc9815bac57c47930a0fdca3247
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.16-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.18-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhcos4.19-arm64
     - sha256:dc48b6c458f7c71bb336e3254c4055f13261803e04f06a5737ccb61d3791bdbd

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel10.0-amd64
     - sha256:d18802d915570881bb4cdb4e5dbd177aa7569137c88a7e25a4b2425884504c59
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel10.0-arm64
     - sha256:e6852c8e27766a78f9fc8110ac9a8b72a0517615b14dea2a6c0522f0a435e6ba
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel10.2-amd64
     - sha256:aed916f68583e916b2f53fac632fdf7dd3f420ca81c5bd818c67f2501c080b6b
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel10.2-arm64
     - sha256:c4a97b64fbc49e96b6cac7523b56e281456f8861677ad2dacba79a22620a291f
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.10-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.6-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.8-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.9-amd64
     - sha256:dc67e64116d7d5f638c5e3e9040ac1cc672a3007bd6939b64435e5ef93bc1b19
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.10-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.6-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.8-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel8.9-arm64
     - sha256:ead834a62ead0527abe0ab0b17c8435b5d73459e7d7a25673343b80b52ec3428
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.0-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.2-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.3-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.5-amd64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.6-amd64
     - sha256:d4ce188a39f5e0bf17081b3d348652c008f6222459b5fef3160a1f142279af33
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.0-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.2-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.3-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.5-arm64
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.6-arm64
     - sha256:886e1a28b9dff739ced73637181cac612491dea5a83ae41e3671cc09eca7cdb3
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.8-amd64
     - sha256:18501736875bb46db04d302f0463b5d8539bedc61bea782046a82057c3f6bfbe
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.8-arm64
     - sha256:58eae9f43af4d4931e497d8b70aee91cfad4906e27e2beb5a98b49c450f59f23

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-sles15.7-amd64
     - sha256:8b045781309b3a1ed6b9de06536825019884e5d7372d920879da9355505b526e
   * -
       | doca3.5.0-26.07-0.5.1.0-0-sles15.7-arm64
     - sha256:f960cc635d73a5f8b1fa354aa38ce797bf5068cf4bf6aee08f2a8773f78177b4


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
     - doca3.5.0-26.07-0.5.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-ubuntu24.04-amd64
     - sha256:71fd53c4da798e57e13b3082a4538f91f5b988f648fe8619d069800988cd695c

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.5.1.0-0-rhel9.6-amd64
     - sha256:64f5f108fb4c3f469ebb15566d7c048036c30f2282ad70f74e9522ebd53d95b7