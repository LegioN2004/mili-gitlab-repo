import pyautogui as gui
import time 

message = input("Enter the message")
number = input("Enter the number of times you want to repeat the message")

time.sleep(1)

for i in range(int(number)):
    gui.typewrite(message)
    gui.press('Enter')

