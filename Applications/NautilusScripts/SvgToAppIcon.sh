#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  mkdir appicon

  for size in 57 72 76 114 120 144 152 192 512
  do
    inkscape -z -e "appicon/$size.png" -w $size -h $size "$filename" >/dev/null 2>/dev/null
  done
done
