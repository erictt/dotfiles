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
* Usage: Provides a much simpler way to use some motions in vim.
* Keys Mapping: 

        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
        map <Leader><leader>h <Plug>(easymotion-linebackward)
        map <Leader><Leader>j <Plug>(easymotion-j)
        map <Leader><Leader>k <Plug>(easymotion-k)
        map <Leader><leader>l <Plug>(easymotion-lineforward)
        map <Leader><leader>. <Plug>(easymotion-repeat)

### unblevable/quick-scope

* Github Repo: [unblevable/quick-scope](https://github.com/unblevable/quick-scope)
* Useage: highlights which characters to target for `f`, `F` and family.
* Key Mapping: 

        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] // 

### scrooloose/nerdtree & jistr/vim-nerdtree-tabs
* Github Repo: [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) & [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* Useage: to explore filesystem and to open files and directories.
* Key Mapping: 

          " nerdtree
          map <C-n> :NERDTreeToggle<CR>
          let NERDTreeHighlightCursorline=1
          let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
          "close vim if the only window left open is a NERDTree
          autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
          let g:NERDTreeMapOpenSplit = 's'
          let g:NERDTreeMapOpenVSplit = 'v'
          let g:NERDTreeWinSize=26
    
          " nerdtreetabs
          map <C-n> <plug>NERDTreeTabsToggle<CR>
          let g:nerdtree_tabs_synchronize_view=0
          let g:nerdtree_tabs_synchronize_focus=0
          let g:nerdtree_tabs_open_on_console_startup=0
          let g:nerdtree_tabs_open_on_gui_startup=0

### ctrlpvim/ctrlp.vim & tacahiroy/ctrlp-funky
* Github Repo: [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* Useage: 
    * Full support for Vim's regexp as search patterns.
    * Built-in Most Recently Used (MRU) files monitoring.
    * Built-in project's root finder.
    * Open multiple files at once.
    * Create new files and directories. 
* Key Mapping: 

        let g:ctrlp_map = '<leader>p' 
        let g:ctrlp_cmd = 'CtrlP'
        map <leader>f :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
        let g:ctrlp_working_path_mode=0
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1

        " ctrlpfunky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
        let g:ctrlp_funky_syntax_highlight = 1
    
        let g:ctrlp_extensions = ['funky']
### syntastic
* Github Repo: [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic#introduction)
* Useage: a syntax checking plugin
* Key Mapping: 
       
        " dependencies
        execute pathogen#infect()
            
        let g:syntastic_error_symbol='>>'
        let g:syntastic_warning_symbol='>'
        let g:syntastic_check_on_open=1
        let g:syntastic_check_on_wq=0
        let g:syntastic_enable_highlighting=1 
           
        let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
        let g:syntastic_python_checkers=['pyflakes', 'pep8']
        let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'
        
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_enable_signs = 1
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_auto_jump = 0
        " let g:syntastic_loc_list_height = 5
        highlight SyntasticErrorSign guifg=white guibg=black



