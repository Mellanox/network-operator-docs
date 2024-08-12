Network Operator API reference v1alpha1
=======================================

Packages:

-  `mellanox.com/v1alpha1 <#mellanox.com%2fv1alpha1>`__

.. _mellanox.com/v1alpha1:

mellanox.com/v1alpha1
---------------------

Package v1alpha1 contains API Schema definitions for the mellanox.com v1alpha1 API group

Resource Types:

.. _mellanox.com/v1alpha1.AppliedState:

AppliedState
~~~~~~~~~~~~

(*Appears on:* `HostDeviceNetworkStatus <#mellanox.com/v1alpha1.HostDeviceNetworkStatus>`__, `NicClusterPolicyStatus <#mellanox.com/v1alpha1.NicClusterPolicyStatus>`__)

AppliedState defines a finer-grained view of the observed state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          |                                                                                                   |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``state``                                                                                         |                                                                                                   |
      | `State <#mellanox.com/v1alpha1.State>`__                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``message``                                                                                       | Message is a human readable message indicating details about why the state is in this condition   |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.ConfigMapNameReference:

ConfigMapNameReference
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `OFEDDriverSpec <#mellanox.com/v1alpha1.OFEDDriverSpec>`__)

ConfigMapNameReference references a config map in a specific namespace. The namespace must be specified at the point of use.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the ConfigMap                                                                             |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.DOCATelemetryServiceConfig:

DOCATelemetryServiceConfig
~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `DOCATelemetryServiceSpec <#mellanox.com/v1alpha1.DOCATelemetryServiceSpec>`__)

DOCATelemetryServiceConfig contains configuration for the DOCATelemetryService.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``fromConfigMap``                                                                                 | *(Optional)*                                                                                      |
      | *string*                                                                                          | FromConfigMap sets the configMap the DOCATelemetryService gets its configuration from. The        |
      |                                                                                                   | ConfigMap must be in the same namespace as the NICClusterPolicy.                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.DOCATelemetryServiceSpec:

DOCATelemetryServiceSpec
~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

DOCATelemetryServiceSpec is the configuration for DOCA Telemetry Service.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     |                                                                                                   |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``config``                                                                                        | *(Optional)*                                                                                      |
      | `DOCATelemetryServiceConfig <#mellanox.com/v1alpha1.DOCATelemetryServiceConfig>`__                | Config contains custom config for the DOCATelemetryService. If set no default config will be      |
      |                                                                                                   | deployed.                                                                                         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.DevicePluginSpec:

DevicePluginSpec
~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

DevicePluginSpec describes configuration options for device plugin 1. Image information for device plugin 2. Device plugin configuration

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpecWithConfig``                                                                           |                                                                                                   |
      | `ImageSpecWithConfig <#mellanox.com/v1alpha1.ImageSpecWithConfig>`__                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``useCdi``                                                                                        | Enables use of container device interface (CDI)                                                   |
      | *bool*                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.DrainSpec:

DrainSpec
~~~~~~~~~

(*Appears on:* `DriverUpgradePolicySpec <#mellanox.com/v1alpha1.DriverUpgradePolicySpec>`__)

DrainSpec describes configuration for node drain during automatic upgrade

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enable``                                                                                        | *(Optional)*                                                                                      |
      | *bool*                                                                                            | Enable indicates if node draining is allowed during upgrade                                       |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``force``                                                                                         | *(Optional)*                                                                                      |
      | *bool*                                                                                            | Force indicates if force draining is allowed                                                      |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``podSelector``                                                                                   | *(Optional)*                                                                                      |
      | *string*                                                                                          | PodSelector specifies a label selector to filter pods on the node that need to be drained For     |
      |                                                                                                   | more details on label selectors, see:                                                             |
      |                                                                                                   | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``timeoutSeconds``                                                                                | *(Optional)*                                                                                      |
      | *int*                                                                                             | TimeoutSecond specifies the length of time in seconds to wait before giving up drain, zero means  |
      |                                                                                                   | infinite                                                                                          |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``deleteEmptyDir``                                                                                | *(Optional)*                                                                                      |
      | *bool*                                                                                            | DeleteEmptyDir indicates if should continue even if there are pods using emptyDir (local data     |
      |                                                                                                   | that will be deleted when the node is drained)                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.DriverUpgradePolicySpec:

