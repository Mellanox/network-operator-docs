#!/bin/bash

# Script to fetch configuration documentation from GitHub
# Usage: ./hack/fetch-config-docs.sh <repo> <branch/tag> <file_path> <output_path>

set -e

REPO=${1:-"Mellanox/nic-configuration-operator"}
BRANCH=${2:-"main"}
FILE_PATH=${3:-"README.md"}
OUTPUT_PATH=${4:-"docs/nic-conf-operator/configuration-details.mdx"}

echo "Fetching configuration documentation from ${REPO}/${BRANCH}/${FILE_PATH}"

# Create output directory if it doesn't exist
mkdir -p "$(dirname "$OUTPUT_PATH")"

# Fetch the content from GitHub
curl -fsSL "https://raw.githubusercontent.com/${REPO}/${BRANCH}/${FILE_PATH}" > ./tmp_config_docs.md

cat > ./tmp_config_section.md << 'EOF'
---
title: Configuration Details
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

EOF

# Extract the configuration details section and promote its headings two levels
awk '/#### Configuration details/,/### NicFirmwareSource/' ./tmp_config_docs.md | sed '$d' \
  | sed -E 's/^##(#+) /\1 /' >> ./tmp_config_section.md

# Escape for MDX; relative links point into the source repository
python3 "$(dirname "$0")/fern/md_to_mdx.py" ./tmp_config_section.md "$OUTPUT_PATH" \
  --link-base "https://github.com/${REPO}/blob/${BRANCH}/$(dirname "${FILE_PATH}" | sed 's|^\.$||')"

# Clean up temporary files
rm -f ./tmp_config_docs.md ./tmp_config_section.md

echo "Configuration documentation saved to ${OUTPUT_PATH}"
echo "Source: https://github.com/${REPO}/blob/${BRANCH}/${FILE_PATH}#configuration-details"
