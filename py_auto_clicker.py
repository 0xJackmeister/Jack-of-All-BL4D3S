#!/usr/bin/python3


import pyautogui as pag
#if pyautogui is still missing after installed , you can try using this tool by Dewalt-arch
# https://github.com/Dewalt-arch/pimpmykali
import random
import time

print ("hello world")
while True: 
    x = random.randint(600,700)
    y = random.randint(200,600)
    pag.moveTo(x,y,0.5)
    #time.sleep(2)
