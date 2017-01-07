#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}_blur.${extension}"

  convert "$filename" -blur 2x2 "$target"
done
