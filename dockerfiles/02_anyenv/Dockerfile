FROM pc01

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

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

# dotfile
RUN git clone git@github.com:yfujii01/dotfiles.git $HOME/dotfiles
RUN /bin/bash ${HOME}/dotfiles/deploy.bash
