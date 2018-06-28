FROM ubuntu:18.04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

ENV USER yfujii01
ENV HOME /home/$USER

# ===================================================
# rootでの設定
# ===================================================
RUN useradd --create-home --shell /bin/bash $USER
ADD .ssh $HOME/.ssh
RUN chmod 600 $HOME/.ssh/* && chown $USER:$USER $HOME/.ssh/*

RUN apt-get update \
	&& apt-get install -y curl wget zip git vim sudo
	#&& apt-get install -y curl wget zip git vim sudo golang-go

ENV LANG=ja_JP.UTF-8
ENV LANG=C

# ===================================================
# 一般ユーザーでの設定
# ===================================================
USER $USER
WORKDIR $HOME

COPY . $HOME

## ghq
#RUN go get github.com/motemen/ghq
#
## fzf
#RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf \
#	&& $HOME/.fzf/install --all
#
## anyenv
#RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv
#
#RUN curl -L https://raw.github.com/yfujii01/dotfiles/master/dotfiles.sh > $HOME/dotfiles.sh \
#	&& sh $HOME/dotfiles.sh
#
## nodejs
#RUN bash $HOME/.bashPathInit.bash \
#	&& anyenv install nodenv \
#	&& bash $HOME/.bashPathInit.bash \
#	&& nodenv install 10.5.0 \
#	&& nodenv global 10.5.0


CMD tail -f /dev/null
