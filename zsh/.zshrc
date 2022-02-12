# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

for file in ~/.zsh/{exports,aliases,functions,extra,env}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