DriverUpgradePolicySpec
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `OFEDDriverSpec <#mellanox.com/v1alpha1.OFEDDriverSpec>`__)

DriverUpgradePolicySpec describes policy configuration for automatic upgrades

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``autoUpgrade``                                                                                   | *(Optional)*                                                                                      |
      | *bool*                                                                                            | AutoUpgrade is a global switch for automatic upgrade feature if set to false all other options    |
      |                                                                                                   | are ignored                                                                                       |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``maxParallelUpgrades``                                                                           | *(Optional)*                                                                                      |
      | *int*                                                                                             | MaxParallelUpgrades indicates how many nodes can be upgraded in parallel 0 means no limit, all    |
      |                                                                                                   | nodes will be upgraded in parallel                                                                |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``waitForCompletion``                                                                             |                                                                                                   |
      | `WaitForCompletionSpec <#mellanox.com/v1alpha1.WaitForCompletionSpec>`__                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``drain``                                                                                         |                                                                                                   |
      | `DrainSpec <#mellanox.com/v1alpha1.DrainSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``safeLoad``                                                                                      | *(Optional)*                                                                                      |
      | *bool*                                                                                            | SafeLoad turn on safe driver loading (cordon and drain the node before loading the driver)        |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.HostDeviceNetwork:

HostDeviceNetwork
~~~~~~~~~~~~~~~~~

HostDeviceNetwork is the Schema for the hostdevicenetworks API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``metadata``                                                                                      | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                       |                                                                                                   |
      | meta/v1.Object                                                                                    |                                                                                                   |
      | Meta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                          | +----------------------------------------------+----------------------------------------------+   |
      | `HostDeviceNetworkSpec <#mellanox.com/v1alpha1.HostDeviceNetworkSpec>`__                          | | ``networkNamespace``                         | Namespace of the NetworkAttachmentDefinition |   |
      |                                                                                                   | | *string*                                     | custom resource                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``resourceName``                             | Host device resource pool name               |   |
      |                                                                                                   | | *string*                                     |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``ipam``                                     | IPAM configuration to be used for this       |   |
      |                                                                                                   | | *string*                                     | network                                      |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        |                                                                                                   |
      | `HostDeviceNetworkStatus <#mellanox.com/v1alpha1.HostDeviceNetworkStatus>`__                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.HostDeviceNetworkSpec:

HostDeviceNetworkSpec
~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `HostDeviceNetwork <#mellanox.com/v1alpha1.HostDeviceNetwork>`__)

HostDeviceNetworkSpec defines the desired state of HostDeviceNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``resourceName``                                                                                  | Host device resource pool name                                                                    |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network                                                    |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.HostDeviceNetworkStatus:

HostDeviceNetworkStatus
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `HostDeviceNetwork <#mellanox.com/v1alpha1.HostDeviceNetwork>`__)

HostDeviceNetworkStatus defines the observed state of HostDeviceNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the HostDeviceNetwork                                                       |
      | `State <#mellanox.com/v1alpha1.State>`__                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``hostDeviceNetworkAttachmentDef``                                                                | Network attachment definition generated from HostDeviceNetworkSpec                                |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``appliedStates``                                                                                 | AppliedStates provide a finer view of the observed state                                          |
      | `[]AppliedState <#mellanox.com/v1alpha1.AppliedState>`__                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.IBKubernetesSpec:

IBKubernetesSpec
~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

