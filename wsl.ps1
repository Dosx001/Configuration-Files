dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wget https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -O wsl_update_x64.msi
./wsl_update_x64.msi /quiet
wsl --set-default-version 2
$wsl = wsl -l -v
if ($wsl[2][57] -eq "1") {
    wsl.exe --set-version Ubuntu 2
}

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y microsoft-windows-terminal
choco install -y vlc
choco install -y f.lux
choco install -y vcxsrv
choco install -y vscode
choco install -y discord
choco install -y qbittorrent
choco install -y steam-client
choco install -y libreoffice-fresh
