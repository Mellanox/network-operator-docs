#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# Render the five quick-start bundles with the Kubernetes Launch Kit.
#
# Usage:
#   hack/render-quick-start-examples.sh [output-dir]
#
# Downloads the Launch Kit install script and installs the binary under
# build/l8k (override with L8K_PREFIX). Without L8K_VERSION the latest release
# is installed on every run. With L8K_VERSION, that version is installed once
# and reused until it changes or L8K_REFRESH=1.
#
# Each profile is rendered with the embedded presets and these shared flags:
#   --network-operator-release <release>
#   --skip-network-operator-helm
#
# <release> is L8K_RELEASE, or the major.minor of network-operator-version in
# docs/common/vars.yml. Ethernet profiles use --for PowerEdge-XE9680-H200
# (BlueField-3 SuperNIC, Ethernet). InfiniBand profiles use
# --for GB200-NVL-NVIDIA-GB200, whose east-west adapters are ConnectX-7.
# Kubernetes object names cannot contain uppercase letters, so the preset
# suffix is lowercased in every manifest and in the references between them.
#
# <output-dir>/<profile>/ receives the rendered network-operator YAML except
# values.yaml, plus complete.yaml (numbered manifests in filename order).
# The quick-start pages include those files with <Code src>.

set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-$root/examples/processed}"
mkdir -p "$out"
out="$(cd "$out" && pwd)"

install_url="${L8K_INSTALL_URL:-https://raw.githubusercontent.com/NVIDIA/k8s-launch-kit/main/scripts/install.sh}"
prefix="${L8K_PREFIX:-$root/build/l8k}"
l8k="$prefix/bin/l8k"

# A pinned L8K_VERSION is installed once and reused. Without a pin, install.sh
# runs on every build so the latest release is always used.
if [[ -n "${L8K_VERSION:-}" ]]; then
	if [[ "${L8K_REFRESH:-}" == "1" || ! -x "$l8k" || ! -f "$prefix/.install-stamp" || "$(cat "$prefix/.install-stamp")" != "$L8K_VERSION" ]]; then
		echo "Installing Kubernetes Launch Kit $L8K_VERSION into $prefix"
		# install.sh treats a missing bin directory as not writable and asks for sudo.
		mkdir -p "$prefix/bin"
		curl -fsSL "$install_url" | sh -s -- -d "$prefix"
		printf '%s\n' "$L8K_VERSION" >"$prefix/.install-stamp"
	else
		echo "Using pinned Kubernetes Launch Kit $L8K_VERSION at $l8k"
	fi
else
	echo "Installing the latest Kubernetes Launch Kit into $prefix"
	mkdir -p "$prefix/bin"
	curl -fsSL "$install_url" | sh -s -- -d "$prefix"
	rm -f "$prefix/.install-stamp"
fi

release="${L8K_RELEASE:-}"
if [[ -z "$release" ]]; then
	release="$(sed -n 's/^network-operator-version: "\(v\)\{0,1\}\([0-9][0-9]*\.[0-9][0-9]*\).*/\2/p' "$root/docs/common/vars.yml")"
fi
if [[ -z "$release" ]]; then
	echo "could not determine the Launch Kit release from docs/common/vars.yml; set L8K_RELEASE=MAJOR.MINOR" >&2
	exit 1
fi
echo "Using Network Operator release $release"

