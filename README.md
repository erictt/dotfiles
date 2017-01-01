My Dotfile
=============
Start to build my dotfile.

## bash/vim dotfiles

To update, `cd` into your local `dotfiles` repository and then:

* for bash

  ```bash
  source bash.sh
  ```

* for vim

  ```bash
  source vim.sh
  ```

Alternatively, to update while avoiding the confirmation prompt:

* for dash

  ```bash
  set -- -f; source bash.sh
  ```
* for vim

  ```bash
  set -- -f; source vim.sh
  ```
    
## VIM Instructions
[VIM.md](VIM.md)

### Command i should remember:

* `<leader>zz` : toggle fold
* `<C-n>` : toggle number show up or not
* `s/v` :  to open in split window
* `F2` :  turn on/off line number

* `F4` :  wrap on/off
* `F6` :  syntax check on/off

* `H` : `^`
* `L` : `$`
* `;` : `:`

* `Command line
* `<C-j>`, `<C-k>` :  to switch previous or next command
* `<C-a>` :  move cursor to the head
* `<C-e>` :  move cursor to the end

* `<leader>/` : cancel highlight
* `<leader>y` : Copy text to system’s clipboard
* `<leader>v` :  select block
* `w!!` : to sudo & write a file

* `kj` : act like Esc when inserting text
* `U` : redo

### Check later

* Statusline

## Steps

* [x] bash
* [x] vim
* [x] brew
* [ ] Mac Configuration

## References && Thanks to

* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [wklken/k-vim](https://github.com/wklken/k-vim)
* [Bash-it/bash-it](https://github.com/Bash-it/bash-it)
* [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
* [caskroom/homebrew-cask](https://github.com/caskroom/homebrew-cask)
* [skwp/dotfiles](https://github.com/skwp/dotfiles)
* [http://coolshell.cn/articles/5426.html](http://coolshell.cn/articles/5426.html)

