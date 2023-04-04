#!/bin/bash
# Generate 100 repeating carlos and wiener user wordlist
counter=0

while [ $counter -lt 100 ]
do
  echo "carlos"
  echo "wiener"
  counter=$((counter+1))
done
