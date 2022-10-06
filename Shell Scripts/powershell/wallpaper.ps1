Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;
public class wpchange {
    public const uint SPI_SETDESKWALLPAPER = 0x0014;
    public const uint SPIF_UPDATEINIFILE = 0x01;
    public const uint SPIF_SENDWININICHANGE = 0x02;
    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    private static extern int SystemParametersInfo (uint uAction, uint uParam, string lpvParam, uint fuWinIni);
    public static void SetWallpaper (string path) {
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, path, SPIF_UPDATEINIFILE | SPIF_SENDWININICHANGE);
    }
}
'@

# Gets a random number between 1 and 6
$fn = Get-Random -Minimum 1 -Maximum 6
# Downloads a random cat pic from the Assets folder
Invoke-WebRequest -Uri https://raw.githubusercontent.com/msr8/attiny85/main/Assets/cat$fn.jpg -OutFile $env:TEMP\15791817.jpg
# Changes it
[wpchange]::SetWallpaper("$env:TEMP\15791817.jpg")
# Deletes it
rm $env:TEMP\15791817.jpg

# Hides the desktop icons, https://superuser.com/questions/1368139/disable-show-desktop-icons-in-windows-with-powershell
$Path="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $Path -Name "HideIcons" -Value 1
Get-Process "explorer"| Stop-Process

