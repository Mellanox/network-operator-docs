#!/bin/bash

# Script to fetch configuration documentation from GitHub
# Usage: ./hack/fetch-config-docs.sh <repo> <branch/tag> <file_path> <output_path>

set -e

REPO=${1:-"Mellanox/nic-configuration-operator"}
BRANCH=${2:-"main"}
FILE_PATH=${3:-"README.md"}
OUTPUT_PATH=${4:-"docs/nic-conf-operator/configuration-details.rst"}

echo "Fetching configuration documentation from ${REPO}/${BRANCH}/${FILE_PATH}"

# Create output directory if it doesn't exist
mkdir -p "$(dirname "$OUTPUT_PATH")"

# Fetch the content from GitHub
curl -s "https://raw.githubusercontent.com/${REPO}/${BRANCH}/${FILE_PATH}" > ./tmp_config_docs.md

# Convert markdown to reStructuredText and extract configuration details section
cat > "$OUTPUT_PATH" << 'EOF'
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

==========================================
Configuration Details
==========================================

EOF

# Extract the configuration details section from the markdown
awk '/#### Configuration details/,/### NicFirmwareSource/' ./tmp_config_docs.md | head -n -1 > ./tmp_config_section.md

# Convert to reStructuredText format using Docker (same as other parts of the workflow)
docker run --rm --volume "`pwd`:/data:Z" pandoc/minimal -f markdown -t rst --wrap=none /data/tmp_config_section.md -o /data/tmp_config_section.rst

# Create the final output
cat "$OUTPUT_PATH" > ./tmp_final_output.rst
echo "" >> ./tmp_final_output.rst
cat ./tmp_config_section.rst >> ./tmp_final_output.rst

mv ./tmp_final_output.rst "$OUTPUT_PATH"

# Clean up temporary files
rm -f ./tmp_config_docs.md ./tmp_config_section.md ./tmp_config_section.rst

echo "Configuration documentation saved to ${OUTPUT_PATH}"
echo "Source: https://github.com/${REPO}/blob/${BRANCH}/${FILE_PATH}#configuration-details" 