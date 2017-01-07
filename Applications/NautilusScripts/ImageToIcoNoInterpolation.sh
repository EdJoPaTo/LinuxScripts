#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}.ico"

  convert "$filename" -filter Point -define icon:auto-resize=256,128,64,48,32,24,16 "$target"
done
