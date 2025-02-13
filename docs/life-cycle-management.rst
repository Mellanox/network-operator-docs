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
.. include:: ./common/vars.rst

*********************
Life Cycle Management
*********************

.. contents:: On this page
   :depth: 4
   :local:
   :backlinks: none

===========================
Network Operator Versioning
===========================

NVIDIA Network Operator is versioned following the calendar versioning convention.

The version follows the pattern ``YY.MM.PP``, such as 25.1.0, 24.10.0, and 24.10.1.
The first two fields, ``YY.MM`` identify a major version and indicates when the major version was initially released.
The third field, ``PP``, identifies the patch version of the major version.
Patch releases typically include critical bug and CVE fixes.

===========================
Network Operator Life Cycle
===========================

When a major version of NVIDIA Network Operator is released, the previous major version enters maintenance support
and only receives patch release updates for critical bug and CVE fixes.
Prior maintance release enters EOL (end-of-life) and are no longer supported and do not receive patch release updates.

The product life cycle and versioning are subject to change in the future.

.. list-table:: Support Status for Releases
   :header-rows: 1

   * - Network Operator Version
     - Status

   * - 25.1.x
     - Generally Available

   * - 24.10.x
     - Maintenance

   * - 24.7.x and lower
     - EOL


=============================
Ensuring Deployment Readiness
=============================

Once the Network Operator is deployed, and a NicClusterPolicy resource is created, the operator will reconcile the state of the cluster until it reaches the desired state, as defined in the resource.

Alignment of the cluster to the defined policy can be verified in the custom resource status.

a "Ready" state indicates that the required components were deployed, and that the policy is applied on the cluster.

---------------------------------------------------
Status Field Example of a NICClusterPolicy Instance
---------------------------------------------------

Get the NicClusterPolicy status:

.. code-block:: bash

   kubectl get -n nvidia-network-operator nicclusterpolicies.mellanox.com nic-cluster-policy -o yaml

.. code-block:: bash

  status:
    appliedStates:
    - name: state-pod-security-policy
      state: ignore
    - name: state-multus-cni
      state: ready
    - name: state-container-networking-plugins
      state: ignore
    - name: state-ipoib-cni
      state: ignore
    - name: state-whereabouts-cni
      state: ready
    - name: state-OFED
      state: ready
    - name: state-SRIOV-device-plugin
      state: ignore
    - name: state-RDMA-device-plugin
      state: ready
    - name: state-NV-Peer
      state: ignore
    - name: state-ib-kubernetes
      state: ignore
    - name: state-nv-ipam-cni
      state: ready
    state: ready

.. note:: An "Ignore" state indicates that the sub-state was not defined in the custom resource, and thus, it is ignored.

========================
Network Operator Upgrade
========================

Before upgrading to Network Operator v24.10 or newer with SR-IOV Network Operator enabled, the following manual actions are required:

.. code-block:: bash

  $ kubectl -n nvidia-network-operator scale deployment network-operator-sriov-network-operator --replicas 0

  $ kubectl -n nvidia-network-operator delete sriovnetworknodepolicies.sriovnetwork.openshift.io default

The network operator provides limited upgrade capabilities, which require additional manual actions if a containerized DOCA Driver is used. Future releases of the network operator will provide an automatic upgrade flow for the containerized driver.

Since Helm does not support auto-upgrade of existing CRDs, the user must follow a two-step process to upgrade the network-operator release:

* Upgrade the CRD to the latest version
* Apply Helm chart update

----------------------------
Downloading a New Helm Chart
----------------------------

To obtain new releases, run:

.. code-block:: bash
   :substitutions:

    # Download Helm chart
    $ helm fetch \https://helm.ngc.nvidia.com/nvidia/charts/network-operator-|helm-chart-version|.tgz
    $ ls network-operator-\*.tgz | xargs -n 1 tar xf


-------------------------------------
Upgrading CRDs for a Specific Release
-------------------------------------

It is possible to retrieve updated CRDs from the Helm chart or from the release branch on GitHub. The example below shows how to upgrade CRDs from the downloaded chart.

.. code-block:: bash

  $ kubectl apply \
    -f network-operator/crds \
    -f network-operator/charts/sriov-network-operator/crds

---------------------------------------------
Preparing the Helm Values for the New Release
---------------------------------------------

Edit the values-<VERSION>.yaml file as required for your cluster. The network operator has some limitations as to which updates in the NicClusterPolicy it can handle automatically. If the configuration for the new release is different from the current configuration in the deployed release, some additional manual actions may be required.

Known limitations:

