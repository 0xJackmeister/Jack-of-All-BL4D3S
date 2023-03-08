#!/bin/bash

if [ -z "$1" ]
then
	echo "You forgot an IP address!"
	echo "Syntax: ./ip-scanner3.sh 192.168.1"

else
	echo -e "\n"
	echo "ICMP Scan Result"
	echo "================"
	for ip in `seq 1 254`; do
		ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	done


	echo -e "\n"
	echo "SYN Scan Result"
	echo "==============="
	nmap -sn  $1.0/24 -oG - 

fi

   
