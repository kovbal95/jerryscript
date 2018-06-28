#!/bin/bash

source ./env_build.sh

COMM=$COMM" --lto ON"
$COMM
wc -c ../build/bin/jerry | grep -ohe "[0-9]*"
if [ "x$1" != "x" ]
then
  python ../tools/run-tests.py --jerry-tests --buildoptions="--profile=micro" | tee temp.log
  grep ": FAIL" temp.log > temp2.log
  input="./temp2.log"
  cat minimalerror.log > temp_list_error.log
  cat minimal_without_profile.log >> temp_list_error.log
  cat long_string_fails.log >> temp_list_error.log
  cat just_int_fail.log >> temp_list_error.log
  sed -i -e "s/  / /g" temp_list_error.log
  clear
  while IFS= read -r var
  do
    c=${var/  / }
    var=$c
    if [[ `grep -F "$var" ./temp_list_error.log` == "" ]] &&
        [[ `echo "$var" | grep  "snapshot"` == "" ]]
    then
      echo $var
    fi
  done < "$input"
fi
