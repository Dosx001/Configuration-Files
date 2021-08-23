# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

alias winhome='cd /mnt/c/Users/Dosx001/'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/home/dosx/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/mnt/c/Users/Dosx001/AppData/Local/Programs/"Microsoft VS Code"/bin

#if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#    GIT_PROMPT_ONLY_IN_REPO=1
#    source $HOME/.bash-git-prompt/gitprompt.sh
#fi

#bash_tips() {
#    echo -e "\e[00m\$(~/bash_tips_generator.sh)"
#}

Date() {
    echo -e "\e[33m`date '+%a %b %d, %Y'`"
}

gitStatus() {
    #echo -e "\e[31m$(git status --short 2> /dev/null | sed ':a;N;$!ba;s/\n/ /g')"
    set -o noglob
    status=$(git status -s 2> /dev/null)
    if [ -n "$status" ]
    then
        echo
        for item in ${status}
        do
            case $item in
                "??")
                    echo -en "\e[37m";;
                "D")
                    Type="D";;
                "M")
                    Type="M";;
                "MM")
                    echo -en "\e[93m";;
                "MD")
                    echo -en "\e[38;5;202m";;
                "A")
                    echo -en "\e[34m";;
                "AM")
                    echo -en "\e[94m";;
                "AD")
                    echo -en "\e[96m";;
                "R")
                    echo -en "\e[35m";;
                "RM")
                    echo -en "\e[38;5;93m";;
                "RD")
                    echo -en "\e[38;5;201m";;
                "UU")
                    echo -en "\e[30;43m"
                    merge=true;;
                "AA")
                    echo -en "\e[30;42m"
                    merge=true;;
                "AU")
                    echo -en "\e[37;42m"
                    merge=true;;
                "UA")
                    echo -en "\e[96;42m"
                    merge=true;;
                "DD")
                    echo -en "\e[30;41m"
                    merge=true;;
                "DU")
                    echo -en "\e[37;41m"
                    merge=true;;
                "UD")
                    echo -en "\e[96;41m"
                    merge=true;;
                *)
                    case $Type in
                        "M")
                            if [[ "$(git status -s $item)" =~ "  " ]]
                            then
                                echo -en "\e[32m"
                            else
                                echo -en "\e[33m"
                            fi;;
                        "D")
                            if [[ "$(git status -s $item)" =~ "  " ]]
                            then
                                echo -en "\e[91m"
                            else
                                echo -en "\e[31m"
                            fi;;
                    esac
                    Type=""
                    if [[ $merge ]]
                    then
                        echo -en $item"\e[00m "
                        merge=false
                    else
                        echo -n $item" "
                    fi
            esac
        done
    fi
}

gitBranch() {
    branch=$(git branch --show-current 2> /dev/null)
    if [ -n "$branch" ]
    then
        echo -e "\e[34;41m\e[30;41m$branch\e[00m\e[31m"
    else
        echo -e "\e[00m\e[34m"
    fi
}

gitStash() {
    stash=$(git stash list 2> /dev/null | wc -l)
    if [[ $stash -gt 0 ]]
    then
        echo -e "\e[35mStashes: $stash"
    fi
}

gitLastLog() {
    commit=$(git log -1 --pretty=format:"%s" 2> /dev/null)
    if [ -n "$commit" ]
    then
        echo -e "\n\e[90m$commit"
    fi
}

position() {
    tput cup $LINES
}

export PS1="\[\e[92m\]\u@\h \$(Date) \$(gitStash)\$(gitLastLog)\$(gitStatus)\n\[\e[32;44m\]\W\$(gitBranch)\[\e[00m\]"
export VISUAL=vim
export EDITOR="$VISUAL"
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
source ~/.aliasme/aliasme.sh
alias Fire="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
alias Explorer="/mnt/c/Windows/explorer.exe ."
alias Server="live-server --no-browser --port=8000"
alias Powershell="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
alias VcXsrv="Powershell -C 'D:\Repositories\Configuration-Files\VcXsrv\config.xlaunch' &"
alias Kill="Powershell -C 'Stop-Process -name vcxsrv'"
alias Restart="Kill; VcXsrv"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dosx/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dosx/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dosx/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dosx/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