* If component configuration was removed from the NicClusterPolicy, manual clean up of the component's resources (DaemonSets, ConfigMaps, etc.) may be required.
* If the configuration for devicePlugin changed without image upgrade, manual restart of the devicePlugin may be required.

These limitations will be addressed in future releases.

.. warning:: Changes that were made directly in the NicClusterPolicy CR (e.g. with kubectl edit) will be overwritten by the Helm upgrade due to the `force` flag.

------------------------------
Applying the Helm Chart Update
------------------------------

To apply the Helm chart update, run:

.. code-block:: bash

  $ helm upgrade -n nvidia-network-operator network-operator nvidia/network-operator --version=<VERSION> -f values-<VERSION>.yaml --force

.. warning:: The --devel option is required if you wish to use the Beta release.

--------------------------
DOCA Driver Manual Upgrade
--------------------------

################################################
Restarting Pods with a Containerized DOCA Driver
################################################

.. warning:: This operation is required only if containerized DOCA Driver is in use.

When a containerized DOCA Driver is reloaded on the node, all pods that use a secondary network based on NVIDIA NICs will lose network interface in their containers. To prevent outage, remove all pods that use a secondary network from the node before you reload the driver pod on it.

The Helm upgrade command will only upgrade the DaemonSet spec of the DOCA Driver to point to the new driver version. The DOCA Driver's DaemonSet will not automatically restart pods with the driver on the nodes, as it uses "OnDelete" updateStrategy. The old DOCA Driver version will still run on the node until you explicitly remove the driver pod or reboot the node:

.. code-block:: bash

  $ kubectl delete pod -l app=mofed-<OS_NAME> -n nvidia-network-operator

It is possible to remove all pods with secondary networks from all cluster nodes, and then restart the DOCA Driver pods on all nodes at once.

The alternative option is to perform an upgrade in a rolling manner to reduce the impact of the driver upgrade on the cluster. The driver pod restart can be done on each node individually. In this case, pods with secondary networks should be removed from the single node only. There is no need to stop pods on all nodes.

For each node, follow these steps to reload the driver on the node:

1. Remove pods with a secondary network from the node.
2. Restart the DOCA Driver pod.
3. Return the pods with a secondary network to the node.

When the DOCA Driver is ready, proceed with the same steps for other nodes.

####################################################
Removing Pods with a Secondary Network from the Node
####################################################

To remove pods with a secondary network from the node with node drain, run the following command:

.. code-block:: bash

  $ kubectl drain <NODE_NAME> --pod-selector=<SELECTOR_FOR_PODS>

.. warning:: Replace <NODE_NAME> with -l "network.nvidia.com/operator.mofed.wait=false" if you wish to drain all nodes at once.

##############################
Restarting the DOCA Driver Pod
##############################

Find the DOCA Driver pod name for the node:

.. code-block:: bash

  $ kubectl get pod -l app=mofed-<OS_NAME> -o wide -A

Example for Ubuntu 20.04:

.. code-block:: bash

  kubectl get pod -l app=mofed-ubuntu20.04 -o wide -A

##########################################
Deleting the DOCA Driver Pod from the Node
##########################################

To delete the DOCA Driver pod from the node, run:

.. code-block:: bash

  $ kubectl delete pod -n <DRIVER_NAMESPACE> <DOCA_DRIVER_POD_NAME>

.. warning:: Replace <DOCA_DRIVER_POD_NAME> with -l app=mofed-ubuntu20.04 if you wish to remove DOCA Driver pods on all nodes at once.

A new version of the DOCA Driver pod will automatically start.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Returning Pods with a Secondary Network to the Node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After the DOCA Driver pod is ready on the node, you can make the node schedulable again.

The command below will uncordon (remove node.kubernetes.io/unschedulable:NoSchedule taint) the node, and return the pods to it:

.. code-block:: bash

  $ kubectl uncordon -l "network.nvidia.com/operator.mofed.wait=false"

------------------------------
Automatic DOCA  Driver Upgrade
------------------------------

To enable automatic DOCA Driver upgrade, define the UpgradePolicy section for the ofedDriver in the NicClusterPolicy spec, and change the DOCA Driver version.

``nicclusterpolicy.yaml``:

