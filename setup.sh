ssh-keygen -t ed25519 -C "andresmichelrodriguez@gmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
read -p 'https://github.com/settings/ssh/new'

sudo apt-get install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
git config --global user.name "Andres Rodriguez"
git config --global user.email "andresmichelrodriguez@gmail.com"
git config --global core.editor vim
git config --global init.defaultBranch main

User=`/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -C whoami`
User=${User##*\\}
User=${User:0:${#User}-1}

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone git@github.com:Dosx001/Configuration-Files.git
cd Configuration-Files
cp -r vim/.vimrc vim/.vim bash/.bashrc ~
cp windows_terminal/settings.json /mnt/c/`echo $User`/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState
vim ~/.vimrc "+PlugInstall | q | q"

mkdir ~/.aliasme
curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh
cp aliasme/cmd ~/.aliasme

sudo apt install make
sudo apt install cmake
sudo apt install firefox
sudo apt install yui-compressor
sudo apt install node-typescript
sudo apt install firefox-geckodriver
py=`python3 -V`
sudo apt-get install python`echo ${py:7:3}`-tk

sudo apt-get install python3-pip
pip3 install numpy
pip3 install matplotlib
pip3 install -U selenium

sudo apt install npm
sudo npm install -g sass
sudo npm install -g terser
sudo npm install -g live-server

sudo apt-get install libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make

cd /mnt/c/Users/`echo $User`/Downloads
wget https://justgetflux.com/flux-setup.exe
wget https://wifimouse.necta.us/apk/MouseServer.exe
wget https://downloadmirror.intel.com/29183/eng/XTUSetup.exe
wget https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
wget https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9002/DiscordSetup.exe
wget https://github.com/White-Tiger/T-Clock/releases/download/v2.1.0%2357/T-Clock.zip
wget https://mirrors.syringanetworks.net/videolan/vlc/3.0.16/win32/vlc-3.0.16-win32.exe
wget https://www.libreoffice.org/donate/dl/win-x86_64/7.0.6/en-US/LibreOffice_7.0.6_Win_x64.msi
wget https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.0.0/TaskbarX_1.7.0.0_x64.zip
wget https://www.gskill.com/gskill-device/keyboard/G.SKILL_RIPJAWSKeyboard_KM780_MX_Setup_V2.03.zip
wget https://cfhcable.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.9.0/vcxsrv-64.1.20.9.0.installer.exe
wget https://az764295.vo.msecnd.net/stable/2d23c42a936db1c7b3b06f918cde29561cc47cd6/VSCodeUserSetup-x64-1.58.0.exe
wget https://phoenixnap.dl.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.6/qbittorrent_4.3.6_setup.exe
wget https://genshinimpact.mihoyo.com/client_app/launcher/20210609_faac20994b76230c/GenshinImpact_install_mihoyo_20210525204658.exe

cd /mnt/d/Repositories || cd /mnt/c/Repositories
git clone https://github.com/sgolovine/nerdfont-patcher.git
cd nerdfont-patcher
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install fontforge
fontforge -script font-patcher /mnt/c/Windows/Fonts/consola.ttf -c
/mnt/c/Windows/explorer.exe .
