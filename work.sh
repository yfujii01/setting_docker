#!/bin/bash

# anyenv
git clone https://github.com/riywo/anyenv $HOME/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# golang-go
anyenv install goenv
eval "$(anyenv init -)"
goenv install 1.10.3
goenv global 1.10.3

# nodejs
anyenv install nodenv
eval "$(anyenv init -)"
nodenv install 10.5.0
nodenv global 10.5.0

# ghq
go get github.com/motemen/ghq

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install --all

# dotfile
curl -L https://raw.github.com/yfujii01/dotfiles/master/dotfile.sh  && sh $HOME/dotfiles.sh

