wsl --install
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# wget https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -O wsl_update_x64.msi
# ./wsl_update_x64.msi /quiet
# wsl --set-default-version 2
# $wsl = wsl -l -v
# if ($wsl[2][57] -eq "1") {
#     wsl.exe --set-version Ubuntu 2
# }

winget install --id Microsoft.WindowsTerminal
wget https://raw.githubusercontent.com/Dosx001/Configuration-Files/main/windows_terminal/settings.json -O settings.json
mv settings.json windows_terminal/settings.json /mnt/c/Users/$env:UserName/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState
wget https://github.com/yuk7/ArchWSL/releases/download/21.8.28.0/Arch.zip -O Arch.zip
Expand-Archive Arch.zip -DestinationPath Arch

winget install --id VideoLAN.VLC
winget install --id flux.flux
winget install --id marha.VcXsrv
winget install --id Microsoft.VisualStudioCode
winget install --id Discord.Discord
winget install --id qBittorrent.qBittorrent
winget install --id Valve.Steam
winget install --id TheDocumentFoundation.LibreOffice
winget install --id VividDesigns.WifiMouseServer

wget https://downloadmirror.intel.com/29183/eng/XTUSetup.exe -O XTUSetup.exe
wget https://github.com/White-Tiger/T-Clock/releases/download/v2.4.4%23492-rc/T-Clock.zip -O T-Clock.zip
wget https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.0.0/TaskbarX_1.7.0.0_x64.zip -O TaskbarX.zip
wget https://www.gskill.com/gskill-device/keyboard/G.SKILL_RIPJAWSKeyboard_KM780_MX_Setup_V2.03.zip -O Gskill.zip
