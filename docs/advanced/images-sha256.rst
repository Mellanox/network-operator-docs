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
     - v26.10.0
     - sha256:9ab1ec42326587241b45f08d452dc44224c0bc5bdb881210b6fca06d12b682bf
   * - nvcr.io/nvidia/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0
     - sha256:29b373af1654cfff9f9024dc5cd7191f9db9af1f4e25290c14b927ed91360d88
   * - nvcr.io/nvidia/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0
     - sha256:840decfffc9948c5ee2c8596fde23a1f241eb7e679a9cc9ded97fc81165d614b
   * - nvcr.io/nvidia/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0
     - sha256:6c24340d8b7ceee38b3f63e31ef1329d4c868954f67100f8b4cb10fb292e02b0
   * - nvcr.io/nvidia/mellanox
     - ipoib-cni
     - network-operator-v26.10.0
     - sha256:b24be84e0451ec10c4b762bd844086c2d00ca42bc48e779686849990eaca86ee
   * - nvcr.io/nvidia/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0
     - sha256:f2f35a3576a03ef1f05a589185f8150f49ca0d60019917ad8a2a8749688c1b32
   * - nvcr.io/nvidia/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0
     - sha256:ce58e5b4e9b52d827f44cdabd2d7bcbbbc98caefcac91f5fc1a9641c8a39d040
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0
     - sha256:679e89586b0ecff3149847da6fa4fc6507d02031ab320ce96381cc100c361748
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0
     - sha256:3323f4a32a0ed05d3641ce36ab63ce070373cafd3786935579b81dc7027455dc
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0
     - sha256:77589f26837c6a3fa05a6d302d78ae5525c1729f3a1ca3543a76f4efd536e30e
   * - nvcr.io/nvidia/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0
     - sha256:fd5e1f182aec6a4e5d3f016343fc8425c58b4053c5b1cffc71d7dd366b22b2e7
   * - nvcr.io/nvidia/mellanox
     - sriov-cni
     - network-operator-v26.10.0
     - sha256:31613738932ad9b260ecde64bd81771743ca32f28e81045ccd078ed55422638f
   * - nvcr.io/nvidia/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0
     - sha256:3df1aca6351b02aade691d8f8c1246aa42d24ca450200e027a862f4f41438533
   * - nvcr.io/nvidia/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0
     - sha256:a3ecc7111cb979ee96e8465b5d7d31a45f3bc545a059214261fd933ba6ac68ae
   * - nvcr.io/nvidia/mellanox
     - plugins
     - network-operator-v26.10.0
     - sha256:75408477333bb2aed761dafb521f34c91f734f969384882bb385ab1c892ccbdf
   * - nvcr.io/nvidia/mellanox
     - multus-cni
     - network-operator-v26.10.0
     - sha256:f4539e04013284b4c37021766852a8702190ac4b7d4e100dd15a5da883a43ec8
   * - nvcr.io/nvidia/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0
     - sha256:5d18a6696a76064bb01cb0f54dc34fdf5effe9e265adf2c2ec345ac821a069a9
   * - nvcr.io/nvidia/mellanox
     - rdma-cni
     - network-operator-v26.10.0
     - sha256:96b5a35413f5171d01194591fd03c05699feaaf81206a54e19b77e34449d6e3c
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0
     - sha256:50e3114bc7ead03c62ba8924fc274592243bb7fd6c994406db5a53c07fdbb13d
   * - nvcr.io/nvidia/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0
     - sha256:77437fd7b9b6737b811d639266d77e46b50527fda192c6dd0d639fe0cb0468a4
   * - nvcr.io/nvidia/mellanox
     - maintenance-operator
     - network-operator-v26.10.0
     - sha256:d7f09dcaf5ce34fe6ecaa4312e9146e38a3c8805a50f8d435d470e8aba2835f1
   * - nvcr.io/nvidia/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0
     - sha256:19e113821ed07e6fb0ba8fd34559d4e47aad1ad758e10ea4d9fdbe2dcfff8db0

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
     - doca3.6.0-26.10-070000-1


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-5.15.0-203-generic-ubuntu22.04-arm64
     - sha256:321f8e8bcb7565f69ca416f1c597f3c92d740db9f86360843f65bab755ad4e92
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:d32d16489a4802e025c56a14fdbb776b79eafe5cf15800aea8a769c2f3e15ce5
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:18b71804b29d00eae36335beaf91000bb8038f83a144e357e2a97725bed2ad79
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1067-oracle-ubuntu22.04-amd64
     - sha256:8e2419bca90ff5991d318506383ac9e6bec07700c3c3d2a2dd49a84057880e43
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1067-oracle-ubuntu22.04-arm64
     - sha256:01dae018ee394f96b7eb930962dad613ae1bd4958deb028a2f6fd30492e4b7e2
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1069-aws-ubuntu22.04-amd64
     - sha256:705dd18aec69a45c71e9e4c48e1bc668c1db041864c0153059ea386ae16b9e87
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1069-aws-ubuntu22.04-arm64
     - sha256:5fb6c2d1b2336b80a931eda6dba657b75191f6a654a1be81daedff77b03a7326
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1073-azure-ubuntu22.04-amd64
     - sha256:52b0d8c78bb5fe2600b99fbd22109cd0195dddf09ace5e4e7716a3536135143a
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-1073-azure-ubuntu22.04-arm64
     - sha256:894fda25500f8c14c0b21aed077a0dbc4f2a3af73602a4aa0efc336893bf4936
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-149-generic-ubuntu24.04-amd64
     - sha256:fc115610f1e3738c7788111ec60c96623965b88064f0b4a7752421ce8dfc0ea3
   * -
       | doca3.6.0-26.10-070000-1-6.8.0-149-generic-ubuntu24.04-arm64
     - sha256:09a4c2e3ff779b7f85e0def7f664e94df3f4b3666fd55b8e16ecdc991166bbe6
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1016-oracle-ubuntu24.04-amd64
     - sha256:8d4e4ac0e0edf7a9cad3f8783921291dcc02c87a6d901dc63285f5a4acdde8ef
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1016-oracle-ubuntu24.04-arm64
     - sha256:cedab4fbde55acab0eb1c964e872e5c8754f077e96a3ff5a6b009a04b9c55857
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1016-oracle-ubuntu26.04-amd64
     - sha256:35528fcc59a6a4e85ca6a9f553e9c4903e8e07e5eb8cce63e533fb2b0a3465dd
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1016-oracle-ubuntu26.04-arm64
     - sha256:42ce718d9d035c74c0b7859ca6e758f704f53b2f0cf13af8d94d4e3f8776f23d
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-aws-ubuntu24.04-amd64
     - sha256:2c55daa18c311dbaba5a0e2742d78c3338f92adb67e2f2ec4fda77ccdae49b92
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-aws-ubuntu24.04-arm64
     - sha256:e0bc239da985f94a0c275c6d6a780f2fb01ca217edf56fb0bc893de325d57a3d
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-aws-ubuntu26.04-amd64
     - sha256:63182acf06fcd2408909ffd44e8855f8137b349bf2f750cb8b0a73d677248acc
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-aws-ubuntu26.04-arm64
     - sha256:f933820194bed569d0689c5b5147a3a27577986194dee468f903182ff6bf0fe8
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:95f927e4a7df38f7d2c829f8a6b700f1a3d6b24e9f8faa0050df219cbf424a37
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:5179bbfc47bc5571f4902ffbf595f1f34e6a40e43cd079ed5dc1c536a0c64409
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1020-azure-ubuntu26.04-amd64
     - sha256:31baf82c0e41592cd4e9c0c2c6f26a5081cdfdf642940984788eea1720df3940
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1020-azure-ubuntu26.04-arm64
     - sha256:6b4a7ef3c7fee8b7e82ebabf092ee254eb974aa414697873ab3be3dd4814c451
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1025-nvidia-ubuntu24.04-amd64
     - sha256:45a791572418c52b6afb9c1a40d55cc3e5b59bbd9d1aae6f1b3e91b2b5374473
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1025-nvidia-ubuntu24.04-arm64
     - sha256:6d7402b2a2d621d102a568889d5f5f1c55a0ec87c60acff0dddc2179fe715244
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1025-nvidia-ubuntu26.04-amd64
     - sha256:60668089261217ba4dfe0c9baa05f5ce8b5e5b1d204a99a24b34665f7aa479ae
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-1025-nvidia-ubuntu26.04-arm64
     - sha256:d99cbd39de6ea165c40ff86665a41c621296a10785e33831961e4f03b8cedddd
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-43-generic-ubuntu26.04-amd64
     - sha256:9f74a84a00120b7717f87cd303afb626e41e581ad51aac5ca9fc7f9792d85da8
   * -
       | doca3.6.0-26.10-070000-1-7.0.0-43-generic-ubuntu26.04-arm64
     - sha256:bc668f118f25ef368e168c250f7db48cd958b3e56178aa06024f53ee83a68c60
   * -
       | doca3.6.0-26.10-070000-1-ubuntu22.04-amd64
     - sha256:666d3fb0d409a185c08c2e8dd2e03e27366f8c6f4ab642d531a185df9ad8006a
   * -
       | doca3.6.0-26.10-070000-1-ubuntu22.04-arm64
     - sha256:ebaae8d67ac1a93080a975c18ea9b5707ebdf99e55437f8aa759ee5a78675f5a
   * -
       | doca3.6.0-26.10-070000-1-ubuntu24.04-amd64
     - sha256:6b79c84c0db9e8abaa71243add6f7eed4ce787b6fcd2dd99b8117e8f083dbef6
   * -
       | doca3.6.0-26.10-070000-1-ubuntu24.04-arm64
     - sha256:bf5e2077fa1c8fa950d77d780474e44ee8185840631581376eb8677a6cf64be1
   * -
       | doca3.6.0-26.10-070000-1-ubuntu26.04-amd64
     - sha256:80c35ea0f5316cc64249e93ce11ca3a895bbef52cd74950af5bc532ee845feb2
   * -
       | doca3.6.0-26.10-070000-1-ubuntu26.04-arm64
     - sha256:e8fe51e5c62c5094fc54588ceac11429aa18f8eb50f865503e8c8a12478bc84d

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-rhcos4.17-amd64
       | doca3.6.0-26.10-070000-1-rhcos4.18-amd64
     - sha256:40a68d42ec3ae6d2e9ee302a550d17cbd2b3e333d220d3a89d40294f1234ccc0
   * -
       | doca3.6.0-26.10-070000-1-rhcos4.17-arm64
       | doca3.6.0-26.10-070000-1-rhcos4.18-arm64
     - sha256:c99fae33806ff93d8bd577e52a7239b5f676c1c9ae8ac6684586fc81ad64b533

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-rhel10.0-amd64
     - sha256:0042f1f023ca9d427317934bfeaa8abea08dc4261b0d9f704859a5d9b39a86db
   * -
       | doca3.6.0-26.10-070000-1-rhel10.0-arm64
     - sha256:edb2112270b320ae064d05cf8144ea1ed00b98ab361d159858d794ebb378bdc7
   * -
       | doca3.6.0-26.10-070000-1-rhel10.2-amd64
     - sha256:64d71fccbb76bfe15d1c5539f11d88ed84b036224425a5eea9c63d5fb9484a0e
   * -
       | doca3.6.0-26.10-070000-1-rhel10.2-arm64
     - sha256:4953f447fc1af58a5a812fc129250167da297d36dc539c86ff735e9dfb7508df
   * -
       | doca3.6.0-26.10-070000-1-rhel8.10-amd64
     - sha256:b5d4cdc03c6090de2e1314100b78f960ef56943b12374608277e28d545f446c8
   * -
       | doca3.6.0-26.10-070000-1-rhel8.10-arm64
     - sha256:b7767967989a0d3d90b95b3eee28a613fd361cc1d2188b59d919039fae6fcbd1
   * -
       | doca3.6.0-26.10-070000-1-rhel9.4-amd64
       | doca3.6.0-26.10-070000-1-rhel9.6-amd64
     - sha256:2824dd8333b73ffe03dc756d014c439e46d3cacfd4ad4bb24d3aa288d6a783bf
   * -
       | doca3.6.0-26.10-070000-1-rhel9.4-arm64
       | doca3.6.0-26.10-070000-1-rhel9.6-arm64
     - sha256:24d7cab5a25d9c0d8fbc5f66702bc95391762a1e01b74274068871b2dcc182a4
   * -
       | doca3.6.0-26.10-070000-1-rhel9.8-amd64
     - sha256:70ddd44fb97ff066a83b8c7f145c5fd95a8a617f07659b10e4fca817d36a15c4
   * -
       | doca3.6.0-26.10-070000-1-rhel9.8-arm64
     - sha256:325bee3cf75b06f14879ccdfde55e024f6c9c4fa14e5d20a182f3192df5d16a0

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-sles15.7-amd64
     - sha256:320df518a633a668b5ac48cb6bb825f951c2ba7c1bcfa4f43283f13fd9f9b635
   * -
       | doca3.6.0-26.10-070000-1-sles15.7-arm64
     - sha256:798f66339bcea18faa092300056a23f674d8e1c6c96053f0af7f2b18c4183220


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
     - doca3.6.0-26.10-070000-1

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-ubuntu24.04-amd64
     - sha256:36ae121592e50ee4b04e2e57149801e749a6819da45632ca58261634700bf409

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-1-rhel9.6-amd64
     - sha256:d64866dd1619ffe32f6f4fb11fcf4e3c52a9210f5e21c1ed474f39ac66135b21