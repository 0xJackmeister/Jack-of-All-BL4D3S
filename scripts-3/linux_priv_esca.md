# linux\_priv\_esca

## 1. Kernel Exploits

```
   1) uname -a
   2) /proc/version
   3) /etc/issue
      1- Look for an exploit for the kernel
      2- Compile and run the code
```

## 2. Sudo

```
   1) sudo -l
      1- look for files you can execute as root. use gtfobins
   2) LD_PRELOAD
      1- if env-keep is set can generate and execute custom lib when running command
         1> compile code as shared object (.so) 
         2> run command with sudo pointing LD_PRELOAD to you .so file
```

## 3. SUID

```
   1) find / -type f -perm -04000 -ls 2>/dev/null 
   2) find / -perm -u=s -type f 2>/dev/null
      1- find SUID enabled files
      2- use gtfobins to find out how to exploit them
```

## 4. Cron Jobs

```
   1) cat /etc/crontab
      1- look for jobs being run as a user with higher privs than you
      2- see if you can write to the file being executed
      3- If the job dosent specify full path, will use PATH listed in crontab. If can write to any dir in the PATH, can hijack the Cron Job
```

## 5. PATH

```
   1) echo $PATH
   2) Can you write to and Dirs in $PATH?
   3) Can you modify your path?
   4) Is there a script you can run that will be effected by this?
      1- if you can modify PATH you can ad d/tmp to beggining and hijack and binary being run with higher privs than you have
```

## 6. Capabilities

```
  1) getcap -r / 2>
      1- recursively get capabilities for every file starting from /
```

## 7. NFS

```
   1) cat /etc/exports
      1- must have “no_root_squash” enabled on a share
         1>  showmount -e 10.10.135.31
         2> mkdir /tmp/mnt 
         3> mount -o rw IP:SHARE /tmp/mnt
         4> make and compile and an exploit
         5> Add the SUID bit
         6> transfer file to mounted share
         7> Execute as user on target
```
