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
     - v26.7.0-beta.3
     - sha256:83c7a7cff752911f5701c9a7dd6264e856cd29cac96b1fb42c00dd53a49b0555
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.7.0-beta.3
     - sha256:9d07b0954648bfd1cfc7d04122a1983c835b8c25f6ce794e6232a18e27207fff
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.7.0-beta.3
     - sha256:a530268b16fdc1abd81eb5b235ee0cb326680add39dfdf936b3cf283f88ad462
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.7.0-beta.3
     - sha256:1bde11ce4aa725e682c3461fb4b393748094ef3675b2781d68d075629f1adf2d
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.7.0-beta.3
     - sha256:ba8167a546d88b83b6eb6a74ef4b69551dc6780aaa57826ce2bb54c6ea40148a
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.7.0-beta.3
     - sha256:6c8a62dde2ba8e94f1652cbdd7cf63008d54eeb2e2a74f83a104bdf1d4ce71c3
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.7.0-beta.3
     - sha256:d42531fa760969df40a629270eaaf09712e74ca90ab0d8d2997b1e0676cbc8a6
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.25.5-doca3.4.0-host
     - sha256:e728430bdde27bc0f2e57cedb83814f21d23113385328034af9727e900724d09
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.7.0-beta.3
     - sha256:0e5cc0966b747fa339c490c8749b9c592a55d3d22d3153f6620039f6c48b379a
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.7.0-beta.3
     - sha256:0db092cf734d3ac420977ebf2fb9c21d4de3eb7ce6706a39260204cd92e30ef4
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.7.0-beta.3
     - sha256:78642f98d4700c718f6db3d5d4cbd509aa3ffd2e2946528adf46decf25933994
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.7.0-beta.3
     - sha256:b10f651a6649e1e241569d72b953a1e944af1cb304e05587e268e1d22b186870
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.7.0-beta.3
     - sha256:92a314920e4acad75019614a2ca90afbd8a99c14e4ce83a203d6f163cda6eba4
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.7.0-beta.3
     - sha256:48515106206eb741eb9aed30d1e61101013d6fb8a67baf3930492588c56b087e
   * - nvcr.io/nvstaging/mellanox
     - dra-driver-sriov
     - network-operator-v26.7.0-beta.3
     - sha256:6a0aaa0144bf6c3bd209091190e375c9e991cdb47fa436192639f6bbacadd596
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.7.0-beta.3
     - sha256:bb14b15467fc43e73cc6e2961f0443147fb742885428f8f6c2a51ab08949815c
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.7.0-beta.3
     - sha256:7afa0a97eb2c1c9caa904d4f7573d16db4346f70ffd97072a4b1bf616fcd3df3
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.7.0-beta.3
     - sha256:9fd4535fe0e869556746e02e368f4caaf48c2a11711cdab0d29fae2cf855a314
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.7.0-beta.3
     - sha256:297795e6eca1b6b5d14cb4f01b220ea335af2a7dcb7ea7e8c2c033acddc77105
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.7.0-beta.3
     - sha256:7e058c00c2d09904bca36651c1ff0dc90fad12af473e55a20141eef0eae1769d
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.7.0-beta.3
     - sha256:0a76a6bddf83661e56ab61d8e15a16fbb8c25c989acc20a06bc1320f89009796
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.7.0-beta.3
     - sha256:f7cd738349f0e78e285ba02dc8bbcc2f789e25a842960ae88050765601b4b978
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.7.0-beta.3
     - sha256:a76e86c6c83c9481e7ce64dd280759ef78347438c985e7effce41d5b2c5828e9

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
     - doca3.5.0-26.07-0.4.0.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-5.15.0-186-generic-ubuntu22.04-amd64
     - sha256:b85490fd5a9170f9ca587a63a75e89194091045c9fc68eb363367144177db956
   * -
       | doca3.5.0-26.07-0.4.0.0-0-5.15.0-186-generic-ubuntu22.04-arm64
     - sha256:2350107e31ce2a7ef2fba99e1c9737a08e2b1847f74594a7a5e4062ddfa5f792
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.17.0-1018-oracle-ubuntu24.04-amd64
     - sha256:edc13b035599a5d53b1c5c1fc5c7cee2b0be0e8eabaa1fdf89a203e9ee34533f
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.17.0-1018-oracle-ubuntu24.04-arm64
     - sha256:d5a9e266040cf135c3e352fe37eddc309115c3c1be243a6d0112f0d3ebc081f8
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1057-oracle-ubuntu22.04-amd64
     - sha256:4f6be4cd5109003b6176962c2aa3dfe0ad11dcdc5459ca64520e77544980a45f
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1057-oracle-ubuntu22.04-arm64
     - sha256:96a10feeb47a4bcff943616efd72a5327313cc601fa2d7995efd1d259e9d222b
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1058-nvidia-ubuntu22.04-amd64
     - sha256:29a3c73e5aafd83430972b5b0b561c50e9cee89986ccd01fe6514e294fbeedc9
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1058-nvidia-ubuntu22.04-arm64
     - sha256:96356708f5bb9c1e9a29e76214d5ff9136849ba88f5fb91d078e59c8fbd385e6
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1060-aws-ubuntu22.04-amd64
     - sha256:08892d96bf5f77866f2fd11156df570be0ce8614ff40486f7564f7e1a909b68f
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1060-aws-ubuntu22.04-arm64
     - sha256:ccb34341d256bd95f32c2221514d1c51bc2d32216cd739632d307fca824cfac2
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1062-azure-ubuntu22.04-amd64
     - sha256:ee7ae08c3522a236b6fc06144f33f2fbfff3b60115d63450ee4084a683cc5541
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-1062-azure-ubuntu22.04-arm64
     - sha256:a325080cc751bd3901fdf5ec885ea37d87999f7f6149ce3139b4bbdf41b62198
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-136-generic-ubuntu24.04-amd64
     - sha256:ec1a74683dde2c37d1056089386916eeefa0eb817e20b0828c72407043299615
   * -
       | doca3.5.0-26.07-0.4.0.0-0-6.8.0-136-generic-ubuntu24.04-arm64
     - sha256:bab5a31ad2430b25dec044a7d8abbce5b54772468bb80268623341a97b82313c
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1007-aws-ubuntu24.04-amd64
     - sha256:607b95128df9583fdab31817dde32320d126243a2ec4d01741e8507c49b0e39c
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1007-aws-ubuntu24.04-arm64
     - sha256:120f4017b95ef4ed3aa78d49df294c8505627d118c6bfcf69e039a4b796f31a7
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1008-azure-ubuntu24.04-amd64
     - sha256:64d7078a9adf7d46f954abd28f0c3f4a2bb877f335c88a12dae22dc82ec00795
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1008-azure-ubuntu24.04-arm64
     - sha256:700f8da60af346826569c61c635373df259c4cfeac3fc77ba12967c7ed4ac51b
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1013-nvidia-ubuntu24.04-amd64
     - sha256:16489e3105e576958ac6366c53978b5227796c57f35b6a020e32b25e30524bf8
   * -
       | doca3.5.0-26.07-0.4.0.0-0-7.0.0-1013-nvidia-ubuntu24.04-arm64
     - sha256:db21443979c9bb26f275214701f9894b6a7e0ecb2d2e5c44066c08d5a71f9adf
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu22.04
     - sha256:13857feee9789fcee7c4cfcf7480c25d0b463a0e8917081d005216af371d18be
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu22.04-amd64
     - sha256:b4d1dcaa30828e8d9672e6d12443b0b0a33af986aeb10f61211b52591c5b246c
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu22.04-arm64
     - sha256:fa575a1df925ebcb2bd33ba24f3d4a8917b5007025e90c06fabec668edf5a5aa
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu24.04
     - sha256:59316f6aad9e985deca0b957d90d6ee237ebd6fc21ae05c48b1dd9b14744548b
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu24.04-amd64
     - sha256:bd75da716f06c23d3049bb67925aebe5790747811106d8cbf6b8f5bcc74038df
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu24.04-arm64
     - sha256:34ba61462e67b775713b1510ddd876eddedc2757dc4a149eb4b30380a7a6e917
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu26.04
     - sha256:4ee3fdf8c24ad62c56c0c9ae2298e18691571dc10e78986b50f1d7a21a49899c
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu26.04-amd64
     - sha256:667af048a263cc7882662dc6b9e1113ffdf06ebaa7316bd4bfd2cdc2ff5587f5
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu26.04-arm64
     - sha256:07915983e5fc7b1d07c53ec12ec3158cfbb4cb9a086c320370d717d7bb9f112e

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.16-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.17-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.18-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.19-amd64
     - sha256:47797d43a64c6d55d846ea37e7d7ecff3afff734d2f6b9f56d634e17ac24a71d
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.16-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.17-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.18-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.19-arm64
     - sha256:846cf2ff1ab30bd9c494a5e7d06d5c6aeec0b95b7f685796ecbd1b94821561bb
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhcos4.19
     - sha256:0bd3220ad565c6c0f47604c3686c7941f452c69e0a8e7062da1c1e1405b46fc7

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.0
     - sha256:102941ffde1d741bb58618ec4c3cf3eaf7a606b126151f1a6d7b332e98047041
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.0-amd64
     - sha256:b357247054aa94b2dd076762abbea162188d85ad8d8aec2aed0803c2c6910cfc
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.0-arm64
     - sha256:a39be9dfc270f6ee07c3c6c5acb03f060ceac8223d4ebbe701061faf75114828
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.2
     - sha256:a2f54b7833a9f7d85bc41a49f6893611df19f5488a2ca9b41d0f1ce34b0dac4e
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.2-amd64
     - sha256:5e4e65c3252266e3bdeb2cfcfb4e6576a1c55cacf99a8c3f3de45eb51f187c2f
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel10.2-arm64
     - sha256:db3214ad10d2af687d593d622b84cd038c1d372565328e4302d34f7adc9225b5
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.10
     - sha256:e90e2fb25385ed0b1c7d26ea1b31b119e7e09d85011f9376cd089d8cce60921b
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.10-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.6-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.8-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.9-amd64
     - sha256:1e33b2c6eee2ec61dc3f6f20fec0d3f08cce07f6d685e5995349cd34549b5ad6
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.10-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.6-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.8-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel8.9-arm64
     - sha256:0d878f59e21517972ddd7d501bbbbd9fad8057bbc655f174bb31a10492ebaf5a
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.0-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.2-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.3-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.4-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.5-amd64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.6-amd64
     - sha256:d0de5faca51adcd69b568d2697f35d434b22388d97d30b4a75ea000384a89661
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.0-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.2-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.3-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.4-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.5-arm64
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.6-arm64
     - sha256:b84306f0c680c6517257797cc98ca2588d58ef7bb31d064b378bfbd683afb1fe
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.6
     - sha256:84e4c6340f6475aa7e35988e87d46cb80053cd9eda2c20914156dac88c5a032b
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.8
     - sha256:3509dd7ed6ac95e4aeaf85c18368db510b3ddcfd1893563ee93b896d6c14d30d
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.8-amd64
     - sha256:ed67306b5eb9d65fb4ca15b86cdf153164240af150052dcfe6f2c6275a4c695f
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.8-arm64
     - sha256:03e3172904b67c53d818fee30b6103d59a91ee2bde2c358491e611b0b2cac4e9

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-sles15.7
     - sha256:056bba406fd825ed9d490618157db32f2d147b3e9c38c5c19ce0673c5f279235
   * -
       | doca3.5.0-26.07-0.4.0.0-0-sles15.7-amd64
     - sha256:6c8be71cfe6333823351895d2d91ac5acae7a1e39955906019889a9e0638bf5e
   * -
       | doca3.5.0-26.07-0.4.0.0-0-sles15.7-arm64
     - sha256:fb50db3bb59b0b63c6c2de0c6ba0a740954662c938cde4e82e4be8af479f1497


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
     - doca3.5.0-26.07-0.4.0.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-ubuntu24.04-amd64
     - sha256:c9adbcd465943108852ea4d5ac3e68a381d7ddc8b3aa58f717d846da17119d8f

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.5.0-26.07-0.4.0.0-0-rhel9.6-amd64
     - sha256:0d4d69454c256d7136631b05140226c92a331e66f2e7a3488e28990f2f33a9f5