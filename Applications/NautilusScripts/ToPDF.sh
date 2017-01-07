#!/bin/bash

for file in $NAUTILUS_SCRIPT_SELECTED_URIS
do
  filename=$(basename "$file")
  extension="${filename##*.}"

  target="${filename}.pdf"

  if [ "$extension" = "tex" ]
  then
    pdflatex -interaction=batchmode $filename
    pdflatex -interaction=batchmode $filename
  elif [ "$extension" = "svg" ]
  then
    inkscape -D -z --file="$filename" --export-pdf="$target"
  else
    libreoffice --invisible --convert-to pdf $file
  fi
done
