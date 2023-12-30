setlocal enabledelayedexpansion

:: Define the PowerShell script as a string
set "powershellScript=^
$URL = \"https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav\"^
$FP  = \"$env:TEMP\15791817.wav\"^
$MINTIME = 600  # 10 minutes^
$MAXTIME = 3600 # 1 hour^

while ($true) {
    $waitTime = Get-Random -Minimum $MINTIME -Maximum $MAXTIME^
    Start-Sleep -Seconds $waitTime^
    if (!(Test-Path $FP)) {^
        Invoke-WebRequest $URL -OutFile $FP^
    }^
    (New-Object System.Media.SoundPlayer($FP)).PlaySync()^
}
"

