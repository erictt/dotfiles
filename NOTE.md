# NOTE

## Tmux

- requires some manual work to complete the installation

- To install the plugins, you need to start a session(just run `tmux`), and
  - press `Ctrl + a + I` to install plugins
  - press `Ctrl + a + r` to reload the configuration

- Create a new session inside a tmux session
  - `:new -s <name>`

## iTerm2

- to Enable "Application in terminal may access clipboard" in iTerm2
  - <https://github.com/tmux/tmux/wiki/Clipboard#terminal-support---iterm2>

## Git

- Delete untracked branches: `git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d`

## VIM

- Prettify JSON in Vim with jq: `%!jq .`

## Anaconda

- To hide the env: conda config --set changeps1 False
  - <https://starship.rs/config/#conda>
- After installing anaconda, the bash has a `(base)` in the prompt. To turn it off, use command `conda config --set auto_activate_base false`.
  - More details: <https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default>

## Ubuntu

- Turn off GUI `sudo systemctl set-default multi-user`
- Turn on GUI `sudo systemctl set-default graphical`
- Don't forget to reboot

### Fix the user can't run docker with non-root user

Create the docker group if it does not exist

`$ sudo groupadd docker`

Add your user to the docker group.

`$ sudo usermod -aG docker $USER`

Run the following command or Logout and login again and run (that doesn't work you may need to reboot your machine first)

`$ newgrp docker`

Check if docker can be run without root

`$ docker run hello-world`

- <http://stackoverflow.com/questions/48957195/ddg#48957722>
