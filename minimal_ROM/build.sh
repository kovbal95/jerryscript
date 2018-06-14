#!/bin/bash

source ./env_build.sh

COMM=$COMM" --lto ON"
$COMM
wc -c ../build/bin/jerry | grep -ohe "[0-9]*"
if [ "x$1" != "x" ]
then
  python ../tools/run-tests.py --jerry-tests --unittests
fi
