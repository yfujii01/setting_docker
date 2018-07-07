FROM pc02

LABEL "maintainer": "yfujii01 <fancl01@gmail.com>"

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

# ag(The Silver Searcher)
RUN apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
RUN apt-get install -y clang-format
RUN git clone https://github.com/ggreer/the_silver_searcher $HOME/.tools/the_silver_searcher
RUN cd $HOME/.tools/the_silver_searcher && ./build.sh && make install

