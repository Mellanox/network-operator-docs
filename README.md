# NVIDIA Network Operator Documentation

For official documentation, go to:

https://docs.nvidia.com/networking/software/cloud-orchestration/index.html


Latest documentation generated from this repo:

https://mellanox.github.io/network-operator-docs/

## Build docs

To generate the docs run:

```bash
make gen-docs
```

Generated files will be under `_build/docs/nvidia_network_operator/latest/`

## Check external links

To check external links, run:

```bash
./repo.sh docs -b linkcheck
```

Note that some links with anchors are reported as broken though they are working correctly.

## Version update

In order to update the doc version, update components versions in `docs/common/vars.rst` and release version in `repo.toml` under `[repo_docs]`.
