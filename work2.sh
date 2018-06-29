#!/bin/bash

# load golang path
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# ghq
go get github.com/motemen/ghq

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all
source $HOME/.fzf.bash

# dotfile
curl -L https://raw.github.com/yfujii01/dotfiles/master/dotfiles.sh > ~/dotfiles.sh
sh $HOME/dotfiles.sh

