#Spawn /bin/bash
python -c 'import pty;pty.spawn("/bin/bash")'
python2 -c 'import pty;pty.spawn("/bin/bash")'
python3 -c 'import pty;pty.spawn("/bin/bash")'

#Allow 'clear' command
export TERM=xterm

#Allow tab etc
press CTRL + Z (go background in linux)
stty raw -echo;fg (get shell and return to session)

