.. headings # #, * *, =, -, ^, ", ~


***********************
Advanced Configurations
***********************

.. contents:: On this page
   :depth: 2
   :local:
   :backlinks: none


=====================================================
Network Operator Deployment with Admission Controller
=====================================================

The Admission Controller can be optionally included as part of the Network Operator installation process. It has the capability to validate supported Custom Resource Definitions (CRDs), which currently include NicClusterPolicy and HostDeviceNetwork.
By default, the deployment of the admission controller is disabled. To enable it, you must set ``operator.admissionController.enabled`` to ``true``.

Enabling the admission controller provides you with two options for managing certificates. You can either utilize the `cert-manager <https://cert-manager.io/docs/installation/>`_ for generating a self-signed certificate automatically, or, alternatively, provide your own self-signed certificate.

To use cert-manager, ensure that ``operator.admissionController.useCertManager`` is set to ``true``. Additionally, make sure that you deploy the cert-manager before initiating the Network Operator deployment.

If you prefer not to use the cert-manager, set ``operator.admissionController.useCertManager`` to ``false``, and then provide your custom certificate and key using ``operator.admissionController.certificate.tlsCrt`` and ``operator.admissionController.certificate.tlsKey``.

.. warning::
   When using your own certificate, the certificate must be valid for ``<Release_Name>-webhook-service.<Release_Namespace>.svc``, e.g. ``network-operator-webhook-service.nvidia-network-operator.svc``.


=======================================================
Network Operator Deployment with Pod Security Admission
=======================================================

The `Pod Security admission <https://kubernetes.io/docs/concepts/security/pod-security-admission/>`_ controller replaces PodSecurityPolicy, enforcing predefined Pod Security Standards by adding a label to a namespace.

There are three levels defined by the `Pod Security Standards <https://kubernetes.io/docs/concepts/security/pod-security-standards>`_ : ``privileged`` , ``baseline`` and ``restricted``.

.. warning::
   In case you wish to enforce a PSA to the Network Operator namespace, the ``privileged`` level is required. Enforcing ``baseline`` or ``restricted`` levels will prevent the creation of required Network Operator pods.

If required, enforce PSA privileged level on the Network Operator namespace by running:

.. code-block:: bash

   kubectl label --overwrite ns nvidia-network-operator  pod-security.kubernetes.io/enforce=privileged

In case that baseline or restricted levels are being enforced on the Network Operator namespace, events for pods creation failures will be triggered:

.. code-block:: bash

   kubectl get events -n nvidia-network-operator --field-selector reason=FailedCreate
   LAST SEEN TYPE    REASON       OBJECT                         MESSAGE
   2m36s     Warning FailedCreate daemonset/mofed-ubuntu22.04-ds Error creating: pods "mofed-ubuntu22.04-ds-rwmgs" is forbidden: violates PodSecurity "baseline:latest": host namespaces (hostNetwork=true), hostPath volumes (volumes "run-mlnx-ofed", "etc-network", "host-etc", "host-usr", "host-udev"), privileged (container "mofed-container" must not set securityContext.privileged=true)


===================
Container Resources
===================

Optional `requests and limits <https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/>`_ can be configured for each component of the sub-resources deployed by the Network Operator by setting the parameter ``containerResources``.

For example, for the SR-IOV Device Plugin:

.. code-block:: yaml

    kind: NicClusterPolicy
    metadata:
      name: nic-cluster-policy
    spec:
      sriovDevicePlugin:
        containerResources:
        - name: "sriov-device-plugin"
          requests:
            cpu: "200m"
            memory: "150Mi"
          limits:
            cpu: "300m"
            memory: "300Mi"
