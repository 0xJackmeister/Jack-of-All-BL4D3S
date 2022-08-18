#!/bin/bash

read -p 'Enter IP address (eg: 192.168.3) : ' IPADDR 
if [ $IPADDR == "" ]
then
echo "You forgot to input IP address!"
echo "Syntax: ./ipscanner.sh 192.168.2"

else
echo -e "\n"
for ip in `seq 1 254`; do
ping -c 1 $IPADDR.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &

done
fi
echo -e "\n$IPADDR scanning is done."
