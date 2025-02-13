Network Operator API reference v1alpha1
=======================================

Packages:

- :ref:`mellanox.com/v1alpha1 <mellanox.com/v1alpha1>`

.. _mellanox.com/v1alpha1:

mellanox.com/v1alpha1
---------------------

Package v1alpha1 contains API Schema definitions for the mellanox.com v1alpha1 API group

Resource Types:

.. _AppliedState:

AppliedState
~~~~~~~~~~~~

(*Appears on:* :ref:`HostDeviceNetworkStatus <HostDeviceNetworkStatus>`, :ref:`NicClusterPolicyStatus <NicClusterPolicyStatus>`)

AppliedState defines a finer-grained view of the observed state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the deployed component this state refers to                                               |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``state``                                                                                         | The state of the deployed component. (“ready”, “notReady”, “ignore”, “error”)                     |
      | :ref:`State <State>`                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``message``                                                                                       | Message is a human readable message indicating details about why the state is in this condition   |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _ConfigMapNameReference:

ConfigMapNameReference
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`OFEDDriverSpec <OFEDDriverSpec>`)

ConfigMapNameReference references a config map in a specific namespace. The namespace must be specified at the point of use.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the ConfigMap                                                                             |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _DOCATelemetryServiceConfig:

DOCATelemetryServiceConfig
~~~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`DOCATelemetryServiceSpec <DOCATelemetryServiceSpec>`)

DOCATelemetryServiceConfig contains configuration for the DOCATelemetryService.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``fromConfigMap``                                                                                 | *(Optional)*                                                                                      |
      | string                                                                                            | FromConfigMap sets the configMap the DOCATelemetryService gets its configuration from. The        |
      |                                                                                                   | ConfigMap must be in the same namespace as the NICClusterPolicy.                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _DOCATelemetryServiceSpec:

DOCATelemetryServiceSpec
~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

DOCATelemetryServiceSpec is the configuration for DOCA Telemetry Service.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for DOCA Telemetry Service                                                      |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``config``                                                                                        | *(Optional)*                                                                                      |
      | :ref:`DOCATelemetryServiceConfig <DOCATelemetryServiceConfig>`                                    | Config contains custom config for the DOCATelemetryService. If set no default config will be      |
      |                                                                                                   | deployed.                                                                                         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _DevicePluginSpec:

DevicePluginSpec
~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

DevicePluginSpec describes configuration options for device plugin 1. Image information for device plugin 2. Device plugin configuration

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpecWithConfig``                                                                           | Image information for the device plugin and optional configuration                                |
      | :ref:`ImageSpecWithConfig <ImageSpecWithConfig>`                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``useCdi``                                                                                        | Enables use of container device interface (CDI) NOTE: NVIDIA Network Operator does not configure  |
      | bool                                                                                              | container runtime to enable CDI.                                                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _DrainSpec:

DrainSpec
~~~~~~~~~

(*Appears on:* :ref:`DriverUpgradePolicySpec <DriverUpgradePolicySpec>`)

DrainSpec describes configuration for node drain during automatic upgrade

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enable``                                                                                        | *(Optional)*                                                                                      |
      | bool                                                                                              | Enable indicates if node draining is allowed during upgrade                                       |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``force``                                                                                         | *(Optional)*                                                                                      |
      | bool                                                                                              | Force indicates if force draining is allowed                                                      |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``podSelector``                                                                                   | *(Optional)*                                                                                      |
      | string                                                                                            | PodSelector specifies a label selector to filter pods on the node that need to be drained For     |
      |                                                                                                   | more details on label selectors, see:                                                             |
      |                                                                                                   | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``timeoutSeconds``                                                                                | *(Optional)*                                                                                      |
      | int                                                                                               | TimeoutSecond specifies the length of time in seconds to wait before giving up drain, zero means  |
      |                                                                                                   | infinite                                                                                          |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``deleteEmptyDir``                                                                                | *(Optional)*                                                                                      |
      | bool                                                                                              | DeleteEmptyDir indicates if should continue even if there are pods using emptyDir (local data     |
      |                                                                                                   | that will be deleted when the node is drained)                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _DriverUpgradePolicySpec:

DriverUpgradePolicySpec
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`OFEDDriverSpec <OFEDDriverSpec>`)

