$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav"
$FP  = "$env:TEMP\15791817.wav"

# Download the audio file and save it in the temporary directory
# https://stackoverflow.com/a/51225744/17002774
Invoke-WebRequest $URL -OutFile $FP

# Change volume to full
# $wshShell = New-Object -ComObject WScript.Shell
# 1..50 | ForEach-Object { $wshShell.SendKeys([char]175) }

# Play the audio file
# https://stackoverflow.com/a/73538809/17002774
(New-Object System.Media.SoundPlayer($FP)).PlaySync()

# Delete the audio file
# https://www.tutorialspoint.com/powershell/powershell_files_delete_files.htm
Remove-Item $FP
