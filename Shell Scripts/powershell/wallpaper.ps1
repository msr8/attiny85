Function Update-Wallpaper {
    Param(
        [Parameter(Mandatory=$true)]
        $Path,

        [ValidateSet('Center','Stretch','Fill','Tile','Fit')]
        $Style
    )
    Try {
        if (-not ([System.Management.Automation.PSTypeName]'Wallpaper.Setter').Type) {
            Add-Type -TypeDefinition @"
            using System;
            using System.Runtime.InteropServices;
            using Microsoft.Win32;
            namespace Wallpaper {
                public enum Style : int {
                    Center, Stretch, Fill, Fit, Tile
                }
                public class Setter {
                    public const int SetDesktopWallpaper = 20;
                    public const int UpdateIniFile = 0x01;
                    public const int SendWinIniChange = 0x02;
                    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
                    private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
                    public static void SetWallpaper ( string path, Wallpaper.Style style ) {
                        SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
                        RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
                        switch( style ) {
                            case Style.Tile :
                                key.SetValue(@"WallpaperStyle", "0") ;
                                key.SetValue(@"TileWallpaper", "1") ;
                                break;
                            case Style.Center :
                                key.SetValue(@"WallpaperStyle", "0") ;
                                key.SetValue(@"TileWallpaper", "0") ;
                                break;
                            case Style.Stretch :
                                key.SetValue(@"WallpaperStyle", "2") ;
                                key.SetValue(@"TileWallpaper", "0") ;
                                break;
                            case Style.Fill :
                                key.SetValue(@"WallpaperStyle", "10") ;
                                key.SetValue(@"TileWallpaper", "0") ;
                                break;
                            case Style.Fit :
                                key.SetValue(@"WallpaperStyle", "6") ;
                                key.SetValue(@"TileWallpaper", "0") ;
                                break;
                        }
                        key.Close();
                    }
                }
            }
"@ -ErrorAction Stop
            }
        }
        Catch {
            Write-Warning -Message "Wallpaper not changed because $($_.Exception.Message)"
        }
    [Wallpaper.Setter]::SetWallpaper( $Path, $Style )
}







# Gets a random number between 1 and 6
$fn = Get-Random -Minimum 1 -Maximum 6

# Downloads a random cat pic from the Assets folder
Invoke-WebRequest -Uri https://raw.githubusercontent.com/msr8/attiny85/main/Assets/cat$fn.jpg -OutFile $env:TEMP\15791817.jpg

# For some reason you have to do it two times or else it acts weirdly
Update-Wallpaper -Path $env:TEMP\15791817.jpg -Style Stretch
Update-Wallpaper -Path $env:TEMP\15791817.jpg -Style Stretch

# Deletes it
Remove-Item $env:TEMP\15791817.jpg

# Hides the desktop icons, https://superuser.com/questions/1368139/disable-show-desktop-icons-in-windows-with-powershell
$Path="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $Path -Name "HideIcons" -Value 1
Get-Process "explorer"| Stop-Process



