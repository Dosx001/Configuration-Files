#!/bin/bash
rm .setup.sh.swp
ssh-keygen -t ed25519 -C "andresmichelrodriguez@gmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
read -p 'https://github.com/settings/ssh/new'

sudo apt-get install -y git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git

sudo apt install -y make
sudo apt install -y cmake
cd /mnt/d || cd /mnt/c
cd Repositories || mkdir Repositories && cd Repositories
git clone git@github.com:Dosx001/GitPrompt.git
cd GitPrompt
cmake CMakeLists.txt
make
cp bin/GitPrompt.exe ~

cd ../
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone git@github.com:Dosx001/Configuration-Files.git
cd Configuration-Files
cp -r vim/.vimrc vim/.vim zsh/.zshrc bash/.bashrc aliasrc.sh git/.gitconfig git/.gitignore_global ~
vim ~/.vimrc "+PlugInstall | q | q"

mkdir ~/.aliasme
curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh
cp aliasme/cmd ~/.aliasme

sudo apt install -y zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
sudo chsh -s /bin/zsh
sudo apt install gh
if [[ ! `which gh` ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt install gh
fi
gh completion -s zsh > _gh
sudo mv _gh /usr/local/share/zsh/site-functions/

sudo apt install -y expect
sudo apt install -y firefox
sudo apt install -y libgbm-dev # wsl electron
sudo apt install -y yui-compressor
sudo apt install -y node-typescript
sudo apt install -y firefox-geckodriver
py=`python3 -V`
sudo apt-get install -y python"${py:7:3}"-tk

sudo apt-get install -y python3-pip
pip3 install numpy
pip3 install matplotlib
pip3 install -U selenium

sudo apt install -y npm
sudo npm install -yg sass
sudo npm install -yg terser
sudo npm install -yg live-server

sudo apt-get install -y libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make

cd /mnt/d/Repositories || cd /mnt/c/Repositories
git clone https://github.com/sgolovine/nerdfont-patcher.git
cd nerdfont-patcher
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:fontforge/fontforge
sudo apt-get update -y
sudo apt-get install -y fontforge
fontforge -script font-patcher /mnt/c/Windows/Fonts/consola.ttf -c
/mnt/c/Windows/explorer.exe .
