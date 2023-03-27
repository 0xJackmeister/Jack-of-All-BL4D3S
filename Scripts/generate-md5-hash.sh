#!/bin/bash

for i in {1..2000}
do
  echo -n $RANDOM | md5sum | head -c 32
  echo ""  # add a newline after each number
done

