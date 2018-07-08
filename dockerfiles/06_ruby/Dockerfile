FROM pc05

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

RUN cd $HOME/dotfiles && git pull
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

## ruby
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y libssl-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y zlib1g-dev
RUN /bin/bash -l -c 'anyenv install rbenv'
RUN /bin/bash -l -c 'rbenv install 2.5.1'
RUN /bin/bash -l -c 'rbenv global  2.5.1'

RUN cd $HOME/dotfiles && git checkout .
