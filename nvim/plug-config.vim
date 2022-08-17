" ################### linter/fixer/completion ######################
" ale {{{
if has_key(g:plugs, 'ale')
    " pip install flake8
    " npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard \
    "   eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint

    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['eslint'],
    \   'python': ['yapf', 'autoflake'],
    \}

    " E501 -> 120 chars
    let g:ale_python_flake8_options = "--ignore=E114,E116,E131 --max-line-length=120"
    " --ignore=E225,E124,E712,E116

    " do not use the auto completion from ale
    let g:ale_completion_enabled = 0

    " Set this setting in vimrc if you want to fix files automatically on save.
    let g:ale_fix_on_save = 0

    " let g:ale_linters_explicit=1
    " let g:ale_sign_column_always = 1
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '>'
    let g:ale_set_highlights = 1
    highlight clear ALEErrorSign
    highlight clear ALEWarningSign
    let g:ale_lint_on_text_changed = 'normal'

    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    " troggle quickfix list
    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic_error location panel
            lopen
        endif
    endfunction

endif
" }}}

" coc {{{
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-spell-checker',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-phpls',
    \ ]

  " use <tab> for trigger completion and navigate to the next complete item
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
  inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" }}}

" ################### quick move/quick format ######################
" easymotion {{{
    let g:EasyMotion_smartcase = 1
" }}}

" quickscope {{{
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" easyalign {{{
    let g:easy_align_ignore_groups = ['Comment', 'String']
    let g:easy_align_delimiters = {
        \ '>': { 'pattern': '>>\|=>\|>' },
        \ '/': {
        \     'pattern':         '//\+\|/\*\|\*/',
        \     'delimiter_align': 'l',
        \     'ignore_groups':   ['!Comment'] },
        \ ']': {
        \     'pattern':       '[[\]]',
        \     'left_margin':   0,
        \     'right_margin':  0,
        \     'stick_to_left': 0
        \   },
        \ ')': {
        \     'pattern':       '[()]',
        \     'left_margin':   0,
        \     'right_margin':  0,
        \     'stick_to_left': 0
        \   },
        \ 'd': {
        \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
        \     'left_margin':  0,
        \     'right_margin': 0
        \   }
        \ }
" }}}

" nerdcommenter {{{
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    " let g:NERDTrimTrailingWhitespace = 1
" }}}

" vim-better-whitespace {{{
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> StripWhitespace
    let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
" }}}

" ################### theme ###################
" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }

    let g:airline_theme='gruvbox_material'

    " symbols
    " If the previous symbols do not render for you then install a powerline enabled font.
    " https://github.com/powerline/fonts
    let g:airline_powerline_fonts = 1
    if has('gui_running')
        " set guifont=Meslo\ for\ Powerline
        set guifont=MesloLGM\ Nerd\ Font
    endif

    " union fonts
    " let g:airline_left_sep = '»'
    " let g:airline_right_sep = '«'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.linenr = '¶'

    " powerline fonts
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.whitespace = 'Ξ'

    " enable ctrlspace
    let g:airline#extensions#ctrlspace#enabled = 1

    " enable tabline
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#buffers_label = 'BUF'
    let g:airline#extensions#tabline#tabs_label = 'TAB'

" }}}

" ################### navigation ###################

" nerdtree {{{
    let NERDTreeShowBookmarks=1
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v split screen
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    let g:NERDTreeWinSize=36
" }}}
set encoding=UTF-8

" ################### manage open files ###################

" ctrlspace {{{
    let g:CtrlSpaceDefaultMappingKey = "<C-space> "
    if has("gui_running")
    " Settings for MacVim and Inconsolata font
        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif
    if executable('rg')
        let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
    elseif executable('fd')
        let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
    elseif executable('ag')
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif
    let g:CtrlSpaceSearchTiming = 500
    hi link CtrlSpaceNormal   PMenu
    hi link CtrlSpaceSelected PMenuSel
    hi link CtrlSpaceSearch   Search
    hi link CtrlSpaceStatus   StatusLine
    " let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
    let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
    let g:CtrlSpaceSaveWorkspaceOnExit = 1

    " find out which engine to use :help g:CtrlSpaceFileEngine
    if has('mac') || has('gui_macvim')
        let s:os = 'darwin'
    else
        let s:os = 'linux'
    endif
    let g:CtrlSpaceFileEngine = '~/.vim/bundle/vim-ctrlspace/bin/file_engine_' . s:os . '_amd64'
    " let g:CtrlSpaceFileEngine = 'file_engine_darwin_amd64'
    let g:CtrlSpaceEnableFilesCache = 0

" }}}

" ################### GIT ###################"

" gitgutter {{{
    " same as git diff
    " let g:gitgutter_highlight_lines = 1
    " Your vimrc
    function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
    endfunction
    set statusline+=%{GitStatus()}
" }}}