DriverUpgradePolicySpec describes policy configuration for automatic upgrades

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``autoUpgrade``                                                                                   | *(Optional)*                                                                                      |
      | bool                                                                                              | AutoUpgrade is a global switch for automatic upgrade feature if set to false all other options    |
      |                                                                                                   | are ignored                                                                                       |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``maxParallelUpgrades``                                                                           | *(Optional)*                                                                                      |
      | int                                                                                               | MaxParallelUpgrades indicates how many nodes can be upgraded in parallel 0 means no limit, all    |
      |                                                                                                   | nodes will be upgraded in parallel                                                                |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``waitForCompletion``                                                                             | The configuration for waiting on pods completions                                                 |
      | :ref:`WaitForCompletionSpec <WaitForCompletionSpec>`                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``drain``                                                                                         | The configuration for node drain during automatic upgrade                                         |
      | :ref:`DrainSpec <DrainSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``safeLoad``                                                                                      | *(Optional)*                                                                                      |
      | bool                                                                                              | SafeLoad turn on safe driver loading (cordon and drain the node before loading the driver)        |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _HostDeviceNetwork:

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
      | ``spec``                                                                                          | Defines the desired state of HostDeviceNetwork                                                    |
      | :ref:`HostDeviceNetworkSpec <HostDeviceNetworkSpec>`                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        | Defines the observed state of HostDeviceNetwork                                                   |
      | :ref:`HostDeviceNetworkStatus <HostDeviceNetworkStatus>`                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _HostDeviceNetworkSpec:

HostDeviceNetworkSpec
~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`HostDeviceNetwork <HostDeviceNetwork>`)

HostDeviceNetworkSpec defines the desired state of HostDeviceNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``resourceName``                                                                                  | Host device resource pool name                                                                    |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network                                                    |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _HostDeviceNetworkStatus:

HostDeviceNetworkStatus
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`HostDeviceNetwork <HostDeviceNetwork>`)

HostDeviceNetworkStatus defines the observed state of HostDeviceNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the HostDeviceNetwork                                                       |
      | :ref:`State <State>`                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``hostDeviceNetworkAttachmentDef``                                                                | Network attachment definition generated from HostDeviceNetworkSpec                                |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``appliedStates``                                                                                 | AppliedStates provide a finer view of the observed state                                          |
      | :ref:`[]AppliedState <AppliedState>`                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _IBKubernetesSpec:

IBKubernetesSpec
~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

IBKubernetesSpec describes configuration options for ib-kubernetes

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for ib-kubernetes                                                               |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``periodicUpdateSeconds``                                                                         | *(Optional)*                                                                                      |
      | int                                                                                               | Interval of updates in seconds                                                                    |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pKeyGUIDPoolRangeStart``                                                                        | The first guid in the pool                                                                        |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``pKeyGUIDPoolRangeEnd``                                                                          | The last guid in the pool                                                                         |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ufmSecret``                                                                                     | Secret containing credentials to UFM service                                                      |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _IPoIBNetwork:

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
      | ``spec``                                                                                          | Defines the desired state of IPoIBNetwork                                                         |
      | :ref:`IPoIBNetworkSpec <IPoIBNetworkSpec>`                                                        |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        | Defines the observed state of IPoIBNetwork                                                        |
      | :ref:`IPoIBNetworkStatus <IPoIBNetworkStatus>`                                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _IPoIBNetworkSpec:

IPoIBNetworkSpec
~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`IPoIBNetwork <IPoIBNetwork>`)

IPoIBNetworkSpec defines the desired state of IPoIBNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``master``                                                                                        | Name of the host interface to enslave. Defaults to default route interface                        |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network.                                                   |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _IPoIBNetworkStatus:

IPoIBNetworkStatus
~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`IPoIBNetwork <IPoIBNetwork>`)

IPoIBNetworkStatus defines the observed state of IPoIBNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the IPoIBNetwork                                                            |
      | :ref:`State <State>`                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipoibNetworkAttachmentDef``                                                                     | Network attachment definition generated from IPoIBNetworkSpec                                     |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _ImageSpec:

ImageSpec
~~~~~~~~~

(*Appears on:* :ref:`DOCATelemetryServiceSpec <DOCATelemetryServiceSpec>`, :ref:`IBKubernetesSpec <IBKubernetesSpec>`, :ref:`ImageSpecWithConfig <ImageSpecWithConfig>`,
:ref:`NICFeatureDiscoverySpec <NICFeatureDiscoverySpec>`, :ref:`NVIPAMSpec <NVIPAMSpec>`, :ref:`OFEDDriverSpec <OFEDDriverSpec>`, :ref:`SecondaryNetworkSpec <SecondaryNetworkSpec>`)

ImageSpec Contains container image specifications

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``image``                                                                                         | Name of the image                                                                                 |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``repository``                                                                                    | Address of the registry that stores the image                                                     |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``version``                                                                                       | Version of the image to use                                                                       |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``imagePullSecrets``                                                                              | *(Optional)*                                                                                      |
      | []string                                                                                          | ImagePullSecrets is an optional list of references to secrets in the same namespace to use for    |
      |                                                                                                   | pulling the image                                                                                 |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``containerResources``                                                                            | ResourceRequirements describes the compute resource requirements                                  |
      | :ref:`[]ResourceRequirements <ResourceRequirements>`                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _ImageSpecWithConfig:

ImageSpecWithConfig
~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`DevicePluginSpec <DevicePluginSpec>`, :ref:`MultusSpec <MultusSpec>`)

ImageSpecWithConfig Contains ImageSpec and optional configuration

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for the component                                                               |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``config``                                                                                        | Configuration for the component as a string                                                       |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _MacvlanNetwork:

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
      | ``spec``                                                                                          | Defines the desired state of MacvlanNetworkSpec                                                   |
      | :ref:`MacvlanNetworkSpec <MacvlanNetworkSpec>`                                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        | Defines the observed state of MacvlanNetwork                                                      |
      | :ref:`MacvlanNetworkStatus <MacvlanNetworkStatus>`                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _MacvlanNetworkSpec:

MacvlanNetworkSpec
~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`MacvlanNetwork <MacvlanNetwork>`)

MacvlanNetworkSpec defines the desired state of MacvlanNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``networkNamespace``                                                                              | Namespace of the NetworkAttachmentDefinition custom resource                                      |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``master``                                                                                        | Name of the host interface to enslave. Defaults to default route interface                        |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``mode``                                                                                          | Mode of interface one of “bridge”, “private”, “vepa”, “passthru”                                  |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``mtu``                                                                                           | MTU of interface to the specified value. 0 for master’s MTU                                       |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipam``                                                                                          | IPAM configuration to be used for this network.                                                   |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _MacvlanNetworkStatus:

MacvlanNetworkStatus
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`MacvlanNetwork <MacvlanNetwork>`)

MacvlanNetworkStatus defines the observed state of MacvlanNetwork

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the state of the MacvlanNetwork                                                          |
      | :ref:`State <State>`                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``macvlanNetworkAttachmentDef``                                                                   | Network attachment definition generated from MacvlanNetworkSpec                                   |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _MultusSpec:

MultusSpec
~~~~~~~~~~

(*Appears on:* :ref:`SecondaryNetworkSpec <SecondaryNetworkSpec>`)

MultusSpec describes configuration options for Multus CNI 1. Image information for Multus CNI 2. Multus CNI config if config is missing or empty then multus config will be automatically generated from
the CNI configuration file of the master plugin (the first file in lexicographical order in cni-conf-dir)

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpecWithConfig``                                                                           | Image information for Multus and optional configuration                                           |
      | :ref:`ImageSpecWithConfig <ImageSpecWithConfig>`                                                  |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NICFeatureDiscoverySpec:

NICFeatureDiscoverySpec
~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

NICFeatureDiscoverySpec describes configuration options for nic-feature-discovery

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for nic-feature-discovery                                                       |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NVIPAMSpec:

NVIPAMSpec
~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

NVIPAMSpec describes configuration options for nv-ipam 1. Image information for nv-ipam 2. Configuration for nv-ipam

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``enableWebhook``                                                                                 | Enable deployment of the validation webhook                                                       |
      | bool                                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ImageSpec``                                                                                     | Image information for nv-ipam                                                                     |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicClusterPolicy:

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
      | ``spec``                                                                                          | Defines the desired state of NicClusterPolicy                                                     |
      | :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``status``                                                                                        | Defines the observed state of NicClusterPolicy                                                    |
      | :ref:`NicClusterPolicyStatus <NicClusterPolicyStatus>`                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicClusterPolicySpec:

NicClusterPolicySpec
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicy <NicClusterPolicy>`)

