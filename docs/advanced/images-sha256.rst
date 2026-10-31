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
     - v26.10.0-rc.5
     - sha256:cd047a5a9fdd1ff6e1167e224ed7750f3c8e589cfdb1670989c65b4e1ef51dc7
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.10.0-rc.5
     - sha256:ef9f84dde2e0302bc543f18eb54764f0674f98a685c902dec9d8a7e13028f752
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.10.0-rc.5
     - sha256:4f48978e0589040398c57b6f5eedafb21f7f60831e1dba6b92ac2aeaffe0b073
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.10.0-rc.5
     - sha256:55bcad611eed7697d0601cfdc09042581d65a6598fe0d9ce602b79169e573223
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.10.0-rc.5
     - sha256:cdeef3f1b3e06f2f923caa1a26b63f620cdd576a42223b6b0c99441daa1c11eb
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.10.0-rc.5
     - sha256:46e843414eba55a08144f903b15c37118a037d4e4b7e1eed2821b63ae734dfb1
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.10.0-rc.5
     - sha256:409705f23c29b2092c772ee43ebe811020abdb96a1f43c1ee04b11a72902e333
   * - nvcr.io/nvstaging/doca
     - doca_telemetry
     - 1.27.7-doca3.6.0-host
     - sha256:a53ace5699cd16c9e8ea62d1938f5b9cd52b4abdec0b9ef0eae34da032ccd10a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.10.0-rc.5
     - sha256:36657f3b6ffda39c8ed2fd74f49409a41ce244918500dc6c2396791bdfcf7a15
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.10.0-rc.5
     - sha256:a0fc70a6abc1c68bde092f465b9cc5c34997bd1ba0c478556914ece7bf1e987b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.10.0-rc.5
     - sha256:df6fd5ddbce560ad83192fc794550157952622f22efc6777dbd0ae46fa5c0aa8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.10.0-rc.5
     - sha256:c4c7e1248baa548aeca13bc49a9129fab67f0f86b90dfd8814cbc061f558d366
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.10.0-rc.5
     - sha256:70efd7b9e6677d74af7d423cb09efef3dad1db463f208fa5f5401160e7d830aa
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.10.0-rc.5
     - sha256:b45df1f9dbf8ab1afea18d296ed64fdc538503b24a1fb27ffa47e3c08fd00c4d
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.10.0-rc.5
     - sha256:4446b0f78066c8b5baf28fe93de0b410f146bca5ec0dacec32caaf5cc275c920
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.10.0-rc.5
     - sha256:574497c1935464fda2acccec7ed695aa73aa25390ee008a251433bc19fb4eef7
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.10.0-rc.5
     - sha256:1ba2e0d51f7b3118f997796fd6b70ae0f3ede11cdda4e04d8a3c00adc1664e7a
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.10.0-rc.5
     - sha256:119ef1ba0e2193ad2fdd53bf2567d7d2197f2a1584f85940ba52ef4086444972
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.10.0-rc.5
     - sha256:f71791d222337f44da075709961e4a8db50d967083f3893f8904024857d320c9
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.10.0-rc.5
     - sha256:7c6efeaea6e417ccd5b948afadae8a0734be4f50d8b6cc570c7d59a91bdd2e2c
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.10.0-rc.5
     - sha256:ae463fb8183481d13cc713884785548d0faeb6fff6add48a61c05e7fafa9aad7
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.10.0-rc.5
     - sha256:77e5f8df34b6fc9222b7df440fd970f4183759ad880a4a85e342a49d157d8046
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.10.0-rc.5
     - sha256:bda8b2f68ba477e73d7a54d577fd1877f8238cb5f3539fb6a2daedefe54be365

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
     - doca3.6.0-26.10-067000-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-5.15.0-202-generic-ubuntu22.04-amd64
     - sha256:d87a9d5ac7c77f6ffe57a48a82de8aae4f888e1745a9b54730ce04df8133015d
   * -
       | doca3.6.0-26.10-067000-0-5.15.0-202-generic-ubuntu22.04-arm64
     - sha256:32226f8ed6a1e727005efc046b220290a45cd60081dc1fbd1e2864934fb324dc
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1062-oracle-ubuntu22.04-amd64
     - sha256:35f63811113d0791f0d09782fa0e6ecdd8d1aa5425b7d55eb0054e784e784cc7
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1062-oracle-ubuntu22.04-arm64
     - sha256:5c602b676bb40d95c7c63eecb7141dacda600392fcc67e099cd5d91abfee5b9b
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1064-nvidia-ubuntu22.04-amd64
     - sha256:815929adbcef63481451d36c167979accfa7f90eb6872dff00acd3dd1532ee65
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1064-nvidia-ubuntu22.04-arm64
     - sha256:8913f264d87993f756bf01b64ed6649dbb5b4fb06fa65611e4635e54be0b36da
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1066-aws-ubuntu22.04-amd64
     - sha256:71a5255ad8d520d726b02d8e0c96896562733ea5144e74ad84f6cd5e8c12862f
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1066-aws-ubuntu22.04-arm64
     - sha256:b15fb51bbb1de51d7cf473d41e49f3b33a27c8d4f3931ef5bace67dc401a3804
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1070-azure-ubuntu22.04-amd64
     - sha256:5243957a89cde5d216f2923853a2954bc5533e11f93308f482bca7d862b420ea
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-1070-azure-ubuntu22.04-arm64
     - sha256:18eeba9e865b65aafa9dd5a7e3de2002bcb46582ced289927d6fb626e0022fb9
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-147-generic-ubuntu24.04-amd64
     - sha256:9f762956bbbcb0842363ba5ec6513a09b08e876dbf571eb4b020202276c303f2
   * -
       | doca3.6.0-26.10-067000-0-6.8.0-147-generic-ubuntu24.04-arm64
     - sha256:cb1854eedea3868f3d94b042967aea01c83705e27fcd06a37fe00a5286c6f29b
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1013-oracle-ubuntu24.04-amd64
     - sha256:6f33edc4655e924e4e038c37dfacb06d2d7715583ee96418c8ac7e7f1d48e3ac
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1013-oracle-ubuntu24.04-arm64
     - sha256:0b608a3c7f2290b7c8180df022f8f54a7033b46620a9b36ba8375b62a9e4b760
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1014-aws-ubuntu24.04-amd64
     - sha256:71a14b0d3b62d88596a042d01cd3747584fb9303d5e1a7fda0bc214abe5ef70a
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1014-aws-ubuntu24.04-arm64
     - sha256:2816d9737bb9295eee83b0e744d7a970c6f81b1ba4241d8753e39ac7512a3d84
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1017-azure-ubuntu24.04-amd64
     - sha256:88b183b103ca0a1eacfc66244fef281d6b8dca57fd1f6d1b7f5229ac7f16ba26
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1017-azure-ubuntu24.04-arm64
     - sha256:2b7c4e7901e1f31593d8d395fb24149f2116d70914cecfb509edba5a46c5f9e5
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1024-nvidia-ubuntu24.04-amd64
     - sha256:c24ec412e758dc27dceaf1d6c58d0bf3e6079d7b4cd9efd50a4d30b228c2830b
   * -
       | doca3.6.0-26.10-067000-0-7.0.0-1024-nvidia-ubuntu24.04-arm64
     - sha256:cd7746361101e1ca21b40e9354c15b48166a10c25b5b773a5c60bca722909354
   * -
       | doca3.6.0-26.10-067000-0-ubuntu22.04-amd64
     - sha256:6ecd2a38ef631c8d5080c8f1edbee8f35d8149de7f2942debe27ec3b6302bf43
   * -
       | doca3.6.0-26.10-067000-0-ubuntu22.04-arm64
     - sha256:c364b9e9067504b9664cad1e776c105ca2b136d8ca5f79223fcec5a438aad1b8
   * -
       | doca3.6.0-26.10-067000-0-ubuntu24.04-amd64
     - sha256:eafe23cd410dd09d6128c29112460cdd153cf06dfb6562eb8ea303d6f7a1f6cc
   * -
       | doca3.6.0-26.10-067000-0-ubuntu24.04-arm64
     - sha256:dd5750ac7b9379e5f7f9b76235355955c3782bc3062565e79cc41a255dfb94d0
   * -
       | doca3.6.0-26.10-067000-0-ubuntu26.04-amd64
     - sha256:06e45ac0679e0a322715f7006ed97d9ae7609a7b5ffd76a37284a799de08e326
   * -
       | doca3.6.0-26.10-067000-0-ubuntu26.04-arm64
     - sha256:c7773d63f59b3051adb938d95f99fc5f5c02dbc2df724242096d7ab60bd33785

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-rhcos4.16-amd64
       | doca3.6.0-26.10-067000-0-rhcos4.17-amd64
       | doca3.6.0-26.10-067000-0-rhcos4.18-amd64
       | doca3.6.0-26.10-067000-0-rhcos4.19-amd64
     - sha256:4592a883011601997f3704d79217f762be2541a15abe60387e320fef564cfc32
   * -
       | doca3.6.0-26.10-067000-0-rhcos4.16-arm64
       | doca3.6.0-26.10-067000-0-rhcos4.17-arm64
       | doca3.6.0-26.10-067000-0-rhcos4.18-arm64
       | doca3.6.0-26.10-067000-0-rhcos4.19-arm64
     - sha256:fb489fb77a5c1a748ce2fe274a06de29be4cb8c08d433e8bbbf86578585f33b6

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-rhel10.0-amd64
     - sha256:262b90a4dd180e5ba0ea9e730f03bf68aef14913fda353475c86f99e1a8c8a38
   * -
       | doca3.6.0-26.10-067000-0-rhel10.0-arm64
     - sha256:df1423daa7ecfe89ce735cd2f9a6023c6b4b36a3e78f1372641e5dd5dfc17b41
   * -
       | doca3.6.0-26.10-067000-0-rhel10.2-amd64
     - sha256:5f292bfbcc12e526d3acc76f704f12c225e15d2f495061f1b4b1a111cb5b8b01
   * -
       | doca3.6.0-26.10-067000-0-rhel10.2-arm64
     - sha256:957eaed378d3c39c30e0eaa13d424c6018f15a8c8e004cdf3eb04dc50474e091
   * -
       | doca3.6.0-26.10-067000-0-rhel8.10-amd64
       | doca3.6.0-26.10-067000-0-rhel8.6-amd64
       | doca3.6.0-26.10-067000-0-rhel8.8-amd64
       | doca3.6.0-26.10-067000-0-rhel8.9-amd64
     - sha256:190dd4ebca5e6980d6e5958f44e76dd31385d44502856b8d850a76376175491b
   * -
       | doca3.6.0-26.10-067000-0-rhel8.10-arm64
       | doca3.6.0-26.10-067000-0-rhel8.6-arm64
       | doca3.6.0-26.10-067000-0-rhel8.8-arm64
       | doca3.6.0-26.10-067000-0-rhel8.9-arm64
     - sha256:12aa9c9b5914e586b5d1fbb0e3b9e6d8eb291bc7fb25f3a3701ca5620fe8ccc0
   * -
       | doca3.6.0-26.10-067000-0-rhel9.0-amd64
       | doca3.6.0-26.10-067000-0-rhel9.2-amd64
       | doca3.6.0-26.10-067000-0-rhel9.3-amd64
       | doca3.6.0-26.10-067000-0-rhel9.4-amd64
       | doca3.6.0-26.10-067000-0-rhel9.5-amd64
       | doca3.6.0-26.10-067000-0-rhel9.6-amd64
     - sha256:2c94757316ddf7093a4bbbaada0c5879fd0fb40ea4d3a3b8b46108a71ff6f188
   * -
       | doca3.6.0-26.10-067000-0-rhel9.0-arm64
       | doca3.6.0-26.10-067000-0-rhel9.2-arm64
       | doca3.6.0-26.10-067000-0-rhel9.3-arm64
       | doca3.6.0-26.10-067000-0-rhel9.4-arm64
       | doca3.6.0-26.10-067000-0-rhel9.5-arm64
       | doca3.6.0-26.10-067000-0-rhel9.6-arm64
     - sha256:6c3176301b5adc1d53713f64d8359cc44972a9334ec477a189fd774303024d63
   * -
       | doca3.6.0-26.10-067000-0-rhel9.8-amd64
     - sha256:067a3fae1e3f24e3ea4d2449430a38bbf2f0d2af1943747b5b43b74cbb39c8d5
   * -
       | doca3.6.0-26.10-067000-0-rhel9.8-arm64
     - sha256:3c3aca3ae28abe4c729672397e9dc50dce013baeb2f8170f82cf266d3d7638ad

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-sles15.7-amd64
     - sha256:e58742e5fed00e19497a4123af349c0be82c6d95d111f45ba3911e32cccca20a
   * -
       | doca3.6.0-26.10-067000-0-sles15.7-arm64
     - sha256:ec9a6a6732bff0ba8a74cfafe3a66f285e905ad846f6fd0e7bc22a44e7fb0de4


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
     - doca3.6.0-26.10-067000-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-ubuntu24.04-amd64
     - sha256:bb9d92b6394a6ac406cff2b41691f49129537ab281d368e72b2d5b37372dc22d

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.6.0-26.10-067000-0-rhel9.6-amd64
     - sha256:024767cc04be7125d8eff33df533737c4b88790b71dfe09916a6cb51e26f377f