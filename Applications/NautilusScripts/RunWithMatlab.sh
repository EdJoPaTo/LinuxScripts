#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  basename="${filename%.*}"

  matlab -nodisplay -r "$basename; quit" > $basename.log
  notify-send -i matlab MATLAB "finished $basename"
done
