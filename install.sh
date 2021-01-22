#!/bin/bash
cp gitconfig ~/.gitconfig
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
vim \
    +'PlugInstall' \
    +'CocInstall coc-tsserver' \
    +'CocInstall coc-diagnostic' \
    +'CocInstall coc-eslint' \
    +'CocInstall coc-jedi' \
    +'CocInstall coc-json' \
    +'qa'
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/
