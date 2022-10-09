# Defines the Update-Wallpaper command
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


# Defines the screenshot command, https://stackoverflow.com/a/2970339/17002774
[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)
   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)
   $bmp.Save($path)
   $graphics.Dispose()
   $bmp.Dispose()
}


# Waits sometime as to not get the powershell window in the frame
Start-Sleep 1

# Gets the dimensions of screenshot, https://stackoverflow.com/a/35965782/17002774
$vc = Get-WmiObject -class "Win32_VideoController"
$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $vc.CurrentHorizontalResolution[1], $vc.CurrentVerticalResolution[1])

# Takes the screenshot
$ss_fp = "$env:TEMP\1987215.png"
screenshot $bounds $ss_fp

# Sets it as the wallpaper
Update-Wallpaper -Path $ss_fp -Style Stretch
Update-Wallpaper -Path $ss_fp -Style Stretch

# # Deletes it
# Remove-Item $ss_fp

# Hides the desktop icons, https://superuser.com/questions/1368139/disable-show-desktop-icons-in-windows-with-powershell
$Path="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $Path -Name "HideIcons" -Value 1
Get-Process "explorer"| Stop-Process







