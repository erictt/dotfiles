#!/usr/bin/env bash

cd /tmp/ || exit

apt-get update
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get -y install \
	build-essential \
	cppcheck \
	git \
	python3-venv \
	python3-pandas \
	python3-matplotlib \
	sqlite3 \
	sqlite3-doc \
	tmux \
	unzip \
	zip \
	zsh

echo "=============================== Install latest nodejs ==============================="
# NODE_VERSION=19.x
NODE_VERSION=lts.x
curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash - &&
	sudo apt-get install -y nodejs npm

# didn't find a way to grep the latest golang version
GO_VERSION=1.20
echo "=============================== Install golang ${GO_VERSION} ==============================="
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

echo "=============================== Install latest lazygit ==============================="
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
