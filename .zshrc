# use starship theme
eval "$(starship init zsh)"

for file in ~/.config/zsh/{functions,env,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
