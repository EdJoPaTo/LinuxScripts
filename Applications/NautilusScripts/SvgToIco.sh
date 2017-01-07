#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}.ico"

  for SIZE in 16 24 32 48 64 128 256; do
    inkscape -z -e "${basename}_$SIZE.png" -w $SIZE -h $SIZE "$filename" >/dev/null 2>/dev/null
  done
  convert "${basename}_256.png" "${basename}_128.png" "${basename}_64.png" "${basename}_48.png" "${basename}_32.png" "${basename}_24.png" "${basename}_16.png" -colors 256 "$target"
done
