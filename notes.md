# WSL
search Features
turn on WSL
install Linux
restart
run setup.sh

# WSL2
Powershell admin
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wget https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
./wsl_update_x64.msi
wsl --set-default-version 2

# VcXsrv
Windows Security
Firewall & network protection
Allow an app through firewall
make sure VcXsrv has both public and private checked
disable access control

# DS
C 34 40 50
