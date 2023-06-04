# port-checker

```
nmap

ChatGPT version :
IP="example.com"; PORT="80"; if timeout 1 bash -c "</dev/tcp/$IP/$PORT >/dev/null 2>&1"; then echo "Port is open"; else echo "Port is closed"; fi

IPPSEC version : 
echo  > /dev/tcp/MACHINE_IP/PORT && echo UP || echo DOWN
```