IBKubernetesSpec describes configuration options for ib-kubernetes

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for ib-kubernetes                                                               |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``periodicUpdateSeconds``                                                                         | *(Optional)*                                                                                      |
      | *int*                                                                                             | Interval of updates in seconds                                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pKeyGUIDPoolRangeStart``                                                                        | The first guid in the pool                                                                        |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pKeyGUIDPoolRangeEnd``                                                                          | The last guid in the pool                                                                         |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ufmSecret``                                                                                     | Secret containing credentials to UFM service                                                      |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.IPoIBNetwork:

IPoIBNetwork
~~~~~~~~~~~~

IPoIBNetwork is the Schema for the ipoibnetworks API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``metadata``                                                                                      | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                       |                                                                                                   |
      | meta/v1.Object                                                                                    |                                                                                                   |
      | Meta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                          | +----------------------------------------------+----------------------------------------------+   |
      | `IPoIBNetworkSpec <#mellanox.com/v1alpha1.IPoIBNetworkSpec>`__                                    | | ``networkNamespace``                         | Namespace of the NetworkAttachmentDefinition |   |
      |                                                                                                   | | *string*                                     | custom resource                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``master``                                   | Name of the host interface to enslave.       |   |
      |                                                                                                   | | *string*                                     | Defaults to default route interface          |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``ipam``                                     | IPAM configuration to be used for this       |   |
      |                                                                                                   | | *string*                                     | network.                                     |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        |                                                                                                   |
      | `IPoIBNetworkStatus <#mellanox.com/v1alpha1.IPoIBNetworkStatus>`__                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.IPoIBNetworkSpec:

IPoIBNetworkSpec
~~~~~~~~~~~~~~~~

(*Appears on:* `IPoIBNetwork <#mellanox.com/v1alpha1.IPoIBNetwork>`__)

IPoIBNetworkSpec defines the desired state of IPoIBNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``master``                                                                                        | Name of the host interface to enslave. Defaults to default route interface                        |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network.                                                   |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.IPoIBNetworkStatus:

IPoIBNetworkStatus
~~~~~~~~~~~~~~~~~~

(*Appears on:* `IPoIBNetwork <#mellanox.com/v1alpha1.IPoIBNetwork>`__)

IPoIBNetworkStatus defines the observed state of IPoIBNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the IPoIBNetwork                                                            |
      | `State <#mellanox.com/v1alpha1.State>`__                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipoibNetworkAttachmentDef``                                                                     | Network attachment definition generated from IPoIBNetworkSpec                                     |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.ImageSpec:

ImageSpec
~~~~~~~~~

(*Appears on:* `DOCATelemetryServiceSpec <#mellanox.com/v1alpha1.DOCATelemetryServiceSpec>`__, `IBKubernetesSpec <#mellanox.com/v1alpha1.IBKubernetesSpec>`__,
`ImageSpecWithConfig <#mellanox.com/v1alpha1.ImageSpecWithConfig>`__, `NICFeatureDiscoverySpec <#mellanox.com/v1alpha1.NICFeatureDiscoverySpec>`__, `NVIPAMSpec <#mellanox.com/v1alpha1.NVIPAMSpec>`__,
`OFEDDriverSpec <#mellanox.com/v1alpha1.OFEDDriverSpec>`__, `SecondaryNetworkSpec <#mellanox.com/v1alpha1.SecondaryNetworkSpec>`__)

ImageSpec Contains container image specifications

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``image``                                                                                         | Name of the image                                                                                 |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``repository``                                                                                    | Address of the registry that stores the image                                                     |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``version``                                                                                       | Version of the image to use                                                                       |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``imagePullSecrets``                                                                              | *(Optional)*                                                                                      |
      | *[]string*                                                                                        | ImagePullSecrets is an optional list of references to secrets in the same namespace to use for    |
      |                                                                                                   | pulling the image                                                                                 |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``containerResources``                                                                            | ResourceRequirements describes the compute resource requirements                                  |
      | `[]ResourceRequirements <#mellanox.com/v1alpha1.ResourceRequirements>`__                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.ImageSpecWithConfig:

ImageSpecWithConfig
~~~~~~~~~~~~~~~~~~~