.. code-block:: yaml
   :substitutions:

    apiVersion: mellanox.com/v1alpha1
    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
      namespace: nvidia-network-operator
    spec:
      ofedDriver:
        image: doca-driver
        repository: nvcr.io/nvidia/mellanox
        version: |mofed-version|
        upgradePolicy:
          # autoUpgrade is a global switch for automatic upgrade feature
          # if set to false all other options are ignored
          autoUpgrade: true
          # maxParallelUpgrades indicates how many nodes can be upgraded in parallel
          # 0 means no limit, all nodes will be upgraded in parallel
          maxParallelUpgrades: 0
          # cordon and drain (if enabled) a node before loading the driver on it
          safeLoad: false
          # describes the configuration for waiting on job completions
          waitForCompletion:
            # specifies a label selector for the pods to wait for completion
            podSelector: "app=myapp"
            # specify the length of time in seconds to wait before giving up for workload to finish, zero means infinite
            # if not specified, the default is 300 seconds
            timeoutSeconds: 300
          # describes configuration for node drain during automatic upgrade
          drain:
            # allow node draining during upgrade
            enable: true
            # allow force draining
            force: false
            # specify a label selector to filter pods on the node that need to be drained
            podSelector: ""
            # specify the length of time in seconds to wait before giving up drain, zero means infinite
            # if not specified, the default is 300 seconds
            timeoutSeconds: 300
            # specify if should continue even if there are pods using emptyDir
            deleteEmptyDir: false

Apply NicClusterPolicy CRD:

.. code-block:: bash

  $ kubectl apply -f nicclusterpolicy.yaml

.. warning:: To be able to drain nodes, make sure to fill the PodDisruptionBudget field for all the pods that use it. On some clusters (e.g. Openshift), many pods use PodDisruptionBudget, which makes draining multiple nodes at once impossible. Since evicting several pods that are controlled by the same deployment or replica set, violates their PodDisruptionBudget, those pods are not evicted and in drain failure.

  To perform a driver upgrade, the network-operator must evict pods that are using network resources. Therefore, in order to ensure that the network-operator is evicting only the required pods, the upgradePolicy.drain.podSelector field must be configured.

###################
Node Upgrade States
###################

The status upgrade of each node is reflected in its nvidia.com/ofed-driver-upgrade-state label . This label can have the following values:

.. list-table::
   :header-rows: 1

   * - Name
     - Description
   * - Unknown (empty)
     - The node has this state when the upgrade flow is disabled or the node has not been processed yet.
   * - ``upgrade-done``
     - Set when DOCA Driver POD is up-to-date and running on the node, the node is schedulable.
   * - ``upgrade-required``
     - Set when DOCA Driver POD on the node is not up-to-date and requires upgrade. No actions are performed at this stage.
   * - ``cordon-required``
     - Set when the node needs to be made unschedulable in preparation for driver upgrade.
   * - ``wait-for-jobs-required``
     - Set on the node when waiting is required for jobs to complete until the given timeout.
   * - ``drain-required``
     - Set when the node is scheduled for drain. After the drain, the state is changed either to pod-restart-required or upgrade-failed.
   * - ``pod-restart-required``
     - Set when the DOCA Driver POD on the node is scheduled for restart. After the restart, the state is changed to uncordon-required.
   * - ``uncordon-required``
     - Set when DOCA Driver POD on the node is up-to-date and has "Ready" status. After uncordone, the state is changed to upgrade-done
   * - ``upgrade-failed``
     - Set when the upgrade on the node has failed. Manual interaction is required at this stage. See Troubleshooting section for more details.

.. warning:: Depending on your cluster workloads and pod Disruption Budget, set the following values for auto upgrade:

  .. code-block:: yaml
    :substitutions:

      apiVersion: mellanox.com/v1alpha1
      kind: NicClusterPolicy
      metadata:
        name: nic-cluster-policy
        namespace: nvidia-network-operator
      spec:
        ofedDriver:
          image: doca-driver
          repository: nvcr.io/nvidia/mellanox
          version: |mofed-version|
          upgradePolicy:
            autoUpgrade: true
            maxParallelUpgrades: 1
            drain:
              enable: true
              force: false
              deleteEmptyDir: true
              podSelector: ""

###################
Safe Driver Loading
###################

.. warning:: The state of this feature can be controlled with the ofedDriver.upgradePolicy.safeLoad option.

Upon node startup, the DOCA Driver container takes some time to compile and load the driver. During that time, workloads might get scheduled on that node. When DOCA Driver is loaded, all existing PODs that use NVIDIA NICs will lose their network interfaces. Some such PODs might silently fail or hang. To avoid this situation, before the DOCA Driver container is loaded, the node should get cordoned and drained to ensure all workloads are rescheduled. The node should be un-cordoned when the driver is ready on it.

