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
