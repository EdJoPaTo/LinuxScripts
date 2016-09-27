#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param jre8-openjdk yed

