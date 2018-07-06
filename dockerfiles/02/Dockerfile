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
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y zip
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y sudo
RUN apt-get install -y zsh
RUN apt-get install -y fish
RUN apt-get install -y locales

# ENV LANG=ja_JP.UTF-8
# ENV LANG=C
ENV TERM=xterm-256color
RUN locale-gen en_US.UTF-8

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

# golang(たまにdownloadでコケるが再実行で通る)
RUN /bin/bash -l -c 'anyenv install goenv'
RUN /bin/bash -l -c 'goenv install 1.10.3'
RUN /bin/bash -l -c 'goenv global  1.10.3'

# ## nodejs
# RUN /bin/bash -l -c 'anyenv install nodenv'
# RUN /bin/bash -l -c 'nodenv install 10.5.0'
# RUN /bin/bash -l -c 'nodenv global  10.5.0'

# ## ruby
# RUN apt-get install -y gcc
# RUN apt-get install -y make
# RUN apt-get install -y libssl-dev
# RUN apt-get install -y libreadline-dev
# RUN apt-get install -y zlib1g-dev
# RUN /bin/bash -l -c 'anyenv install rbenv'
# RUN /bin/bash -l -c 'rbenv install 2.5.1'
# RUN /bin/bash -l -c 'rbenv global  2.5.1'

# ## python
# RUN apt-get install -y build-essential
# RUN apt-get install -y python-dev
# RUN apt-get install -y python-setuptools
# RUN apt-get install -y python-pip
# RUN apt-get install -y python-smbus
# RUN apt-get install -y libncursesw5-dev
# RUN apt-get install -y libgdbm-dev
# RUN apt-get install -y libc6-dev
# RUN apt-get install -y zlib1g-dev libsqlite3-dev
# RUN apt-get install -y libssl-dev openssl
# RUN apt-get install -y libffi-dev
# RUN /bin/bash -l -c 'anyenv install pyenv'
# RUN /bin/bash -l -c 'pyenv install 3.7.0'
# RUN /bin/bash -l -c 'pyenv global  3.7.0'

# ghq
RUN /bin/bash -l -c 'go get github.com/motemen/ghq'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

# ag(The Silver Searcher)
RUN apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
RUN apt-get install -y clang-format
RUN git clone https://github.com/ggreer/the_silver_searcher $HOME/.tools/the_silver_searcher
RUN LANG=en_US.UTF-8 && cd $HOME/.tools/the_silver_searcher && ./build.sh && make install

# dotfile
RUN git clone git@github.com:yfujii01/dotfiles.git $HOME/dotfiles
RUN /bin/bash ${HOME}/dotfiles/deploy.bash


CMD tail -f /dev/null
