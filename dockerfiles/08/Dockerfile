FROM pc07

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

# dotfile
RUN cd $HOME/dotfiles && git pull
RUN /bin/bash ${HOME}/dotfiles/deploy.bash
