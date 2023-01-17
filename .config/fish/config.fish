#u Load universal config when it's changed

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Theme
starship init fish | source

if test "$fish_config_changed" = "$fish_config_mtime"
    exit
else
    set -U fish_config_changed $fish_config_mtime
end

set -Ux fish_user_paths
# Path
# fish_add_path ~/.cargo/bin # rust
fish_add_path ~/.local/bin
fish_add_path ~/Library/Python/3.{9,10}/bin
fish_add_path /usr/local/sbin
fish_add_path /bin
fish_add_path ~/.local/share/neovim/bin

# Fish
set -U fish_emoji_width 2

# Go
set -Ux GOPATH ~/go
fish_add_path $GOPATH $GOPATH/bin

# Exports
set -Ux LESS -rF
set -Ux BAT_THEME Dracula
set -Ux COMPOSE_DOCKER_CLI_BUILD 1
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux DOTDROP_AUTOUPDATE no
set -Ux MANPAGER "nvim +Man!"
set -Ux MANROFFOPT -c
set -Ux OPENCV_LOG_LEVEL ERROR
#set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'" # use bat to format man pages
#set -Ux MANPAGER "most" # use bat to format man pages

# Tmux
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'
abbr mux tmuxinator

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias -s ls="exa --color=always --icons --group-directories-first"
alias -s la 'exa --color=always --icons --group-directories-first --all'
alias -s ll 'exa --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim

# # Dev
# abbr git hub
# abbr g hub
# abbr lg lazygit
# abbr gl 'hub l --color | devmoji --log --color | less -rXF'
# abbr st "hub st"
# abbr push "hub push"
# abbr pull "hub pull"
# alias -s tn "npx --no-install ts-node --transpile-only"
# abbr tt "tn src/tt.ts"
# alias -s todo "ag --color-line-number '1;36' --color-path '1;36' --print-long-lines --silent '((//|#|<!--|;|/\*|^)\s*(TODO|FIXME|FIX|BUG|UGLY|HACK|NOTE|IDEA|REVIEW|DEBUG|OPTIMIZE)|^\s*- \[ \])'"
#

