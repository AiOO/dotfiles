#!/bin/bash
cp wezterm.lua ~/.wezterm.lua
cp gitconfig ~/.gitconfig
cp gitignore ~/.gitignore
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp p10k.zsh ~/.p10k.zsh
vim \
    +'PlugInstall' \
    +'CocInstall coc-tsserver' \
    +'CocInstall coc-diagnostic' \
    +'CocInstall coc-eslint' \
    +'CocInstall coc-jedi' \
    +'CocInstall coc-json' \
    +'CocInstall coc-prettier' \
    +'qa'
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/
