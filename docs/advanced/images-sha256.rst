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
     - v25.4.0-beta.1
     - sha256:7b3d40884b0fcafba50262cf3dae4403c1498034634fe36e94fcaa1bd00f567c
   * - ghcr.io/mellanox
     - network-operator-init-container
     - v0.0.3
     - sha256:67e93ccf3ecb61f17597567faf0f72e1b8ddcf73c5d7440baeadcc1cb6bb811b
   * - ghcr.io/mellanox
     - k8s-rdma-shared-dev-plugin
     - v1.5.2
     - sha256:9f468fdc4449e65e4772575f83aa85840a00f97165f9a00ba34695c91d610fbd
   * - ghcr.io/mellanox
     - ib-kubernetes
     - v1.1.0
     - sha256:100e6addf99d5b44e81cb3aa8d2fc892fced1de3183190931961b92ee924207b
   * - ghcr.io/mellanox
     - ipoib-cni
     - v1.2.1
     - sha256:56f19687b0b956ba45bf079cf3a655b0d1bad0314da9d5ecfe0f4d98ff31fc86
   * - ghcr.io/mellanox
     - nvidia-k8s-ipam
     - v0.3.6
     - sha256:9c62748a35f5f370419c80bb13ef9e3b5d0fbf6cb32f049626b3421d247bf981
   * - ghcr.io/mellanox
     - nic-feature-discovery
     - v0.0.1
     - sha256:92dda9434519de39be0f94c80787766e3399e8b238d14839360aff4d6232a09b
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.16.5-doca2.6.0-host
     - sha256:866971717cb2683f2742d265c9793f93242f55b6e8bd9a0a88a558869f9b9cd7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-25.4.0-beta.1
     - sha256:4fcd2ff35cb3e52f96e42d771dbd1021e363090924324ec0b8b1f82d972e9600
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0-beta.1
     - sha256:baf6c32dab24cd368acd10def88ce91703c9f6d2d777c3bdf60200f65b8957f6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0-beta.1
     - sha256:2f8b3403b69c50179ff83affdc504ac93e7d09826a50bb7d0d75bfc8dc90d187
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
     - v1.1.1
     - sha256:0b1a0de216f46e667d9a326cdf2391fa1e4b4e40d911dcb266faae4464d8e1ff
   * - ghcr.io/k8snetworkplumbingwg
     - plugins
     - v1.6.2
     - sha256:2c329b1c2c97ce7ddc4b315137dcdebdc66a394b8f3bb039061cd46aea20e972
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
     - v1.2.0
     - sha256:220af56ef977c63f93ea3eb9cec6cf3ddc363147b9d1053c742b7c793a70400e
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v0.1.18
     - sha256:d250e88a196caa038f5ec746b60dc86c998bbc85edd63645f42864a3e58fd646
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v0.1.18
     - sha256:042cbc1eca56ae37a9515818b0e04702f0be56da85849b926a1d42f8f5443a41
   * - ghcr.io/mellanox
     - maintenance-operator
     - v0.2.0
     - sha256:47d87129d967a5f9d947915b414931e6ba7d42be45186123b531d760b93c6306


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
     - 25.04-0.2.3.0-0


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.2.3.0-0-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:447b1580bbf5bab79f413f4599b6b15538c6cbdc2528adf90140cb6648d1569d
   * -
       | 25.04-0.2.3.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:750a0a5903c26a37dc7101cf200dd6990735ea9e1adf00ca54fb3e2077c75f6a
   * -
       | 25.04-0.2.3.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:b0393e35ed2302f4061ea94cc69ca4b312d632555b50e9d034ef09c3b7f81f16
   * -
       | 25.04-0.2.3.0-0-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:f342f53557aea52b7edf0e873ecddd7705090f4c8cda9ab24f802c0ce9078b30
   * -
       | 25.04-0.2.3.0-0-6.11.0-1003-nvidia-ubuntu24.04-amd64
     - sha256:5f9eba834232a6a01b29e7d98dcb66efd95cea84289cd2fdcb177d4763fd97ba
   * -
       | 25.04-0.2.3.0-0-6.11.0-1003-nvidia-ubuntu24.04-arm64
     - sha256:a92a7454c3490ff753a8bb27aa10ca93c5376410ea091d2fcd23b14cac324b73
   * -
       | 25.04-0.2.3.0-0-6.11.0-1008-azure-ubuntu24.04-amd64
     - sha256:936b42496956233c348fd9c4772611c80f396c9e9f2750f4d14ca0f34099fb50
   * -
       | 25.04-0.2.3.0-0-6.11.0-1008-azure-ubuntu24.04-arm64
     - sha256:36768e7537a483b8d91ae50fa83833a14090813e44e38d5ac3048012139a6527
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-azure-ubuntu22.04-amd64
     - sha256:aa45ee3f209fce16aad52205755432b8d5bca2285c2f23ade094f604fb9318ac
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-azure-ubuntu22.04-arm64
     - sha256:42e47526bfe0e0d2c091574be5ddb32086932c7bcb73e3de5f4049d24f3c06d1
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-oracle-ubuntu22.04-amd64
     - sha256:71fe255372c08a5daa00577b4605638ac43b9f4629f5df6c2d7bc270bf320581
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-oracle-ubuntu22.04-arm64
     - sha256:6664084d448c9578c3604fbb19981d25e9a834a6b7934cd957b4e3c28e9d6726
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-oracle-ubuntu24.04-amd64
     - sha256:58a13f2275accc7b0f4bb4881f53842b8a94b319d93bb171eac9aec2c8b332f6
   * -
       | 25.04-0.2.3.0-0-6.8.0-1021-oracle-ubuntu24.04-arm64
     - sha256:da10aaab6a944f5e5134748619e26c54283d1c8bb75ff983779555602c4f7165
   * -
       | 25.04-0.2.3.0-0-6.8.0-1023-nvidia-ubuntu22.04-amd64
     - sha256:1e63c3affa6a9cae38e21e3e91d350734be05638f7835546fa4fcd5d07c4bedc
   * -
       | 25.04-0.2.3.0-0-6.8.0-1023-nvidia-ubuntu22.04-arm64
     - sha256:a52393bb6265b6e6e10d876c20499af11e179a4d3a54926819df01e19abde6f7
   * -
       | 25.04-0.2.3.0-0-6.8.0-1024-aws-ubuntu22.04-amd64
     - sha256:4b67cb84007edf60f7c446a9b96d8e89bbce97b3b860bc1dced8ecb3537fc3b0
   * -
       | 25.04-0.2.3.0-0-6.8.0-1024-aws-ubuntu22.04-arm64
     - sha256:e28e097583b2d2afa7ffc52d863bcb660d553d51cc4cb0339d4a02757d1e7d9f
   * -
       | 25.04-0.2.3.0-0-6.8.0-1024-aws-ubuntu24.04-amd64
     - sha256:553824092c654807a158aca6d69931379b258292068f2cec8bb9ed74b0210929
   * -
       | 25.04-0.2.3.0-0-6.8.0-1024-aws-ubuntu24.04-arm64
     - sha256:9b6eb790130acea9598707d7b3f636cb7906ade304e4670710090bf73a876283
   * -
       | 25.04-0.2.3.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:38b271c79cbbdd7c00e7b7d92e0e176ef654eddcf649d49a58f619075c04a420
   * -
       | 25.04-0.2.3.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:ad98dae477846626e52eff105896a7a876b8bcc7903912c72335e4a3ab489808
   * -
       | 25.04-0.2.3.0-0-ubuntu22.04-amd64
     - sha256:efbf563744ba07f9a9652b4b676a56ebe240c976e452e232a378daafc7aacb6e
   * -
       | 25.04-0.2.3.0-0-ubuntu22.04-arm64
     - sha256:990c54298bba719ad226391c07530d8337cc2cf8e421d051faae28ec399d6aff
   * -
       | 25.04-0.2.3.0-0-ubuntu24.04-amd64
     - sha256:a4ce8c310094bb6969b9cef156395ef6ac1b57d4d267d101bcbdae3a6b724b21
   * -
       | 25.04-0.2.3.0-0-ubuntu24.04-arm64
     - sha256:d2ccd60dbb4934c14acb984c5e3774fe3028bd96c6bbfa2ebf94cf2198400f12

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.2.3.0-0-rhcos4.13-amd64
       | 25.04-0.2.3.0-0-rhcos4.14-amd64
       | 25.04-0.2.3.0-0-rhcos4.15-amd64
       | 25.04-0.2.3.0-0-rhcos4.16-amd64
       | 25.04-0.2.3.0-0-rhcos4.17-amd64
       | 25.04-0.2.3.0-0-rhcos4.18-amd64
     - sha256:d4727e065d27271f35b87b168885a4714588c2893b05e0e0732748e9345db4b6
   * -
       | 25.04-0.2.3.0-0-rhcos4.13-arm64
       | 25.04-0.2.3.0-0-rhcos4.14-arm64
       | 25.04-0.2.3.0-0-rhcos4.15-arm64
       | 25.04-0.2.3.0-0-rhcos4.16-arm64
       | 25.04-0.2.3.0-0-rhcos4.17-arm64
       | 25.04-0.2.3.0-0-rhcos4.18-arm64
     - sha256:8883bb9da6d5a8d8d1f182fdc4491b4cc5d07ad6e84a409e96195c7022ef02e8

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.2.3.0-0-rhel8.10-amd64
       | 25.04-0.2.3.0-0-rhel8.6-amd64
       | 25.04-0.2.3.0-0-rhel8.8-amd64
       | 25.04-0.2.3.0-0-rhel8.9-amd64
     - sha256:f441ae044798f0801983fe38bd1ed120cef581d15f95eb8b561ad6e1dae56363
   * -
       | 25.04-0.2.3.0-0-rhel8.10-arm64
       | 25.04-0.2.3.0-0-rhel8.6-arm64
       | 25.04-0.2.3.0-0-rhel8.8-arm64
       | 25.04-0.2.3.0-0-rhel8.9-arm64
     - sha256:6bf50dc5f29a1dc480c2428c8b666b87649b5c5282e78ad353d33d9615305b36
   * -
       | 25.04-0.2.3.0-0-rhel9.0-amd64
       | 25.04-0.2.3.0-0-rhel9.2-amd64
       | 25.04-0.2.3.0-0-rhel9.3-amd64
       | 25.04-0.2.3.0-0-rhel9.4-amd64
       | 25.04-0.2.3.0-0-rhel9.5-amd64
     - sha256:216cefb0bc6726941a0e12f836ddda1cf6727ab0085610a3be68fae0ca58115b
   * -
       | 25.04-0.2.3.0-0-rhel9.0-arm64
       | 25.04-0.2.3.0-0-rhel9.2-arm64
       | 25.04-0.2.3.0-0-rhel9.3-arm64
       | 25.04-0.2.3.0-0-rhel9.4-arm64
       | 25.04-0.2.3.0-0-rhel9.5-arm64
     - sha256:16c527b05cd175e3817525646e8725b62e4eb4dcb9915e553420d7e21ba09312

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.2.3.0-0-sles15.6-amd64
     - sha256:d2fb7906631a758ae4a9a75d87e250ff9ec560bab7a9d8aedfa6059de2e18523
   * -
       | 25.04-0.2.3.0-0-sles15.6-arm64
     - sha256:0d690f5745f6e59887104dee3b2d1d4928cdbdfa20ccbbd175e0ef6accfec431