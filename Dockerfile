FROM ubuntu:18.04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

ENV USER yfujii01
ENV HOME /home/$USER

# ===================================================
# rootでの設定
# ===================================================
RUN useradd --create-home --shell /bin/bash $USER
ADD .ssh $HOME/.ssh
RUN chmod 600 $HOME/.ssh/config
RUN chmod 600 $HOME/.ssh/id_rsa
RUN chown $USER:$USER $HOME/.ssh/config
RUN chown $USER:$USER $HOME/.ssh/id_rsa

RUN apt update
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y zip
RUN apt install -y git
RUN apt install -y vim
RUN apt install -y sudo

# golang
RUN apt install -y golang-go

# ===================================================
# 一般ユーザーでの設定
# ===================================================
USER $USER
WORKDIR $HOME

# ghq
RUN go get github.com/motemen/ghq
# RUN echo 'export PATH="$PATH:$HOME/go/bin"'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

ENV LANG=ja_JP.UTF-8

# dotfiles(vim)
RUN $HOME/go/bin/ghq get -p yfujii01/setting_vim
# RUN cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_vim) && . deploy.sh
RUN bash $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_vim)/deploy.sh
# RUN dir=`$($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_vim)` \
# 	cd $dir 
# 	# . deploy.sh

# # dotfiles(bash)
# RUN $HOME/go/bin/ghq get -p yfujii01/setting_bash
# RUN cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_bash)
# RUN . deploy.sh

# # dotfiles(git)
# RUN $HOME/go/bin/ghq get -p yfujii01/setting_git
# RUN cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_git)
# RUN . deploy.sh

# # anyenv
# RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv
# RUN . $HOME/.bash_profile

# RUN exec $SHELL -l


CMD tail -f /dev/null
