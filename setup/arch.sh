#!/bin/bash
rm .setup.sh.swp
pacman-key --init
pacman-key --populate
useradd -m -G wheel dosx
passwd dosx
set -i 's/%wheel ALL=(ALL) ALL/root ALL=(ALL) ALL' /etc/sudoers
sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm github-cli
gh auth login
read -p 'SSH key Name? ' title
ssh-keygen.exe -t ed25519 -C "andresmichelrodriguez@gmail.com"
mv /mnt/c/Users/Dosx001/.ssh ~
ssh-add.exe ~/.ssh/id_ed25519
gh ssh-key add id_ed25519.pub --title $title

packs=(
    firefox
    python3
    git
    cmake
    make
    gcc
    tmux
    npm
    zsh
    python-pip
    geckodriver
    go
    expect
    gtest
    tk
    )
sudo pacman -S --noconfirm ${packs[@]}

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
cd ../
rm -rf paru
makepkg -si

paru -S --noconfirm yuicompressor

_path=`pwd`
./setup/setup.sh
cd _path
cp pacman/pacman.conf pacman/paru.conf /etc/
