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

Invoke-WebRequest -Uri https://raw.githubusercontent.com/msr8/attiny85/main/Assets/cat6.jpg -OutFile "$env:TEMP\test.jpg"

[wpchange]::SetWallpaper("$env:TEMPDIR\test.jpg")

