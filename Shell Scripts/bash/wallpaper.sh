# Downloads a random cat from the Assets folder
fn="$((1 + RANDOM % 6))"
curl "https://raw.githubusercontent.com/msr8/attiny85/main/Assets/cat$(echo $fn).jpg" > "$TMPDIR/15791817.jpg"

# Changes the wallpaper, https://apple.stackexchange.com/a/348454 & https://stackoverflow.com/a/16825976/17002774
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$(echo $TMPDIR)/15791817.jpg\""
osascript -e "tell application \"System Events\" to tell process \"System Preferences\"
    tell pop up button 2 of tab group 1 of window 1
        click
        click menu item \"Stretch to Fill Screen\" of menu 1
    end tell
end tell"
killall Dock

# Hides the icons
defaults write com.apple.finder CreateDesktop false
killall Finder

# Deletes the file
rm "$TMPDIR/15791817.jpg"