(*Appears on:* `DevicePluginSpec <#mellanox.com/v1alpha1.DevicePluginSpec>`__, `MultusSpec <#mellanox.com/v1alpha1.MultusSpec>`__)

ImageSpecWithConfig Contains ImageSpec and optional configuration

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     |                                                                                                   |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``config``                                                                                        | Configuration for the component as a string                                                       |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.MacvlanNetwork:

MacvlanNetwork
~~~~~~~~~~~~~~

MacvlanNetwork is the Schema for the macvlannetworks API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``metadata``                                                                                      | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                       |                                                                                                   |
      | meta/v1.Object                                                                                    |                                                                                                   |
      | Meta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                          | +----------------------------------------------+----------------------------------------------+   |
      | `MacvlanNetworkSpec <#mellanox.com/v1alpha1.MacvlanNetworkSpec>`__                                | | ``networkNamespace``                         | Namespace of the NetworkAttachmentDefinition |   |
      |                                                                                                   | | *string*                                     | custom resource                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``master``                                   | Name of the host interface to enslave.       |   |
      |                                                                                                   | | *string*                                     | Defaults to default route interface          |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``mode``                                     | Mode of interface one of “bridge”,           |   |
      |                                                                                                   | | *string*                                     | “private”, “vepa”, “passthru”                |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``mtu``                                      | MTU of interface to the specified value. 0   |   |
      |                                                                                                   | | *int*                                        | for master’s MTU                             |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``ipam``                                     | IPAM configuration to be used for this       |   |
      |                                                                                                   | | *string*                                     | network.                                     |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        |                                                                                                   |
      | `MacvlanNetworkStatus <#mellanox.com/v1alpha1.MacvlanNetworkStatus>`__                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.MacvlanNetworkSpec:

MacvlanNetworkSpec
~~~~~~~~~~~~~~~~~~

(*Appears on:* `MacvlanNetwork <#mellanox.com/v1alpha1.MacvlanNetwork>`__)

MacvlanNetworkSpec defines the desired state of MacvlanNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``master``                                                                                        | Name of the host interface to enslave. Defaults to default route interface                        |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``mode``                                                                                          | Mode of interface one of “bridge”, “private”, “vepa”, “passthru”                                  |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``mtu``                                                                                           | MTU of interface to the specified value. 0 for master’s MTU                                       |
      | *int*                                                                                             |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network.                                                   |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.MacvlanNetworkStatus:

MacvlanNetworkStatus
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `MacvlanNetwork <#mellanox.com/v1alpha1.MacvlanNetwork>`__)

MacvlanNetworkStatus defines the observed state of MacvlanNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the MacvlanNetwork                                                          |
      | `State <#mellanox.com/v1alpha1.State>`__                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``macvlanNetworkAttachmentDef``                                                                   | Network attachment definition generated from MacvlanNetworkSpec                                   |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.MultusSpec:

MultusSpec
~~~~~~~~~~

(*Appears on:* `SecondaryNetworkSpec <#mellanox.com/v1alpha1.SecondaryNetworkSpec>`__)

MultusSpec describes configuration options for Multus CNI 1. Image information for Multus CNI 2. Multus CNI config if config is missing or empty then multus config will be automatically generated from
the CNI configuration file of the master plugin (the first file in lexicographical order in cni-conf-dir)

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpecWithConfig``                                                                           |                                                                                                   |
      | `ImageSpecWithConfig <#mellanox.com/v1alpha1.ImageSpecWithConfig>`__                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.NICFeatureDiscoverySpec:

NICFeatureDiscoverySpec
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

NICFeatureDiscoverySpec describes configuration options for nic-feature-discovery

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     |                                                                                                   |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.NVIPAMSpec:

NVIPAMSpec
~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

NVIPAMSpec describes configuration options for nv-ipam 1. Image information for nv-ipam 2. Configuration for nv-ipam

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enableWebhook``                                                                                 | Enable deployment of the validation webhook                                                       |
      | *bool*                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ImageSpec``                                                                                     |                                                                                                   |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.NicClusterPolicy:

