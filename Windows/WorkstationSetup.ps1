# --- Deal With Escalation ---

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

 # Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
{
    # We are running "as Administrator" - so change the title and background color to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
}
else
{
    # We are not running "as Administrator" - so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
}

# --- Script Start ---

# Run your code that needs to be elevated here
Write-Host "Press any key to set up system..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

$packages = [ordered]@{}
$softwaredrive = Read-Host -Prompt 'Enter the drive letter for software installations: '
$videogamesdrive = Read-Host -Prompt 'Enter the drive letter for video game installations: '
if(!(Test-Path -Path $videogamesdrive":\Platforms")) { ((New-Item -Path $videogamesdrive":\Platforms" -ItemType Directory) | Out-Null) }

winget install -e --id GlenSawyer.MP3Gain --location $softwaredrive":\WINGET\Media\MP3Gain"
winget install -e --id Mp3tag.Mp3tag --location $softwaredrive":\WINGET\Media\MP3Tag"
winget install -e --id Audacity.Audacity --location $softwaredrive":\WINGET\Media\Audacity"
winget install -e --id Gyan.FFmpeg --location $softwaredrive":\WINGET\Media\FFmpeg"
winget install -e --id HandBrake.HandBrake --location $softwaredrive":\WINGET\Media\HandBrake"
winget install -e --id GIMP.GIMP --location $softwaredrive":\WINGET\Media\GIMP"
winget install -e --id OpenShot.OpenShot --location $softwaredrive":\WINGET\Media\OpenShot"
winget install -e --id VideoLAN.VLC --location $softwaredrive":\WINGET\Media\VLC"
winget install -e --id KDE.Krita --location $softwaredrive":\WINGET\Media\Krita"
winget install -e --id OBSProject.OBSStudio --location $softwaredrive":\WINGET\Media\OBS"
winget install -e --id SumatraPDF.SumatraPDF --location $softwaredrive":\WINGET\Media\SumatraPDF"
winget install -e --id geeksoftwareGmbH.PDF24Creator --location $softwaredrive":\WINGET\Media\PDF24"
winget install -e --id Adobe.Acrobat.Reader.64-bit --location $softwaredrive":\WINGET\Media\Adobe\AcrobatReader"
winget install -e --id calibre.calibre --location $softwaredrive":\WINGET\Media\Calibre"

winget install -e --id ArduinoSA.IDE.stable --location $softwaredrive":\WINGET\Development\Arduino"
winget install -e --id Microsoft.VisualStudio.2022.Community --location $softwaredrive":\WINGET\Development\Visual Studio 2022"
winget install -e --id Microsoft.VisualStudioCode --location $softwaredrive":\WINGET\Development\Visual Studio Code"
winget install -e --id Google.AndroidStudio --location $softwaredrive":\WINGET\Development\Android Studio"
winget install -e --id Python.Python.3.10 --location $softwaredrive":\WINGET\Development\Python310"
winget install -e --id OpenJS.NodeJS.LTS --location $softwaredrive":\WINGET\Development\NodeJS"
winget install -e --id Oracle.JDK.19 --location $softwaredrive":\WINGET\Development\JavaSDK"
winget install -e --id Oracle.JavaRuntimeEnvironment --location $softwaredrive":\WINGET\Development\JavaJRE"
winget install -e --id Microsoft.DotNet.SDK.7 --location $softwaredrive":\WINGET\Development\DotNet7"
winget install -e --id Microsoft.DotNet.SDK.Preview --location $softwaredrive":\WINGET\Development\DotNet8"
winget install -e --id ApacheFriends.Xampp.8.2 --location $softwaredrive":\WINGET\Development\XAMPP"
winget install -e --id Microsoft.XNARedist --location $softwaredrive":\WINGET\Development\XNA"
winget install -e --id Git.Git --location $softwaredrive":\WINGET\Development\Git"
winget install -e --id Docker.DockerDesktop --location $softwaredrive":\WINGET\Development\Docker"

