# WSL
Powershell admin
```powershell
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Set-ExecutionPolicy RemoteSigned
wget https://raw.githubusercontent.com/Dosx001/Configuration-Files/main/wsl.ps1 -O wsl.ps1
.\wsl.ps1
```

```bash
echo -e '[automount]\noptions = "metadata"' > /etc/wsl.conf
mkdir /mnt/d/Repositories || mkdir /mnt/c/Repositories
```
```bash
sudo pacman -S --noconfirm wget
wget https://github.com/Dosx001/Configuration-Files/blob/main/setup/setup.sh
wget https://github.com/Dosx001/Configuration-Files/blob/main/setup/arch.sh
./arch.sh
```

### Arch
```
%wheel ALL=(ALL) ALL
root ALL=(ALL) ALL
```
```powershell
.\Arch.exe config --default-user dosx
```

# VcXsrv
* Windows Security
* Firewall & network protection
* Allow app through firewall
* make sure VcXsrv has both public and private checked
* disable access control

# DS
|C|34|40|50|
|-|--|--|--|
|S|33|30|25|
|X|67|  |  |
| |50|75|  |

# mouseless
* disable useless shortcuts
* ;alskdjfiewo

# Notes
* Uninstall bloatware
* Disable background apps
* Disable startup apps
