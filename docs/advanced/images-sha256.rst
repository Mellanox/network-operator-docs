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
     - v25.7.0-beta.1
     - sha256:f1156eec9d9097fb68d355e79b7f9b2d6d8c0017b3c6f173fe077d7039722d80
   * - nvcr.io/nvstaging/mellanox
     - network-operator-init-container
     - network-operator-v25.7.0-beta.2
     - sha256:939930c4e99230a740b31fc7e4adf3d7e5b90f4a94169b9da4c3994dc8137816
   * - nvcr.io/nvstaging/mellanox
     - k8s-rdma-shared-dev-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:f69523e7e0f6f1cf5a8d18c4ebae83229f9c45373ed206f50926250672e8c6af
   * - nvcr.io/nvstaging/mellanox
     - ib-kubernetes
     - network-operator-v25.7.0-beta.2
     - sha256:c410b334baeb1e781767b60b82b9b33a2ac1b1df584ab2c350d8a0ae5497e71b
   * - nvcr.io/nvstaging/mellanox
     - ipoib-cni
     - network-operator-v25.7.0-beta.2
     - sha256:3343112f345b8caa0f7aa29906cb3a0e5b290e737f18bd19fcd2d32cba903ecc
   * - nvcr.io/nvstaging/mellanox
     - nvidia-k8s-ipam
     - network-operator-v25.7.0-beta.2
     - sha256:a132150417d1c857e86418456af05d70deb7d4d828184013c064fd436cacbb82
   * - nvcr.io/nvstaging/mellanox
     - nic-feature-discovery
     - network-operator-v25.7.0-beta.2
     - sha256:64547422659625aefbd85aa59944812dca49e5ef8428656bdb48dfbf6b33a628
   * - nvcr.io/nvidia/doca
     - doca_telemetry
     - 1.21.4-doca3.0.0-host
     - sha256:13c2a2d055e501c03c6451413b85476ceafbc2fbffc7443952294c196f3f89f3
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator
     - network-operator-25.4.0
     - sha256:fd4ef7f4a5342518d49526ebc5c0168adc9660e6be1bb665dc53db327d5a87eb
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-webhook
     - network-operator-25.4.0
     - sha256:cd350ea326bf311064db6f403f424f72b4b33bb1f6681214fb3b521ad3db9945
   * - nvcr.io/nvidia/mellanox
     - sriov-network-operator-config-daemon
     - network-operator-25.4.0
     - sha256:747c2de5521389bbd9666a82aaf9c1864d57288fa7a334ddd75dd4960fb27f43
   * - nvcr.io/nvstaging/mellanox
     - sriov-network-device-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:b2aa75e4533f2c2cc65c66c828d874e2d349ea120cdee99e6f994aee26613d8a
   * - nvcr.io/nvstaging/mellanox
     - sriov-cni
     - network-operator-v25.7.0-beta.2
     - sha256:cad7b91d2e59c7d0b49ec6c1f430697e6848f2d828a002c66f49e26aa1a102ac
   * - nvcr.io/nvstaging/mellanox
     - ib-sriov-cni
     - network-operator-v25.7.0-beta.2
     - sha256:35032a8a6195dcb6e4e01f8f1c82405aedde1a07386fc746c3048f463e9b1b5b
   * - nvcr.io/nvstaging/mellanox
     - plugins
     - network-operator-v25.7.0-beta.2
     - sha256:226d1274c503c47473fb310c4ef2bf029be6d8c9b21f5a9f17a9c335d49e2020
   * - nvcr.io/nvstaging/mellanox
     - multus-cni
     - network-operator-v25.7.0-beta.2
     - sha256:80234d240000c7d839a661dc902ee6c0a65743cafc93f68cc36d01796b0f7fad
   * - nvcr.io/nvstaging/mellanox
     - whereabouts
     - network-operator-v25.7.0-beta.2
     - sha256:ab4289c5bda987ca2eee10cbc7d35247cb13ed8487f9972dd95b0d00c3f617a9
   * - nvcr.io/nvstaging/mellanox
     - ovs-cni-plugin
     - network-operator-v25.7.0-beta.2
     - sha256:cd4c3bc9bb0ede3bed71026edbef2aadbfea97a90b156f9260e00e13ae8d9c55
   * - nvcr.io/nvstaging/mellanox
     - rdma-cni
     - network-operator-v25.7.0-beta.2
     - sha256:bd62b733910c005d2d49207ae10e90c68b927b5804d82918bf58dd7fa82e62d9
   * - ghcr.io/mellanox
     - nic-configuration-operator
     - v1.0.3
     - sha256:353ab27f5f5fba08197cbe8968222e1c115431cc1b9b8d8445f1facb3c3c4d7b
   * - ghcr.io/mellanox
     - nic-configuration-operator-daemon
     - v1.0.3
     - sha256:0e8478898e0b30aec13030b11081b205308666c2a9c5c5bf2c00121079901b41
   * - nvcr.io/nvstaging/mellanox
     - maintenance-operator
     - network-operator-v25.7.0-beta.2
     - sha256:70c5725a2f99c3c9318477e00b1dfcd9b13c885bede3ad680bdc95f73a7b8ac9
   * - nvcr.io/nvstaging/mellanox
     - spectrum-x-operator
     - network-operator-v25.7.0-beta.2
     - sha256:b01b62f7c899d2679d8912923397390c8b95a7cbe407e28a3936f012d439373c

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
     - 25.04-0.6.1.0-2


