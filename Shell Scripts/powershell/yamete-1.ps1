$URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudusai.wav"
$FP  = "$env:TEMP\15791817.wav"

# Download the audio file and save it with a random name in the temporary directory
# https://stackoverflow.com/a/51225744/17002774
Invoke-WebRequest -Uri $URL -OutFile $FP

# https://www.youtube.com/watch?v=kJvl7GjjkI0
# Play the audio file
# https://stackoverflow.com/a/73538809/17002774
(New-Object System.Media.SoundPlayer($FP)).PlaySync()