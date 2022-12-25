# NOTE

## Tmux

- requires some manual work to complete the installation

- To install the plugins, you need to start a session(just run `tmux`), and
  - press `Ctrl + a + I` to install plugins
  - press `Ctrl + a + r` to reload the configuration

## iTerm2

- to Enable "Application in terminal may access clipboard" in iTerm2
  - https://github.com/tmux/tmux/wiki/Clipboard#terminal-support---iterm2

## Git

- Delete untracked branches: `git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d`

## VIM

- Prettify JSON in Vim with jq: `%!jq .`
