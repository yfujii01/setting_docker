FROM ubuntu:18.04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

ENV USER yfujii01
ENV HOME /home/$USER
RUN useradd --create-home --shell /bin/bash $USER

#ENV USER root
#ENV HOME /root

# ===================================================
# rootでの設定
# ===================================================

COPY . $HOME
RUN chown -R $USER:$USER $HOME/.ssh && chmod -R 700 $HOME/.ssh

RUN apt-get update && apt-get install -y curl wget zip git vim sudo

ENV LANG=ja_JP.UTF-8
ENV LANG=C

# ===================================================
# 一般ユーザーでの設定
# ===================================================
USER $USER
WORKDIR $HOME


# anyenvのインストール＋各言語のインストール
RUN bash $HOME/work1.sh
RUN bash $HOME/work2.sh


CMD tail -f /dev/null