NicClusterPolicy
~~~~~~~~~~~~~~~~

NicClusterPolicy is the Schema for the nicclusterpolicies API

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``metadata``                                                                                      | Refer to the Kubernetes API documentation for the fields of the ``metadata`` field.               |
      | `Kubernetes                                                                                       |                                                                                                   |
      | meta/v1.Object                                                                                    |                                                                                                   |
      | Meta <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#objectmeta-v1-meta>`__ |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``spec``                                                                                          | +----------------------------------------------+----------------------------------------------+   |
      | `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__                            | | ``nodeAffinity``                             | Additional nodeAffinity rules to inject to   |   |
      |                                                                                                   | | `Kubernetes                                  | the DaemonSets objects that are managed by   |   |
      |                                                                                                   | | core/v1.NodeAffinity <https://g              | the operator                                 |   |
      |                                                                                                   | | odoc.org/k8s.io/api/core/v1#NodeAffinity>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``tolerations``                              | Additional tolerations to inject to the      |   |
      |                                                                                                   | | `[]Kubernetes                                | DaemonSets objects that are managed by the   |   |
      |                                                                                                   | | core/v1.Toleration <https:/                  | operator                                     |   |
      |                                                                                                   | | /godoc.org/k8s.io/api/core/v1#Toleration>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``ofedDriver``                               |                                              |   |
      |                                                                                                   | | `OFEDDriverSpe                               |                                              |   |
      |                                                                                                   | | c <#mellanox.com/v1alpha1.OFEDDriverSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``rdmaSharedDevicePlugin``                   |                                              |   |
      |                                                                                                   | | `DevicePluginSpec                            |                                              |   |
      |                                                                                                   | | <#mellanox.com/v1alpha1.DevicePluginSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``sriovDevicePlugin``                        |                                              |   |
      |                                                                                                   | | `DevicePluginSpec                            |                                              |   |
      |                                                                                                   | | <#mellanox.com/v1alpha1.DevicePluginSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``ibKubernetes``                             |                                              |   |
      |                                                                                                   | | `IBKubernetesSpec                            |                                              |   |
      |                                                                                                   | | <#mellanox.com/v1alpha1.IBKubernetesSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``secondaryNetwork``                         |                                              |   |
      |                                                                                                   | | `SecondaryNetworkSpec <#me                   |                                              |   |
      |                                                                                                   | | llanox.com/v1alpha1.SecondaryNetworkSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``nvIpam``                                   |                                              |   |
      |                                                                                                   | | `NVIPA                                       |                                              |   |
      |                                                                                                   | | MSpec <#mellanox.com/v1alpha1.NVIPAMSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``nicFeatureDiscovery``                      |                                              |   |
      |                                                                                                   | | `NICFeatureDiscoverySpec <#mella             |                                              |   |
      |                                                                                                   | | nox.com/v1alpha1.NICFeatureDiscoverySpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      |                                                                                                   | | ``docaTelemetryService``                     |                                              |   |
      |                                                                                                   | | `DOCATelemetryServiceSpec <#mellan           |                                              |   |
      |                                                                                                   | | ox.com/v1alpha1.DOCATelemetryServiceSpec>`__ |                                              |   |
      |                                                                                                   | +----------------------------------------------+----------------------------------------------+   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        |                                                                                                   |
      | `NicClusterPolicyStatus <#mellanox.com/v1alpha1.NicClusterPolicyStatus>`__                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.NicClusterPolicySpec:

NicClusterPolicySpec
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicy <#mellanox.com/v1alpha1.NicClusterPolicy>`__)