NicClusterPolicySpec defines the desired state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ofedDriver``                                                                                    | OFEDDriver is a specialized driver for NVIDIA NICs which can replace the inbox driver that comes  |
      | :ref:`OFEDDriverSpec <OFEDDriverSpec>`                                                            | with an OS. See https://network.nvidia.com/support/mlnx-ofed-matrix/                              |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``rdmaSharedDevicePlugin``                                                                        | RdmaSharedDevicePlugin manages support IB and RoCE HCAs through the Kubernetes device plugin      |
      | :ref:`DevicePluginSpec <DevicePluginSpec>`                                                        | framework. The config field is a json representation of the RDMA shared device plugin             |
      |                                                                                                   | configuration. See https://github.com/Mellanox/k8s-rdma-shared-dev-plugin                         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``sriovDevicePlugin``                                                                             | SriovDevicePlugin manages SRIOV through the Kubernetes device plugin framework. The config field  |
      | :ref:`DevicePluginSpec <DevicePluginSpec>`                                                        | is a json representation of the RDMA shared device plugin configuration. See                      |
      |                                                                                                   | https://github.com/k8snetworkplumbingwg/sriov-network-device-plugin                               |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ibKubernetes``                                                                                  | IBKubernetes provides a daemon that works in conjunction with the SR-IOV Network Device Plugin.   |
      | :ref:`IBKubernetesSpec <IBKubernetesSpec>`                                                        | It acts on Kubernetes pod object changes and reads the pod’s network annotation. From there it    |
      |                                                                                                   | fetches the corresponding network CRD and reads the PKey. This is done in order to add the newly  |
      |                                                                                                   | generated GUID or the predefined GUID in the GUID field of the CRD. This is then passed in        |
      |                                                                                                   | cni-args to that PKey for pods with mellanox.infiniband.app annotation. See:                      |
      |                                                                                                   | https://github.com/Mellanox/ib-kubernetes                                                         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``secondaryNetwork``                                                                              | SecondaryNetwork Specifies components to deploy in order to facilitate a secondary network in     |
      | :ref:`SecondaryNetworkSpec <SecondaryNetworkSpec>`                                                | Kubernetes. It consists of the following optionally deployed components: - Multus-CNI: Delegate   |
      |                                                                                                   | CNI plugin to support secondary networks in Kubernetes - CNI plugins: Currently only              |
      |                                                                                                   | containernetworking-plugins is supported - IPAM CNI: Currently only Whereabout IPAM CNI is        |
      |                                                                                                   | supported as a part of the secondaryNetwork section. - IPoIB CNI: Allows the user to create IPoIB |
      |                                                                                                   | child link and move it to the pod                                                                 |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nvIpam``                                                                                        | NvIpam is an IPAM provider that dynamically assigns IP addresses with speed and performance in    |
      | :ref:`NVIPAMSpec <NVIPAMSpec>`                                                                    | mind. Note: NvIPam requires certificate management e.g. cert-manager or OpenShift cert            |
      |                                                                                                   | management. See https://github.com/Mellanox/nvidia-k8s-ipam                                       |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nicFeatureDiscovery``                                                                           | NicFeatureDiscovery works with NodeFeatureDiscovery to expose information about NVIDIA NICs.      |
      | :ref:`NICFeatureDiscoverySpec <NICFeatureDiscoverySpec>`                                          | https://github.com/Mellanox/nic-feature-discovery                                                 |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``docaTelemetryService``                                                                          | DOCATelemetryService exposes telemetry from NVIDIA networking components to prometheus. See:      |
      | :ref:`DOCATelemetryServiceSpec <DOCATelemetryServiceSpec>`                                        | https://docs.nvidia.com/doca/sdk/nvidia+doca+telemetry+service+guide/index.html                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``nodeAffinity``                                                                                  | NodeAffinity rules to inject to the DaemonSets objects that are managed by the operator           |
      | `Kubernetes core/v1.NodeAffinity <https://godoc.org/k8s.io/api/core/v1#NodeAffinity>`__           |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``tolerations``                                                                                   | Tolerations to inject to the DaemonSets objects that are managed by the operator                  |
      | `[]Kubernetes core/v1.Toleration <https://godoc.org/k8s.io/api/core/v1#Toleration>`__             |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _NicClusterPolicyStatus:

