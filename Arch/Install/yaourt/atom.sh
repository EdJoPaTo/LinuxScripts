#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

# atom-beautify dependency for c++
yaourt $param clang

yaourt $param atom-editor-bin

../../Install/Atom.sh
