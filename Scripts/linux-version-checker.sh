#!/bin/bash

echo -e "Kernal name            : $(uname -s)\n"
echo -e "Kernal release         : $(uname -r)\n"
echo -e "Kernal version         : $(uname -v)\n"
echo -e "Host name              : $(uname -n)\n"
echo -e "Machine architecture   : $(uname -m)\n"
echo -e "Processor architecture : $(uname -p)\n"
echo -e "OS architecture        : $(uname -i)\n"
echo -e "Operating System       : $(uname -o)\n"


#may need root privilege
echo -e "Additional kernal info       : $(/proc/version)\n"
echo -e "system identification        : $(/etc/issue)\n"