NicClusterPolicySpec defines the desired state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``nodeAffinity``                                                                                  | Additional nodeAffinity rules to inject to the DaemonSets objects that are managed by the         |
      | `Kubernetes core/v1.NodeAffinity <https://godoc.org/k8s.io/api/core/v1#NodeAffinity>`__           | operator                                                                                          |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``tolerations``                                                                                   | Additional tolerations to inject to the DaemonSets objects that are managed by the operator       |
      | `[]Kubernetes core/v1.Toleration <https://godoc.org/k8s.io/api/core/v1#Toleration>`__             |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ofedDriver``                                                                                    |                                                                                                   |
      | `OFEDDriverSpec <#mellanox.com/v1alpha1.OFEDDriverSpec>`__                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``rdmaSharedDevicePlugin``                                                                        |                                                                                                   |
      | `DevicePluginSpec <#mellanox.com/v1alpha1.DevicePluginSpec>`__                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``sriovDevicePlugin``                                                                             |                                                                                                   |
      | `DevicePluginSpec <#mellanox.com/v1alpha1.DevicePluginSpec>`__                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ibKubernetes``                                                                                  |                                                                                                   |
      | `IBKubernetesSpec <#mellanox.com/v1alpha1.IBKubernetesSpec>`__                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``secondaryNetwork``                                                                              |                                                                                                   |
      | `SecondaryNetworkSpec <#mellanox.com/v1alpha1.SecondaryNetworkSpec>`__                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nvIpam``                                                                                        |                                                                                                   |
      | `NVIPAMSpec <#mellanox.com/v1alpha1.NVIPAMSpec>`__                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nicFeatureDiscovery``                                                                           |                                                                                                   |
      | `NICFeatureDiscoverySpec <#mellanox.com/v1alpha1.NICFeatureDiscoverySpec>`__                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``docaTelemetryService``                                                                          |                                                                                                   |
      | `DOCATelemetryServiceSpec <#mellanox.com/v1alpha1.DOCATelemetryServiceSpec>`__                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.NicClusterPolicyStatus:

NicClusterPolicyStatus
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicy <#mellanox.com/v1alpha1.NicClusterPolicy>`__)

NicClusterPolicyStatus defines the observed state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the current state of the cluster policy                                                  |
      | `State <#mellanox.com/v1alpha1.State>`__                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``appliedStates``                                                                                 | AppliedStates provide a finer view of the observed state                                          |
      | `[]AppliedState <#mellanox.com/v1alpha1.AppliedState>`__                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.OFEDDriverSpec:

OFEDDriverSpec
~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

OFEDDriverSpec describes configuration options for OFED driver

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for ofed driver container                                                       |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``startupProbe``                                                                                  | Pod startup probe settings                                                                        |
      | `PodProbeSpec <#mellanox.com/v1alpha1.PodProbeSpec>`__                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``livenessProbe``                                                                                 | Pod liveness probe settings                                                                       |
      | `PodProbeSpec <#mellanox.com/v1alpha1.PodProbeSpec>`__                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``readinessProbe``                                                                                | Pod readiness probe settings                                                                      |
      | `PodProbeSpec <#mellanox.com/v1alpha1.PodProbeSpec>`__                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``env``                                                                                           | List of environment variables to set in the OFED container.                                       |
      | `[]Kubernetes core/v1.EnvVar <https://godoc.org/k8s.io/api/core/v1#EnvVar>`__                     |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``upgradePolicy``                                                                                 | Ofed auto-upgrade settings                                                                        |
      | `DriverUpgradePolicySpec <#mellanox.com/v1alpha1.DriverUpgradePolicySpec>`__                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``certConfig``                                                                                    | Optional: Custom TLS certificates configuration for driver container                              |
      | `ConfigMapNameReference <#mellanox.com/v1alpha1.ConfigMapNameReference>`__                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``repoConfig``                                                                                    | Optional: Custom package repository configuration for OFED container                              |
      | `ConfigMapNameReference <#mellanox.com/v1alpha1.ConfigMapNameReference>`__                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``terminationGracePeriodSeconds``                                                                 | *(Optional)*                                                                                      |
      | *int64*                                                                                           | TerminationGracePeriodSeconds specifies the length of time in seconds to wait before killing the  |
      |                                                                                                   | OFED pod on termination                                                                           |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``forcePrecompiled``                                                                              | *(Optional)*                                                                                      |
      | *bool*                                                                                            | ForcePrecompiled specifies if only MOFED precompiled images are allowed If set to false and       |
      |                                                                                                   | precompiled image does not exists, MOFED drivers will be compiled on Nodes If set to true and     |
      |                                                                                                   | precompiled image does not exists, OFED state will be Error.                                      |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.PodProbeSpec:

