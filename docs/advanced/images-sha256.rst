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
     - v26.10.0-beta.5
     - sha256:33330595c4a7102d82daabf0d597bf47cddeba191986d6f736a446bca50178cf
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-beta.5
     - sha256:4d3e51e2b2e03f429af98a88040418dddd3911c3eaeca4cfee044d8268c4344d
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-beta.5
     - sha256:bcaa5bc71cfb7180a98c243575f7b2e8567d29ee1fb995c6c0076c546aa13073
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-beta.5
     - sha256:5eb4ed419a4372b16e466747439cc94a77e33bd925b76fc3691603380165f2dc
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-beta.5
     - sha256:eb799ddba203fbdcff6246e2d8604847899bdf3942931d4b98bd3a15a5b6e18c
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-beta.5
     - sha256:d60af20bf2225c67cd4436b18b34ad360c5724fec27b237942c7d376c1015bc1
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-beta.5
     - sha256:055c666a8ea3ec0e728bf6718bc96fcb4a5bad5f824c9a955c29b80d97f791d5
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.4-doca3.6.0-host
     - sha256:57e60407cd7f6e9be4274748e6a118342c18c15819444d940ea7935778c4fe90
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-beta.5
     - sha256:4e4adf04f97623d3000e487cf79c0414603ed216362198c1ad3c45c9f4febbf5
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-beta.5
     - sha256:2fac61186431ff7090bdb797e9dd57e98916483b00e5669ace590a533bd45bc4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-beta.5
     - sha256:df7f6ff0934ec53893e60200c8966c1dc11e65806060b501326bf3601476bbb8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-beta.5
     - sha256:cda28fe7cdfd1178bcc5c87af603f476e72b69c0976bad5e5a6c7dee17535569
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-beta.5
     - sha256:56e0351d173fc59ee19b50bd17e3896a633ff895225a94eac1c0049db82a8722
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-beta.5
     - sha256:334526a75edb51641b32e768b5c1ffa3db3b0b4c626a3b7f93f4170d15408a71
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-beta.5
     - sha256:43105b941c91ac6e00a6dadcaac90f092778c261acfefaae402297fe3074de20
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-beta.5
     - sha256:e7d6c8e611d7529758155829e15f3b564fa8cc72988ed44b481fcb791f6c9dfa
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-beta.5
     - sha256:b48d15092bcfab9c256d6f8eb5c4fa7b64a73284f76f7779f61a4414eb3776fb
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-beta.5
     - sha256:3287b8f30d3a21815f4fe59e6fe3b2cc716d861850c9629ee31d519766efa67d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-beta.5
     - sha256:ed3fef2b30cc3e43a66e063ee538956d9933c25abfb3f8ba781787eb034eec0c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-beta.5
     - sha256:a92f3dc12cdb1e1fa247b07e0a5c0982cdaf89a5bfd94e166adc31db58426021
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-beta.5
     - sha256:fe5252528499a5d901832c04ad858867a5221d12806e251bb00eeff3b3a834f1
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-beta.5
     - sha256:6cb5c0fa34d744bce9fb5ae883cfd102b84fadb8344328bcebb9290ed7c1ca97
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-beta.5
     - sha256:95c2279809ada1b742289b971d04de7c06a747226aa238fe968ec6f60a6ca08e

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
     - doca3.6.0-26.10-053000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-5.15.0-198-generic-ubuntu22.04-amd64
     - sha256:814dfbffdcec02a6bafcd86ad830f220f381f2ed8f68bc4f461963837170362d
   * -
       | doca3.6.0-26.10-053000-0-5.15.0-198-generic-ubuntu22.04-arm64
     - sha256:98a1e1cd0d5187a4c1c4ee7d548d1b7123d85f432f0d88dad1bd803f8958512b
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:edf7a3de7dd2579993f645aeb8e1aedca461cce0c4fdb6b0662bce83010fd027
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:4f8a8f9be1e440e12d86f129c776557b8409f92e12bb5dc872f57521ad0c5067
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:de2a120793e14afc005ec30937ba18408e6a0b678b3bb1c3f82f851745889557
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:93b00f4095bb663e646b5b52914baf1abfc3761558f051287db07e5fdd8cfe90
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:d12e952b48a71993c7cdb91c0d04b80e110240b5ed3bfbdd218dc23d89585055
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:f00d97f6e8dffa5a01aec1d1c9432f86d6503a9840d111326078bfa607b4cdd8
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:b2885e571e2e3298721dbf9772dd7d7c07720b7a09d8e2224f0ab455b102178f
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:833337b0ab5ba8c278fa79186416625fa303f9806400275054cc5ca173917796
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:48e748c2bfbfb8e3f625c669fbb0d6cbe1108d59f045403e8d866bc4e9d063b0
   * -
       | doca3.6.0-26.10-053000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:463bbed458cbb59e40883a10b53b3530757f74ac424af33b66cddced7156afcd
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:ec9c1b7f5a8c2fe8d7d81003492e1906c589b52913756dcd059e28a78700017b
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:1bb6cd392a18e3d3875c1daebd7e02fafd72f5f8fdc6fc727bcb3f26ea67918e
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:024459f8d1672225d7a07c8ae899b81de72b5bacfc8c87cee8446a923173001f
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:384a18b7b93cfb54b265233962d0bdc9f90f805c7f619bdb21d13816c105c3c2
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:b342432e123812bc66833599034fd9bdc55a331030a1fb4a243a4cefd1b4acb9
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:ecfd12df5aa4e94f40b1d1aafe8a1764a49121ab0389a0be74f9bfcc03c93763
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:8e72792512e83c5ba13f22a3d67fc1bee12603d00f4d8dcdcae3bf8165b7bde6
   * -
       | doca3.6.0-26.10-053000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:723fc4869a4979bb8281e1d9fd840003f4bb4e0ecc8d6d5cd64b6f77fb19be25
   * -
       | doca3.6.0-26.10-053000-0-ubuntu22.04-amd64
     - sha256:3854766bff5222f10a28de41a18069daaac325c75c2b5cbbc63e0bee3a15cfd1
   * -
       | doca3.6.0-26.10-053000-0-ubuntu22.04-arm64
     - sha256:a14f79b2710962e40fad7369e819e0686c77df02bea55476f20312b88a0d3872
   * -
       | doca3.6.0-26.10-053000-0-ubuntu24.04-amd64
     - sha256:2066d460d1dc246665885131d6c1cd31c15d5a801510f36e089977aa38d246e5
   * -
       | doca3.6.0-26.10-053000-0-ubuntu24.04-arm64
     - sha256:ea9ff5d4e217ecc65bb01d0c7ddcc91130a27fa2aa49fe5d6eec3b818adbbf24
   * -
       | doca3.6.0-26.10-053000-0-ubuntu26.04-amd64
     - sha256:334c9c4717f02ccdf8db29142706f7fafe8634018b69fbd5f6c54d1e217e3318
   * -
       | doca3.6.0-26.10-053000-0-ubuntu26.04-arm64
     - sha256:f0e31ff352c72dea21cb37866474353aae560e9e0ded017ee43226dcf4f2b34c

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-053000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-053000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-053000-0-rhcos4.19-amd64
     - sha256:d5db679a2437200fb9070325d80d95ec302085840bd64fc8ea9a23973260c306
   * -
       | doca3.6.0-26.10-053000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-053000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-053000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-053000-0-rhcos4.19-arm64
     - sha256:76e969e3312ddc5040c2c1d5d687f10210a5ec7e3c9cc2412b0452987a668794

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-rhel10.0-amd64
     - sha256:48426b0296a0bb1517cfec1926e405efd370de1809529675d6e43260a54777de
   * -
       | doca3.6.0-26.10-053000-0-rhel10.0-arm64
     - sha256:7727e5a65fa81510a49f50045bc2df37a89faf9b4bf4f61bf657a32aa3dcc9ef
   * -
       | doca3.6.0-26.10-053000-0-rhel10.2-amd64
     - sha256:a804d934dba82917a850ae40f204e46de9f54ae8dd2d6fba87416b7944d2efc1
   * -
       | doca3.6.0-26.10-053000-0-rhel10.2-arm64
     - sha256:0e8e31ee12671751d1c33814e59dd3b24f213c17e0b3509cf7306f1eae75a3e5
   * -
       | doca3.6.0-26.10-053000-0-rhel8.10-amd64
       | doca3.6.0-26.10-053000-0-rhel8.6-amd64
       | doca3.6.0-26.10-053000-0-rhel8.8-amd64
       | doca3.6.0-26.10-053000-0-rhel8.9-amd64
     - sha256:4de8ca1eb8e17bbbe09a08427731d1ac578520a92c8782ac544a60462ea03b0c
   * -
       | doca3.6.0-26.10-053000-0-rhel8.10-arm64
       | doca3.6.0-26.10-053000-0-rhel8.6-arm64
       | doca3.6.0-26.10-053000-0-rhel8.8-arm64
       | doca3.6.0-26.10-053000-0-rhel8.9-arm64
     - sha256:de9d13dc31efdaa5e4cdd9fd25f9e1d16432b6ea839e20d9041709d988cb3840
   * -
       | doca3.6.0-26.10-053000-0-rhel9.0-amd64
       | doca3.6.0-26.10-053000-0-rhel9.2-amd64
       | doca3.6.0-26.10-053000-0-rhel9.3-amd64
       | doca3.6.0-26.10-053000-0-rhel9.4-amd64
       | doca3.6.0-26.10-053000-0-rhel9.5-amd64
       | doca3.6.0-26.10-053000-0-rhel9.6-amd64
     - sha256:6dfeeff80935b44599dd7dd8da1e535fdb1074567a4df1f424fa51a8f2ceeb80
   * -
       | doca3.6.0-26.10-053000-0-rhel9.0-arm64
       | doca3.6.0-26.10-053000-0-rhel9.2-arm64
       | doca3.6.0-26.10-053000-0-rhel9.3-arm64
       | doca3.6.0-26.10-053000-0-rhel9.4-arm64
       | doca3.6.0-26.10-053000-0-rhel9.5-arm64
       | doca3.6.0-26.10-053000-0-rhel9.6-arm64
     - sha256:a1e30e013060a4beb0b4eba6b2c259dd7884c9ed6dacf4ca0d1c44f8eafda750
   * -
       | doca3.6.0-26.10-053000-0-rhel9.8-amd64
     - sha256:c75148ce1e6d18614e35e30207bfd88930a85e041d71f6a95797d5c1aaf41a29
   * -
       | doca3.6.0-26.10-053000-0-rhel9.8-arm64
     - sha256:7923d5005efce60af0745f866f63a6150f2641bc78eec1c6303a2c26686d05f6

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-sles15.7-amd64
     - sha256:3af8bcfbabcca52eb7ac08ae4a09872ce42c1f1bee15473e287086fb7dd28ec5
   * -
       | doca3.6.0-26.10-053000-0-sles15.7-arm64
     - sha256:f82cdab86c23da3a6b94f0d5622942128104d51ae50067bdb8778a89dbd7c28e


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
     - doca3.6.0-26.10-053000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-ubuntu24.04-amd64
     - sha256:9e1ac1c5e3001732bbfe5f2f0c7f685daa30c5fb0907666703f47f25a6617ba1

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-053000-0-rhel9.6-amd64
     - sha256:159b09cdbeacb4e031768c9ee9e151b86ede4dfd3c55a1dfa1340d0343849cf1