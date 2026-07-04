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
     - v26.7.0-beta.1
     - sha256:17221cc8d45c997e4ae6059e706cc9c5ded536f8ea0497a367e93a2c222803e5
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-beta.1
     - sha256:a1fb65d3a7ff4a2b606432fa4bc3f8cf6120828f5734bfc1799c36c8f976b7cc
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-beta.1
     - sha256:cfe8a08017abc69670a68d51091b3529a622dc33d9284e10df82c9cb559662dc
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-beta.1
     - sha256:74139076895b8f8dac69551ef5d64af845e95b13bf231f72833e692109884420
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-beta.1
     - sha256:ae23d20f7f76c0dbe7a46bdb1e434f88113dd685fe01a0d06c944c0fd850ed18
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-beta.1
     - sha256:94bcb565575c4917fcaf3a6563c5372d9ca4dafecdc5b57415765284575f7f05
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-beta.1
     - sha256:7b1370853e66f0971fc2407c24c28b8cd31399581095c368143a1f6f0f38b312
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-beta.1
     - sha256:4ee2ba0af9a76986054f905c95b5f7d7454376817b10dd47631838efbd81162a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-beta.1
     - sha256:f25b509556d0c57185f63c2d6fd1fef02ea75734972870a620327ce3447ae364
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-beta.1
     - sha256:e713902bf90d0e0305dcc937c7864e50e0a65332528d39a6a4afe7dc46d2aa80
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-beta.1
     - sha256:6ab6483bc3a694c5fed58a9519d09ddd62bc1e2daa0f27a46f1ad25476bd0b39
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-beta.1
     - sha256:65acdb1805ce2d030c686d196ac16c5e51c443b568789a41122c7f0529056426
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-beta.1
     - sha256:93e5a57ccb57bae84dc07b9fcfb953bc0b397b967f1a12363f665b1f4d375bd7
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-beta.1
     - sha256:4eedcb047be94c2998d92cda3e24f9f469e29ad16dbd56f135bad271f9b1c55c
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-beta.1
     - sha256:ca23f6f44c4084126634e2abb0e23cdccbe2ee55b033a899390097483d94148d
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-beta.1
     - sha256:71a2c94dabca92dfcf89363a84b05afed38503435e5936ce32d45b8b15e29f80
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-beta.1
     - sha256:5dfd26da20b5f2a1d31485f9d7ea0cd271e33f95fc2a2c0548818cde0bb6bc39
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-beta.1
     - sha256:3118815a5fe0ba45ccae4895fca218bbacb8b9abf930e378a81bbd338afe43e2
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-beta.1
     - sha256:f0da3f0cc04d2dc0300a6ddca6e6f8465f329facaee1ca9d66f7a0253c7c36ff
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-beta.1
     - sha256:6e8a0fcf5ebc0f83b0763ff9cf8c2ac6c38e78c6f2c1ae4b4f774e95f4286c02
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-beta.1
     - sha256:ebd25acd7ada071aeafeeb6265357c2627555925fd108105b1e43709f3eea8dc
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-beta.1
     - sha256:ff69f23168d5b28cf411876c439be1a7a4ee9d85ca46c9978d23d96b88216130

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
     - doca3.5.0-26.07-0.3.1.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-5.15.0-185-generic-ubuntu22.04-amd64
     - sha256:b09407c8a79b5a9afa40d6710f7d28b5f3f10560729a3fcf9d7b276a7f0b2cd2
   * -
       | doca3.5.0-26.07-0.3.1.0-0-5.15.0-185-generic-ubuntu22.04-arm64
     - sha256:1b1275e278c633f7ab174b2a08359a1ade7997ae93de716d0d68dcfc3c80a1de
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:0af7a650fd7c421b04f62a6ad7d1760cf81a0cf90f64e9b8c9d666deb6f7abe9
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:5f016902542ed48226bbcb02fc2175333bf76bb154fbf5588e1f23e9164bf021
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.17.0-1019-aws-ubuntu24.04-amd64
     - sha256:54cb247640d238cbbe4c4631d5dcf43004916bdd2762def7c0da150ad4b8fe01
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.17.0-1019-aws-ubuntu24.04-arm64
     - sha256:4c46d62c5c3231f15ebf4e0f2b010246263d64dda17e3c175771ecc5a3fb8a99
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1057-oracle-ubuntu22.04-amd64
     - sha256:dbabef6065bbeb9a872cf1414dee18fb3778f95fbe487d992081ebfcf0e2ee97
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1057-oracle-ubuntu22.04-arm64
     - sha256:b2af1119f796ae4ac9d9a87d299a8e47427da62fd84a454e645eea71046c3680
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1058-nvidia-ubuntu22.04-amd64
     - sha256:bf50676ecd49a1acf536d87422a72eaa23f13dbc22af82279c63f47864a28e16
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1058-nvidia-ubuntu22.04-arm64
     - sha256:ac258068a34b9c0def9e0b5f42b79b7d39ea38738e783174b2ddeff7decd799f
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1059-azure-ubuntu22.04-amd64
     - sha256:ba6a64b0eee9be9eb17565363047bf0e5f53de26c07d9106cedf877aaa2583c0
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1059-azure-ubuntu22.04-arm64
     - sha256:5da0534b33ec8225a23aa2bf2d11bd19c16dc831224ebebb5c17f2d790902214
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:349d00e2fc0710d5ec54ea4e3f673b502b104d71ccf43f92d6aa3ca805c4941f
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:847b77b57b8e7c91d010d28143360964844d0616af75570fa9626e2d8e70a8ea
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-134-generic-ubuntu24.04-amd64
     - sha256:86864eef3beea1f60557f38fd329ae29cc1decf125c904b988edf109bc660869
   * -
       | doca3.5.0-26.07-0.3.1.0-0-6.8.0-134-generic-ubuntu24.04-arm64
     - sha256:4af3bd3fd947d115b7af880537a8811b2117974b679daf4212c792d0e2f9f9f8
   * -
       | doca3.5.0-26.07-0.3.1.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:c451ebad0030da4c98b2bc8a3af46bf13c7d41149ef3d5035bf691480a52fd0d
   * -
       | doca3.5.0-26.07-0.3.1.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:9b6e16d9c80ce890e0a44ad0767ea3408f0929ae51fd2d3fba5ee3f6b867f253
   * -
       | doca3.5.0-26.07-0.3.1.0-0-7.0.0-1013-nvidia-ubuntu24.04-amd64
     - sha256:838a0655731df191f2023c1f409007bbabc825eafabfc6b14135628ea2534d7a
   * -
       | doca3.5.0-26.07-0.3.1.0-0-7.0.0-1013-nvidia-ubuntu24.04-arm64
     - sha256:ec96021ab0d652442f0a538a6d62faf23f7c4288285d50648ef6ff1099c8b165
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu22.04-amd64
     - sha256:694097dc04f68a4d498fdfed23d06801bc7042e3f2dd373ad5c9685846fb32e1
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu22.04-arm64
     - sha256:bb9cfcb9fbe17a0423606710b1d50f7859ce14eec537cebb4909320a623af872
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu24.04-amd64
     - sha256:d8c56e70019d67d837b09dc697557bcded41afeaef5182eb74cbe0111a21ae50
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu24.04-arm64
     - sha256:f53f4594f6f22d6cc599ed54178ce7b73fc695e0d61e59b7e112b24812c02e2a
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu26.04-amd64
     - sha256:53b6fac2c1ec99881535ebbaacf4d923a9b30d53f3efaa1975f7b0a70b67081e
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu26.04-arm64
     - sha256:2e295e6c8decc426a9e448dad4376238f3fe7abe6279642c9304a1a212a90a7a

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.16-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.18-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.19-amd64
     - sha256:064ffbf37958b1ee0302af2f838879000dfa6ad6296d39d877768901eb4fba8c
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.16-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.18-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhcos4.19-arm64
     - sha256:4da3eade3400f6ba82a2d52839dd485c473a0f8e2e32252d7cb532af4a315772

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel10.0-amd64
     - sha256:56112fe30a0e2755390928cb577affd0b4a2d4e4392e0c7facf17af3a9e9c28c
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel10.0-arm64
     - sha256:d3af117785c123dee2e7363d0ae34aebb99ddc699712ccb10a5b2dcd3825d04f
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.10-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.6-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.8-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.9-amd64
     - sha256:f734ba0d031cf3655dae32fee476968b00cceeb23a0c69154dde8a9b081147dc
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.10-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.6-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.8-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel8.9-arm64
     - sha256:56bac6374c1c1ffc74f9038eafab6a58205fc8ade0be56dc6b0cefeacff7cdca
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.0-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.2-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.3-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.5-amd64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.6-amd64
     - sha256:dae5176cb97fbfccef5a93166c72ae7ed68adeae99da452414c5e107783f40f7
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.0-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.2-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.3-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.5-arm64
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.6-arm64
     - sha256:d2360bbcf15aee0e17661fd0ebe0cb25de2b07b22c7efce2abf0dd33dbdb67dc

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-sles15.7-amd64
     - sha256:3010d29c83af6c42ca51b6a0f207d7641b7048aa03f3d208404623bcd981b4ae
   * -
       | doca3.5.0-26.07-0.3.1.0-0-sles15.7-arm64
     - sha256:acf15d62b690f85b762aa9eae258e075a6890d10d2a01043b51acef5fd9bb154


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
     - doca3.5.0-26.07-0.3.1.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-ubuntu24.04-amd64
     - sha256:8b67b1c44b3bd88ec0539026268a9d3980459b6af638bc3f273d510c18525c7a

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.6-amd64
     - sha256:0be9bfb7b55d03cc32ef275bd86a94d222633fe5044a02b02da6515d3dcacdcb