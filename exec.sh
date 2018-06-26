#!/bin/sh

CONTAINER_NAME=pc1
# コマンドを表示
set -x

buil() {
	cp -r ~/.ssh .
	docker build --no-cache -t mypc .
	# docker build -t mypc .
	rm -rf .ssh

	docker stop pc1
	docker rm pc1
	docker run -d --name pc1 mypc
	docker ps

	docker exec -it pc1 bash
}

all() {
	docker stop pc1
	docker rm pc1
	docker run -d --name pc1 ubuntu:latest tail -f /dev/null
	docker ps
}

private() {
	docker cp ~/.ssh pc1:/root/.ssh
	docker exec pc1 chmod 600 /root/.ssh/config
	docker exec pc1 chmod 600 /root/.ssh/id_rsa
	docker exec pc1 chown root:root /root/.ssh/config
	docker exec pc1 chown root:root /root/.ssh/id_rsa
	docker exec pc1 ls -l /root/.ssh
}

public() {
	docker exec pc1 apt update
	docker exec pc1 apt install -y curl
	docker exec pc1 apt install -y curl
	docker exec pc1 apt install -y git
	docker exec pc1 apt install -y vim
}

debug() {
	docker exec -it pc1 bash
}

install() {
	# apt update
	# apt install -y curl
	# apt install -y curl
	# apt install -y git
	# apt install -y vim

	# golang
	apt install -y golang-go

	# ghq
	go get github.com/motemen/ghq

	# fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --all

	# dotfiles(vim)
	~/go/bin/ghq get -p yfujii01/setting_vim
	cd $(~/go/bin/ghq root)/$(~/go/bin/ghq list | grep yfujii01/setting_vim)
	. deploy.sh

	# dotfiles(bash)
	~/go/bin/ghq get -p yfujii01/setting_bash
	cd $(~/go/bin/ghq root)/$(~/go/bin/ghq list | grep yfujii01/setting_bash)
	. deploy.sh

	# dotfiles(git)
	~/go/bin/ghq get -p yfujii01/setting_git
	cd $(~/go/bin/ghq root)/$(~/go/bin/ghq list | grep yfujii01/setting_git)
	. deploy.sh

	# anyenv
	git clone https://github.com/riywo/anyenv ~/.anyenv
	. ~/.bash_profile

	exec $SHELL -l
}

$1

# コマンドを非表示
set +x
