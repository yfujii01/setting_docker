FROM ubuntu:18.04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

#ENV USER yfujii01
#ENV HOME /home/$USER
#RUN useradd --create-home --shell /bin/bash $USER

ENV USER root
ENV HOME /root

# ===================================================
# rootでの設定
# ===================================================
# curl            - must
# wget            - must
# zip             - must
# git             - must
# vim             - text editor
# sudo            - 
# zsh             - 
# gcc             - for ruby install
# make            - for ruby install
# libssl-dev      - for ruby install
# libreadline-dev - for ruby install
# zlib1g-dev      - for ruby install
RUN apt-get update \
 && apt-get install -y \
    curl \
    wget \
    zip \
    git \
    vim \
    sudo \
    zsh \
    gcc \
    make \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev

ENV LANG=ja_JP.UTF-8
ENV LANG=C
ENV TERM=xterm-256color

COPY . $HOME
RUN chown -R $USER:$USER $HOME/.ssh && chmod -R 700 $HOME/.ssh

# ===================================================
# 一般ユーザーでの設定
# ===================================================
USER $USER
WORKDIR $HOME

# 使用するshellをzshにする
#ENV SHELL=/bin/zsh

# anyenv
RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

# golang-go
RUN /bin/bash -l -c 'anyenv install goenv'
RUN /bin/bash -l -c 'goenv install 1.10.3'
RUN /bin/bash -l -c 'goenv global 1.10.3'

## nodejs
RUN /bin/bash -l -c 'anyenv install nodenv'
RUN /bin/bash -l -c 'nodenv install 10.5.0'

RUN /bin/bash -l -c 'anyenv install rbenv'
RUN /bin/bash -l -c 'rbenv install 2.5.1'


# ghq
RUN /bin/bash -l -c 'go get github.com/motemen/ghq'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

# dotfile
RUN git clone git@github.com:yfujii01/dotfiles.git
RUN /bin/bash ${HOME}/dotfiles/deploy.sh



## anyenvのインストール＋各言語のインストール
#RUN source $HOME/work1.sh
#RUN source $HOME/work2.sh
#RUN source $HOME/work4.sh


