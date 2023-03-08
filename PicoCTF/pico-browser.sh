!#/bin/bash

curl -s --user-agent "picobrowser" "https://jupiter.challenges.picoctf.org/problem/28921/flag" | egrep -o "picoCTF{[^}]+}"
