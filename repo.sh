#!/bin/bash

set -e

SCRIPT_DIR=$(dirname ${BASH_SOURCE})
cd "$SCRIPT_DIR"

if [ "${1:-}" = "docs" ]; then
    echo "Processing RST files for rli:: variable substitutions..."
    # Forward substitutions script: |var| -> value (applies only to lines with 'rli::')
    sed_file_f=/tmp/vars_rli.sed
    grep -E '^\.\. \|.*\| replace::' docs/common/vars.rst | \
        sed 's/\.\. |\(.*\)| replace:: \(.*\)/\/rli::\/ s@|\1|@\2@g/' > "$sed_file_f"
    # Apply in-place only to matching files (those that contain rli::)
    grep -RIl --include="*.rst" --exclude-dir="_build" 'rli::' docs | while read -r file; do
        echo "Processing $file"
        sed -i -f "$sed_file_f" "$file"
    done
fi

# Run the documentation build (do not exec so we can run post-steps)
set +e
"tools/packman/python.sh" tools/repoman/repoman.py "$@"
rc=$?
set -e

if [ "${1:-}" = "docs" ]; then
    echo "Reverting rli:: substitutions in RST files..."
    # Reverse substitutions script: value -> |var| (applies only to lines with 'rli::')
    sed_file_r=/tmp/vars_rli_rev.sed
    grep -E '^\.\. \|.*\| replace::' docs/common/vars.rst | \
        sed 's/\.\. |\(.*\)| replace:: \(.*\)/\/rli::\/ s@\2@|\1|@g/' > "$sed_file_r"
    grep -RIl --include="*.rst" --exclude-dir="_build" 'rli::' docs | while read -r file; do
        echo "Processing $file"
        sed -i -f "$sed_file_r" "$file"
    done
    # Cleanup both scripts if present
    rm -f /tmp/vars_rli.sed "$sed_file_r"
fi

exit $rc