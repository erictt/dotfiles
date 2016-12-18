## Explain All The Plugins I Used

### Explanations of Important Keywords
* `<Leader>`: default is `\`, you can change it by using `let mapleader = ','` in `.vimrc` file. 
* `<CR>`: equals `<Return>`	\& `<Enter>`
* `<S-...>`	: shift-key
* `<C-...>`: control-key		
* `<M-...>` & `<A-...>`: alt-key 
* `<D-...>`: command-key (Mac only)
* `g:`: means globally. Example: 
    * `let g:last_active_tab = 1` toggle switch between current tab and the last one globally.
* `remap`: Allows for mappings to work recursively.
* `noremap`: Only a single entry. Can NOT be remapped.
* `n` & `v` & `s` & `i`: prefixes, `n` stands for Normal mode, `v` stands for Visual mode, `s` stands for Select Mode, `i` stands for Insert Mode. Example: 
    * `nnoremap <C-t> :tabnew<CR>`: remap `Ctrl + t` to create a new tab
    * `inoremap <C-t> <Esc>:tabnew<CR>`: same as last one, with an escape action additionally.
* `<Plug>`: in '`.vimrc` file. it is used for mapping other scripts. And this keyword is more like `public` keyword in most programing language, which is visible outside of the script. So we can use it in `.vimrc` like this:  `map <Leader><Leader>j <Plug>(easymotion-j)`. Since this keyword is used to avoid conflicts with other scripts, so it's structure should be like this: `<Plug>Easymotion`. `typecorr` is the script name and `Add` is the mapname.
* `<SID>`: is the script ID and not visible outside. Compare with `<Plug>`, it's more like `private` function to us. So we also can write and use some functions in `.vimrc` by our own. Example: 

        " ,en ,ep to jump between errors
        function! <SID>LocationPrevious()
          try
              lprev
          catch /^Vim\%((\a\+)\)\=:E553/
              llast
          endtry
        endfunction
    
        function! <SID>LocationNext()
          try
              lnext
          catch /^Vim\%((\a\+)\)\=:E553/
              lfirst
          endtry
        endfunction
    
        nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
        nnoremap <silent> <Plug>LocationNext :<C-u>exe 'call <SID>LocationNext()'<CR>
        nmap <silent> <Leader>ep <Plug>LocationPrevious
        nmap <silent> <Leader>en <Plug>LocationNext
        
* `<silence>`:  to make a key mapping can`t be echoed on the command line
* `<expr>` take the argument as expression. For example: `inoremap <expr> <C-L> ListItem()`, ListItem is a function which is mapped with `Ctrl + L`.
### vim-easymotion

* Github Repo: [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
* Usage: Press one key to jump directly to the target. 


