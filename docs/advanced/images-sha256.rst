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
     - v25.1.0-rc.2
     - sha256:cc637144375d44ec2e9b99c6f80e039e1ab777fee7d561d3f184d7d3b410f22b
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
     - v0.2.0
     - sha256:47e1bb84ac97f9af49f97b49c2de44b4ba82b890b487880edc5c9adf86a176f7
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
     - network-operator-25.1.0-rc.2
     - sha256:550e490ef41576d399a6831a8567ee4d0a1c946e56dd899a64feea112aa3a706
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.1.0-rc.2
     - sha256:59d2245cab9b6e5f3a38666ffba1eaf2b2ebf359ca753cb9ea525136a8e16eb7
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.1.0-rc.2
     - sha256:691113613be670ae030df8a59a8f6689be296b7efcf825bddc3a0774a30a61d2
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
     - v1.5.0
     - sha256:fe8efec170b498922b3367aabbb6dc57966eb930c8aa086a5f5fb369cefa6064
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
     - v0.1.17
     - sha256:36a1395a4a6d250114375e78ef9c08bccdf779d5a6e139709c43c2f61aadc369
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v0.1.17
     - sha256:d05f3297f4d05bcc0e23303f74a3e4d16bf953e3419348044f1571063b116bf8
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
     - 25.01-0.6.0.0-0


