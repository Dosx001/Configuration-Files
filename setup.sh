sudo apt-get install git
add-apt-repository ppa:git-core/ppa
apt update
apt install git
git config --global user.name "Andres Rodriguez"
git config --global user.email "andresmichelrodriguez@gmail.com"
git config --global core.editor vim
git config --global init.defaultBranch main

git clone git@github.com:Dosx001/Configuration-Files.git
cd Configuration-Files
cp -r vim/.vimrc .vim/after bash/.bashrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim ~/.vimrc "+PlugInstall | q | q"

mkdir ~/.aliasme
curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh
cp aliasme/cmd ~/.aliasme

sudo apt install node-typescript
sudo apt install yui-compressor

sudo apt-get install python3-pip
pip3 install matplotlib
pip3 install numpy

sudo apt install npm
sudo npm install -g sass
sudo npm install terser -g

sudo apt-get install libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make

mkdir /mnt/c/download
cd /mnt/c/download
wget https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
wget https://justgetflux.com/flux-setup.exe
wget https://phoenixnap.dl.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.6/qbittorrent_4.3.6_setup.exe
wget https://mirrors.syringanetworks.net/videolan/vlc/3.0.16/win32/vlc-3.0.16-win32.exe
wget https://cfhcable.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.9.0/vcxsrv-64.1.20.9.0.installer.exe
wget https://downloadmirror.intel.com/29183/eng/XTUSetup.exe
wget https://wifimouse.necta.us/apk/MouseServer.exe
wget https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9002/DiscordSetup.exe
wget https://az764295.vo.msecnd.net/stable/2d23c42a936db1c7b3b06f918cde29561cc47cd6/VSCodeUserSetup-x64-1.58.0.exe
wget https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.0.0/TaskbarX_1.7.0.0_x64.zip
wget https://github.com/White-Tiger/T-Clock/releases/download/v2.1.0%2357/T-Clock.zip
wget https://genshinimpact.mihoyo.com/client_app/launcher/20210609_faac20994b76230c/GenshinImpact_install_mihoyo_20210525204658.exe

al origin
git clone https://github.com/sgolovine/nerdfont-patcher.git
cd nerdfont-patcher
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install fontforge
fontforge -script font-patcher /mnt/c/Windows/Fonts/consola.ttf -c
Explorer

ssh-keygen -t ed25519 -C "andresmichelrodriguez@gmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub