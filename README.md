# Controller

An attempt to emulate a gameboy controller

## The Idea

The sole purpose of this project was to try remotely controlling the WASD keypad and the left/right clicks of a laptop through an app on an android device.

## The Details

To achieve this connection, I have used Firebase RTDB to update the values in binary fashion as shown below:

![](https://i.imgur.com/JLy73Oj.gif) 
![](https://i.imgur.com/EbIflue.gif)

(The delay shown in the above GIFs is not noticable when the app is running)

The python script then grabs these values from the database and then performs the corresponding key press/mouse click according to the value retrieved. (1 for press the key and 0 for release) 

This automation is achieved through the [PyAutoGUI](https://pyautogui.readthedocs.io/en/latest/index.html) library. 

To test this project, I pulled up a word document and it types the corresponding keys/presses the corresponding mouse keys to command

General note: The app as of now is not responsive and there is some delay between pressing the button on the app and watching it reflect on the word document
