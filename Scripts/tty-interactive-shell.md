# Spawn /bin/bash
```
python -c 'import pty;pty.spawn("/bin/bash")'

python2 -c 'import pty;pty.spawn("/bin/bash")'

python3 -c 'import pty;pty.spawn("/bin/bash")'

echo os.system('/bin/bash')

/bin/sh -i

script -qc /bin/bash /dev/null

perl -e 'exec "/bin/sh";'

perl: exec "/bin/sh";

ruby: exec "/bin/sh"

lua: os.execute('/bin/sh')

IRB: exec "/bin/sh"

vi: :!bash

vi: :set shell=/bin/bash:shell

nmap: !sh

```
# Allow 'clear' command
```
export TERM=xterm
```
# Allow tab etc
```
press CTRL + Z (go background in linux)
stty raw -echo;fg (get shell and return to session)
press ENTER to get shell
```


