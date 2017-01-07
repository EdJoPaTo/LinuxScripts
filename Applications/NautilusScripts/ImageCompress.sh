#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}_compressed.jpg"

  convert "$filename" -resize '2000x1000' -enhance +dither -colors 256 -quality 90 "$target"
done
