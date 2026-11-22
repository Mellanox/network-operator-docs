---
title: "Deployment Profiles"
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

A **profile** is a named combination of fabric and deployment type. Each profile maps to a complete set of Kubernetes manifests produced by `l8k generate`. Pick a profile from the decision tree or table below, then follow the link.

For the conceptual difference between fabric and deployment type, see [Overview](/k8s-launch-kit/overview).

## Decision Tree

The fabric is Ethernet or InfiniBand. Spectrum-X is an explicitly selected Ethernet/SR-IOV profile requiring a configured Spectrum-X fabric and a matching RA profile; discovery alone does not select or qualify it.

```mermaid
flowchart TD
    Start{Fabric}
    Start -->|Ethernet| EthDT{Deployment type}
    Start -->|InfiniBand| IBDT{Deployment type}
    EthDT -->|Spectrum-X| SPCXRA{RA version}

    EthDT -->|sriov| SRIOVE([SR-IOV Ethernet])
    EthDT -->|host_device| HDE([Host Device])
    EthDT -->|rdma_shared + MacVLAN| MV([MacVLAN RDMA Shared])

    IBDT -->|sriov| SRIOVIB([SR-IOV InfiniBand])
    IBDT -->|host_device| HDI([Host Device])
    IBDT -->|rdma_shared + IPoIB| IPOIB([IPoIB RDMA Shared])

    SPCXRA -->|Non-VR: RA2.4<br/>Network Operator 26.10| SX4([Spectrum-X RA2.4])
    SPCXRA -->|VR: RA3.1<br/>Network Operator 26.10| SX31([Spectrum-X RA3.1])
    SPCXRA -->|RA2.2<br/>Network Operator 26.4| SX2([Spectrum-X RA2.2])
    SPCXRA -->|RA2.3<br/>Network Operator 26.7| SX3([Spectrum-X RA2.3])
    SPCXRA -->|RA2.1<br/>Network Operator 26.1| SX1([Spectrum-X RA2.1])
    SX3 --> MPM[multiplane mode<br/>none / swplb / hwplb<br/>+ number of planes]
    SX1 --> MPM
    SX2 --> MPM
    SX4 --> MPM
    SX31 --> MPM

    classDef profile fill:#a2efb6,stroke:#28a745,color:#000
    classDef params fill:#fff3cd,stroke:#ffc107,color:#000
    class SRIOVE,HDE,MV,SRIOVIB,HDI,IPOIB,SX1,SX2,SX3,SX4 profile
    class MPM params
```

## Decision Matrix

| **Profile** | **When to use** | **Fabric / Deployment type** | **Keywords** |
| --- | --- | --- | --- |
| [SR-IOV Ethernet](/k8s-launch-kit/profiles/sriov-ethernet) | High-performance Ethernet networking with hardware acceleration. Per-pod dedicated VFs. | ethernet / sriov | SR-IOV, RDMA, low-latency, dedicated VFs |
| [SR-IOV InfiniBand](/k8s-launch-kit/profiles/sriov-infiniband) | Virtualized InfiniBand with hardware acceleration. Isolated IB partitions per pod. | infiniband / sriov | SR-IOV, InfiniBand, large-scale HPC |
| [Host Device](/k8s-launch-kit/profiles/host-device) | Direct hardware passthrough. Minimal CPU overhead. Exclusive device access per pod. | ethernet or infiniband / host_device | host-device, PCI-passthrough, DPDK |
| [IP over InfiniBand (RDMA Shared)](/k8s-launch-kit/profiles/ipoib-rdma-shared) | InfiniBand networking with shared RDMA resources. Parallel I/O workloads. | infiniband / rdma_shared | IPoIB, shared-device, high-bandwidth |
| [MacVLAN (RDMA Shared)](/k8s-launch-kit/profiles/macvlan-rdma-shared) | Multi-tenant Ethernet with shared RDMA capabilities and network isolation. | ethernet / rdma_shared | MacVLAN, multi-tenant, network-segmentation |
| [Spectrum-X](/k8s-launch-kit/profiles/spectrum-x) | NVIDIA Spectrum-X multi-rail AI interconnect (RA3.1 for VR and RA2.4 for other platforms, released together and both integrated with Network Operator 26.10; see the version matrix for older RAs). Single-plane, SWPLB, or HWPLB. | ethernet / sriov / spectrum-x | Spectrum-X, multiplane, RA2.4, RA3.1, HWPLB |

## See Also

- [Overview](/k8s-launch-kit/overview) — profile selection vocabulary
- [Generate Workflow](/k8s-launch-kit/workflows/generate) — how profile flags are consumed
- [Heterogeneous Clusters](/k8s-launch-kit/heterogeneous-clusters) — mixing profiles per node group
