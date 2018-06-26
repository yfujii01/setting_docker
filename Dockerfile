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

RUN apt update \
	&& apt install -y curl \
	&& apt install -y wget \
	&& apt install -y zip \
	&& apt install -y git \
	&& apt install -y vim \
	&& apt install -y sudo \
	&& apt install -y golang-go

# ===================================================
# 一般ユーザーでの設定
# ===================================================
USER $USER
WORKDIR $HOME
ENV LANG=ja_JP.UTF-8

# ghq
RUN go get github.com/motemen/ghq

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf \
	&& $HOME/.fzf/install --all

# anyenv
RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv

# dotfiles(vim)
RUN $HOME/go/bin/ghq get -p yfujii01/setting_vim \
	&& cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_vim) \
	&& bash deploy.sh

# dotfiles(bash)
RUN $HOME/go/bin/ghq get -p yfujii01/setting_bash \
	&& cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_bash) \
	&& git checkout -b mac origin/mac \
	&& bash deploy.sh

# dotfiles(git)
RUN $HOME/go/bin/ghq get -p yfujii01/setting_git \
	&& cd $($HOME/go/bin/ghq root)/$($HOME/go/bin/ghq list | grep yfujii01/setting_git) \
	&& bash deploy.sh

RUN . $HOME/.bashPathInit.bash \
	&& anyenv install nodenv \
	&& . $HOME/.bashPathInit.bash \
	&& nodenv install 10.5.0 \
	&& nodenv global 10.5.0


CMD tail -f /dev/null
