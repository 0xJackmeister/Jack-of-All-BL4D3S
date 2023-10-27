for i in {101..255}; do echo $i; timeout 5s curl -I http://192.168.2.$i; done
#Bash command to get web server header of ip range specified
