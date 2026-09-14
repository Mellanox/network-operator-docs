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
     - v26.4.2-rc.3
     - sha256:76c46fafb1291a121e08af9e44d4ce0c4ebd851cf1bdd9065c894c6273c046e3
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.2-rc.3
     - sha256:ca24d1d6bfa27df77d8184bf833d40c568680cdc0e79ab55d8b264a95a8ae996
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.2-rc.3
     - sha256:f5e5c94757bf4217efbf1c1babcfffe59c341351a446553cdefb9837094211aa
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.2-rc.3
     - sha256:c32e378b0d680aa21b39342d0a745c3aa929a4cb384057a9336547bf825cdc6c
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.2-rc.3
     - sha256:0f38d971ca79361e3a67352e02be99b9203a3dec910247e97055547e2ab25129
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.2-rc.3
     - sha256:37a0f2581ac1063b191566d1ade5f870777f2d97a47f72bc6aac51e945af7c40
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.2-rc.3
     - sha256:1f67f914068fa00b2fe85a76f8e186cbcb2b5915ae5c47662616bb8fe327f084
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.2-rc.3
     - sha256:9c37ad8311f4206c5cbee9762e42b1f9383db6d1a0502cb1065598afcd19974f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.2-rc.3
     - sha256:ce9c3abbe6c4c5ce4f19f5c131fc10b9a3497ddbc68d515635b4b019d4e11e4c
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.2-rc.3
     - sha256:7cd8470a3d7b2c497c5d0ddd34a06ae74254a18a4d52a801b7c2a075108f87fb
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.2-rc.3
     - sha256:75f01eecfe36c86b2fa9aa4294ab6ff52711f692da79d07c89338e127ef25339
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.2-rc.3
     - sha256:93e9468a40063f04adca5e6157e873188e28aba60753162d9146ae4df72cd9fa
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.2-rc.3
     - sha256:0318ac50e013aff1eb36bd103ab430a99008d771ee31f73d3dce7386b7d1911e
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.4.2-rc.3
     - sha256:e484ede1eb4b580eb66f99094bad740cf53740c62d4f6d4b5af7dc1f557dbd9c
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.2-rc.3
     - sha256:792a9971f202cfd95744d5b24d98da5892e3e8eb7af7abe8de66db7899a4db8b
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.2-rc.3
     - sha256:31c82bf3406b3dc1dc8edc6d6df3b0f69abf4c592ffd852bd11b7623f866adf1
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.2-rc.3
     - sha256:fea2de21fcc8482ac046380498a4c7f95c09c15dbc576fbdc963b7907f2d48d6
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.2-rc.3
     - sha256:1ab7e134863606f2bcc6bb888cf0467b2bfe53136af5692b5323d661612719e9
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.2-rc.3
     - sha256:140e155dcc80b87c0a8408d223ca525753f3ac9a47d600d87fff2efc72097e51
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.2-rc.3
     - sha256:c5f37e65449c52c4d7ae750d77c906aee36ac2bac15ba9429a2fdfe61e16f060
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.2-rc.3
     - sha256:64ce87dea95d98d5867504b5f373da71a9f092e062ccaca6bfc02db7adb3cd12
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.2-rc.3
     - sha256:ec19cb1eb17bc378968ce1a1f4f7081b27a739a833c3618a11481e6bffff5fe9

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
     - doca3.4.1-26.04-1.1.0.0-2


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-5.15.0-191-generic-ubuntu22.04-amd64
     - sha256:f1ff41fe64e04465ce509b27734458caa7c0fb878b09b246807e98d18112df9e
   * -
       | doca3.4.1-26.04-1.1.0.0-2-5.15.0-191-generic-ubuntu22.04-arm64
     - sha256:cda33046c01fdc5071066dc5e34f1286c9fdd8eb53f58d3e4bde8b3c9df31ab7
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1060-oracle-ubuntu22.04-amd64
     - sha256:d04235eb5e9f01cbcba19bf4be75f8ebe9933550d26182b4d7f5ef2fb9900a76
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1060-oracle-ubuntu22.04-arm64
     - sha256:1f34ab9799587ebef047b2243d2b30a4b1402fb572d9d846f52a9b519b3fc90c
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1062-nvidia-ubuntu22.04-amd64
     - sha256:ab40c2ac824f746f0716ed7d7156223d51bb48c90136d2dae2544bd1c7fbd904
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1062-nvidia-ubuntu22.04-arm64
     - sha256:cd4b6c372dd5cf2a68cbcc0e2d6acee01d8b4b572607d28dc8ab2a24c39dc24f
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1063-aws-ubuntu22.04-amd64
     - sha256:b7e456b55f01aba88dfad95fd2a00a8c4a5e7e2c3bda164ce6d39c322ee8d56d
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1063-aws-ubuntu22.04-arm64
     - sha256:1fa52650be3f3fb884e47326fac56011661554ee8aa9fc05ee438a211b5a6833
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1065-azure-ubuntu22.04-amd64
     - sha256:70393d3140b75b15bd34d4fd5ffb868cf0f18015a8487ce3230400b971987971
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-1065-azure-ubuntu22.04-arm64
     - sha256:f4eba3bf1a1c4e71efe0801832f9f593901ef35f290504d70c46e72929132711
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-139-generic-ubuntu24.04-amd64
     - sha256:f33ffb96220c60b30cd4fa27cc68e039479705970a57df75ac0b5a1176b50981
   * -
       | doca3.4.1-26.04-1.1.0.0-2-6.8.0-139-generic-ubuntu24.04-arm64
     - sha256:ea209f3ff952fc89c84cc2964512c3a0219657349eacf290729a3241ebf7c113
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1006-oracle-ubuntu24.04-amd64
     - sha256:4546e2abcbad185d8aab74c3b4873f4fdff0ff940e2ae968520cbffb3c3f4f27
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1006-oracle-ubuntu24.04-arm64
     - sha256:322818fb506ddcdebacd8abb514fe362da85faef8c2c74071ddc48c70ce5e85f
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:e140a4508b73059a6456f3719d337aa785f0aaed4e1b379db235a656b72d7901
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:5ef7ae8a6751f525d936417b6bbe7da86ca3ee8b16302a0008263fdb3f8cbe37
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1012-aws-ubuntu24.04-amd64
     - sha256:9ef42ce42bd186ff22ed06452667a520f43d0bc2e36a7c6eba5ae6ea3b37a4b5
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1012-aws-ubuntu24.04-arm64
     - sha256:81f6e75d55d59640526b20760a246277f4ead7b94c7a2105a580a23a7d1de3bd
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1016-nvidia-ubuntu24.04-amd64
     - sha256:67ab6086cc1587f097f5328166fa291e15ebc7a3175945272de302193aaecbe4
   * -
       | doca3.4.1-26.04-1.1.0.0-2-7.0.0-1016-nvidia-ubuntu24.04-arm64
     - sha256:d570eda701835b2bdd690b88ec74007a0f58e95e7873feafbb03ad2d2970108e
   * -
       | doca3.4.1-26.04-1.1.0.0-2-ubuntu22.04-amd64
     - sha256:a9c642440b729d18e2683958685ac067bb74fa29a1eb711267498f0c8a21d6bf
   * -
       | doca3.4.1-26.04-1.1.0.0-2-ubuntu22.04-arm64
     - sha256:dc2a7abdf78c85a8d55d5e3c3e402566033d63ca78716f7eb8340b7c59a22e41
   * -
       | doca3.4.1-26.04-1.1.0.0-2-ubuntu24.04-amd64
     - sha256:5c178c4f96d076088dea6821c7d15181ac95b4101056319dd4bcd29e075f7224
   * -
       | doca3.4.1-26.04-1.1.0.0-2-ubuntu24.04-arm64
     - sha256:5e16c0f09f0b8621d6cc1af9745e3724722eeef2abf973864917dcd1cb555427

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.16-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.17-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.18-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.19-amd64
     - sha256:df482f3df48c846f27fd5b8970fb3860549b9590884931ba7d731926ce94c3b5
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.16-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.17-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.18-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhcos4.19-arm64
     - sha256:68359f1c23f41b3c91cdb2c9f5ab71351e6918074c2308c12b3ae82aea669f66

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel10.0-amd64
     - sha256:7d357396a70e406c41544f9922293ea7601ef1a9e5332067bbb718c0bb60c376
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel10.0-arm64
     - sha256:6de493f1d5cd2dd74a496cc91d6012b4013c74685ab6ba6983b32e5b47660572
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel10.2-amd64
     - sha256:be84b7815885e59ffa43bfa25e152f0c53f2cb8f7c09f8933adc273de61f8c4e
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel10.2-arm64
     - sha256:6bb30634deee73749c28ae0a7fc1cf6a6f5e19d6c8a6f4930a718555ab58fa61
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.10-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.6-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.8-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.9-amd64
     - sha256:d727928d22f14ae2d763454b1c2c37d620b9899ff806a7716b6131741b6cbb4d
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.10-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.6-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.8-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel8.9-arm64
     - sha256:4ab9b410ca8b4bd1ca7bc5a632b6bd89ef95505b4037df13279e8d9970dac3bd
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.0-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.2-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.3-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.4-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.5-amd64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.6-amd64
     - sha256:70495fd8d95392a29e676db02f95594b87f4ed51afc83043600dfdd2f9b6f3c0
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.0-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.2-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.3-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.4-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.5-arm64
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.6-arm64
     - sha256:d3e952dee96e36709ed70986f8d955f68b957e9b1ca135724a8b5d4bd6ad88a4
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.8-amd64
     - sha256:d3f4c73588588931cddaebf01518a088e5a127fcc75d6276e537783f4af76455
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.8-arm64
     - sha256:adcd633d77e1cb7a1a95002ccb0cef090c969404550c8ebef57f6ed541a31d57

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-sles15.7-amd64
     - sha256:936d5150640045f193bff749479f5c2f83e3a359f409a472dae292baaa1f384d
   * -
       | doca3.4.1-26.04-1.1.0.0-2-sles15.7-arm64
     - sha256:592bd78d362543179f956ace80ae77edc58aeca540f68d3700a3a1e753df55db


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
     - doca3.4.1-26.04-1.1.0.0-2

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-ubuntu24.04-amd64
     - sha256:b877d311b28207c043f724d2e6a00e072b956576596bf71391a77e585d9dd9dd

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.1-26.04-1.1.0.0-2-rhel9.6-amd64
     - sha256:f44159e05fa1fda2fcff2ade1dc94068fd398fe4adb7d2d9df4c3f327e8d825b