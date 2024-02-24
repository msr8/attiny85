$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav"
$FP  = "$env:TEMP\15791817.wav"

# Download the audio file and save it in the temporary directory
# https://stackoverflow.com/a/51225744/17002774
Invoke-WebRequest $URL -OutFile $FP

# Change the entry in the windows registry to the path of the audio file
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-itemproperty
Set-ItemProperty -Name "(Default)" -Value $FP -Path "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"