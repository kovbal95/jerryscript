egrep -nr " "$1"[ ]*\(" ../ | grep "\.c:" | grep -oh "^[^:]*\.c:[0-9]*" > temp_files.log
cat temp_files.log
echo "*************************************************************************"
input="./temp_files.log"
while IFS= read -r var
do
  echo ""
  echo $var
  egrep -n "^[^ ]+[ ]*\(" `echo $var | grep -oh "^[^:]*"` > temp_lines.log
  input2="./temp_lines.log"
  tortent=0
  while IFS= read -r var2
  do
    linenumber=`echo $var2 | egrep -oh "^[0-9]+"`
    line=`echo $var | egrep -oh "[0-9]*$"`
    if [[ $linenumber -gt $line ]]
    then
      echo $elozo
      tortent=1
      break
    fi
    elozo=`echo $var2 | egrep -oh "[^: (]*[ ]*\("`
    elozo=`echo $elozo | egrep -oh "[^: (]*"`
  done < "$input2"
  if [[ $tortent == 0 ]]
  then
    echo $elozo
  fi
done < "$input"
