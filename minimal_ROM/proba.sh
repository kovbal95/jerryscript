input="./temp2.log"
echo "$(cat minimalerror.log)" > temp_list_error.log
echo "$(cat minimal_without_profile.log)" >> temp_list_error.log
sed -i -e "s/  / /g" temp_list_error.log
while IFS= read -r var
do
  c=${var/  / }
  var=$c
  if [[ `grep -F "$var" temp_list_error.log` == "" ]] &&
      [[ `echo "$var" | grep  " \-"` == "" ]]
  then
    echo $var
    echo $var | wc -m
  fi
done < "$input"
