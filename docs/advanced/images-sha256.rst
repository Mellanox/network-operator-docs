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
     - v26.10.0-rc.7
     - sha256:5178403caae2108ed5cd78b8c4dc9e00d2cbf1f188de07da2035ee1b621c5a56
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-rc.7
     - sha256:7315242c6f99590b0a857359c140279c885005e7469f4bd192c02b49cdf12494
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-rc.7
     - sha256:52ef54a3bcfbd9b3761c37e2058aa8f4a22cbd5d3b98175ad10271a063589d76
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-rc.7
     - sha256:6333357ed1b79f7194e2fcabec8714acb927b6cdfb26f58ae36943510d793306
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-rc.7
     - sha256:07169a8b5905ed36e7aebfb92bc5af0c5d2ed6280786665572df7a6f3a7e7a84
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-rc.7
     - sha256:a7478a3f7aa06703fafb3fe315ef502f47d196e0396d68176d1d12e0699a3ebb
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-rc.7
     - sha256:c167b1bfcb140a4daadfbbd7f73b451d803ab63fdbe092d318c689d49d5a3d1a
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-rc.7
     - sha256:8422734e2ca469e4142f00603f9c13ddf5c2857dd111030b76aaadc8fadbf73f
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-rc.7
     - sha256:330fe11bfc8273978d642f09be2195fb596960c50b9dc719fa48812bc3ebf588
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-rc.7
     - sha256:f430439180bf77da5727045a283aac2799e23f5253e8b058567b5775aad08f72
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-rc.7
     - sha256:1d545a7359a1986471ef5bec3daae2e79253ef53e8bdf474d3dad51e49378e0a
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-rc.7
     - sha256:809991d98f2b66c01d3523a93e63fd5f8ae6e05b4b0e827d3b4b18fb85a8e40b
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-rc.7
     - sha256:12b296fce6a3961c7080b8273da11cedf6f9964245243e104a61968b5c17ec88
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-rc.7
     - sha256:90fa9cf755a285e835f5f47dde3f7f50665b282891a3b8ac1f970ce71ac8bc95
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-rc.7
     - sha256:bcbfcf689bb2404cc83e8826cc2d985736f26cbf08b35012a766a4888c355f01
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-rc.7
     - sha256:8a6ea52f3bad6ad090f0569adc3ab6d3554109b9f7707d40e41b0c212bf45ae6
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-rc.7
     - sha256:116b192df735e576b381db275e93cee3d2d9a556cc8c90ff24f5c9dfef0dcf44
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-rc.7
     - sha256:75242767cbd0e8f2e1efce94336e2bca4894868296a29e9bbf2e3b04db0b3863
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-rc.7
     - sha256:23ad54db212c1c6ec4447518abd1d340f202f221edbe282b1f4e441e7ff8a502
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-rc.7
     - sha256:2cb55d7f7f4262c7f81c07fea05f8004fcc879ab330189970931e2f65c20a355
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-rc.7
     - sha256:07bdfc821e3d4e7d4fced2cd589915e846ed24ec22feb6f30e4576e315db471b
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-rc.7
     - sha256:3bb35cd9afc6733047cc9099a3ab2383ec37b6d540b88710f354380675c5ff5e

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
     - doca3.6.0-26.10-070000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-5.15.0-202-generic-ubuntu22.04-amd64
     - sha256:f84c41029e0c1fd3849d62f5f37a966e79a9d929285fa6144b03fc147eb0a981
   * -
       | doca3.6.0-26.10-070000-0-5.15.0-202-generic-ubuntu22.04-arm64
     - sha256:72dc832ce58a54a5f67439d0f26f3fb7db9124955d14419afde863674d670a26
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:e124f4edb0f46bb5c286adcdb8056c421110c16766c927672f9929cead288083
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:cb42808e9dba0f504dbb09b7d87ea437aa40be0c231a6255eccabf3eaedf0c2e
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:2d3d3f8770b4eeb845e06046036c16010f565b83e00e0b9bf13d4b7938cd2f56
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:3cdb9d42f5744fbbfadff7d44bcbe1935aac1e7e72dd1b0cb30be9f56080328b
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:1071a7c37efa42ae6ccc21746cad5518a2a1e8b61253a52b238d0f7d6985b097
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:ee8a234eaf0b3bd868778d1103b4d77be9e950c96e9f6d97e8adea578eec2475
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:2ecaa89f39c300a850d9682a74c26096a2c8f06dfb27a2ca1b81bbe9c9c08c12
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:7b6d7fd1b7ab33ff4fb31ca9871622e9a8ecc5737cb6719722a263cab879901e
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:a173cd064c725541bcf264300d3626176e49fddb8ef39df45d0801d953f8d5bf
   * -
       | doca3.6.0-26.10-070000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:8c00d2ccc14d2610c77fb73550a59f449db76c6e6d9be56784ba9a84db6bfd33
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:6c1fe86ea7616150f214d1a2fb4821faf6576e4a5d3c3b5f4dc414e58e6e3f03
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:0ea3712dec8889f95dc2c075f055cbe0f106efcf3cf4a4b651e7442e0cd582ff
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:a29d8a19671b4a15256e203b93f41b616417d2c5b8438ebdc050816ae668713f
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:d9dbc211eff159fc46ddba9a10074b09daa2f8a3fffbbf30c3446770782a6767
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1015-oracle-ubuntu26.04-amd64
     - sha256:e4c8b25a2818466f8e08652966b9a8a9dfaaa55b3a1f9371682ab62cbcae643f
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1015-oracle-ubuntu26.04-arm64
     - sha256:627416347f0a114c89995f0aeab680f56463a946f037745ac8d6673e288e74ce
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1016-aws-ubuntu26.04-amd64
     - sha256:0eaa56d904d56cf2484d1ea4cf04b44fdab5fa07a1db5e3dd0c74ca722c441c3
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1016-aws-ubuntu26.04-arm64
     - sha256:88475380b20e2c43d241ef0cdcc18e137c699fd165410800e651afda74982e8b
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:b8aae9b4c25cfb0ed3354b20acd15cdf8942f10a53afcdacd22ab69fe7eaf317
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:06151c7b902d31ce5a587ffc8df2ef88a477c52b644c42e0505661c8b6ade4dc
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1018-nvidia-ubuntu26.04-amd64
     - sha256:4850b6fb28aec88ccbe7a60161b0e32c47997f9b8075d5e72aa0299afbef5cfb
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1018-nvidia-ubuntu26.04-arm64
     - sha256:d0a795acf0c6ff7075df333846ca7bdf32e3f248b1e4837c547d62bdf87a01b7
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1019-azure-ubuntu26.04-amd64
     - sha256:7a53244077b540d032de2e3d4f73105b9a41f90eafe7fca4c75525e49a9cf1a8
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1019-azure-ubuntu26.04-arm64
     - sha256:5ea5a108a98ed814802114c051ccc56783f137c53e3a854380f81c11ded4af87
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1024-nvidia-ubuntu24.04-amd64
     - sha256:d541e8ab6b340edd57588c61f833f088bfa9335c082402f2156b4eaef766579c
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-1024-nvidia-ubuntu24.04-arm64
     - sha256:9f2c7722cb99a0b2642dfb161fa7dfe0dd47a235d017dd0197a2db7ecd9b9ab8
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-42-generic-ubuntu26.04-amd64
     - sha256:b4340f95015f25796900cd46488301b9d964e31a0c859bf48bd91a0420078205
   * -
       | doca3.6.0-26.10-070000-0-7.0.0-42-generic-ubuntu26.04-arm64
     - sha256:70bd2c88297256c24f47ea420b11411980f1bf9a8f20fc5fa61220e22a208be5
   * -
       | doca3.6.0-26.10-070000-0-ubuntu22.04-amd64
     - sha256:6d11ecb689b5bd5fcc9b349617526c717040f73be4a6b4e8df92b5e29a800566
   * -
       | doca3.6.0-26.10-070000-0-ubuntu22.04-arm64
     - sha256:7d52d15f06f6eebcff297d018ede778590ac950ab031eb7776b7f20b909272ad
   * -
       | doca3.6.0-26.10-070000-0-ubuntu24.04-amd64
     - sha256:2cb204cf540c9c44157bea806968c557b9d4f60c8dff24a77814393ed1ba43ff
   * -
       | doca3.6.0-26.10-070000-0-ubuntu24.04-arm64
     - sha256:14df4ed940bb2e04d672c681551caedc6538bd46a684ea9a6d910103cd3fd5a9
   * -
       | doca3.6.0-26.10-070000-0-ubuntu26.04-amd64
     - sha256:e38d4774a9ced893b63a5f4e76f4b803744a7a95b9af3caa05b95ede4b09e6e8
   * -
       | doca3.6.0-26.10-070000-0-ubuntu26.04-arm64
     - sha256:c01b2a30ce11afa87c234eb983a3a8cdcb43f1e209d8edb540319067c3361a60

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-070000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-070000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-070000-0-rhcos4.19-amd64
     - sha256:099c18f886a71b1a3b938f021668179f1dc23cb02dd7dac370814968c2d09693
   * -
       | doca3.6.0-26.10-070000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-070000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-070000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-070000-0-rhcos4.19-arm64
     - sha256:878a9cffe215f23bc0d757afabd4ca448cb8727298f09b7d992f2fe90969a903

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-rhel10.0-amd64
     - sha256:cd0eec194f83b353c447deada04271a71d39effb4e933720c4d853e197eb70b0
   * -
       | doca3.6.0-26.10-070000-0-rhel10.0-arm64
     - sha256:8569c43d657189114a66e163e555976a0d26923a787783188bb6b8f8c8bd6c56
   * -
       | doca3.6.0-26.10-070000-0-rhel10.2-amd64
     - sha256:52c8666cd8bc0034cd3257973039a1499bc13d4bb242331f2090bae424655a28
   * -
       | doca3.6.0-26.10-070000-0-rhel10.2-arm64
     - sha256:e8201e92dd4b485ecf3793efd17c531a8fdd5a75b347177668a6cd0271d6f23d
   * -
       | doca3.6.0-26.10-070000-0-rhel8.10-amd64
       | doca3.6.0-26.10-070000-0-rhel8.6-amd64
       | doca3.6.0-26.10-070000-0-rhel8.8-amd64
       | doca3.6.0-26.10-070000-0-rhel8.9-amd64
     - sha256:2532d8c7407dbf01b24e0c4281bb748ce06c33ac2792edd29c4d31174a179d28
   * -
       | doca3.6.0-26.10-070000-0-rhel8.10-arm64
       | doca3.6.0-26.10-070000-0-rhel8.6-arm64
       | doca3.6.0-26.10-070000-0-rhel8.8-arm64
       | doca3.6.0-26.10-070000-0-rhel8.9-arm64
     - sha256:4683e6acdbbb453378edffb5ee3d9104242ba5e79c411eb5054349393eccfcd8
   * -
       | doca3.6.0-26.10-070000-0-rhel9.0-amd64
       | doca3.6.0-26.10-070000-0-rhel9.2-amd64
       | doca3.6.0-26.10-070000-0-rhel9.3-amd64
       | doca3.6.0-26.10-070000-0-rhel9.4-amd64
       | doca3.6.0-26.10-070000-0-rhel9.5-amd64
       | doca3.6.0-26.10-070000-0-rhel9.6-amd64
     - sha256:0c61cee14af9d5ab7be9f08394ad59bba955300afe5cc63367b451a8d2637737
   * -
       | doca3.6.0-26.10-070000-0-rhel9.0-arm64
       | doca3.6.0-26.10-070000-0-rhel9.2-arm64
       | doca3.6.0-26.10-070000-0-rhel9.3-arm64
       | doca3.6.0-26.10-070000-0-rhel9.4-arm64
       | doca3.6.0-26.10-070000-0-rhel9.5-arm64
       | doca3.6.0-26.10-070000-0-rhel9.6-arm64
     - sha256:55247d124c1a0c2d503dcb7ed185cba32e524b1130645006c34a8b6dacfaf541
   * -
       | doca3.6.0-26.10-070000-0-rhel9.8-amd64
     - sha256:c49962f1da74de05d0a732145865d69fdc501571f92d0e024eed2039a4094da3
   * -
       | doca3.6.0-26.10-070000-0-rhel9.8-arm64
     - sha256:b956cd1f633e1ed49464662f1dcbdfb62aa6451b3afa05ad3d518bf1cab215f0

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-sles15.7-amd64
     - sha256:663fc0feb269798dfa47195798baa2e023981ffc7f3c0ff6fcd296f4a6956291
   * -
       | doca3.6.0-26.10-070000-0-sles15.7-arm64
     - sha256:347c7fdd629aa29fc886944d405d570b898021965b50797d720766ebb4326c8d


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
     - doca3.6.0-26.10-070000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-ubuntu24.04-amd64
     - sha256:2894e7c6c4abc585a5367c7732328cc1d74af6b2522f745f01d841708cb80bc2

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-070000-0-rhel9.6-amd64
     - sha256:0c5ba2a0652db5c35c4c6ffbff606c225f5c308983fcbbfff958103ac3a46589