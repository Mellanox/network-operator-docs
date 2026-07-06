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
     - v26.7.0-beta.2
     - sha256:b9ff1ef26a46b0a2f63936188d091c91bba2d722177a28908b2b5fc81c6beec2
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-beta.2
     - sha256:6ed8522f058525bce77d7c1195343bf5ec9fa85ccbcfe372a27379ed29cd8d72
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-beta.2
     - sha256:b146d84babd5a5a3b992601427f450839ef1c0a255e221c78f0a4dc61c9eee41
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-beta.2
     - sha256:266ef65a6c30ae6bf3f91fc9286f84af73908d38423bc2b9a07b435e1d4b58c7
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-beta.2
     - sha256:f99b5bc540c9461e513a21025e92ae1a4546739031a61df48bdbd2e40df7f41e
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-beta.2
     - sha256:8356b735cf077e18f89871de380dc7ff5ac519780abc97e8af40c5ffde4651cc
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-beta.2
     - sha256:46d3d653c2865617588d652a04e29b166d0e00e349ecc69da3b0a1de2fbdb8dc
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-beta.2
     - sha256:1b72fb1bd7c16d8abc4520b0992bf9172e79a2ae0df55400077647d1e12850a9
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-beta.2
     - sha256:c201b56fe623b160cad4815c2474de90ee6f0235b4152d6f1e10160c4c33829a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-beta.2
     - sha256:4f62f50e76eb36f3cb12f131fa157bdb3c8bfa4ce578e5b269279c0d513c3c86
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-beta.2
     - sha256:47f5fe4f23fba1c66ebf6b21460b367058388e1c8a2e3bb9cdddaf9c9a225add
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-beta.2
     - sha256:a24ff60145ac66c2002ab1da9ff6f2b23713741e780848dd93cecbf1fe3af910
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-beta.2
     - sha256:30e06ae932448298d5b891690a9e60dea3ac59f7c15ec4531b8190e2b144387c
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-beta.2
     - sha256:e85d6d349b7272e67bf1dadfae1e2731cf1c699b6e1b2b0ac023902e185336ab
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-beta.2
     - sha256:4f6f6594f3a3da9e3560cf286a7bebbbf60791be519172f5762f4c7244a38401
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-beta.2
     - sha256:50e47372ae3fbfa521e7451db3d92edf9564dd85063495969edfb2e7d7867735
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-beta.2
     - sha256:a67be307d3f817fe27fa25bbbb2d72c87a48cbfd5f7f7dee691efc1560da2815
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-beta.2
     - sha256:13de233cfe9f2b97470bb5dc592f2e84f723f7dbd88d3514fc3769cf0e30b834
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-beta.2
     - sha256:4d67e1814c863ac601b96b13267ab41cca0d6949f7f6aa2610003dbc92677de3
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-beta.2
     - sha256:4b2cbc55063d3865c897ca56cef98b196b46b2e8f26d192ec4480f7e013251cb
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-beta.2
     - sha256:b647080917401f0110bddd224988d4135331f6ccf0b4b203d98a28b94b4b9a10
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-beta.2
     - sha256:20471affa4da448ce04fc37f96a7cdb2634bfa6761d1f59f4cca793e136c5ba2

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
     - sha256:f464b3c55ed199b421a2c9f7341a2fbce935bcd6efdd823824b0428ca6e22974
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
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.8-amd64
     - sha256:0e8c9c43c923911dc1144e0b6226cefe4629e17d32a72603bd6d3014616d5551
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.8-arm64
     - sha256:40e7fcc5a30120bc47ffd894075ed79cd35fd0ea81e05147b5300772b8dd559e

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
     - sha256:f4336c9c482cf8472f3f0706f2a919fc7bce2603e966c6f590f0f73e4b009f2d

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.3.1.0-0-rhel9.6-amd64
     - sha256:a4329b4f479cb99dc3dc9a68a99724c31df69674d442017867031f4dc8428941