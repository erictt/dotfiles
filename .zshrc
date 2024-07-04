if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load Antigen
source "$HOME/.config/antigen.zsh"

# Load Antigen configurations
antigen init $HOME/.config/antigenrc

for file in ~/.config/zsh/{functions,env,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Hide conda env from the prompt
# https://starship.rs/config/#conda
# conda config --set changeps1 False

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eric/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eric/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/eric/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eric/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

