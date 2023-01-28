#!/usr/bin/env bash

apt-get update
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get -y install \
	build-essential \
	golang \
	python3-venv \
	python3-pandas \
	python3-matplotlib \
	tmux \
	git \
	zip \
	unzip \
	npm \
	nodejs \
	sqlite3 \
	sqlite3-doc

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /etc/alternatives/nvim.appimage

ln -sf /etc/alternatives/nvim.appimage /usr/bin/vi
ln -sf /etc/alternatives/nvim.appimage /usr/bin/vim
ln -sf /etc/alternatives/nvim.appimage /usr/bin/nvim
