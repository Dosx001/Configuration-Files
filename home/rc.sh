#!/bin/bash
# shellcheck disable=1087,2128,2231,2086,2164,2206,2068,2046
stty -ixon

HISTSIZE=1000
HISTFILESIZE=2000
# SAVEHIST=1000
HISTCONTROL=ignoreboth

# shellcheck disable=1090
source ~/.aliasme/aliasme.sh

Update() {
	Pwd=$(pwd)
	Dirs=$(
		find ~/.tmux/plugins/* ~/.zsh/* -maxdepth 0 -type d
	)
	for i in $Dirs; do
		cd "$i"
		git pull
	done
	cd $Pwd
}

Merge() {
	files=()
	for i in $(git status -s); do
		if [[ -f $i && -n $(git diff --raw $i) ]]; then
			files+=($i)
		fi
	done
	vim ${files[@]} -p
}

Delete() {
	files=()
	chk=false
	for i in $(git status -s); do
		if $chk; then
			files+=($i)
			chk=false
		fi
		if [[ $i == "D" ]]; then chk=true; fi
	done
	git restore ${files[@]}
}

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ds4="echo 0 | sudo tee find /sys/class/leds/*global/brightness"

alias ff='cd $(fd -t d | sk)'
alias fh='cd $(fd -Ht d | sk)'
alias fz='cd $(fd -t d . "/home/" | sk)'
alias fzh='cd $(fd -Ht d . "/home/" | sk)'

alias p="python3"
# alias vi="\vim"
alias vim="nvim"

alias Server="live-server --no-browser --port=8000"
alias fuck='sudo $(fc -ln -1)'
alias Pwd='al add $(basename $PWD) "cd $(pwd)"'
alias Branch='git push --set-upstream origin $(git branch --show-current)'
alias Date='GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"'

if [[ -e /etc/wsl ]]; then
	DISPLAY=$(grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0.0
	alias Fire="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
	alias Explorer="/mnt/c/Windows/explorer.exe ."
	alias code="/mnt/e/Users/Dosx001/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
	alias Powershell="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
	alias VcXsrv="Powershell -C 'D:\Repositories\Configuration-Files\VcXsrv\config.xlaunch' &"
	alias Kill="Powershell -C 'Stop-Process -name vcxsrv'"
	alias Restart="Kill; VcXsrv"
fi
