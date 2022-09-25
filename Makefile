all: install config

install:
	./install.sh

config:
	./config.sh

clean_vim:
  # rm -rf ~/.cache/nvim && rm -rf ~/.local/share/nvim && rm -rf ./nvim/plugin
