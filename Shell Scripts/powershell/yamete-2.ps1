$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav"
$FP  = "$env:TEMP\15791817.wav"
# Uncomment the below line to "fix" the sound
# $FP = "C:\Windows\Media\Windows Hardware Insert.wav"

# Download the audio file and save it in the temporary directory
# https://stackoverflow.com/a/51225744/17002774
Invoke-WebRequest $URL -OutFile $FP

Set-ItemProperty -Value $FP -Path "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current" -Name "(Default)"

# https://www.dmcinfo.com/latest-thinking/blog/id/9338/automatically-change-windows-system-sounds
# https://stackoverflow.com/questions/66824212/change-default-windows-sound-with-powershell
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-itemproperty?view=powershell-7.4