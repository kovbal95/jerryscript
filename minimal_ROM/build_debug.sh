#!/bin/bash

COMM=../tools/build.py
COMM=$COMM" --clean"

COMM=$COMM" --js-parser=ON"
COMM=$COMM" --debug"
COMM=$COMM" --error-messages=ON"

COMM=$COMM" --profile=micro"
$COMM