NicClusterPolicyStatus
~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicy <NicClusterPolicy>`)

NicClusterPolicyStatus defines the observed state of NicClusterPolicy

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``state``                                                                                         | Reflects the current state of the cluster policy                                                  |
      | :ref:`State <State>`                                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``reason``                                                                                        | Informative string in case the observed state is error                                            |
      | string                                                                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``appliedStates``                                                                                 | AppliedStates provide a finer view of the observed state                                          |
      | :ref:`[]AppliedState <AppliedState>`                                                              |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _OFEDDriverSpec:

OFEDDriverSpec
~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

OFEDDriverSpec describes configuration options for DOCA Driver

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``ImageSpec``                                                                                     | Image information for ofed driver container                                                       |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``startupProbe``                                                                                  | Pod startup probe settings                                                                        |
      | :ref:`PodProbeSpec <PodProbeSpec>`                                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``livenessProbe``                                                                                 | Pod liveness probe settings                                                                       |
      | :ref:`PodProbeSpec <PodProbeSpec>`                                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``readinessProbe``                                                                                | Pod readiness probe settings                                                                      |
      | :ref:`PodProbeSpec <PodProbeSpec>`                                                                |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``env``                                                                                           | List of environment variables to set in the DOCA Driver container                                 |
      | `[]Kubernetes core/v1.EnvVar <https://godoc.org/k8s.io/api/core/v1#EnvVar>`__                     |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``upgradePolicy``                                                                                 | DOCA Driver auto-upgrade settings                                                                 |
      | :ref:`DriverUpgradePolicySpec <DriverUpgradePolicySpec>`                                          |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``certConfig``                                                                                    | Optional: Custom TLS certificates configuration for driver container                              |
      | :ref:`ConfigMapNameReference <ConfigMapNameReference>`                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``repoConfig``                                                                                    | Optional: Custom package repository configuration for DOCA Driver containe                        |
      | :ref:`ConfigMapNameReference <ConfigMapNameReference>`                                            |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``terminationGracePeriodSeconds``                                                                 | *(Optional)*                                                                                      |
      | int64                                                                                             | TerminationGracePeriodSeconds specifies the length of time in seconds to wait before killing the  |
      |                                                                                                   | OFED pod on termination                                                                           |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``forcePrecompiled``                                                                              | *(Optional)*                                                                                      |
      | bool                                                                                              | ForcePrecompiled specifies if only MOFED precompiled images are allowed If set to false and       |
      |                                                                                                   | precompiled image does not exists, MOFED drivers will be compiled on Nodes If set to true and     |
      |                                                                                                   | precompiled image does not exists, OFED state will be Error.                                      |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _PodProbeSpec:

