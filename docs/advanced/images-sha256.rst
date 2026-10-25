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
     - v26.10.0-rc.2
     - sha256:d907164195dffa30681b97c5df10d2d132c1bfe73d973bc95848a5fa8568c28e
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-rc.2
     - sha256:8bcf3bd90449b1c5f9b0c2ffc0835f827fd3d473f6bf299b76b97a27737575a8
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-rc.2
     - sha256:79bab65c74ddd3c6941d0d9ceb564e7d24d793f191c5ed3c209e095e8a6f662b
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-rc.2
     - sha256:89b2661ad6bfe1ef5d96ab3a748ca04cb12e35b5f4b084cec49c04d0f54a6677
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-rc.2
     - sha256:7a3ce987e2d832da7860da7ac55362c96442f7044550cc5eefc2b09470f040f3
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-rc.2
     - sha256:644aa95ca268ff4a0342c62b0f2a15d3d65568b1235eb6421ceb0408513578bb
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-rc.2
     - sha256:08a5c4a7aeb071a6a862d3e6356350f4415e8e231c93681235f88a74c37e80f7
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-rc.2
     - sha256:021aad3248a938e03b7b14858a5d388140d144c2160e54e42c9c9c3b8cdf81bd
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-rc.2
     - sha256:f49e77bb5345d69d8aaf195317855f048bc07216caa21b88139b5a59990b35a1
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-rc.2
     - sha256:b4e5cba9c10c84b6a6589d9c8ee20503143efb7f5cdd39ce03a56efce655b7a3
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-rc.2
     - sha256:0af8aef810ae3c5b2e00ea46f29bd913410348c0e56f04e2db81f36f9999bfd5
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-rc.2
     - sha256:e025843a12b5f4092ab48b37041867db93cf6adfe803c7db8f045731c7a5e437
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-rc.2
     - sha256:ed00110e87f431be3dcf6f0be1124aaa632640ff4c42e8267836d740ac0697fe
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-rc.2
     - sha256:dbe6e4645b03c9bb15c1eb408745301e1945c6ee2a7d8a1811c95487123b5dba
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-rc.2
     - sha256:076031e81da9f3f84cab4e0f4c5c2c9baea31d997a414186494190238e08f5ea
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-rc.2
     - sha256:91ce2f8336cc2b66b0602fbeeed6ca8d6e50fbd5d0e0460312615fb0c525f747
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-rc.2
     - sha256:58265d6ea58c12b10588800c520f51be867b09338c3114420bbd98a0dd2ad229
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-rc.2
     - sha256:c324acc76a0ffb370c56dbfb2fdc7eefadeb780945857f9ed4b78c1697c4fc5a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-rc.2
     - sha256:013560bde2ea449fe4ed63a2d2c3391be36db1c03a96a4470f870aa0808f42ba
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-rc.2
     - sha256:04213ebfecd09ee4cf1fb47853317ce62e36a465fb1a3016c00a6115d5d3b828
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-rc.2
     - sha256:e3b4282f276e3219be67fab36e76b7e4d0453a2c295c150329f74e2efb437dcb
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-rc.2
     - sha256:0e2c6d3a95ae6205cc1f7ecaaf67e7160d67c0f88535315466215d1428c8b8b1

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
     - doca3.6.0-26.10-062000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-5.15.0-198-generic-ubuntu22.04-amd64
     - sha256:f09abfd2ddafb5b81505f7b20e7fb4ce1bc2b82e37c5051daae6b1044dfdca8f
   * -
       | doca3.6.0-26.10-062000-0-5.15.0-198-generic-ubuntu22.04-arm64
     - sha256:edf2b6f2eb13d0feea093f3374b7b639fe63678ef43a4466d6ad9f2bd87e0e0c
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:1ebe8010cb1def76de4166cfd5450ad2ac0429040c6888ecf6bb899fca669e54
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:49f815da2295cfa077f9a498ab77c1734d1944d946a55f86782a6a67b4f8a8d2
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:bc553fac6b04a23b2aefd980bcdbcc9e589b2169de40e4af0cb3dccc90c869b6
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:daf289406afe06046aa2d56bd7801d1225dbc684abcec20023fac6b8f309c28a
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:85624df9378201a2988ccb17dd0296b19cbfdeea340a3bf9ad06f15e8483189c
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:1c5431bc8a4a76922c40f880e1e33abff4d8cfc204b4b5f0fed235f360e5ad55
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:5fd94f0c02fde3b393ff457864f6f110875153eeaf028d4632f04c26b8d8ff26
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:ba1178edc8b79e795ee6834939ac1e89c0c007ef2f709246f77f1b45d46d1afb
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:b80f42a91925fcedb2629465643285ee6c428fdb853176054e85a099cc032be1
   * -
       | doca3.6.0-26.10-062000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:43f92626fbce2391edf7f9a6b442abf0b52f4f7ae50b6e82c886ea4f6dd149e7
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:2c2428d07c77fce5bc20f4440641f9c058bc8c1f63fcbf75d39e4d1601beda00
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:5cf8e5c4ae851fa2d4c400df4d8d1ff3eccaff22f2089d42f5fbac1d834fcca0
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:65fb44c25de1de2a7ebf46a80282746612f07e32823589ddb558c5866c6adef2
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:2f1f9c145f35f2473ee3ed754e10de7ec98975faa7b491e43bf617c57e655b4e
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:a342393da750ab72b9726747178d37f811cc27c7ef67f09cf27ee0609988ff9a
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:5728ff97db81a93a36d111600189efb22eb397fd632317a3a83a6b7430524d2a
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1019-nvidia-ubuntu24.04-amd64
     - sha256:3bb3966b324cef71df90eea9cc4072ad759f4b07377c4fac480bb7bc0366ea96
   * -
       | doca3.6.0-26.10-062000-0-7.0.0-1019-nvidia-ubuntu24.04-arm64
     - sha256:af5cfbf0f66d3a87483915dcbdfafe5a826e6428643f56ab19aeb14d0d3b580f
   * -
       | doca3.6.0-26.10-062000-0-ubuntu22.04-amd64
     - sha256:a8efef6cbf9442157a8e7ecd854f69e481d6f5a06cdef73d96518f2442fa195d
   * -
       | doca3.6.0-26.10-062000-0-ubuntu22.04-arm64
     - sha256:365e85cce95061ece9f4680c6eaa0c1f54cacf0803aa7782f5195ef8c8e8ce96
   * -
       | doca3.6.0-26.10-062000-0-ubuntu24.04-amd64
     - sha256:5cede6b8b8adec1da58fa958dcb958f92b7666e9c5b3b125344cceded7073638
   * -
       | doca3.6.0-26.10-062000-0-ubuntu24.04-arm64
     - sha256:b33ef61f35969798c5f31b45e9166b625e54e196993d18389da7edfe657964e5
   * -
       | doca3.6.0-26.10-062000-0-ubuntu26.04-amd64
     - sha256:03a09590ab71ea1a7e35f239cd7095fd109d7453b597ed8159fc283861544090
   * -
       | doca3.6.0-26.10-062000-0-ubuntu26.04-arm64
     - sha256:3d33e7c917c6ab46515811e7e481063fdac2d383b5efc8f154b9c0e7463b841a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-062000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-062000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-062000-0-rhcos4.19-amd64
     - sha256:431e4e1a47a759c1bdfcdfd172e9ef8d7aff53368d7a53b4592418f31a454ca0
   * -
       | doca3.6.0-26.10-062000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-062000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-062000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-062000-0-rhcos4.19-arm64
     - sha256:598049498298750cc6a2b155c922e38ca5b8afe76a98aad48848a8cdb922dabe

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-rhel10.0-amd64
     - sha256:d2e1191b8bc1af96628edb8ce2e5274e8cf32f63bcd1ccb7c755e800fc84e857
   * -
       | doca3.6.0-26.10-062000-0-rhel10.0-arm64
     - sha256:7bf490b624cc32a70adab58cfe93d49b1a41d68112c18d0ca642e8e750229cc8
   * -
       | doca3.6.0-26.10-062000-0-rhel10.2-amd64
     - sha256:a3175c40bc5daae221973492844fe769d59c8c6460788397d825c6377ecda3e8
   * -
       | doca3.6.0-26.10-062000-0-rhel10.2-arm64
     - sha256:740c74c0ea2bdea3c7aacb3a0149b01def591609d4cb28bc789a1223b0fd4640
   * -
       | doca3.6.0-26.10-062000-0-rhel8.10-amd64
       | doca3.6.0-26.10-062000-0-rhel8.6-amd64
       | doca3.6.0-26.10-062000-0-rhel8.8-amd64
       | doca3.6.0-26.10-062000-0-rhel8.9-amd64
     - sha256:1fb5d8b0b2b9c9cd5b41ae02e87db2e0e9f2d85324c81239370cc300beef5537
   * -
       | doca3.6.0-26.10-062000-0-rhel8.10-arm64
       | doca3.6.0-26.10-062000-0-rhel8.6-arm64
       | doca3.6.0-26.10-062000-0-rhel8.8-arm64
       | doca3.6.0-26.10-062000-0-rhel8.9-arm64
     - sha256:29bb89492ca680d88066a5720734d1dcde303668a724067084eb4be25cc93d2e
   * -
       | doca3.6.0-26.10-062000-0-rhel9.0-amd64
       | doca3.6.0-26.10-062000-0-rhel9.2-amd64
       | doca3.6.0-26.10-062000-0-rhel9.3-amd64
       | doca3.6.0-26.10-062000-0-rhel9.4-amd64
       | doca3.6.0-26.10-062000-0-rhel9.5-amd64
       | doca3.6.0-26.10-062000-0-rhel9.6-amd64
     - sha256:ad239c20ef297be33c520548f6ea9336d64c80e8f0089c48cf56db9075367433
   * -
       | doca3.6.0-26.10-062000-0-rhel9.0-arm64
       | doca3.6.0-26.10-062000-0-rhel9.2-arm64
       | doca3.6.0-26.10-062000-0-rhel9.3-arm64
       | doca3.6.0-26.10-062000-0-rhel9.4-arm64
       | doca3.6.0-26.10-062000-0-rhel9.5-arm64
       | doca3.6.0-26.10-062000-0-rhel9.6-arm64
     - sha256:cae78b2df83c589545af3489d1a4cbddb7b44b748397951428e177728a6c319f
   * -
       | doca3.6.0-26.10-062000-0-rhel9.8-amd64
     - sha256:8844551e9d0f0700f5ec8ddba0fff4bbc523469b3da15e6f7449090654225130
   * -
       | doca3.6.0-26.10-062000-0-rhel9.8-arm64
     - sha256:4aa31681bde8a3432781e361d94648e4f570bab36f91461b14aa420b23ebc111

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-sles15.7-amd64
     - sha256:944b7b999be270945065aaef8d142965041ea26b54c7bfb2ae9a653261cffbf2
   * -
       | doca3.6.0-26.10-062000-0-sles15.7-arm64
     - sha256:2bfb4ec4da81fb42af54f162c82360302815c0f25da27dbebcbd3c34738744c3


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
     - doca3.6.0-26.10-062000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-ubuntu24.04-amd64
     - sha256:4487c1e2d17ec88a151adf8bad4ec27fcb41791804893c9235e45f828b97ee13

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-062000-0-rhel9.6-amd64
     - sha256:a13240f5e8c7237ba303fcc32f4664eddb0cfab7debdc871b6bba9f78c01c309