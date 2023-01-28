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
