Note : Installation only tested on Windows

# Setup 

```
#Get a Digispark

https://shopee.com.my/electrica_malaysia/4060279901
```
![image](https://user-images.githubusercontent.com/78603128/224087378-7f44ee07-244e-4dc7-af98-9aebbed89334.png)

```
#Install arduino ide 1.8.13 (more stable , others doesnt work for me)

https://downloads.arduino.cc/arduino-1.8.13-windows.exe

#Open the ide and put digispark library link into "File -> Pereferences ->Additional Board Manager URLs"

https://raw.githubusercontent.com/digistump/arduino-boards-index/master/package_digistump_index.json
```
![image](https://user-images.githubusercontent.com/78603128/224086982-c6967836-bb9e-47ba-9151-5ee6159b49a4.png)

```
#Go "Tools -> Board -> Board Manager -> find and install Digistump AVR Boards"
```
![image](https://user-images.githubusercontent.com/78603128/224086886-68d8aca6-0930-4b8c-b06c-3c68bc758eee.png)

```
#Install digispark driver

https://github.com/digistump/DigistumpArduino/releases/download/1.6.7/Digistump.Drivers.zip

#Extract and install "Install Drivers.exe"
```
![image](https://user-images.githubusercontent.com/78603128/224086804-d90414d9-78af-448f-8802-9d37a56e23bc.png)

# Testing
```
Once everything is done setup , you can use any payload from any digispark github repo

https://github.com/CedArctic/DigiSpark-Scripts

https://github.com/MTK911/Attiny85

https://github.com/skyf0l/DigiSpark-Scripts

https://github.com/topics/digispark-payload
```

```
Insert the code into IDE and verify it for snytax error then press upload 
```
![image](https://user-images.githubusercontent.com/78603128/224089723-6afcf985-e1d8-4dbe-8672-c457b2415b2a.png)

```
It will prompt you to insert digispark usb , insert it and the script will be injected into it
```
