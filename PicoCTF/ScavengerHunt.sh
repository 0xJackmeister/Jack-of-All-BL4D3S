#!/bin/bash

curl -s http://mercury.picoctf.net:39491/ | grep pico;
curl -s http://mercury.picoctf.net:39491/mycss.css | grep 2 ;
curl -s http://mercury.picoctf.net:39491/robots.txt | grep 3;
curl -s http://mercury.picoctf.net:39491/.htaccess | grep 4 ;
curl -s http://mercury.picoctf.net:39491/.DS_Store | grep 5
