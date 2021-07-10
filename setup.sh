sudo apt-get install git
git clone git@github.com:Dosx001/Configuration-Files.git
cd Configuration-Files
cp bash/.bashrc ~
cp -r vim/.vimrc .vim/after ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim ~/.vimrc "+PlugInstall | q"

mkdir ~/.aliasme
curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh

sudo apt-get install python3-pip

cd ../
git clone https://github.com/sgolovine/nerdfont-patcher.git
cd nerdfont-patcher
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install fontforge
fontforge -script font-patcher /mnt/c/Windows/Fonts/consola.ttf -c