The followings tags are available for the above DOCA Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-5.15.0-102-generic-ubuntu22.04-amd64
     - sha256:5049cc99fbc91798a11816492e20b66ce161d4e6e77f7d742f1b8073ebc926c4
   * -
       | 25.01-0.6.0.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:e2f80447c0aa268b72ce44cc09a0b516dd75fae37b7754b161dd14929a74ddb0
   * -
       | 25.01-0.6.0.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:f5afde8089bdbd5a1469ad99e8a2f643c11de8a8403f6c82d784b1fa36f149b3
   * -
       | 25.01-0.6.0.0-0-5.15.0-91-generic-ubuntu22.04-amd64
     - sha256:4e8d55adb5ada56b8630877a2c6224c03d152e33d3fd9905da1861dfa6d53bec
   * -
       | 25.01-0.6.0.0-0-6.8.0-1019-oracle-ubuntu22.04-amd64
     - sha256:3078c8c8f1b444cb7ff082d9adb4d1aa07d5e6e4b79ba63f73c7bef109594a86
   * -
       | 25.01-0.6.0.0-0-6.8.0-1019-oracle-ubuntu22.04-arm64
     - sha256:e812ec9e4ec2837f7111ca92798ac88dd62fca7137d71ce6a0ff20768c286316
   * -
       | 25.01-0.6.0.0-0-6.8.0-1019-oracle-ubuntu24.04-amd64
     - sha256:23645571e6efc5327627ca7c6594721f74a38fcf5589ebb349ebbeafb9a5e343
   * -
       | 25.01-0.6.0.0-0-6.8.0-1019-oracle-ubuntu24.04-arm64
     - sha256:f700bd89c2f6df137009ad81f880bc6ccc99df8529c2abf0cc2751dc2d1b465b
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-aws-ubuntu22.04-amd64
     - sha256:ac7f717b510222f179d29ed31d8eb79c52da2dd16547ecfe972242b4cd0ab681
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-aws-ubuntu22.04-arm64
     - sha256:0415a99fdc18523dc0c4c384c3d115a0a9b3870e3c3a228ccd4924fd4107b314
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-aws-ubuntu24.04-amd64
     - sha256:5375f038d080854542de2b5171b3f58f75c2db35ecc1b7218aa556e10ef943de
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-aws-ubuntu24.04-arm64
     - sha256:e8f234601806b29ceaca7dae1d91dd044ec03a18401f1b4942e9ca542275ef84
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-azure-ubuntu22.04-amd64
     - sha256:196e136171afa64f80598d29fe0c7e2c46a3cf1633d632817f7ae46ab4b1e774
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-azure-ubuntu22.04-arm64
     - sha256:8356b4ca3ebb64621b392a184a8b5c5173f2842a93f70946d9453afd91055d05
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-azure-ubuntu24.04-amd64
     - sha256:49803829165c8055cdbd3e9650ba7296789d41c00a6da9ee9f73b70564bc5f04
   * -
       | 25.01-0.6.0.0-0-6.8.0-1021-azure-ubuntu24.04-arm64
     - sha256:188be3315b6dd70cc9dfe0088f4c019ed9e1ada92cd049c91a261c6adf7967e6
   * -
       | 25.01-0.6.0.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:7457e91ecdc6fcfff110df9c874a246e6c0f8f66bac951d1db192a69fdc021aa
   * -
       | 25.01-0.6.0.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:9d574605df895186319e8d01916a2ee3a7cd92ced255af538d980f2909e3d2c7
   * -
       | 25.01-0.6.0.0-0-ubuntu22.04-amd64
     - sha256:6f40d36c475ea7d266ee2f5d77934cbaeeba7277d06b6626b2e83b98afcccf01
   * -
       | 25.01-0.6.0.0-0-ubuntu22.04-arm64
     - sha256:beac981aee7cd4b795d9eb52634f8b68976b17f785f23121ec03dc062ed52f3d
   * -
       | 25.01-0.6.0.0-0-ubuntu24.04-amd64
     - sha256:de8e15005d58eba4f7b9fa7aef38bd59b652e88689ee805882204164290fffa1
   * -
       | 25.01-0.6.0.0-0-ubuntu24.04-arm64
     - sha256:9e7dc05421083d3ba6312079beaea1bf57cd86bbad2b5f15b25a87a80852efd1

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.100.1.el9_2.aarch64-rhcos4.14-arm64
     - sha256:08b651bbf4fa388a31da6eb130050bc8692b33854e6eb7b1248192cbe88f42bd
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.100.1.el9_2.aarch64-rhcos4.15-arm64
     - sha256:ca213423b1be1dd1301137b5a3976e6f662ba973715511857d2568ff7e0785fa
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.100.1.el9_2.x86_64-rhcos4.14-amd64
     - sha256:7be948edbf8947762d76a7bddc9e5513cf51557f071d8fe9c58b6ac84a3ce661
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.100.1.el9_2.x86_64-rhcos4.15-amd64
     - sha256:d62df8a92e7e976e49bd71ddcdb78a8dee61bb30ec52d449c4a13b035b282e41
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.104.1.el9_2.aarch64-rhcos4.14-arm64
     - sha256:ccd933cd9c8382596e8412c66b071db581f4c387754089335434eaba9ee40530
   * -
       | 25.01-0.6.0.0-0-5.14.0-284.104.1.el9_2.x86_64-rhcos4.14-amd64
     - sha256:bab2bb435803e29938fd2f5e39366caeca397d3ad4d0002d3f60f8ce5c39b33d
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.50.1.el9_4.aarch64-rhcos4.16-arm64
     - sha256:812828d384bc37c94f8dad44cb0534b13a555a345ccc4ae5bc20ddc8d66564f5
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.50.1.el9_4.aarch64-rhcos4.17-arm64
     - sha256:b5251a04dbccb0ff33cf08f010e9bd6b117174237460381de72e700b16f23240
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.50.1.el9_4.x86_64-rhcos4.16-amd64
     - sha256:1ab6b722b17386af977bc72c1c8f7e01313e11b8d22b1d0ef327f30c6853b702
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.50.1.el9_4.x86_64-rhcos4.17-amd64
     - sha256:eec4fbd278a8dc2752a32de2a859dcf96632c156b269308820e613e6e87a6914
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.55.1.el9_4.aarch64-rhcos4.16-arm64
     - sha256:95bfedbf868263949c855fa2a5b95786939ef69c9471c5a41dc987165bf5e3f6
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.55.1.el9_4.aarch64-rhcos4.17-arm64
     - sha256:e529e7c86f4d410c6adbfda1f97f39ef0e68bd9885241d5818962062f69622f4
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.55.1.el9_4.x86_64-rhcos4.16-amd64
     - sha256:af3649da9c17edc0509d3dbf1bf4146b58a60510356b767fe3a362ac53bee9ca
   * -
       | 25.01-0.6.0.0-0-5.14.0-427.55.1.el9_4.x86_64-rhcos4.17-amd64
     - sha256:b520a52ce51d4064d82303d1b8368202b7107a00b07d0820719e1e8d1c599ac2
   * -
       | 25.01-0.6.0.0-0-rhcos4.13-amd64
       | 25.01-0.6.0.0-0-rhcos4.14-amd64
       | 25.01-0.6.0.0-0-rhcos4.15-amd64
       | 25.01-0.6.0.0-0-rhcos4.16-amd64
       | 25.01-0.6.0.0-0-rhcos4.17-amd64
     - sha256:b5128b5d1554b6215fcfef49fea19078cdb02b1823cd78cfd6a9940257a63730
   * -
       | 25.01-0.6.0.0-0-rhcos4.13-arm64
       | 25.01-0.6.0.0-0-rhcos4.14-arm64
       | 25.01-0.6.0.0-0-rhcos4.15-arm64
       | 25.01-0.6.0.0-0-rhcos4.16-arm64
       | 25.01-0.6.0.0-0-rhcos4.17-arm64
     - sha256:7980f3185e1d0ea10ba8d606dcd201a1bc5327c6c9a078aa5aa4b1db01fc23f8

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-rhel8.10-amd64
       | 25.01-0.6.0.0-0-rhel8.6-amd64
       | 25.01-0.6.0.0-0-rhel8.8-amd64
       | 25.01-0.6.0.0-0-rhel8.9-amd64
     - sha256:ee2fde985302c1b3db3a4273964727a234eee86cd7df294ebcec18d5d709edd7
   * -
       | 25.01-0.6.0.0-0-rhel8.10-arm64
       | 25.01-0.6.0.0-0-rhel8.6-arm64
       | 25.01-0.6.0.0-0-rhel8.8-arm64
       | 25.01-0.6.0.0-0-rhel8.9-arm64
     - sha256:52bc65ed485ce00940673fd7bc07723aaa8afc134c6b7add7d1c1f107eb50e4a
   * -
       | 25.01-0.6.0.0-0-rhel9.0-amd64
       | 25.01-0.6.0.0-0-rhel9.2-amd64
       | 25.01-0.6.0.0-0-rhel9.3-amd64
       | 25.01-0.6.0.0-0-rhel9.4-amd64
       | 25.01-0.6.0.0-0-rhel9.5-amd64
     - sha256:bbfecf01b19f493f0b11227e6ebf57466b453bad08ccda1c8e77aed5cbbbeeb7
   * -
       | 25.01-0.6.0.0-0-rhel9.0-arm64
       | 25.01-0.6.0.0-0-rhel9.2-arm64
       | 25.01-0.6.0.0-0-rhel9.3-arm64
       | 25.01-0.6.0.0-0-rhel9.4-arm64
       | 25.01-0.6.0.0-0-rhel9.5-arm64
     - sha256:9bd4fdbcb068789aae46160d7a2e7189405b6c2c544b13aeebec6ea2352d5ff2

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-sles15.6-amd64
     - sha256:fdbec9dbe2df5f9d43f694049acfc7588c5698fd1299dc0af312d3f8e4f49aac
   * -
       | 25.01-0.6.0.0-0-sles15.6-arm64
     - sha256:6586e0e7bd70983fcd2f24f74f03b179786538495a4199750eb3a7b745e870d3