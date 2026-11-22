---
title: "Installation"
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

## Prerequisites

Before using Kubernetes Launch Kit, ensure the following:

- **Kubernetes cluster** and credentials with permission to run the privileged discovery daemon and manage the intended networking resources. Discovery does not require a pre-installed Network Operator or NFD. On Kubernetes, `l8k deploy` can install the selected Network Operator Helm chart. For externally managed installations, set `networkOperator.skipHelmChart: true` before generation.
- On **OpenShift**, install the certified operators and their prerequisites separately; Launch Kit does not own their Helm lifecycle. See [Getting Started with Red Hat OpenShift](/getting-started-with-openshift).
- `kubectl` configured with access to the target cluster.
- Docker or Podman on the machine where you will run `l8k` (only for the container scenario).

## Install

Choose one of the methods below. The script and Homebrew methods install a binary with embedded default configuration and presets, plus matching profile templates; the container method runs `l8k` from a published image and writes nothing outside your working directory.

### Script

Downloads the latest release from GitHub and installs the `l8k` binary to `/usr/local/bin`:

```bash
curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh
```

Pin a specific version or install to a custom directory:

```bash
curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh -o install-l8k.sh
L8K_VERSION=${k8s_launch_kit_version} sh install-l8k.sh
curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh -s -- -d ~/local
```

### Homebrew

For macOS and Linux systems with Homebrew:

```bash
brew tap nvidia/l8k https://github.com/nvidia/k8s-launch-kit
brew install l8k
```

### Build from Source

Build from the release tag so the binary and profile templates agree:

```bash
git clone --branch ${k8s_launch_kit_version} https://github.com/NVIDIA/k8s-launch-kit.git
cd k8s-launch-kit
make build
```

Run `./build/l8k` from that repository root, or use `make install` to install the binary and matching assets.

### Container

Run `l8k` directly from the published container image without copying any binary or assets to the host filesystem. The image stays in the local Docker cache; everything else (kubeconfig, output directory) is mounted at runtime.

Pull the image once:

```bash
docker pull ${k8s_launch_kit_repository}/k8s-launch-kit:${k8s_launch_kit_version}
```

Define a helper that preserves the image's `/src` working directory, where its profile templates are stored. Mount the host working directory at `/work` and pass explicit paths for persistent inputs and outputs:

```bash
l8k_container() {
    docker run --rm --network host \
        -e KUBECONFIG=/kube/config \
        -v "$HOME/.kube:/kube:ro" \
        -v "$PWD:/work" \
        ${k8s_launch_kit_repository}/k8s-launch-kit:${k8s_launch_kit_version} "$@"
}

l8k_container discover --save-cluster-config /work/cluster-config.yaml
l8k_container generate --user-config /work/cluster-config.yaml \
    --fabric ethernet --deployment-type sriov --multirail \
    --save-deployment-files /work/deployment
l8k_container deploy --deployment-files /work/deployment
l8k_container validate --deployment-files /work/deployment --wait 10m
```

Files explicitly written under `/work` remain on the host after the container exits. Use container-visible paths such as `/work/topology.json` and `/work/profile.yaml` for Spectrum-X inputs too. Do not change the working directory to `/work`: profile discovery expects the image's bundled templates under `/src/profiles`.

<Note>
The API server and credentials referenced by kubeconfig must be reachable inside the container. External credential files and exec plugins need corresponding mounts and tools. The `--rm` flag removes stopped containers; the kubeconfig directory is mounted read-only.
</Note>

## Verify

For script or Homebrew installations:

```bash
l8k version
```

For the container helper, use `l8k_container version`.

## Uninstall

Use the method that matches how you installed.

### Script

```bash
curl -fsSL https://raw.githubusercontent.com/nvidia/k8s-launch-kit/main/scripts/install.sh | sh -s -- --uninstall
```

### Homebrew

```bash
brew uninstall l8k
brew untap nvidia/l8k
```

### Container

Remove the shell function and the cached image:

```bash
unset -f l8k_container
docker image rm ${k8s_launch_kit_repository}/k8s-launch-kit:${k8s_launch_kit_version}
```

Also remove the function from your shell rc file if you added it.

## Layout (Script and Homebrew)

The installer writes `bin/l8k`, `share/l8k/profiles/`, and the sosreport helper under `share/l8k/scripts/`. The binary embeds its default configuration and preset catalog. Optional filesystem overrides are selected with `--config-dir`:

```text
/etc/l8k/
├── l8k-config.yaml
└── presets/
    └── <preset-name>/topology.yaml
```

`--user-config` takes precedence over `--config-dir/l8k-config.yaml`. An override `presets/` directory replaces the embedded catalog. Existing legacy share-directory overrides are preserved by the installer; select them explicitly with `--config-dir`.

The image includes profile templates, presets, and default configuration. Persist generated inputs, manifests, and reports under the mounted `/work` directory.

## See Also

- [Quick Start](/k8s-launch-kit/quick-start) — end-to-end walkthrough using `l8k`
- [CLI Reference](/k8s-launch-kit/reference/cli) — full flag reference
