#!/bin/bash
cp ~/.bashrc bash
cp ~/.tmux.conf tmux
cp ~/.zshrc zsh
cp ~/rc.sh .
cp ~/.gitconfig ~/.gitignore_global git
git submodule update --remote
cp /mnt/c/Users/Dosx001/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json windows_terminal 2> /dev/null
