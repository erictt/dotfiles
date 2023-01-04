# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init $HOME/.config/antigenrc

for file in ~/.config/zsh/{exports,aliases,functions,extra,env,custom}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eric/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eric/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eric/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eric/google-cloud-sdk/completion.zsh.inc'; fi
