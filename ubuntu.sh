#!/usr/bin/env bash

cd /tmp/ || exit

apt-get update
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get -y install \
	build-essential \
	python3-venv \
	python3-pandas \
	python3-matplotlib \
	tmux \
	git \
	zip \
	unzip \
	cppcheck \
	sqlite3 \
	sqlite3-doc

echo "=============================== Install latest nodejs ==============================="
NODE_VERSION=19.x
curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash - &&
	sudo apt-get install -y nodejs npm

echo "=============================== Install latest golang ==============================="
GO_VERSION=1.19.5
rm -rf /usr/bin/go /usr/lib/go /usr/local/go /usr/share/go
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
ln -sf /usr/local/go/bin/go /usr/bin/go
ln -sf /usr/local/go/bin/gofmt /usr/bin/gofmt

echo "=============================== Install latest neovim ==============================="
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage /etc/alternatives/nvim.appimage

ln -sf /etc/alternatives/nvim.appimage /usr/bin/vi
ln -sf /etc/alternatives/nvim.appimage /usr/bin/nvim
