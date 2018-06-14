#!/bin/bash

source ./env_build.sh

COMM=$COMM" --linker-flag='-Wl,-Map=output.map'"
COMM=$COMM" --lto OFF"
$COMM