# Kubernetes metadata.name is a DNS-1123 subdomain. Launch Kit copies the
# preset name, which contains uppercase letters, into policies, pools,
# networks, and DaemonSets. Rewrite that token to lowercase everywhere in
# the bundle so those names and the fields that point at them stay aligned.
lowercase_preset_names() {
	local preset="$1"
	local dest="$2"
	local lower
	lower="$(printf '%s' "$preset" | tr '[:upper:]' '[:lower:]')"
	if [[ "$preset" == "$lower" ]]; then
		return
	fi
	python3 - "$preset" "$lower" "$dest" <<'PY'
import pathlib
import sys

preset, lower, dest = sys.argv[1:]
for path in pathlib.Path(dest).glob("*.yaml"):
    text = path.read_text()
    if preset in text:
        path.write_text(text.replace(preset, lower))
PY
	if grep -q "$preset" "$dest"/*.yaml; then
		echo "preset name $preset still present in $dest" >&2
		exit 1
	fi
}

# GB200's external BMC keeps the NIC powered through an OS reboot. The
# NIC Configuration Operator applies non-volatile settings only when
# FW_RESET_AFTER_CONFIG_UPDATE is true. Launch Kit does not set it. If a
# later release adds nicConfigurationOperator.env, keep that list as one
# key and make this variable the single "true" entry.
enable_firmware_reset() {
	local policy="$1"
	python3 - "$policy" <<'PY'
import re
import sys
from pathlib import Path

RESET = "FW_RESET_AFTER_CONFIG_UPDATE"
ENV = r"env:\s*(?:\[\]|null|~)?\s*(?:#.*)?"
NAME = re.compile(r"^(\s*)-\s+name:\s*(.*?)\s*$")
VALUE = re.compile(r"^(\s*)value:\s*(.*?)\s*$")


def pad(line):
    return len(line) - len(line.lstrip(" "))


def unquote(raw):
    raw = raw.strip()
    return raw[1:-1] if len(raw) >= 2 and raw[0] == raw[-1] and raw[0] in "'\"" else raw


def section(lines):
    for start, line in enumerate(lines):
        match = re.match(r"^(\s*)nicConfigurationOperator:\s*(?:#.*)?$", line)
        if match:
            width = len(match.group(1))
            break
    else:
        raise SystemExit("nicConfigurationOperator section not found")
    end = next((i for i in range(start + 1, len(lines))
                if lines[i].strip() and not lines[i].strip().startswith("#") and pad(lines[i]) <= width), len(lines))
    return start, end, width


def block_end(lines, begin, limit, width):
    child, index = width + 2, begin + 1
    while index < limit:
        text = lines[index].strip()
        if text and not text.startswith("#") and (
            pad(lines[index]) <= width or (pad(lines[index]) == child and not text.startswith("-"))
        ):
            break
        index += 1
    while index > begin + 1 and (not lines[index - 1].strip() or lines[index - 1].strip().startswith("#")):
        index -= 1
    return index


def env_blocks(lines, start, end, width):
    blocks, index = [], start + 1
    while index < end:
        if pad(lines[index]) != width + 2 or not re.match("^" + ENV + "$", lines[index].strip()):
            index += 1
            continue
        finish = block_end(lines, index, end, width)
        match = re.match(r"^(\s*)" + ENV + "$", lines[index])
        if not match:
            raise SystemExit("unrecognized nicConfigurationOperator env line: %r" % lines[index])
        preamble, entries = [], []
        for line in lines[index + 1:finish]:
            name = NAME.match(line)
            if name:
                entries.append([unquote(name.group(2)), [line]])
            elif re.match(r"^\s*-\s+", line):
                raise SystemExit("unrecognized env entry: %r" % line)
            elif entries:
                entries[-1][1].append(line)
            else:
                preamble.append(line)
        blocks.append({"start": index, "end": finish, "indent": len(match.group(1)), "preamble": preamble, "entries": entries})
        index = finish
    return blocks


def value_of(entry):
    return next((unquote(m.group(2)) for line in entry[1] if (m := VALUE.match(line))), None)


def indents(entries, env_indent):
    for _, entry_lines in entries:
        match = NAME.match(entry_lines[0])
        if match:
            return len(match.group(1)), len(match.group(1)) + 2
    return env_indent, env_indent + 2


def reset_lines(item, value):
    return ['%s- name: "%s"' % (" " * item, RESET), '%svalue: "true"' % (" " * value)]


def force_true(entry, item, value):
    out, done = [], False
    for line in entry[1]:
        match = VALUE.match(line)
        if match and not done:
            out.append('%svalue: "true"' % match.group(1))
            done = True
        else:
            out.append(line)
    return out if done else reset_lines(item, value)


def good(block):
    names = [entry[0] for entry in block["entries"]]
    reset = [entry for entry in block["entries"] if entry[0] == RESET]
    return len(reset) == 1 and len(names) == len(set(names)) and value_of(reset[0]) == "true"


def normalize(blocks):
    existing = [entry for block in blocks for entry in block["entries"]]
    item, value = indents(existing, blocks[0]["indent"])
    order, chosen = [], {}
    for entry in existing:
        if entry[0] not in chosen:
            order.append(entry[0])
        chosen[entry[0]] = entry
    if RESET not in chosen:
        order.append(RESET)
        chosen[RESET] = [RESET, reset_lines(item, value)]
    elif value_of(chosen[RESET]) != "true":
        chosen[RESET] = [RESET, force_true(chosen[RESET], item, value)]
    return [chosen[name] for name in order]


def main(path):
    original = path.read_text()
    lines = original.splitlines()
    start, end, width = section(lines)
    blocks = env_blocks(lines, start, end, width)
    changed = not blocks or not (len(blocks) == 1 and good(blocks[0]))
    if not blocks:
        item = width + 2
        at = next((i for i in range(start + 1, end) if pad(lines[i]) == item and lines[i].strip().startswith("logLevel:")), end)
        lines[at:at] = [" " * item + "env:", *reset_lines(item, item + 2)]
    elif changed:
        rendered = [" " * blocks[0]["indent"] + "env:", *blocks[0]["preamble"]]
        for entry in normalize(blocks):
            rendered.extend(entry[1])
        for block in reversed(blocks[1:]):
            del lines[block["start"]:block["end"]]
        lines[blocks[0]["start"]:blocks[0]["end"]] = rendered
    start, end, width = section(lines)
    if len(checked := env_blocks(lines, start, end, width)) != 1 or not good(checked[0]):
        raise SystemExit("nicConfigurationOperator.env must contain one %s=true entry" % RESET)
    if changed:
        path.write_text("\n".join(lines) + "\n")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: enable_firmware_reset <policy.yaml>")
    main(Path(sys.argv[1]))
PY
}

render_profile() {
	local profile="$1"
	local preset="$2"
	local node_selector="$3"
	local network_glob="$4"
	shift 4

	local scratch dest
	scratch="$(mktemp -d)"

	echo "Rendering $profile from preset $preset"
	"$l8k" generate \
		--for "$preset" \
		--node-selector "$node_selector" \
		--network-operator-release "$release" \
		--skip-network-operator-helm \
		--save-deployment-files "$scratch" \
		"$@"

	dest="$out/$profile"
	rm -rf "$dest"
	mkdir -p "$dest"

	local rendered=0
	local path base
	for path in "$scratch/network-operator"/*.yaml; do
		base="$(basename "$path")"
		if [[ "$base" == "values.yaml" ]]; then
			continue
		fi
		cp "$path" "$dest/$base"
		rendered=$((rendered + 1))
	done
	if [[ "$rendered" -eq 0 ]]; then
		echo "no manifests rendered for $profile" >&2
		exit 1
	fi
	if [[ -e "$dest/values.yaml" ]]; then
		echo "values.yaml must not be published for $profile" >&2
		exit 1
	fi
	if [[ ! -f "$dest/10-nicclusterpolicy.yaml" ]]; then
		echo "missing 10-nicclusterpolicy.yaml for $profile" >&2
		exit 1
	fi
	if ! compgen -G "$dest/20-ippool*.yaml" >/dev/null; then
		echo "missing IP pool manifest for $profile" >&2
		exit 1
	fi
	if ! compgen -G "$dest/$network_glob" >/dev/null; then
		echo "missing network manifest ($network_glob) for $profile" >&2
		exit 1
	fi
	local examples
	examples="$(find "$dest" -maxdepth 1 -name '*example-daemonset*.yaml' | wc -l | tr -d ' ')"
	if [[ "$examples" != "1" ]]; then
		echo "expected one example DaemonSet for $profile, found $examples" >&2
		exit 1
	fi

	lowercase_preset_names "$preset" "$dest"
	# GB200 keeps the NIC powered across an OS reboot. Without a firmware
	# reset, NicConfigurationTemplate changes drain and reboot the node
	# without taking effect.
	if [[ "$preset" == "GB200-NVL-NVIDIA-GB200" ]]; then
		enable_firmware_reset "$dest/10-nicclusterpolicy.yaml"
	fi

	local complete="$dest/complete.yaml"
	local files=()
	local manifest
	while IFS= read -r manifest; do
		files+=("$manifest")
	done < <(find "$dest" -maxdepth 1 -name '[0-9]*-*.yaml' | sort)
	: >"$complete"
	local i
	for i in "${!files[@]}"; do
		cat "${files[$i]}" >>"$complete"
		if [[ "$i" -lt $((${#files[@]} - 1)) ]]; then
			printf '\n---\n' >>"$complete"
		fi
	done

	rm -rf "$scratch"
}

render_profile sriov-network-rdma PowerEdge-XE9680-H200 \
	"nvidia.com/gpu.product=NVIDIA-H200" '50-sriovnetwork*.yaml' \
	--fabric ethernet --deployment-type sriov
render_profile host-device-rdma PowerEdge-XE9680-H200 \
	"nvidia.com/gpu.product=NVIDIA-H200" '*hostdevicenetwork*.yaml' \
	--fabric ethernet --deployment-type host_device
render_profile macvlan-rdma-shared PowerEdge-XE9680-H200 \
	"nvidia.com/gpu.product=NVIDIA-H200" '*macvlannetwork*.yaml' \
	--fabric ethernet --deployment-type rdma_shared
render_profile sriov-ib-rdma GB200-NVL-NVIDIA-GB200 \
	"nvidia.com/gpu.product=NVIDIA-GB200" '*sriovibnetwork*.yaml' \
	--fabric infiniband --deployment-type sriov
render_profile ipoib-rdma-shared GB200-NVL-NVIDIA-GB200 \
	"nvidia.com/gpu.product=NVIDIA-GB200" '*ipoibnetwork*.yaml' \
	--fabric infiniband --deployment-type rdma_shared

echo "Wrote quick-start bundles to $out"