PodProbeSpec
~~~~~~~~~~~~

(*Appears on:* `OFEDDriverSpec <#mellanox.com/v1alpha1.OFEDDriverSpec>`__)

PodProbeSpec describes a pod probe.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``initialDelaySeconds``                                                                           | Number of seconds after the container has started before the probe is initiated                   |
      | *int*                                                                                             |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``periodSeconds``                                                                                 | How often (in seconds) to perform the probe                                                       |
      | *int*                                                                                             |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.ResourceRequirements:

ResourceRequirements
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__)

ResourceRequirements describes the compute resource requirements.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the container the requirements are set for                                                |
      | *string*                                                                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``limits``                                                                                        | *(Optional)*                                                                                      |
      | `Kubernetes core/v1.ResourceList <https://godoc.org/k8s.io/api/core/v1#ResourceList>`__           | Limits describes the maximum amount of compute resources allowed. More info:                      |
      |                                                                                                   | https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``requests``                                                                                      | *(Optional)*                                                                                      |
      | `Kubernetes core/v1.ResourceList <https://godoc.org/k8s.io/api/core/v1#ResourceList>`__           | Requests describes the minimum amount of compute resources required. If Requests is omitted for a |
      |                                                                                                   | container, it defaults to Limits if that is explicitly specified, otherwise to an                 |
      |                                                                                                   | implementation-defined value. Requests cannot exceed Limits. More info:                           |
      |                                                                                                   | https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.SecondaryNetworkSpec:

SecondaryNetworkSpec
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `NicClusterPolicySpec <#mellanox.com/v1alpha1.NicClusterPolicySpec>`__)

SecondaryNetworkSpec describes configuration options for secondary network

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``multus``                                                                                        | Image and configuration information for multus                                                    |
      | `MultusSpec <#mellanox.com/v1alpha1.MultusSpec>`__                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``cniPlugins``                                                                                    | Image information for CNI plugins                                                                 |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipoib``                                                                                         | Image information for IPoIB CNI                                                                   |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipamPlugin``                                                                                    | Image information for IPAM plugin                                                                 |
      | `ImageSpec <#mellanox.com/v1alpha1.ImageSpec>`__                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _mellanox.com/v1alpha1.State:

State (``string`` alias)
~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `AppliedState <#mellanox.com/v1alpha1.AppliedState>`__, `HostDeviceNetworkStatus <#mellanox.com/v1alpha1.HostDeviceNetworkStatus>`__,
`IPoIBNetworkStatus <#mellanox.com/v1alpha1.IPoIBNetworkStatus>`__, `MacvlanNetworkStatus <#mellanox.com/v1alpha1.MacvlanNetworkStatus>`__,
`NicClusterPolicyStatus <#mellanox.com/v1alpha1.NicClusterPolicyStatus>`__)

State represents reconcile state of the system.

.. _mellanox.com/v1alpha1.WaitForCompletionSpec:

WaitForCompletionSpec
~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* `DriverUpgradePolicySpec <#mellanox.com/v1alpha1.DriverUpgradePolicySpec>`__)

WaitForCompletionSpec describes the configuration for waiting on job completions

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``podSelector``                                                                                   | *(Optional)*                                                                                      |
      | *string*                                                                                          | PodSelector specifies a label selector for the pods to wait for completion For more details on    |
      |                                                                                                   | label selectors, see:                                                                             |
      |                                                                                                   | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``timeoutSeconds``                                                                                | *(Optional)*                                                                                      |
      | *int*                                                                                             | TimeoutSecond specifies the length of time in seconds to wait before giving up on pod             |
      |                                                                                                   | termination, zero means infinite                                                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