The followings tags are available for the above DOCA-OFED Driver container version:

------
Ubuntu
------

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-5.15.0-25-generic-ubuntu22.04-amd64
     - sha256:2410568bcac94ed18fc4fadc596ff8b7b38602afeaef5d761117ae875d8b69eb
   * -
       | 25.04-0.6.1.0-2-5.15.0-25-generic-ubuntu22.04-arm64
     - sha256:b2dc16d8ca360a6f17694d9bbe68d2cb8217d05877069068d0bd2eb71f4e5e33
   * -
       | 25.04-0.6.1.0-2-6.11.0-1007-nvidia-ubuntu24.04-amd64
     - sha256:0f0719c32b95daa37c5d9d9b37aae2a3223fe663e47d4baf42b942908dd29664
   * -
       | 25.04-0.6.1.0-2-6.11.0-1007-nvidia-ubuntu24.04-arm64
     - sha256:f5676fcc5538e4ad68d251308f3e57d3e053ac332482e4d832805e950efd0e3e
   * -
       | 25.04-0.6.1.0-2-6.11.0-1014-azure-ubuntu24.04-amd64
     - sha256:a33c333eb12d76d40801e83284af0beb0ca90264722dc1096d77ad6d86df54ac
   * -
       | 25.04-0.6.1.0-2-6.11.0-1014-azure-ubuntu24.04-arm64
     - sha256:0e717a9ced009c3798a9f46daca646ac6922c46f84c3c34914b55e7e5ff6c36c
   * -
       | 25.04-0.6.1.0-2-6.8.0-1025-oracle-ubuntu22.04-amd64
     - sha256:59c46cd0061f5c87c7ee736f82116c38ab734eda3610fed3575493712476b719
   * -
       | 25.04-0.6.1.0-2-6.8.0-1025-oracle-ubuntu22.04-arm64
     - sha256:3355578f4383e6c252038f4fb26e1b053ba2b3e1b2144bfff26ded4054566efd
   * -
       | 25.04-0.6.1.0-2-6.8.0-1026-oracle-ubuntu24.04-amd64
     - sha256:7b4aa05954c3dfda02ebeacd70c4ef5c74ddaa5a952aeb06dc5a7130eb393eac
   * -
       | 25.04-0.6.1.0-2-6.8.0-1026-oracle-ubuntu24.04-arm64
     - sha256:8a94e1509f8ce6bd26be9f9f4fab98dd2a1535a0efac9b4bd1aa34aa630a18a0
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-azure-ubuntu22.04-amd64
     - sha256:435aca1744a8bd436d5dcd030357d76454313dcfbed83e8136658562ab607948
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-azure-ubuntu22.04-arm64
     - sha256:37da7ba7a44c2516dcb8bbec44f124f37b597d58631b06acc4fb3a81e44b8c23
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-nvidia-ubuntu22.04-amd64
     - sha256:13fbe5d4ab7d6604382c797d555277b4f4da01411f64e2763b5de6da73dace2d
   * -
       | 25.04-0.6.1.0-2-6.8.0-1028-nvidia-ubuntu22.04-arm64
     - sha256:f10b7ee8b3b06f2512f43f4f3feae00d186005fb4acb43eca5f5e61aea6a4489
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu22.04-amd64
     - sha256:d04b62a02470467f2832c5925d23a74de1d9a214c7308bcb02cc692c20f8ce0b
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu22.04-arm64
     - sha256:50a416ebbde3ee801c83d0b500b8b9dff6db924b85613dc8cc6ede7385a1dd3f
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu24.04-amd64
     - sha256:b7a4819d30e25867a37c9bab4a3e7b23d3d6962f265c17fd1ef31799328d323f
   * -
       | 25.04-0.6.1.0-2-6.8.0-1029-aws-ubuntu24.04-arm64
     - sha256:e72030c760add213d268bb8fd28851b6d149a3fef3a04a342befa1c51c279f51
   * -
       | 25.04-0.6.1.0-2-6.8.0-31-generic-ubuntu24.04-amd64
     - sha256:dce95980169e469ab235c8419d318c55fb0ef5b8fd6c17773669a71e7b766dcf
   * -
       | 25.04-0.6.1.0-2-6.8.0-31-generic-ubuntu24.04-arm64
     - sha256:50bca7f9910a15baa081445f62e5a02f3a04f376d28301fc3117f3163f7935cd
   * -
       | 25.04-0.6.1.0-2-rhcos4.19
       | 25.04-0.6.1.0-2-ubuntu22.04
     - sha256:b3561383f61423fc5e312fb0bfdd30345cbe32e8c404482c329ca9fe929e9905
   * -
       | 25.04-0.6.1.0-2-ubuntu22.04-amd64
     - sha256:cb436254179a539a33c31b97c3eb84f78011e5eba3b7a49780245fed233076cf
   * -
       | 25.04-0.6.1.0-2-ubuntu22.04-arm64
     - sha256:b434c8d20f9fee8c590bb34375da751d25a0d9e249b9f67640264afc2ca54dd3
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04
     - sha256:86122f68639756d7565b0f12368ffe872fa487d09aff874a736c1055e2b22588
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-amd64
       | 25.04-0.6.1.0-200-rhcos4.19-amd64
     - sha256:c9d12598ab699d29a04d6fadd89fdf0b2515dd5947f414baa704bc20f0d790a8
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-arm64
       | 25.04-0.6.1.0-200-rhcos4.19-arm64
     - sha256:97c311b6cf9b973b65767b5520cb0a76077837599ecd1b8581c774deb6ae50db
   * -
       | 25.04-0.6.1.0-21-ubuntu24.04-amd64
     - sha256:188eabded1db4f60051c58df8b162f39b66d96197790dc614ff0f1cd2a7cfad5
   * -
       | 25.04-0.6.1.0-22-ubuntu24.04-amd64
     - sha256:607ae32ada98fc16c3d523829f81cdd99b27a759ba340133b735928cdcc5fdab

