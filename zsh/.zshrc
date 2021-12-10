autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors '=(#b)*(-- *)=32=31' '=*=32'
zmodload zsh/complist
compinit -i
_comp_options+=(globdots)

HISTFILE=~/.histfile
setopt HIST_SAVE_NO_DUPS

bindkey -v
VISUAL=vi
EDITOR=vi
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[f' forward-word
bindkey '^[ ' autosuggest-execute

_prompt() {
    if [[ -e `git rev-parse --git-dir 2> /dev/null` ]]; then
        echo -n "$fg[green]`whoami`@`cat /proc/sys/kernel/hostname` "
    else
        echo "$fg[green]`whoami`@`cat /proc/sys/kernel/hostname`"
    fi
    ~/GitPrompt.exe
}

autoload -U add-zsh-hook
add-zsh-hook precmd _prompt

autoload -U colors && colors
setopt PROMPT_SUBST
PROMPT="%{$fg[green]$bg[blue]%} %1d %{$reset_color%}%{$fg[blue]%}%{$reset_color%}"

source ~/rc.sh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2> /dev/null
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
