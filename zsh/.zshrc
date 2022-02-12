# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

for file in ~/.zsh/{exports,aliases,functions,extra,env}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
