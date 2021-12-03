#!/bin/bash
rm .setup.sh.swp
sudo apt update -y && sudo apt upgrade -y

sudo apt install gh
if [[ ! `which gh` ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt install gh
fi
gh auth login
read -p 'SSH key Name? ' title
ssh-keygen -t ed25519 -C "andresmichelrodriguez@gmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
gh ssh-key add id_ed25519.pub --title $title

py=`python3 -V`
packs=(
    git
    make
    cmake
    zsh
    npm
    expect
    firefox
    libgbm-dev # wsl electron
    yui-compressor
    firefox-geckodriver
    python"${py:7:3}"-tk
    python3-pip
    libgtest-dev
    build-essential # YCM
    vim-nox
    python3-dev
    mono-complete
    golang
    nodejs
    default-jdk
    )
sudo apt-get install -y ${packs[@]}

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt install -y git

pip3 install numpy
pip3 install matplotlib
pip3 install -U selenium

.setup/setup.sh

cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make

cd /mnt/d/Repositories || cd /mnt/c/Repositories
git clone https://github.com/sgolovine/nerdfont-patcher.git
cd nerdfont-patcher
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:fontforge/fontforge
sudo apt-get install -y fontforge
fontforge -script font-patcher /mnt/c/Windows/Fonts/consola.ttf -c
/mnt/c/Windows/explorer.exe .
