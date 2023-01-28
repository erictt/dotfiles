#! /bin/sh

# Switch to zsh as default shell
if ! grep -qF '/bin/zsh' /etc/shells; then
	echo '/bin/zsh' | sudo tee -a /etc/shells
fi
sudo chsh -s $(which zsh) $(whoami)
