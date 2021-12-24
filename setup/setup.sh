#!/bin/bash
cd ../
cd C++ || mkdir C++ && cd C++
git clone git@github.com:Dosx001/GitPrompt.git
cd GitPrompt
cmake CMakeLists.txt
make
cp bin/GitPrompt.exe ~

cd ../../
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone git@github.com:Dosx001/Configuration-Files.git
cd Configuration-Files
files=(
    vim/.vimrc
    vim/.vim
    zsh/.zshrc
    bash/.bashrc
    rc.sh
    git/.gitconfig
    git/.gitignore_global
    tmux/.tmux.conf
    )
cp -r ${files[@]} ~
vim ~/.vimrc "+PlugInstall | q | q"

curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh
cp aliasme/cmd ~/.aliasme

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
chsh -s /bin/zsh

sudo gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh

packs=(
    numpy
    matplotlib
    selenium
)
pip3 install ${packs[@]} || pip install ${packs[@]}

packs=(
    sass
    terser
    live-server
    typescript
)
sudo npm install -yg ${packs[@]}
