FROM ubuntu:18.04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

ENV USER root
ENV HOME /root
ENV TERM=xterm-256color

# apt-getで表示される警告を非表示にする
# ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
# RUN apt-get install -y dialog
# RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y zip
RUN apt-get install -y git
RUN apt-get install -y vim
# RUN apt-get install -y locales

# RUN locale-gen en_US.UTF-8

COPY . $HOME
RUN chown -R $USER:$USER $HOME/.ssh
RUN chmod -R 700 $HOME/.ssh

USER $USER
WORKDIR $HOME

CMD tail -f /dev/null
