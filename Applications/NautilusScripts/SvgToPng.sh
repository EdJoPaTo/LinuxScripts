#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  inkscape -z -e "$basename.png" "$filename" >/dev/null 2>/dev/null
done
