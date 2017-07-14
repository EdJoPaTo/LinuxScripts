#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}_compressed.jpg"

  convert "$filename" -sampling-factor 4:2:0 -strip -resize '2000x1000>' -quality 85 "$target"
done
