$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav"
$FP  = "$env:TEMP\15791817.wav"

# Check if the file does not exist
if ( -not (Test-Path $FP) ) {
    # if it doesnt exist, download the audio file and save it in the temporary directory
    # https://stackoverflow.com/a/51225744/17002774
    Invoke-WebRequest -Uri $URL -OutFile $FP
}

# Play the audio file
# https://stackoverflow.com/a/73538809/17002774
(New-Object System.Media.SoundPlayer($FP)).PlaySync()