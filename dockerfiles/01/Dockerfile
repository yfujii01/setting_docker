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

ENV TERM=xterm-256color
RUN locale-gen en_US.UTF-8

COPY . $HOME
RUN chown -R $USER:$USER $HOME/.ssh && chmod -R 700 $HOME/.ssh

USER $USER
WORKDIR $HOME

# anyenv
RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

# golang(たまにdownloadでコケるが再実行で通る)
RUN /bin/bash -l -c 'anyenv install goenv'
RUN /bin/bash -l -c 'goenv install 1.10.3'
RUN /bin/bash -l -c 'goenv global  1.10.3'

# ghq
RUN /bin/bash -l -c 'go get github.com/motemen/ghq'

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

# dotfile
RUN git clone git@github.com:yfujii01/dotfiles.git $HOME/dotfiles
RUN /bin/bash ${HOME}/dotfiles/deploy.bash


CMD tail -f /dev/null
