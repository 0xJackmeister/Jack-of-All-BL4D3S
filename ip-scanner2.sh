!/bin/bash

if [ -z "$1" ]
  then
    echo "No 3 part network given , i.e. 113.22.35"
else
    ipAddress=$1

    for i in {1..255} ;do 
    (
        {
        ping -w 5 $ipAddress.$i;  

 #store last run success result(0) 
        result=$(echo $?);

 #clear all command output
        } &> /dev/null


#check if ping successful
        if [ $result = 0 ]; then
            echo  $ipAddress.$i : UP
        else
            echo  $ipAddress.$i : DOWN
        fi &);
    done

fi

