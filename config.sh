#!/usr/bin/env bash

# run brew.sh at first
if [[ -d ~/.config ]]; then
	echo "$HOME/.config exists, exit"
	exit 1
fi

# create alias to .config
ln -sf "$PWD/.config" "$HOME/.config"

# ---------------------------------------- zsh ---------------------------------------- #
echo "=============================== Configure zsh ==============================="
rm -rf "$HOME/.zshrc" "$HOME/.zsh" "$HOME/.antigen" "$HOME/.config/antigen.zsh" "$HOME/.oh-my-zsh"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download antigen
curl -L git.io/antigen >"$HOME/.config/antigen.zsh"

ln -sf "$PWD/.zshrc" "$HOME/.zshrc"

# install starship theme
curl -sS https://starship.rs/install.sh | sh
# ---------------------------------------- zsh ---------------------------------------- #

# ---------------------------------------- tmux ---------------------------------------- #
echo "=============================== Configure tmux ==============================="
rm -rf "$HOME/.tmux.conf" "$HOME/.tmux/"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"

# Install tpm:
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# ---------------------------------------- tmux ---------------------------------------- #

# ---------------------------------------- vim --------------------------------------- #
echo "=============================== Configure nvim ==============================="
make clean-vim

nvim --headless "+Lazy! sync" +qa

# ---------------------------------------- vim ---------------------------------------- #
