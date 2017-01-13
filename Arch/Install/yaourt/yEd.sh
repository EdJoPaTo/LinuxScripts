#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param --asdeps jre8-openjdk
yaourt $param yed
