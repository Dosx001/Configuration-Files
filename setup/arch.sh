#!/bin/bash
rm .setup.sh.swp
pacman-key --init
pacman-key --populate
useradd -m -G wheel dosx
passwd dosx
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm github-cli
gh auth login
read -rp 'SSH key Name? ' title
ssh-keygen.exe -t ed25519 -C "andresmichelrodriguez@gmail.com"
mv /mnt/c/Users/Dosx001/.ssh ~
ssh-add.exe ~/.ssh/id_ed25519
gh ssh-key add id_ed25519.pub --title "$title"

packs=(
  # openssh
	cmake
	dart-sass
	expect
	firefox
	gcc
	geckodriver
	git
	go
	gtest
	make
	npm
	python-pip
	python3
	tk
	tmux
	typescript
	typescript-language-server
	xsel
	zsh
  clang
  eslint
  flake8
  lua-language-server
  neovim
  prettier
  pyright
  python-black
  python-isort
  python-pylint
  rust-analyzer
  shellcheck
  shfmt
  yarn
)
sudo pacman -S --noconfirm "${packs[@]}"

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru || exit
cd ../
rm -rf paru
makepkg -si

packs=(
  eslint_d
  nodejs-live-server
  vscode-langservers-extracted
  yuicompressor
)
paru -S --noconfirm "${packs[@]}"

_path=$(pwd)
./setup/setup.sh
cd _path || exit
cp pacman/pacman.conf pacman/paru.conf /etc/
