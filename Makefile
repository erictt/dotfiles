mac:
	sudo ./brew.sh && rm -rf ~/.config && ./config.sh

ubuntu:
	sudo ./ubuntu.sh && rm -rf ~/.config && ./config.sh

reconfig:
	rm -rf ~/.config && ./config.sh

clean-vim:
	rm -rf ~/.cache/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim

switch-zsh:
	sh ./scripts/switch-zsh.sh

rm-swap:
	rm -rf ~/.local/state/nvim/swap/*