The safe driver loading feature is implemented as a part of the upgrade flow, meaning safe driver loading is a special scenario of the upgrade procedure, where we upgrade from the inbox driver to the containerized DOCA Driver.

When this feature is enabled, the initial DOCA Driver driver rollout on the large cluster can take a while. To speed up the rollout, the initial deployment can be done with the safe driver loading feature disabled, and this feature can be enabled later by updating the NicClusterPolicy CRD.

^^^^^^^^^^^^^^^
Troubleshooting
^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Issue
     - Required Action
   * - The node is in upgrade-failed state.
     - * Drain the node manually by running kubectl drain <node name> --ignore-daemonsets.
       * Delete the NVIDIA DOCA Driver pod on the node manually, by running the following command: ``kubectl delete pod -n `kubectl get pods --A --field-selector spec.nodeName=<node name> -l nvidia.com/ofed-driver --no-headers | awk '{print $1 " "$2}'```.

       **NOTE:** If the "Safe driver loading" feature is enabled, you may also need to remove the ``nvidia.com/ofed-driver-upgrade.driver-wait-for-safe-load`` annotation from the node object to unblock the loading of the driver
       ``kubectl annotate node <node_name> nvidia.com/ofed-driver-upgrade.driver-wait-for-safe-load-``

       * Wait for the node to complete the upgrade.

   * - The updated NVIDIA DOCA Driver pod failed to start/ a new version of NVIDIA DOCA Driver cannot be installed on the node.
     - Manually delete the pod by using ``kubectl delete -n <Network Operator Namespace> <pod name>``.
       If following the restart the pod still fails, change the NVIDIA DOCA Driver version in the NicClusterPolicy to the previous version or to another working version.

=================================
Uninstalling the Network Operator
=================================

-------------------------------------------------------------
Uninstalling Network Operator on a Vanilla Kubernetes Cluster
-------------------------------------------------------------

Delete the NicClusterPolicy:

.. code-block:: bash

   kubectl delete -n nvidia-network-operator nicclusterpolicies.mellanox.com nic-cluster-policy

Uninstall the Network Operator:

.. code-block:: bash

  helm uninstall network-operator -n nvidia-network-operator

You should now see all the pods being deleted:

.. code-block:: bash

  kubectl get pods -n nvidia-network-operator

Make sure that the CRDs created during the operator installation have been removed:

.. code-block:: bash

  kubectl get nicclusterpolicies.mellanox.com
  No resources found

---------------------------------------------------------
Uninstalling the Network Operator on an OpenShift Cluster
---------------------------------------------------------

.. _Red Hat OpenShift Container Platform Documentation: https://docs.openshift.com/container-platform/4.10/operators/admin/olm-deleting-operators-from-cluster.html

From the console:

In the OpenShift Container Platform web console side menu, select **Operators >Installed Operators**, search for the **NVIDIA Network Operator**, and click on it.

On the right side of the **Operator Details** page, select **Uninstall Operator** from the **Actions** drop-down menu.

For additional information, see the `Red Hat OpenShift Container Platform Documentation`_.

From the CLI:

  * Check the current version of the Network Operator in the currentCSV field:

    .. code-block:: bash

      oc get subscription -n nvidia-network-operator nvidia-network-operator -o yaml | grep currentCSV

    Example output:

    .. code-block:: bash

      currentCSV: nvidia-network-operator.v24.1.0
  * Delete the subscription:

    .. code-block:: bash

      oc delete subscription -n nvidia-network-operator nvidia-network-operator

    Example output:

    .. code-block:: bash

      subscription.operators.coreos.com "nvidia-network-operator" deleted

  * Delete the CSV using the currentCSV value from the previous step:

    .. code-block:: bash

      subscription.operators.coreos.com "nvidia-network-operator" deleted

    Example output:

    .. code-block:: bash

      clusterserviceversion.operators.coreos.com "nvidia-network-operator.v10.0" deleted

The SR-IOV Network Operator uninstallation procedure is described in this document. For additional information, see the `Red Hat OpenShift Container Platform Documentation`_.

----------------
Additional Steps
----------------

.. warning:: In OCP, uninstalling an operator does not remove its managed resources, including CRDs and CRs. To remove them, you must manually delete the Operator CRDs following the operator uninstallation.

Delete the Network Operator CRDs:

.. code-block:: bash

  oc delete crds hostdevicenetworks.mellanox.com macvlannetworks.mellanox.com nicclusterpolicies.mellanox.com

===========================
NicClusterPolicy CRD Update
===========================
If the NicClusterPolicy manual update affects the device plugin configuration (e.g. NICs selectors), manual device plugin pods restart is required.
