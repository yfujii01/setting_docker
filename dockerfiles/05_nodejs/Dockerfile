FROM pc04

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

RUN cd $HOME/dotfiles && git pull
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

## nodejs
RUN /bin/bash -l -c 'anyenv install nodenv'
RUN /bin/bash -l -c 'nodenv install 10.5.0'
RUN /bin/bash -l -c 'nodenv global  10.5.0'

RUN cd $HOME/dotfiles && git checkout .
