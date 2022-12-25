all: install config

install:
	./install.sh

config:
	./config.sh

clean-vim:
	rm -rf ~/.cache/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/lazy-lock.json
