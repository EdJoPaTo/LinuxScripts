#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  mkdir appicon

  for size in 16 32 57 60 72 76 114 120 144 152 180 192 512 1000 1024
  do
    inkscape -z -e "appicon/$size.png" -w $size -h $size "$filename" >/dev/null 2>/dev/null
  done
done
