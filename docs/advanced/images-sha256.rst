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
     - v26.1.0-rc.1
     - sha256:a2f8599e45fc9572085b3dd41ebc866e2b57344f5a2210d56b262df0dff971c8
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-rc.1
     - sha256:9d0f6279ea2d13b6c117b1b1342573a48607d4741312b487fa46ceb0f072fea7
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-rc.1
     - sha256:9fbe2fd8a4060b4989471fc8bcc3c44a4a74759391fc93a02054918c0994377d
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-rc.1
     - sha256:690bd2c59cbbb74824ad9effa283b8386bf70febe9b815c4e12e8dce0b90fe32
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-rc.1
     - sha256:9b945e2b1176e7870d9f1efed0cddfe0b7fa3991b0b439b7b715535fb471c6a5
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-rc.1
     - sha256:6af6d212a8355f6006dc3dca58f705a8ed3d3de1590d0450361d60cbbb78c8cf
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-rc.1
     - sha256:9fc3c7ed6280d6123290eeff4b35270e69440a2bd3121bbb3ed7fb20bbfe3275
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-rc.1
     - sha256:3744f34eab2767b30a0a700c00d2720585d5e1dc5aa667b8cc7610865ef8b83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-rc.1
     - sha256:aa2c27cd557ef52638fb0c4ca6504d55901477f2cf36430f12dbb52560ad5134
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-rc.1
     - sha256:97fa4936ad9afe0d597d8daf396f21ff11e8cd11d4763dd5d7f9351ac85713b6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-rc.1
     - sha256:b49cc566cb66566617d469c705e5df2927a0dff66f21d1344f269d50a1beb452
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-rc.1
     - sha256:cc4cc8b541424e69a692846c7b50c2160b2a062325da870e93831a81b495a887
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-rc.1
     - sha256:e6d277507f762d86014affdfc0a5d9b75aa20c17fe4eedc7232e2c2922b7aed6
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-rc.1
     - sha256:2b064a2ca5530d20242cc9f5900a11029bb02866ebf8ca17bb82c4bfc400c9e6
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-rc.1
     - sha256:667a26929ecb93e8093d0918a4b93027516670130ee908dcbbad900a43509741
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-rc.1
     - sha256:e7e3e1398b8462d8b5657dd086914634032f69573042a575616bbacf6cbaf6a6
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-rc.1
     - sha256:033eb67b6ad2ee891fb5af20343f803b4d25c3708fd82c2b3b7c5c2ffb5031ba
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-rc.1
     - sha256:6fd5530b9fbb0a80e3316233f172d60f66f3c31a6434fdf35b4c3e81401159c9
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-rc.1
     - sha256:8b8ed764dd0c62e6d920ed3ac8ad3a01b40ac3836ed91f9b72cd288219dbb395
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-rc.1
     - sha256:655d7cd755d3d27040db05d80d957f37c7fced967cbcacf4aadff35474230c4e
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-rc.1
     - sha256:ba486077290e729c955a9edff6590eb1336315c22ba15988b1a72c4225b5e397

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
     - doca3.3.0-26.01-0.9.6.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-5.15.0-170-generic-ubuntu22.04-amd64
     - sha256:bb73c514d9ca60d39a0a963d5a659fea1839953ecada0a978c7ff50b9a8aca49
   * -
       | doca3.3.0-26.01-0.9.6.0-0-5.15.0-170-generic-ubuntu22.04-arm64
     - sha256:3a5bdd95d307858f3485af64e7f623520cea3483376c492a1d4821c742f8116b
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:c32154a554876f060d0072ceed56479fab462a9f098b7e41915050cc74142da2
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:3fc6d9fad9e57894dc0cc7efee834b82e86ea4b4e6f7d6069b90cef32d0f569b
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1004-oracle-ubuntu24.04-amd64
     - sha256:2b9d99be6177fde108ef15adda92181170407cd78bb603094b7e7d8e7b72bc06
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1004-oracle-ubuntu24.04-arm64
     - sha256:661e74c9f0ba4d770bce48578bac3aaa391fe772819dfe021df8c6fd2ea00262
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1005-aws-ubuntu24.04-amd64
     - sha256:5a15b6fa1a13d91a5745ccc9aaf07e39ebcff3abb627d75070fc513a6253f3b6
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1005-aws-ubuntu24.04-arm64
     - sha256:d3179c8f3d6bbd99ce652c1846fe570ffd39716080110f7c945cbc39bc259a68
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1008-nvidia-ubuntu24.04-amd64
     - sha256:0664d2a4e2881ac108184c4f6e6a10b326060bd1d47ccad4dbc98b9fcd089c4e
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.17.0-1008-nvidia-ubuntu24.04-arm64
     - sha256:96c9f21180a1e722b957bc7523c8a30efc1552c6c6e1f8817a370fd445e896a3
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-100-generic-ubuntu24.04-amd64
     - sha256:9e836f369b1e5732059d9ee4554e4aac81a62210ca02a359201cce2d973b1192
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-100-generic-ubuntu24.04-arm64
     - sha256:f2c278336da88879de6653a7e3596015c76100c7e8be2255c9a9fe74727faa26
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1042-oracle-ubuntu22.04-amd64
     - sha256:3a2d50a9d8b23d1596f2f87d99f877820098dc0cbe7f5ca756da7c94d83cdba7
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1042-oracle-ubuntu22.04-arm64
     - sha256:0644f422dfef5408dad32b1115452881cbfc2b25469f4d171f78741f46bc9415
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:ebe91d3e018f95753a995785b645bedcb0a78db93ad99148535ee444f5440d07
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:135c765b3895ca9597d3b6d2d92407f0385702557dcbc0cb317e01273d36a61d
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1045-aws-ubuntu22.04-amd64
     - sha256:ddb71d6c7e468ead05dfc52e84f2f80c9e2dc4148f421e46a5b0e1c34e28d5d8
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1045-aws-ubuntu22.04-arm64
     - sha256:124afbd778b4ed10de684901b46d2082e81bf86e3af2af2950b1cdb39c199189
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1045-nvidia-ubuntu22.04-amd64
     - sha256:de33025a1ffec8889673ae66425019a6aa94d2b8b47d6386d2768a5864105ad4
   * -
       | doca3.3.0-26.01-0.9.6.0-0-6.8.0-1045-nvidia-ubuntu22.04-arm64
     - sha256:20bc9e9afd573eef53d0686514eaa8d2a8d764fed4c773df1f78fa93cb18e4d3
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu22.04
     - sha256:6c68dcb33fb0bea41cb06a9dc63ac896c0aea27d53038f106be3121745693f59
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu22.04-amd64
     - sha256:fde8aab4da356149b0925f10b099e05b2f48924492b4131028115e0aa213aad0
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu22.04-arm64
     - sha256:1b8073b5be93eae8d37e8a6dcc193a6252da78859027af0132c2075008d8e64d
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu24.04
     - sha256:1658da4949d28e5d5f130a4c81e64719fa51f21fec7f607386c0c65ee3af9f56
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu24.04-amd64
     - sha256:a5cc078c125cba11d4fb7ed1f37c56c464f1b6027d72da57fa75716fe16ec97c
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu24.04-arm64
     - sha256:0f590d601cc08443dc9e7bf8ad307c8168fe16014f3fb081e03faae9dccd9bf6

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.19-amd64
     - sha256:eaa354bb89e929642ae56dc36b5bc1bdc182df3ef51403a8d81c031077c321ec
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.19-arm64
     - sha256:fe917fcdfe8a7a462928d4843b2c3969365ef0cc31a60699473e94cb13600b9e
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhcos4.19
     - sha256:8e26c2210ff756a2f56c15c036ff9d2883d26a05e80c371811216cf35e5de352

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel10.0
     - sha256:0a0686621a9fd0235d31303231a33b1e17fd3a3613ebf004b8fc48d672e2ac6c
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel10.0-amd64
     - sha256:b417f1c0997d90725acaf1fc620fee218553f1808ab2658e679a5fd623f0c001
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel10.0-arm64
     - sha256:d2f54c4c6b0e9c175466da75cb122f91086beaa9a1e3f17ee6c007f30da8858c
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.10
     - sha256:ec978f6d345ee0110759eaaced1ec8473301ec3e615612f3c3d4901f07e6c83e
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.9-amd64
     - sha256:a938b06b4173d51e412d0c001221d91971b3e2a71f5056547c12d5b3c257d258
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel8.9-arm64
     - sha256:1f699d7708b3f93b1106ea6499cbc13026650b4dc682f371f5fe2c4f31bd844e
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.6-amd64
     - sha256:c7ae830be74b809cb90819c75d62292d3d0958d3f22abdbf8e961519263aea2a
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.6-arm64
     - sha256:24b9320f29da982b416921c00b38e9921772b9081064c5993a11922590341359
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.6
     - sha256:2842ba37a9493e6310aafd41322e11688c11f653b843635dc97a845884300ecb

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-sles15.7
     - sha256:695c042fd7955f55b31e66c8bd5368fff101e042302aabea30603356d77d4fc8
   * -
       | doca3.3.0-26.01-0.9.6.0-0-sles15.7-amd64
     - sha256:42e9b5f309c4c34863dfd2133abcaee8bd00c270c2c4d75214739b3e19949403
   * -
       | doca3.3.0-26.01-0.9.6.0-0-sles15.7-arm64
     - sha256:0e8d3bf659cef40eb1e7993b214c0860a18508d1f7b63c87d0dae88d07879370


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
     - doca3.3.0-26.01-0.9.6.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-ubuntu24.04-amd64
     - sha256:f9ed77fa9e258c357ebc695609dc56ae631abdc1ef92d19c2095b6e8bde153e4

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.9.6.0-0-rhel9.6-amd64
     - sha256:692366e44922d10c7e4347c1d74d14e01f5d9234e37a001ded085cbf656f4748