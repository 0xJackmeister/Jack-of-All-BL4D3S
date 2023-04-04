#!/bin/bash
# Echo "peter" each next line after a word from the wordlist "pass.txt"
while read line
do
  echo "$line"
  echo "peter"
done < pass.txt
# Remember set to send one request at a time to avoid getting banned
