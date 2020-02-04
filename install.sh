#!/bin/bash
cp ./.vimrc ~/
read -p "Which colorscheme do you want to install? (molokai[1]  gruvbox[2]) :" color
if (( $color == 1))
then
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
    cd
    echo ":colorscheme molokai" >> ~/.vimrc

elif (( $color == 2))
then
    cd 
    mkdir -p .vim/pack/default/start/
    git clone https://github.com/morhetz/gruvbox.git .vim/pack/default/start/gruvbox
    cd
    echo ":colorscheme gruvbox" >> ~/.vimrc

else
    echo "Wrong input! Please repeat!"
    exit 1
fi
