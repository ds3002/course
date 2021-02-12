#!/usr/local/bin/bash

echo -n "Enter a number: "
read VAR

if [[ $VAR -gt 10 ]]
then
  echo "That number is greater than 10."
else
  echo "Your number is pretty small!"
fi
