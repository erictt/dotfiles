# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init $HOME/.config/antigenrc

for file in ~/.config/zsh/{functions,env,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
