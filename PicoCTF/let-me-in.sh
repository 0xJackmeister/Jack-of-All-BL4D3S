#!/bin/bash

curl -X GET "http://mercury.picoctf.net:38322/" \
-H "Host: mercury.picoctf.net:38322" \
-H "User-Agent: PicoBrowser text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8" \
-H "Accept-Language: en-US,en;q=0.5" \
-H "Accept-Encoding: gzip, deflate" \
-H "Connection: close" \
-H "Upgrade-Insecure-Requests: 1" \
-H "Referer: mercury.picoctf.net:38322" \
-H "Date: 2018" \
-H "DNT: 1" \
-H "Accept-Language: sv" \
-H "X-Forwarded-For: 103.57.72.0"
