# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

for file in ~/.zsh/{exports,aliases,functions,extra,env}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
