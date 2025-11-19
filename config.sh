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

if [[ "$(uname)" == "Darwin" ]]; then
  ln -sf "$PWD/.zshrc.mac" "$HOME/.zshrc"
elif [[ "$(uname)" == "Linux" ]]; then
  ln -sf "$PWD/.zshrc.ubuntu" "$HOME/.zshrc"
fi

# install starship theme
curl -sS https://starship.rs/install.sh | sh

ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"
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

echo ""
echo "Neovim configuration has been set up!"
echo "Please open Neovim manually to complete plugin installation:"
echo "  1. Run: nvim"
echo "  2. Wait for Lazy.nvim to install all plugins"
echo "  3. Wait for nvim-treesitter to download parsers"
echo "  4. Wait for Mason to install LSP servers"
echo "  5. After everything completes, restart Neovim"
echo ""
echo "Note: First launch may take a few minutes. Don't close Neovim until installations complete!"
echo ""

# ---------------------------------------- vim ---------------------------------------- #
