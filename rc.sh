#!/bin/bash
# shellcheck disable=2086,2164
stty -ixon
if [[ -e /etc/wsl.conf ]]; then
	export DISPLAY=$(grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0.0
fi

HISTSIZE=1000
HISTFILESIZE=2000
SAVEHIST=1000
HISTCONTROL=ignoreboth

# shellcheck disable=1090
source ~/.aliasme/aliasme.sh

Update() {
	Pwd=$(pwd)
	Dirs=$(
		ls -d ~/.tmux/plugins/*
		ls -d ~/.zsh/*
	)
	for i in $Dirs[@]; do
		cd $i
		git pull
	done
	cd $Pwd
}

Dot() {
	cp ~/.prettierrc .
	eslint --init
	yarn add --dev eslint-config-prettier eslint-plugin-prettier
}

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias p="python3"
alias vi="\vim"
alias vim="nvim"

alias fuck='sudo $(fc -ln -1)'
alias Server="live-server --no-browser --port=8000"
alias neglect='paru -Sy archlinux-keyring && paru -Su'

alias Fire="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
alias Explorer="/mnt/c/Windows/explorer.exe ."
alias code="/mnt/e/Users/Dosx001/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
alias Powershell="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
alias VcXsrv="Powershell -C 'D:\Repositories\Configuration-Files\VcXsrv\config.xlaunch' &"
alias Kill="Powershell -C 'Stop-Process -name vcxsrv'"
alias Restart="Kill; VcXsrv"
