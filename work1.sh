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

# ビルドのための依存関係未解決
## python
#anyenv install pyenv
#eval "$(anyenv init -)"
#pyenv install 3.6.5
#pyenv global 3.6.5
#
## ruby
#anyenv install rbenv
#eval "$(anyenv init -)"
#rbenv install 2.5.1
#rbenv global 2.5.1
#

