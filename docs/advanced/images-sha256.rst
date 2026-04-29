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
     - v26.4.0-beta.6
     - sha256:c75e6396ee6f160b60db569ea3b100797d1a9011f70d2bea5d0a2f29d6c7c287
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v26.4.0-beta.6
     - sha256:cdd924b622c43c40a0a7e53390d0a99ff6eb3c27441272c1b8e3e87f0b2b2cd4
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v26.4.0-beta.6
     - sha256:e6815e3da701a99e76e63f6758764775fe1b70c96708d3e4baaf5933b06a3c9f
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v26.4.0-beta.6
     - sha256:482cc195cef37c783649ceb99873dbbd8491d1679bc5cffd71abcb05880fa441
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v26.4.0-beta.6
     - sha256:ada0db6393cbf2dddd2444a4a3504ba05f88499c0e0fe38cdace02d0732b5435
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v26.4.0-beta.6
     - sha256:20139e7d7966d619936c9fe9745394a44ed70fc27f2b9501c543ba36d81fc0d3
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v26.4.0-beta.6
     - sha256:69b45dc5693d89a1b981e332f7515fb08eb5c1f2750ff009778b1677acb9a566
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.24.3-doca3.3.0-host
     - sha256:d561707f58be0470121c8dbe31b2576caffd92c6a6533a5ddaf37e3f6d1479d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator
     - network-operator-v26.4.0-beta.6
     - sha256:f6d2b364cadcd8658ad056bab876fae3ea55b74cc5d853f52b6eac72f10d9e35
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-webhook
     - network-operator-v26.4.0-beta.6
     - sha256:6a22fcc4c4e24ab97ab56aea85b1d98dffcdea48bb00e925bbeecef9b78769d6
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-v26.4.0-beta.6
     - sha256:46b2500d9477a6c3110b4da77fbc7c4552f423b6a1251fb900a6babf9bd21e7d
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v26.4.0-beta.6
     - sha256:1ff88020c0323644418346fdc03c973d43d2e02168d09dc82f2041025cd1ec27
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v26.4.0-beta.6
     - sha256:b0c97db02312ed3e7f67e755900b9a600d8476e94ec30a9a217b87389c3d60fb
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v26.4.0-beta.6
     - sha256:bb878008934a6c80d30007fb62b5413277453ebcd961d387fb0aefcfa9c8c948
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v26.4.0-beta.6
     - sha256:04b3da77b12a88aa50088b7dacf2298bddd44c3639dee69eb645a653176bfa51
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v26.4.0-beta.6
     - sha256:1db31dc311129c8cf63ec6558e6150e8aa0a6e1eca957789622f37c76ffc4b3c
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v26.4.0-beta.6
     - sha256:9758b0902cf07b649842ade523da6c098d8ce00f3c553e156f0979f718bdfbae
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v26.4.0-beta.6
     - sha256:bfc62e68d28e449dff448c81980a5da429165df4fb0423322b4c97e3d5f9f642
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator
     - network-operator-v26.4.0-beta.6
     - sha256:b8a12ca256ed051fb60addfbaa38e925bc17e55365aa9a5be25daa384cd0779a
   * - nvcr.io/nvstaging/mellanox
     - nic-configuration-operator-daemon
     - network-operator-v26.4.0-beta.6
     - sha256:d8f0049700f1d9e9d9519be737eb920814eae8c803c9904fe0203451c23629af
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v26.4.0-beta.6
     - sha256:41d1724c9b56d74196533e5a587b9b2d5aedc9623ef8e4487f1567a960f55f1a
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v26.4.0-beta.6
     - sha256:49d6b8708b23583e11c6e12524bb4e02d9cb3c0178a6ba43feb8d582a24ebb1b

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
     - doca3.4.0-26.04-0.5.3.0-0


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-5.15.0-176-generic-ubuntu22.04-amd64
     - sha256:7d5a6b66909f5213418749df26b042053c5a097cee1d8218e349568a81482797
   * -
       | doca3.4.0-26.04-0.5.3.0-0-5.15.0-176-generic-ubuntu22.04-arm64
     - sha256:699149f4c5d03232750ada9e970e7fb2ace684fcbefa7937b52f56a5f0fc6303
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1011-azure-ubuntu24.04-amd64
     - sha256:f83e50c728b82749fd4afdf5bfc8c1a1dc8e99bbbfb428adf50843d5444ccf41
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1011-azure-ubuntu24.04-arm64
     - sha256:f07d65cf6da2cd9830fb413d05158d0a86c773042232ac9f84a1b49a494dbc29
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1011-oracle-ubuntu24.04-amd64
     - sha256:c781a5574c062cec4ce60cbeb46f755b8f21f8fce2b8c082cc55526eb91fe9a1
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1011-oracle-ubuntu24.04-arm64
     - sha256:4dedb1df4bf693f98d70f2f9e641c6689f14a6c83c397376450d5b900517e1b4
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1012-aws-ubuntu24.04-amd64
     - sha256:53ba77031a8b9d4e33d3f2f093cc6c2b08e3b83f76f4922efc9e7d7dff898fd6
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1012-aws-ubuntu24.04-arm64
     - sha256:d101f70b5afaaef03ad66dd9e9611d218d3293ff2f89a9e8414a6c907c19ae5a
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1014-nvidia-ubuntu24.04-amd64
     - sha256:804b1188596d2cb2155c8a4d2fbf2943926429ebb1a69766d0fe16de1e43f549
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.17.0-1014-nvidia-ubuntu24.04-arm64
     - sha256:c41b84086970a952261e81464524cedbd90ac9da1d800b1878393f4076915fce
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1049-oracle-ubuntu22.04-amd64
     - sha256:6804a6f902bbb53ff3242d131e9762e2857befa73488301f738c5fb3196226a1
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1049-oracle-ubuntu22.04-arm64
     - sha256:d8396b31e175f264595a35da5f75f5d2524181a5c57bb24507b673a829828fb4
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1051-nvidia-ubuntu22.04-amd64
     - sha256:7161ccd31891ee78017d8baf2f256f91e60e48851cf88cd9c7108826d0a22669
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1051-nvidia-ubuntu22.04-arm64
     - sha256:d096f47157550222f5679cceda81052029b010c292de071f6802330da31d74ea
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1052-aws-ubuntu22.04-amd64
     - sha256:1b1fbbc6ad393c4326633b40d99f511d34946ce9828777bcd5576fbaa5eb9bd0
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1052-aws-ubuntu22.04-arm64
     - sha256:f6ced8e0e520d60171fd5a2156ae4bdc66c29312e3ea63ffb172903b1bf83bf2
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1052-azure-ubuntu22.04-amd64
     - sha256:b970d0e8a6c6829485a31b97d07f6a83d102a8a5a64c54ecf422cc812992fe2a
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-1052-azure-ubuntu22.04-arm64
     - sha256:a7a6b862faebf096030699b18bd6653df717bbc1863c1ec0e981e71cf8aeea41
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-110-generic-ubuntu24.04-amd64
     - sha256:ca3cdfb9d0f55ad57328bcc6637f97b81f08571d763c494034f0755f1dd19268
   * -
       | doca3.4.0-26.04-0.5.3.0-0-6.8.0-110-generic-ubuntu24.04-arm64
     - sha256:fc0039406cb13564c885e11d94e409c47dff0437a91df4efd67a2609e5af1993
   * -
       | doca3.4.0-26.04-0.5.3.0-0-ubuntu22.04-amd64
     - sha256:0c394b5ead8696979497517e56a94f274938a091a7bdadac7dd03f8c393bf4a8
   * -
       | doca3.4.0-26.04-0.5.3.0-0-ubuntu22.04-arm64
     - sha256:3a7669cd439af3c2db54da0e869bc799e276632619fb54f3aebeeaac8afd09fb
   * -
       | doca3.4.0-26.04-0.5.3.0-0-ubuntu24.04-amd64
     - sha256:35d03314c12bb15a57123d1f78b8a6a627df4b9bfe1d49ec04d2d9924fd69ff3
   * -
       | doca3.4.0-26.04-0.5.3.0-0-ubuntu24.04-arm64
     - sha256:1b7fd768994c542a724275d8607c6cce98e1bad261ba9c8ab599f41e66460d2c

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.16-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.17-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.18-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.19-amd64
     - sha256:827770b798fbd1edffdcb0a9619eaa7c824225fa5611bdd1b51a8242b334c5bf
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.16-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.17-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.18-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhcos4.19-arm64
     - sha256:2b197daec78d54ffa1a2f18bf4aa6311f9dd0189d18b21cf857d4a5e993f978b

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel10.0-amd64
     - sha256:2bf3e6ddcf176f763b783792749908667aeaf983c4766667f8edd824e51800c4
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel10.0-arm64
     - sha256:702b7e296d3ac5fe3d9bb8ea1ef2386e15c5261c6ba492d15e80185141a39c05
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.10-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.6-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.8-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.9-amd64
     - sha256:ab358f5fd93ccf1e946fc13300e10d41fa584e1a369e30429c8cbc5fb023df94
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.10-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.6-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.8-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel8.9-arm64
     - sha256:de3def5b097ee5f53d53d97b8e9b87697b50e047860e4e950beb3c03e04aab41
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.0-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.2-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.3-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.4-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.5-amd64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.6-amd64
     - sha256:5f6936135ade31ddf06829b0976d4f3a0edde93bdcc712a4e28b3457bb5ca8e5
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.0-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.2-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.3-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.4-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.5-arm64
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.6-arm64
     - sha256:450488881acebdf914341b38b4bd44fc8c23caf46a99496002a48d06ebd609b9

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-sles15.7-amd64
     - sha256:83b3bd901ff2a7c69632f1085e0b0c9f6e3ed6cabe0daa7c03c4ce92c528ecdc
   * -
       | doca3.4.0-26.04-0.5.3.0-0-sles15.7-arm64
     - sha256:b13abc0aa9728a85209c774d394f13dab5d4f0109e3fe57c945cea0ec1791894


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
     - doca3.4.0-26.04-0.5.3.0-0

The followings tags are available for the above STIG FIPS Compliant DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-ubuntu24.04-amd64
     - sha256:fd9efd7805ed5482b6657defb2c36923337a471132b46b3ee8e4cd8a00f74572

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | doca3.4.0-26.04-0.5.3.0-0-rhel9.6-amd64
     - sha256:fd1d065d876de4f623665991a4a57f36b313bc6210b2c1a5ebb5e43050eb8b38