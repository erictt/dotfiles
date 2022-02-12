# -- Antigen ---
# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load oh-my-zsh library
antigen use oh-my-zsh

# Specify completions we want before the completion module
antigen bundle zsh-users/zsh-completions

# Specify plugins we want
antigen bundle git
antigen bundle command-not-found
antigen bundle docker
antigen bundle macos
antigen bundle rake
antigen bundle rbenv
antigen bundle tmux
antigen bundle editor
antigen bundle history
antigen bundle prompt
antigen bundle utility
antigen bundle completion

# Specify additional external plugins we want
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Select theme
antigen theme spaceship-prompt/spaceship-prompt
SPACESHIP_EXEC_TIME_ELAPSED=1

# Load everything
antigen apply
# -- end of Antigen ---

# Set any settings or overrides here
# prompt belak
bindkey -e

for file in ~/.zsh/{exports,aliases,functions,extra,env}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
