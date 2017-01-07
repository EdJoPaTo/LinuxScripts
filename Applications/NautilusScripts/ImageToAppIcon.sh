#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  mkdir appicon

  for SIZE in 57 72 76 114 120 144 152 192 512
  do
    convert "$filename" -resize "${SIZE}x${SIZE}" "appicon/${basename}_${SIZE}.${extension}"
  done
done