-----
RHCOS
-----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-rhcos4.13-amd64
       | 25.04-0.6.1.0-2-rhcos4.14-amd64
       | 25.04-0.6.1.0-2-rhcos4.15-amd64
       | 25.04-0.6.1.0-2-rhcos4.16-amd64
       | 25.04-0.6.1.0-2-rhcos4.17-amd64
       | 25.04-0.6.1.0-2-rhcos4.18-amd64
       | 25.04-0.6.1.0-2-rhcos4.19-amd64
     - sha256:0cec1ad27b1c7642c2d997dbfb00893b632b0cf2b1af658ea212e1d322445ce5
   * -
       | 25.04-0.6.1.0-2-rhcos4.13-arm64
       | 25.04-0.6.1.0-2-rhcos4.14-arm64
       | 25.04-0.6.1.0-2-rhcos4.15-arm64
       | 25.04-0.6.1.0-2-rhcos4.16-arm64
       | 25.04-0.6.1.0-2-rhcos4.17-arm64
       | 25.04-0.6.1.0-2-rhcos4.18-arm64
       | 25.04-0.6.1.0-2-rhcos4.19-arm64
     - sha256:e1a8b3e702e6c77b061b64306769d9b86d960e0bad4fd4ef31c588e215b39e0b
   * -
       | 25.04-0.6.1.0-2-rhcos4.18
     - sha256:796facf411f137fec41ee447c7a4955af716bb929a80688d0e21a48d523394c7
   * -
       | 25.04-0.6.1.0-2-rhcos4.19
       | 25.04-0.6.1.0-2-ubuntu22.04
     - sha256:b3561383f61423fc5e312fb0bfdd30345cbe32e8c404482c329ca9fe929e9905
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-amd64
       | 25.04-0.6.1.0-200-rhcos4.19-amd64
     - sha256:c9d12598ab699d29a04d6fadd89fdf0b2515dd5947f414baa704bc20f0d790a8
   * -
       | 25.04-0.6.1.0-2-ubuntu24.04-arm64
       | 25.04-0.6.1.0-200-rhcos4.19-arm64
     - sha256:97c311b6cf9b973b65767b5520cb0a76077837599ecd1b8581c774deb6ae50db
   * -
       | 25.04-0.6.1.0-200-rhcos4.18-amd64
     - sha256:10a29c282d159a66e972bd2be12a8dce03c3b891deed07ad2b97c9ed9c1c2afe
   * -
       | 25.04-0.6.1.0-210-rhcos4.16-amd64
     - sha256:710c72cca18b3625637d4828a612cc16fd3c6a7b37c4cd7c8c78a1bfaff963d9
   * -
       | 25.04-0.6.1.0-210-rhcos4.18-amd64
     - sha256:8b6992a0a96fd0a549e31553b449c6683de9d8c681cf9a4414e6fa2fc8048f80
   * -
       | 25.04-0.6.1.0-211-rhcos4.16-amd64
     - sha256:9178c2cb416396e22b6707089c3670aec32bec60221c4cba1db8e5f3aa41e72e

