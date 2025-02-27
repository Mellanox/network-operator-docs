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
     - v25.1.0
     - sha256:12f0576f372f5adc17b60795952ae47388e50d8fad563b9595f3091eadd8eb29
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
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-25.1.0
     - sha256:550e490ef41576d399a6831a8567ee4d0a1c946e56dd899a64feea112aa3a706
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.1.0
     - sha256:59d2245cab9b6e5f3a38666ffba1eaf2b2ebf359ca753cb9ea525136a8e16eb7
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.1.0
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
   * - nvcr.io/nvidia/mellanox
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
       | 25.01-0.6.0.0-0-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:e2f80447c0aa268b72ce44cc09a0b516dd75fae37b7754b161dd14929a74ddb0
   * -
       | 25.01-0.6.0.0-0-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:f5afde8089bdbd5a1469ad99e8a2f643c11de8a8403f6c82d784b1fa36f149b3
   * -
       | 25.01-0.6.0.0-0-6.11.0-1008-azure-ubuntu24.04-amd64
     - sha256:153c6a232e161c1c5e19d631704afb7c42a09a23f435c81dddc306e5a8658df9
   * -
       | 25.01-0.6.0.0-0-6.11.0-1008-azure-ubuntu24.04-arm64
     - sha256:cffaee623d571f534124417d3826cd480cc68b0c068b560e15343c3a1013a1b6
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
       | 25.01-0.6.0.0-0-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:7457e91ecdc6fcfff110df9c874a246e6c0f8f66bac951d1db192a69fdc021aa
   * -
       | 25.01-0.6.0.0-0-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:9d574605df895186319e8d01916a2ee3a7cd92ced255af538d980f2909e3d2c7
   * -
       | 25.01-0.6.0.0-0-ubuntu22.04-amd64
     - sha256:aeacb67bd1e56389a0373a48eee45888fa9387e78c89eecdd0d9a6be6bdfd195
   * -
       | 25.01-0.6.0.0-0-ubuntu22.04-arm64
     - sha256:a8706b85c44829fa38f4d6270f5dd5e7e5a6740cd6987a80dc6b93f9b60ea936
   * -
       | 25.01-0.6.0.0-0-ubuntu24.04-amd64
     - sha256:f8b4e3c6ab25eb97cbcf9abbbe493e735de287307b6c1ab59397c8a869f9159e
   * -
       | 25.01-0.6.0.0-0-ubuntu24.04-arm64
     - sha256:e96571f76ca4f0d1819e310fa462eb42ebbcd1b3dd304cf59f389197e8810da9

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-rhcos4.14-amd64
       | 25.01-0.6.0.0-0-rhcos4.16-amd64
       | 25.01-0.6.0.0-0-rhcos4.17-amd64
     - sha256:5b91974c74f08fc5b1ad2edd4ca97d81b2dc6cc897045c3eac777826fe5d40d8
   * -
       | 25.01-0.6.0.0-0-rhcos4.14-arm64
       | 25.01-0.6.0.0-0-rhcos4.16-arm64
       | 25.01-0.6.0.0-0-rhcos4.17-arm64
     - sha256:7604a30cbd0927eba76ddc74ea1cfbe113563ccf068e6ab3fe78123e4deec28d

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-rhel8.10-amd64
       | 25.01-0.6.0.0-0-rhel8.8-amd64
     - sha256:a257aae9c4e02b62f9f4ddeea66c4349c517519a544dd02fe4c8d3fee5229521
   * -
       | 25.01-0.6.0.0-0-rhel8.10-arm64
       | 25.01-0.6.0.0-0-rhel8.8-arm64
     - sha256:68b3735c4edca2d889c456beba80ac2077b0cc0edba11a32769dacd3ece64892
   * -
       | 25.01-0.6.0.0-0-rhel9.2-amd64
       | 25.01-0.6.0.0-0-rhel9.4-amd64
       | 25.01-0.6.0.0-0-rhel9.5-amd64
     - sha256:3edf0cec91eea10df17c9f182b2db430cb383887ac144e27ac44043b308284d7
   * -
       | 25.01-0.6.0.0-0-rhel9.2-arm64
       | 25.01-0.6.0.0-0-rhel9.4-arm64
       | 25.01-0.6.0.0-0-rhel9.5-arm64
     - sha256:f5c1741cc6368fcec5b250285552d9c80ff7254414f68102cc89162e12ac0400

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.01-0.6.0.0-0-sles15.6-amd64
     - sha256:fa77ddd01d467889578564b6a0281af33549ffb4a419a18a4d83dcc30dd911af
   * -
       | 25.01-0.6.0.0-0-sles15.6-arm64
     - sha256:3235a7e98a5868d174e99718f88c265906b4ef76469b8d18327df0cd5906f2f8