PodProbeSpec
~~~~~~~~~~~~

(*Appears on:* :ref:`OFEDDriverSpec <OFEDDriverSpec>`)

PodProbeSpec describes a pod probe.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``initialDelaySeconds``                                                                           | Number of seconds after the container has started before the probe is initiated                   |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``periodSeconds``                                                                                 | How often (in seconds) to perform the probe                                                       |
      | int                                                                                               |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _ResourceRequirements:

ResourceRequirements
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`ImageSpec <ImageSpec>`)

ResourceRequirements describes the compute resource requirements.

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``name``                                                                                          | Name of the container the requirements are set for                                                |
      | string                                                                                            |                                                                                                   |
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

.. _SecondaryNetworkSpec:

SecondaryNetworkSpec
~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`NicClusterPolicySpec <NicClusterPolicySpec>`)

SecondaryNetworkSpec describes configuration options for secondary network

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``multus``                                                                                        | Image and configuration information for multus                                                    |
      | :ref:`MultusSpec <MultusSpec>`                                                                    |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``cniPlugins``                                                                                    | Image information for CNI plugins                                                                 |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipoib``                                                                                         | Image information for IPoIB CNI                                                                   |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``ipamPlugin``                                                                                    | Image information for IPAM plugin                                                                 |
      | :ref:`ImageSpec <ImageSpec>`                                                                      |                                                                                                   |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. _State:

State (``string`` alias)
~~~~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`AppliedState <AppliedState>`, :ref:`HostDeviceNetworkStatus <HostDeviceNetworkStatus>`, :ref:`IPoIBNetworkStatus <IPoIBNetworkStatus>`,
:ref:`MacvlanNetworkStatus <MacvlanNetworkStatus>`, :ref:`NicClusterPolicyStatus <NicClusterPolicyStatus>`)

State represents reconcile state of the system.

.. _WaitForCompletionSpec:

WaitForCompletionSpec
~~~~~~~~~~~~~~~~~~~~~

(*Appears on:* :ref:`DriverUpgradePolicySpec <DriverUpgradePolicySpec>`)

WaitForCompletionSpec describes the configuration for waiting on pods completions

.. container:: md-typeset__scrollwrap

   .. container:: md-typeset__table

      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | Field                                                                                             | Description                                                                                       |
      +===================================================================================================+===================================================================================================+
      | ``podSelector``                                                                                   | *(Optional)*                                                                                      |
      | string                                                                                            | PodSelector specifies a label selector for the pods to wait for completion For more details on    |
      |                                                                                                   | label selectors, see:                                                                             |
      |                                                                                                   | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors         |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
      | ``timeoutSeconds``                                                                                | *(Optional)*                                                                                      |
      | int                                                                                               | TimeoutSecond specifies the length of time in seconds to wait before giving up on pod             |
      |                                                                                                   | termination, zero means infinite                                                                  |
      +---------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------+
