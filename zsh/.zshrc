autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors '=(#b)*(-- *)=32=31' '=*=32'
zmodload zsh/complist
compinit -i
_comp_options+=(globdots)

HISTFILE=~/.histfile
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt correct_all

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
source ~/.zsh/yarn-completion/yarn-completion.plugin.zsh

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

