#!/bin/bash
cp ./.vimrc ~/
cd 
git clone https://github.com/tomasr/molokai.git
if [ -d $HOME/.vim ]
then
    if [ -d $HOME/.vim/colors ]
    then
        cp molokai/colors/molokai.vim $HOME/.vim/colors/
    else
        mkdir colors
        cp molokai/colors/molokai.vim $HOME/.vim/colors/
    fi
else
    mkdir -p $HOME/.vim/colors
    cp molokai/colors/molokai.vim $HOME/.vim/colors/
fi
