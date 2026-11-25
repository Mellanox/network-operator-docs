---
title: "Quick Start"
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

This walkthrough takes you from a freshly prepared cluster to a running NVIDIA networking deployment using the **SR-IOV Ethernet** profile — the most common starting point. For other profiles, see the [Deployment Profiles](/k8s-launch-kit/profiles/profiles) decision matrix.

<Note>
**Use this when:** you meet the [Installation](/k8s-launch-kit/installation) prerequisites, have the `l8k` binary on your PATH, and `$KUBECONFIG` set or your default kubeconfig at `~/.kube/config`.
</Note>

## Step 1 — Discover

Probe the cluster's network hardware. Output is written to `./cluster-config.yaml` by default.

```bash
l8k discover
```

Discovery temporarily deploys the NIC Configuration Daemon, examines NICs and OFED-dependent kernel modules on each node, and groups nodes by PCI topology.

## Step 2 — Generate

Generate Kubernetes manifests for an SR-IOV Ethernet deployment. Launch Kit auto-reads `./cluster-config.yaml` and writes manifests to `./deployment/`.

```bash
l8k generate --fabric ethernet --deployment-type sriov --multirail
```

Review `deployment/.l8k/resolved-config.yaml` and the generated manifests, especially node selectors, addresses, driver settings, and maintenance concurrency. See [Generate Workflow](/k8s-launch-kit/workflows/generate) for the output file layout.

## Step 3 — Deploy

If the required operator CRDs are already installed, preview the reviewed bundle with a server-side dry-run:

```bash
l8k deploy --deployment-files ./deployment --dry-run
```

Dry-run cannot bootstrap missing CRDs. On a first installation, review the generated files and proceed with deployment, or install the compatible operator APIs before using the preview. Launch Kit manages Helm first when enabled, then policies and networking resources. Example workloads are applied only during validation:

```bash
l8k deploy --deployment-files ./deployment
```

## Step 4 — Verify

Run validation against the same bundle and inspect its HTML report. Required checks must run on the intended workers and rails; an exit code of zero with skipped checks is incomplete evidence:

```bash
l8k validate --deployment-files ./deployment --wait 10m
```

See [Validate Workflow](/k8s-launch-kit/workflows/validate) for acceptance criteria and `deployment/k8s-launch-kit-validation-report.html`.

## Next Steps

- Picking a different profile? [Deployment Profiles](/k8s-launch-kit/profiles/profiles)
- Cluster has mixed GPU/NIC types? [Heterogeneous Clusters](/k8s-launch-kit/heterogeneous-clusters)
- Generating manifests without cluster access? [Cluster Topology Presets](/k8s-launch-kit/presets)
- Wiring l8k into CI/CD? [Automation and CI/CD](/k8s-launch-kit/automation)
- Something didn't work? [Troubleshooting](/k8s-launch-kit/troubleshooting)

## See Also

- [Overview](/k8s-launch-kit/overview) — the discover/generate/deploy mental model
- [CLI Reference](/k8s-launch-kit/reference/cli) — host workflow flags
- [Configuration Reference](/k8s-launch-kit/reference/config) — `cluster-config.yaml` schema
