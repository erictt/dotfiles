# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="hyperzsh"

# Add Environment Variables in ~/.env, the plugin dotenv will pick it up

for file in ~/.zsh/{exports,aliases,functions,extra,env}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
plugins=(
  git
  bundler
  osx
  rake
  rbenv
  ruby
  tmux
)

source $ZSH/oh-my-zsh.sh
