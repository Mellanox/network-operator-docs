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
     - v26.1.0-beta.5
     - sha256:cf98f1f4fae164ebaf73ccf36aa1c7e51928392339bad1620c12899d162fe633
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.1.0-beta.5
     - sha256:1f8ae6643bda7ae2af9a77b2f5c9036b629532744961a5d06d9c5109e98c4fda
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:434168aaa0a5802e9c1236bd6b89962084dfb45ec96e6cac9d74f976d42d09e3
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.1.0-beta.5
     - sha256:eb304f04b61157ee590b8b950e9d9791dad5d9736c21d433025b57650665086f
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.1.0-beta.5
     - sha256:ff73d32d9857ed0c507df07e396b776324a9d83a6377789ca510a9911e223007
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.1.0-beta.5
     - sha256:9f926de88e184c58c1135ba7a9c236388aee02828d895c626e213fb11615c162
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.1.0-beta.5
     - sha256:86ff1328a2233cb7aa56563f095dcd7dea4974f252af8416ff1a89d0d6628082
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.23.4-doca3.2.0-host
     - sha256:b628647c87715087888a687bc86887eb9675566558d863b4e43f227cf649f83b
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.1.0-beta.5
     - sha256:ec76a6d47cef715caac96fb04ca81c938f9efab028d3cef510bd5149fe500370
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.1.0-beta.5
     - sha256:f03998316d7f0f0b226e5bfc6e6ceb8decc95fa75f9e86355bf7e289deba8190
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.1.0-beta.5
     - sha256:7fafec5d804814e349a7544f33706c77cea9c9618a74cc03a5684cdcfb28f5d8
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:84c5f4b9d25831e3fd7dcee86e35c1c615fbe0e6d9c02d5b1ee98857e05f8312
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.1.0-beta.5
     - sha256:f57370a9ff976ac041d58c2cc235c3081cb7391fc734a32c678cdcbab1b3d8f4
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.1.0-beta.5
     - sha256:1c596cf05d390732255bcc3bd804742498ec4e627cb9a9141f3837662ebfbb2b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.1.0-beta.5
     - sha256:3c6171a23c4c208204de9bb44c873c8af59bb67279ef1304d9b207bb2f15610c
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.1.0-beta.5
     - sha256:4405c7779467c8a0c448003241be60790e1f3a01c639341f7655481276cf4ea8
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.1.0-beta.5
     - sha256:1a28b7fa1c697b71352d6fe721dfb5d5d7d7fa7a4a7fada3f2309232316d7a2d
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.1.0-beta.5
     - sha256:e476e002c04a0272874579d84bdc2c9a6f27ccc633675e112468a99b7b95d682
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.1.0-beta.5
     - sha256:8848706f0264d7607e2d8971722dd950935b4168ed57d7c738d06dee0952a3c3
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.1.0-beta.5
     - sha256:22ded2a0922914ec8b921c5536b3ebe19c061ead65a1aa574ee02661815cbc98
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.1.0-beta.5
     - sha256:22fbbe3e6fadd750d02da2e386991e5896082442b1e03444b8cd828c299ceaf2
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.1.0-beta.5
     - sha256:559963ea45b56c23f2f1dc8d322c56a39983b1f9e8101397a76c97c6a68a7526

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
     - doca3.3.0-26.01-0.6.8.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-5.15.0-164-generic-ubuntu22.04-amd64
     - sha256:c7503ceac61ce62caf6299c25534cf319a45323a1c7abad398caea1e768976a0
   * -
       | doca3.3.0-26.01-0.6.8.0-0-5.15.0-164-generic-ubuntu22.04-arm64
     - sha256:b3119718907ae08460fec56699754056a13c0cf05de2594dfa8e7ac79bba808b
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.14.0-1017-azure-ubuntu24.04-amd64
     - sha256:637b560f7f5f8ee776c00ec7881d168ec21fa058de4b32844937c5a17383ad60
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.14.0-1017-azure-ubuntu24.04-arm64
     - sha256:56344a3a4de7b4468cc5bb264c57d6501bd966bb37d0c808b66055e7fea65c11
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.14.0-1018-oracle-ubuntu24.04-amd64
     - sha256:ab9e3dfe8981312bfc0d5903b39b58d4dab218774f8b29c98dfd43221fa0cf0c
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.14.0-1018-oracle-ubuntu24.04-arm64
     - sha256:666ff458faec0f0c77c28661a0e371ea61ffe65cba525aee69b99ed0edc289b1
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.17.0-1004-nvidia-ubuntu24.04-amd64
     - sha256:50182ed662d1b67907ec100f779b9ed6d5af34424475550a299fa80b736d911e
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.17.0-1004-nvidia-ubuntu24.04-arm64
     - sha256:1e121508c49efade6b9f9f881023f118ecf18614073765cd180d0cc7f02df59f
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.17.0-1005-aws-ubuntu24.04-amd64
     - sha256:46f5ea8f0808cca06871af11b4923be29f70f79218977958b7b8a4fc9c2ef944
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.17.0-1005-aws-ubuntu24.04-arm64
     - sha256:b2c90df87bd19bbd688d11cffe9ff19726ff09582b0c4633f1935378bb1f4749
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1041-oracle-ubuntu22.04-amd64
     - sha256:74636d6b99691d659be721b582684d795658903059882aade32951c4a459a983
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1041-oracle-ubuntu22.04-arm64
     - sha256:dfd4a1ad3fe8902804b55a9ed36e9bea2181c325b82d1f208339dfe2ef86f6df
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-aws-ubuntu22.04-amd64
     - sha256:404c088278b15238699409bd656cc67dcc27fd0d0ceb0fac0a1aade6d253477d
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-aws-ubuntu22.04-arm64
     - sha256:4cea7f5c3f3d9dd7ca6a4dfc811392163a49c05987c3ae8c280bc816f567cdae
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-azure-ubuntu22.04-amd64
     - sha256:097604808567fd41a9c57cb42fa5192734465ca921e7066bf6878e1816b9abb1
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-azure-ubuntu22.04-arm64
     - sha256:a8496ec54974aeab9a28c9452650470738ea71227561932c442080b0c5381b59
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-nvidia-ubuntu22.04-amd64
     - sha256:a143911c16a2c25ce18655724cbfbe6be9aadf5e3328f8ec4991b524af9999a2
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-1044-nvidia-ubuntu22.04-arm64
     - sha256:ef7f07e603e16d77816aa64d89468e8af5949fd95ecc565985d428e21fa543cf
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-90-generic-ubuntu24.04-amd64
     - sha256:0e52d9bef3f7c015d1a51951ff4bc44b074988cd0a952096980956e1e15a385f
   * -
       | doca3.3.0-26.01-0.6.8.0-0-6.8.0-90-generic-ubuntu24.04-arm64
     - sha256:d13f2e3dec6b5a56c11bd5cac2ee1ff02e25b30cd7f896f8d860841ae73b7ebc
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu22.04
     - sha256:cb0c47efdd163f68f2d4fdc92320f73fd21440a4bb9b187d81c30411f7517380
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu22.04-amd64
     - sha256:0c0ba0e7b4b7488c4db80140d7a20291e8c7b8f957a7e8600b202e44d5e02d85
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu22.04-arm64
     - sha256:da32e57cdfb4a9ec9eab42ac1367a94b5bd3da840fc6a6bf2fc392a7a43d637b
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu24.04
     - sha256:199e461b6e1ac7236c37901ad05b1de4d568f5dfd9a0b37f8164c5bb3b932823
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu24.04-amd64
     - sha256:2795dc72f5a46dcd847fd00430615c93687d4f7a955d566d6ae580c8dd14811e
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu24.04-arm64
     - sha256:eaec20a622185d89d2f0aeafa3d39150255c444d5f47b1c059a28982a9eeb164

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.16-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.17-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.18-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.19-amd64
     - sha256:6eaab4f928ff26245602f6221cd953c39d0816dbb45692fc80d4a810b6d72157
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.16-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.17-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.18-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.19-arm64
     - sha256:964ec02dd80b8332837edab9e087b2748d3a2cb28cfa6f8edaf58aa24a5cc6ef
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhcos4.19
     - sha256:f39505041ed26fc770ef120205a245a37067bbc366800d516cb477bcc0bee7df

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel10.0
     - sha256:aef11c05c8177e57480293171947830bef9fc76cfdcaed3628ce13eafa592b31
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel10.0-amd64
     - sha256:4e7329c0a01e1fd61f3219e0c29f19cc29099de9bf799988a0164dc0313fb8e7
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel10.0-arm64
     - sha256:146a53a0baec1e71250dda97b4c5197cc926deaff3be79617636c1358e6573c0
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.10
     - sha256:9ad66c7e5e5ffe0713f7af8ca3a12cb4a8230eb298527221c9df15e1dfc5d9b6
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.10-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.6-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.8-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.9-amd64
     - sha256:e290a186e42e97bb05f1dc5312760bed14445381cf71ecb41ab1490d0f4fc21e
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.10-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.6-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.8-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel8.9-arm64
     - sha256:4afc43df343f4505a27d2265129051993860f0823eeb75e32ed3b0a5c5ff121e
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.0-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.2-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.3-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.4-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.5-amd64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.6-amd64
     - sha256:00df016887a093c1acfe12ae268f159113e283d9704faf122c942e80407db84b
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.0-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.2-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.3-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.4-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.5-arm64
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.6-arm64
     - sha256:222f5c6faeead92c6044e6cf2c68bb59b606ed1d97149014f7b7cd095189686d
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.6
     - sha256:3c9d28638ebe978acbccd0fea915bdfdc3c9ad0171722e47a21ca832f59baaff

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-sles15.7
     - sha256:dd05ba5a2363d146df483aaa0b70a9a3873c4201902c9fb8a94e6020ecf94ad9
   * -
       | doca3.3.0-26.01-0.6.8.0-0-sles15.7-amd64
     - sha256:2956fb8c47861f3cb95d64cfcccbb745460a6f23be967902815cd7428e5ffd92
   * -
       | doca3.3.0-26.01-0.6.8.0-0-sles15.7-arm64
     - sha256:d4e838f6f2f58ede1764d96d9afcb1ab82c0ee39e34a4cfc76b456e826f2bfcc


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
     - doca3.3.0-26.01-0.6.8.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-ubuntu24.04-amd64
     - sha256:6d11b0538046e705f0c4cdf2f876d66277ed2d49221f6da20762accf9216740b

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.3.0-26.01-0.6.8.0-0-rhel9.6-amd64
     - sha256:464b49749e7b842e8ad5b6181cfbcdfef3eb25c71b312a6594e304555359d315