#!/bin/bash
rm .setup.sh.swp
pacman-key --init
pacman-key --populate
useradd -mg wheel dosx
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
	# tk
	bluez
	bluez-utils
	clang
	cmake
	cppcheck
	dart-sass
	eslint
	expect
	firefox
	flake8
	gcc
	geckodriver
	git
	go
	gtest
	lua-language-server
	lutris
	make
	mpv
	neovim
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	npm
	polkit
	prettier
	pyright
	python-black
	python-debugpy
	python-isort
	python-pip
	python-pylint
	python3
	qbittorrent
	redshift
	ripgrep
	rust-analyzer
	selene-linter
	shellcheck
	shfmt
	steam
	stylua
	tmux
	typescript
	typescript-language-server
	wine
	xclip
	xdotool
	xf86-video-amdgpu
	xsel
	yarn
	zsh
)
sudo pacman -S --noconfirm "${packs[@]}"

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
cd ../
rm -rf paru

packs=(
	eslint_d
	nodejs-markdownlint-cli
	nodejs-live-server
	nodejs-n
	vscode-langservers-extracted
	yuicompressor
)
paru -S --noconfirm "${packs[@]}"

_path=$(pwd)
./setup/setup.sh
cd _path || exit
cp pacman/pacman.conf pacman/paru.conf /etc/
