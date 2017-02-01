#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}_opti_pretty.svg"

  svgo --pretty --disable=mergePaths --disable=cleanupIDs "$filename" "$target"
done
