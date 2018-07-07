FROM pc06

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

RUN cd $HOME/dotfiles && git pull
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

## python
RUN apt-get install -y build-essential
RUN apt-get install -y python-dev
RUN apt-get install -y python-setuptools
RUN apt-get install -y python-pip
RUN apt-get install -y python-smbus
RUN apt-get install -y libncursesw5-dev
RUN apt-get install -y libgdbm-dev
RUN apt-get install -y libc6-dev
RUN apt-get install -y zlib1g-dev libsqlite3-dev
RUN apt-get install -y libssl-dev openssl
RUN apt-get install -y libffi-dev
RUN /bin/bash -l -c 'anyenv install pyenv'
RUN /bin/bash -l -c 'pyenv install 3.7.0'
RUN /bin/bash -l -c 'pyenv global  3.7.0'

RUN cd $HOME/dotfiles && git checkout .