winget install -e --id Microsoft.PowerToys --location $softwaredrive":\WINGET\Utilities\PowerToys"
winget install -e --id RustDesk.RustDesk --location $softwaredrive":\WINGET\Utilities\RustDesk"
winget install -e --id CPUID.HWMonitor --location $softwaredrive":\WINGET\Utilities\HWMonitor"
winget install -e --id AntibodySoftware.WizTree --location $softwaredrive":\WINGET\Utilities\WizTree"
winget install -e --id LIGHTNINGUK.ImgBurn --location $softwaredrive":\WINGET\Utilities\ImgBurn"
winget install -e --id Cyanfish.NAPS2 --location $softwaredrive":\WINGET\Utilities\NAPS2"
winget install -e --id NordVPN.NordVPN --location $softwaredrive":\WINGET\Utilities\NordVPN"
winget install -e --id 7zip.7zip --location $softwaredrive":\WINGET\Utilities\7zip"
winget install -e --id CPUID.CPU-Z --location $softwaredrive":\WINGET\Utilities\CPU-Z"
winget install -e --id TechPowerUp.GPU-Z --location $softwaredrive":\WINGET\Utilities\GPU-Z"
winget install -e --id Piriform.Defraggler --location $softwaredrive":\WINGET\Utilities\Defraggler"
winget install -e --id CrystalDewWorld.CrystalDiskInfo --location $softwaredrive":\WINGET\Utilities\CrystalDiskInfo"
winget install -e --id CrystalDewWorld.CrystalDiskMark --location $softwaredrive":\WINGET\Utilities\CrystalDiskMark"
winget install -e --id qBittorrent.qBittorrent --location $softwaredrive":\WINGET\Utilities\qBittorrent"
winget install -e --id pavlobu.deskreen --location $softwaredrive":\WINGET\Utilities\Deskreen"

winget install -e --id BlenderFoundation.Blender --location $softwaredrive":\WINGET\CAD\Blender"
winget install -e --id OpenSCAD.OpenSCAD --location $softwaredrive":\WINGET\CAD\OpenSCAD"
winget install -e --id FreeCAD.FreeCAD --location $softwaredrive":\WINGET\CAD\FreeCAD"
winget install -e --id Prusa3D.PrusaSlicer --location $softwaredrive":\WINGET\CAD\PrusaSlicer"
winget install -e --id eTeks.SweetHome3D --location $softwaredrive":\WINGET\CAD\SweetHome3D"
winget install -e --id TinyCAD.TinyCAD --location $softwaredrive":\WINGET\CAD\TinyCAD"
winget install -e --id CircuitDiagram.CircuitDiagram --location $softwaredrive":\WINGET\CAD\CircuitDiagram"

winget install -e --id Overwolf.CurseForge --location $videogamesdrive":\Platforms\CurseForge"
winget install -e --id GOG.Galaxy --location $videogamesdrive":\Platforms\GOG"
winget install -e --id Valve.Steam --location $videogamesdrive":\Platforms\Steam"
winget install -e --id EpicGames.EpicGamesLauncher --location $videogamesdrive":\Platforms\Epic"
winget install -e --id ElectronicArts.EADesktop --location $videogamesdrive":\Platforms\EA"
winget install -e --id Discord.Discord --location $videogamesdrive":\Communication\Discord"
winget install -e --id Mojang.MinecraftLauncher --location $videogamesdrive":\Minecraft"
winget install -e --id ZeroTier.ZeroTierOne --location $videogamesdrive":\Utilities\ZeroTier"
winget install -e --id Playnite.Playnite --location $videogamesdrive":\Platforms\Playnite"

winget install -e --id Zoom.Zoom --location $softwaredrive":\WINGET\Communication\Zoom"
winget install -e --id OpenWhisperSystems.Signal --location $softwaredrive":\WINGET\Communication\Signal"

winget install -e --id Google.Chrome --location $softwaredrive":\WINGET\Browsers\Chrome"
winget install -e --id Mozilla.Firefox --location $softwaredrive":\WINGET\Browsers\Firefox"

winget install -e --id Nvidia.GeForceExperience --location $softwaredrive":\WINGET\Drivers\Nvidia"

$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip",$videogamesdrive":\temp\steamcmd.zip")
Expand-Archive -LiteralPath $videogamesdrive":\temp\steamcmd.zip" -DestinationPath $videogamesdrive":\Platforms\SteamCMD"
Remove-Item -LiteralPath $videogamesdrive":\temp\steamcmd.zip"

# Docker Configuration
wsl --install
wsl --shutdown
wsl --export docker-desktop-data softwaredrive":\temp\docker-desktop-data.tar"
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data $softwaredrive":\WINGET\Development\Docker\WSL_Data" docker-desktop-data.tar --version 2
Remove-Item -LiteralPath $softwaredrive":\temp\docker-desktop-data.tar"

# VS Configuration
dotnet tool install --global dotnet-ef

Write-Host "Installation complete. Remember to manually install FreeFileSync and Equalizer APO."
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

return 0
