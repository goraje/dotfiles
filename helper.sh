#!/usr/bin/env bash

# mimic 'stow' command behavior but only create the directory tree

set -euo pipefail

DEST="$HOME"

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 SRC_DIR [SRC_DIR2 ...]"
    exit 1
fi

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
