# VolumeToTrim

## Summary

**VolumeToTrim** is an AutoHotkey v2 script that enables the use of a simple $15 USB volume knob as a trim wheel in Microsoft Flight Simulator 2020. It converts the volume knob’s "volume up" and "volume down" inputs into key presses, which can be mapped to the elevator trim up and elevator trim down controls in MSFS. Pressing the volume knob (mute function) also generates a key press. 

In some aircraft in MSFS, the response of the trim wheel is very slow, and you would need to turn the wheel countless times if the script only output single key presses. To address this, **VolumeToTrim** has two functions:
1. You can define a minimum number of key presses generated for each movement of the wheel.
2. Additionally, there is a feature where turning the wheel faster generates more key presses per movement, which increase gradually. This feature can also be disabled.

These and other settings in **VolumeToTrim** are configured via an .ini file. The effects of the settings are described within the .ini file.

**Note**: This is something I quickly put together for my own use, and I wanted to share it in case someone else finds it useful. I cannot provide support if something does not work for you but it should be pretty simple to use.

## Requirements

[AutoHotkey v2](https://www.autohotkey.com/)

## Installation 

### Use the compiled version

1. Download the VolumeToTrim.zip
2. Unzip the file to the desired directory
3. Run the .exe

### Use as a Script Only

1. Install AutoHotkey v2 
2. Download the source code
3. Unzip the file to the desired directory.
4. Double-click VolumeToTrim.ahk to run it.

### Compile the Script to an .exe file by yourself

1. Install AutoHotkey v2 
2. Download the source code
3. Unzip the file to the desired directory.
4. Open **AutoHotkey Dash** from the Start menu.
5. Press **Compile**, and let it install **Ahk2Exe** for you if it is not installed already.
6. Select VolumeToTrim.ahk as the source (script file).
7. Leave the other fields as default.
8. Press **Convert**.

You now have an .exe file that you can directly run from, e.g., batch files.
