# VolumeToTrim
## Summary
VolumeToTrim is an AutoHotkey v2 script that enables the use of a simple USB volume knob as a trim wheel in Microsoft Flight Simulator. It converts the volume knob’s volume up and volume down inputs into key presses, which can be mapped to elevator trim up and elevator trim down controls in MSFS. Pressing the volume knob (mute function) also generates a key press.

In some aircraft in MSFS, the response of the trim wheel is very slow, and you would need to turn the wheel countless times if the script only output single keypresses. To address this, VolumeToTrim has two functions. Firstly, you can define a minimum number of key presses generated for each movement of the wheel. Additionally, there is a feature where turning the wheel faster generates more key presses, increasing gradually. This feature can also be disabled.

These and other settings of VolumeToTrim are configured in an .ini file located in the same directory. The effect of the settings is described in the .ini file.

NB: This is something I just quickly put together for my own usage and wanted to share if someone finds it useful. I can't provide support if something isn't working for you. 
## Requirements
AutoHotkey V2
## Installation 
### Use as script only
- Install AutoHotkey v2
- Download VolumeToTrim.zip
- Unzip the zip file to directory desired
- Double click the VolumeToTrim.ahk to run it
## Compile the script to an .exe file
- Install AutoHotkey v2
- Download VolumeToTrim.zip
- Unzip the zip file to directory desired
- Open AutoHotkey Dash from Start menu
- Press Compile and let it install Ahk2Exe for you if it isn't installed already
- Select VolumeToTrim as a Source (script file)
- Leave other fields as default
- Press Convert

You now have an .exe file you cand directly run from eg. batch files

