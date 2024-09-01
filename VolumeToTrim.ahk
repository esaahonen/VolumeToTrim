; VolumeToTrim.ahk v. 0.1.0 / Esa Ahonen 2024
; This AutoHotkey script is meant for using USB Volume button as a trim wheel in MSFS
; NB: This is for AutoHotkey Version 2, it will not work with v1

; These settings are to prevent AHK error from too much inputs in default interval
A_MaxHotkeysPerInterval := 500
A_HotkeyInterval := 500

; Name & path to the .ini file
configFilePath := "VolumeToTrim.ini"

; Read the values from .ini file and set up default values if read from file fails
volumeUpKey := IniRead(configFilePath, "Settings", "VolumeUpKey", "Numpad7")
volumeDownKey := IniRead(configFilePath, "Settings", "VolumeDownKey", "Numpad1")
volumeMuteKey := IniRead(configFilePath, "Settings", "VolumeMuteKey", "Ins")
maxDelay := IniRead(configFilePath, "Settings", "RepeatDelay", 250)
maxRepeats := IniRead(configFilePath, "Settings", "MaxRepeats", 10)
minRepeats := IniRead(configFilePath, "Settings", "MinRepeats", 1)
enableSpeedup := IniRead(configFilePath, "Settings", "EnableSpeedup", 1)
autoMinimize := IniRead(configFilePath, "Settings", "AutoMinimize", 0)

; Initialize variables for time tracking and multipliers
global lastTrimUpTime := 0
global lastTrimDownTime := 0
global trimUpMultiplier := minRepeats
global trimDownMultiplier := minRepeats

; Create the simple GUI and add text + buttons + their actions
guiHandle := Gui()
guiHandle.Title := "VolumeToTrim"

guiHandle.Add("text","x50 y20","Current settings:")
guiHandle.Add("text","x75 y50", "Volume up key: " . volumeUpKey)
guiHandle.Add("text","x75 y70", "Volume down key: " . volumeDownKey)
guiHandle.Add("text","x75 y90", "Mute button key: " . volumeMuteKey)
guiHandle.Add("text","x75 y110", "Minimum repeats: " . minRepeats)

guiHandle.Add("text","x75 y140", "Enable speedup: " . enableSpeedup)
guiHandle.Add("text","x75 y160", "Repeat delay (ms): " . maxDelay)
guiHandle.Add("text","x75 y180", "Maximum repeats: " . maxRepeats)

guiHandle.Add("text","x75 y210", "Minimize on start: " . autoMinimize)


guiHandle.Add("text","x50 y250","The settings are editable in the .ini file")
guiHandle.Add("text","x50 y270","and they are also described there")

quitButton := guiHandle.Add("Button", "x250 y315 w100 h30", "Quit")
quitButton.OnEvent("Click", (*) => ExitApp())

minButton := guiHandle.Add("Button", "x48 y315 w100 h30", "Minimize")
minButton.OnEvent("Click", (*) => guiHandle.Minimize())

; Show the GUI
guiHandle.Show("W400 H375 xCenter yCenter")

; Check if setting AutoMinimize is on and act accordingly
if (autoMinimize) {
	guiHandle.Minimize()
}

; Map volume up/down actions to functions
Volume_Up:: {
    HandleTrimKey(volumeUpKey, "up")
}

Volume_Down:: {
    HandleTrimKey(volumeDownKey, "down")
}

; Directly handle the mute press
; This awkwardish way of outputting the keypress is because of MSFS's weirdness in handling keypresses
Volume_Mute:: {
    Send("{" volumeMuteKey " down}")
    Sleep(50)
    Send("{" volumeMuteKey " up}")
}

; Function to output the keypresses with the correct multiplier
HandleTrimKey(key, direction) {
    global lastTrimUpTime, lastTrimDownTime, trimUpMultiplier, trimDownMultiplier, maxRepeats, minRepeats, maxDelay, enableSpeedup

    ; Get the current timestamp
    currentTime := A_TickCount

    ; Determine which timestamp and multiplier to use
    if (direction = "up") {
        lastTime := lastTrimUpTime
        multiplier := trimUpMultiplier
    } else {
        lastTime := lastTrimDownTime
        multiplier := trimDownMultiplier
    }

    ; Calculate the time difference
    timeDifference := currentTime - lastTime

    ; Adjust multiplier if speedup is enabled
    if (enableSpeedup) {
        if (timeDifference < maxDelay) {
            ; Increase multiplier if time between keypresses is less than maxDelay
            multiplier := Min(multiplier + 1, maxRepeats)
        } else {
            ; Reset multiplier if time between keypresses exceeds maxDelay
			; If this happens use minRepeats
            multiplier := minRepeats
        }
    } else {
        ; Speedup is disabled, use minRepeats
        multiplier := minRepeats
    }

    ; Update lastTime and multiplier values based on direction
    if (direction = "up") {
        lastTrimUpTime := currentTime
        trimUpMultiplier := multiplier
    } else {
        lastTrimDownTime := currentTime
        trimDownMultiplier := multiplier
    }

    ; Send keypresses with current multiplier
	; This awkwardish way of outputting the keypress is because of MSFS's weirdness in handling keypresses
    Loop multiplier {
        Send("{" key " down}")
        Sleep(50)
        Send("{" key " up}")
    }
}
