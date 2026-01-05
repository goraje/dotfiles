#!/usr/bin/env bash

set -euo pipefail

DEST="$HOME"

# Check that at least one source directory is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 SRC_DIR [SRC_DIR2 ...]"
    exit 1
fi

# Step 1: Recreate directory structure
for SRC in "$@"; do
    if [ ! -d "$SRC" ]; then
        echo "Warning: '$SRC' is not a directory, skipping."
        continue
    fi

    find "$SRC" -mindepth 1 -type d | while read -r dir; do
        rel="${dir#$SRC/}"
        rel="${rel//dot-/.}"
        mkdir -p "$DEST/$rel"
    done
done

# Step 2: Backup existing files in destination
for SRC in "$@"; do
    if [ ! -d "$SRC" ]; then
        continue
    fi

    find "$SRC" -type f | while read -r file; do
        # Compute relative path
        rel="${file#$SRC/}"
        rel="${rel//dot-/.}"
        dest_file="$DEST/$rel"

        # If the file exists, create a .bkp copy
        if [ -f "$dest_file" ]; then
            cp -p "$dest_file" "$dest_file.bkp"
            echo "Backed up: $dest_file → $dest_file.bkp"
            rm "$dest_file"
        fi
    done
done