----
RHEL
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-mztest
       | 25.04-0.6.1.0-2-rhel8.10
     - sha256:9ffc93fa12782ea7bf064d2d3a199072510ceab5d0af18d34ec95b1980c1f733
   * -
       | 25.04-0.6.1.0-2-rhel8.10-amd64
       | 25.04-0.6.1.0-2-rhel8.6-amd64
       | 25.04-0.6.1.0-2-rhel8.8-amd64
       | 25.04-0.6.1.0-2-rhel8.9-amd64
     - sha256:35ff3b173b2694198e57b61720545be67e944c1da18ac004007a5b4e68562adc
   * -
       | 25.04-0.6.1.0-2-rhel8.10-arm64
       | 25.04-0.6.1.0-2-rhel8.6-arm64
       | 25.04-0.6.1.0-2-rhel8.8-arm64
       | 25.04-0.6.1.0-2-rhel8.9-arm64
     - sha256:76529c24ea17e68b89a2c0d4823d66504fa6f53759760a449308fda396574097
   * -
       | 25.04-0.6.1.0-2-rhel9.0-amd64
       | 25.04-0.6.1.0-2-rhel9.2-amd64
       | 25.04-0.6.1.0-2-rhel9.3-amd64
       | 25.04-0.6.1.0-2-rhel9.4-amd64
       | 25.04-0.6.1.0-2-rhel9.5-amd64
     - sha256:4a620bd39bc70928cd6e249855176ced0f4feb585c8c7624c0b9f5a3e57664c9
   * -
       | 25.04-0.6.1.0-2-rhel9.0-arm64
       | 25.04-0.6.1.0-2-rhel9.2-arm64
       | 25.04-0.6.1.0-2-rhel9.3-arm64
       | 25.04-0.6.1.0-2-rhel9.4-arm64
       | 25.04-0.6.1.0-2-rhel9.5-arm64
     - sha256:56a41010b4dbee0dc31e8f9c1467a739241a2d248ed8b5054d4b418f7f79f04d
   * -
       | 25.04-0.6.1.0-2-rhel9.5
     - sha256:861eb503c13cf4246aacefdd5deaa978eddce1cc6bf1d83beb1a7b38a4b2631b

----
SLES
----

.. list-table::
   :header-rows: 1

   * - Tags
     - Digest
   * -
       | 25.04-0.6.1.0-2-sles15.6
     - sha256:18d789efefea306f42a87f08df8cc53075f274abb3ddd5d10da2974eaa0e5a98
   * -
       | 25.04-0.6.1.0-2-sles15.6-amd64
     - sha256:ea2b07942daafa8c08cacfcf8ba64f783a39fd6f8644458952fd582325e4a7f0
   * -
       | 25.04-0.6.1.0-2-sles15.6-arm64
     - sha256:e3389a26293b3f2fa291b87c66f97819325359c61055fa3e360227bcddfe7f07