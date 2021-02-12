#!/bin/bash

set -e

echo -n "Enter a number: "
read VAR

if [[ $VAR -gt 10 ]]
then
  echo "That number is greater than 10."
else
  echo "Your number is pretty small!"
  exit 0;
fi
