#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  basename="${filename%.*}"

  target="${basename}.pdf"

  if [ "$extension" = "tex" ]
  then
    pdflatex -interaction=batchmode $filename
    pdflatex -interaction=batchmode $filename
  elif [ "$extension" = "dot" ]
  then
    dot -Tpdf "$filename" -o "$target"
  elif [ "$extension" = "svg" ]
  then
    inkscape -z --file="$filename" --export-pdf="$target"
  else
    libreoffice --invisible --convert-to pdf $file
  fi
done
