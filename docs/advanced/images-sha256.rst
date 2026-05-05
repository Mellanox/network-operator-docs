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
     - v26.4.0-beta.7
     - sha256:2b0799e95077360e1aea904885af637db6def7990e94b62b94b2668fcaf40453
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.7
     - sha256:b1f53e41e3e25b9d744d853b37715d62bc61814f47ff8507e044325f4fd3540e
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.7
     - sha256:cab2d6ba598190db3f063022296b1b210110fccac7975ca536b15f0975cb1fb1
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.7
     - sha256:957a2dbc199f2b94f0391607d1f986aacafc48a4d83e98ed7a2fc453aa84866c
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.7
     - sha256:3e7287b4b5be2d69ae9fdc9f0cfa807b64c8fd721b6165e8c0ad05218217d13a
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.7
     - sha256:871c8018a30a65901c210228352fe48aad735d2c477619a310fbfe62bf71b62a
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.7
     - sha256:f2c2d8169da66b03c2b1a254a3564c7ab09301836830123317a65933a1458fd7
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.7
     - sha256:f51891b83c67d8083504b7a57cd48d7e65f4271d18ea6ead4839f4c7be380915
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.7
     - sha256:234ad6627826d1309e2e28ebfa796cfa197d61c02f4eda964a072bc222998b2d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.7
     - sha256:0a4d633fb60ec86c124827af0dd51b82e1d8d9591242c2db2195c735ff3c336d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.7
     - sha256:4b3c73708289807bfcf037a823d24a5e794f890388b1548b7cd0bc6209054611
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.7
     - sha256:117470e1c06567345b04d6dbb913d431f1abbae8c8abb6e89f955eafce125968
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.7
     - sha256:bb98732fe5316e6ebc8e9a6bfc9dd11c258658e1ad8cae890c30f3674dc462f2
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.7
     - sha256:94152febabbe3afee32a82d7d05f6ae7b74a2b9fc1a142b388152742d97d1c5e
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.7
     - sha256:6276f1582fe5be4bdc27fd106bb65c9fd0c0060cd5bbd20b7191cc24012ae246
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.7
     - sha256:042a655966fae1f8b0e54519e7d28ac78fa15790115f0442a1165f0cb87244b6
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.7
     - sha256:6a9f37ab30df847f754a8aff33bc0dd77028909a38489e35d8bdadb0c3ba7e9c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.7
     - sha256:ed9565a1a99c111f7483608a4902e1b9a265f732bfb08a249f96f8d052183642
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.7
     - sha256:ab4e59a5cf76978bdf4cf807d282731b8f1dbfcb911bb5082813bda197e42e68
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.7
     - sha256:1c5ba72724982d471417365f39554b78c12916a387b59672e000f3ecfb3ec7f1
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.7
     - sha256:2fd53765ca7d2c535738d1b4f47c46b3843ab03bf08ac36c5128f253cd4d8cd3

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
     - doca3.4.0-26.04-0.6.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-6.8.0-1050-oracle-ubuntu22.04-amd64
     - sha256:1d44b23f3aeaeb7c4e5277ca847054630a3dad0e44307dee5db646a35aac7f1e
   * -
       | doca3.4.0-26.04-0.6.1.0-0-ubuntu22.04-amd64
     - sha256:28abaedebd9b41bbb925b2babf9a1432e13bd25c2c5eb95868d31301f7810edf
   * -
       | doca3.4.0-26.04-0.6.1.0-0-ubuntu22.04-arm64
     - sha256:66e17596e0a1c5709e65ddd3a1316fcfd5a1cf8ed4e85dd6e767563c92a47d37
   * -
       | doca3.4.0-26.04-0.6.1.0-0-ubuntu24.04-amd64
     - sha256:aa6d09e70b4f81f2b9cf6a17f006a74521eb985043c197ca6155b4bd3e2cc731
   * -
       | doca3.4.0-26.04-0.6.1.0-0-ubuntu24.04-arm64
     - sha256:a4610a110da1a465ae98f84af63d5f26c0b08b05f990295d4d941bd1db68b8e4
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-5.15.0-177-generic-ubuntu22.04-amd64
     - sha256:ad8ed320f1d845b127abfe6cf88dc512f46bc6357c207080463654c9c4c3f00a
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-5.15.0-177-generic-ubuntu22.04-arm64
     - sha256:f66814d5ce59e7872bd79cc59249c3097ed2b4c5d7bae928ffe1308a8791e8f4
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1011-oracle-ubuntu24.04-amd64
     - sha256:24083b10b91490c2a2a5fcbbf604e500e9c68d95e371473984d57bf95fa929b4
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1011-oracle-ubuntu24.04-arm64
     - sha256:039999a1a782c360e83307e26147bf6d7a0996d13ccba44a77107e6893ab7f35
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1013-aws-ubuntu24.04-amd64
     - sha256:3f84bf6a68b60ad8648025c8ffe00737f969ac791e8164e421e4027c7ae0e075
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1013-aws-ubuntu24.04-arm64
     - sha256:be11eb84d97c3b65cb203a6f1fce7ad29649d2bd167f10e67514303df1ba661f
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1013-azure-ubuntu24.04-amd64
     - sha256:e5832797afa12f204db0834cdd233da4fa1274c16253ca1887ca2f67eeddba32
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1013-azure-ubuntu24.04-arm64
     - sha256:0f953caf1780389a88406012a94b58998e71bd3a21a2e945746d291e1f19f967
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1014-nvidia-ubuntu24.04-amd64
     - sha256:50392b68b980f1f22a347e79d1f8473f0976291d1b86828a5c847c24ebd3475c
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.17.0-1014-nvidia-ubuntu24.04-arm64
     - sha256:ba4ccaa999bd973d356036a2046f9952782ea3cd622d2957e668b0c2c4a2e78b
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1050-oracle-ubuntu22.04-arm64
     - sha256:36b32dc4068684b0954d4ed7595103a54013e91d751c9f2bcf756b65bb2f61ef
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1051-nvidia-ubuntu22.04-amd64
     - sha256:1a955dfdea237042439da28e27a361cfea9aac55d8ac21975fbdb086fd404d75
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1051-nvidia-ubuntu22.04-arm64
     - sha256:8ac5100258b5e18e7046fc00895b717293e0140f5ce60516133efaa949bebc46
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:c81843ef22905831db5e0be9283cd22b203c5cdae9edf8685dab18a2b9e8991e
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:1f652a9cd33515eac93f1881113a96767a29f8d191b1f44725c2b16ef62c6a09
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1053-aws-ubuntu22.04-amd64
     - sha256:f3bb4c6a8c662104d80669b88ac1f7dbf0e98e372812752ea06de14bd484a80d
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-1053-aws-ubuntu22.04-arm64
     - sha256:19461df8dbc6e9b42681b567be3b74e486df1aff4fe5f13c3e9aef8b57fa40c7
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-111-generic-ubuntu24.04-amd64
     - sha256:89d8741c2fe459c0dad1fb047421aeb083d8c30cbf8ab4321bd573a4efdde973
   * -
       | docadoca3.4.0-26.04-0.6.1.0-0-6.8.0-111-generic-ubuntu24.04-arm64
     - sha256:8d6bf16fb98326bd8f9710e2c99f69c936db1ee1aca23bf97f74aa80d2178a6d

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.19-amd64
     - sha256:5d51b7857bf97fe391afcb50720eb7f9eba3c17f084fa4a1a2d9d87cfccc7329
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhcos4.19-arm64
     - sha256:37da8adb7b6f6f8badc43a145ffb46919e2679cfc83c74bcdd34d7de247613b1

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel10.0-amd64
     - sha256:4049dd0e954a6d0691d0c4a710b0edc8e5435dd881a8e4c86c50f85f6fedbf6d
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel10.0-arm64
     - sha256:7a46ad582ccb458b8be549972c281358976c1f7d88990fda5be28a65964f184e
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.9-amd64
     - sha256:09c4f6c27526f5771e3f0d6b2e30b55c3ebafe427634136928ceb5c2bfbf6106
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel8.9-arm64
     - sha256:c4354733f711f049d71a414871f199b339239021b0da32ea0424557ebcb3519f
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.6-amd64
     - sha256:78e42a17e7f53813c65c146723310dff6a2fb5aa103fbf53d1a0427c1301ee80
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.6-arm64
     - sha256:8d9163296e10caebdb5235873d7301ebc4db32c684d9805600f38f3666931281

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-sles15.7-amd64
     - sha256:1d427bdf0d2d8427ca74c2e13f07172476b871d2315449ec5ee4fd30e26c92b9
   * -
       | doca3.4.0-26.04-0.6.1.0-0-sles15.7-arm64
     - sha256:09115eca0ba3ee6567de9219941189ee5bfa42037c5cffc2398fa1a2464ca47d


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
     - doca3.4.0-26.04-0.6.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-ubuntu24.04-amd64
     - sha256:03a52329a85c368ae66ff1b425ba69b26936c2573526806709b88c279db64bef

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.6.1.0-0-rhel9.6-amd64
     - sha256:5347ef15f6200be8a901ece5afd39aeac70aedc0bc124774d9aa691618c701b2