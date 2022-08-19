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
" lualine {{{
lua << END
require("lualine").setup{
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = 'gruvbox-material',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress', 'location'},
    lualine_z = { {
        'diagnostics',

        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { 'ale', 'coc' },

        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn', 'info', 'hint' },
        separator = {left = '', right = ''},

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = { fg = '#ea6962', bg = '#32302f', gui='bold' }, -- Changes diagnostics' error color.
          warn = { fg = '#d8a657', bg = '#32302f', gui='bold' }, -- Changes diagnostics' error color.
          info = { fg = '#7daea3', bg = '#32302f', gui='bold' }, -- Changes diagnostics' error color.
          hint = { fg = '#a9b665', bg = '#32302f', gui='bold' }, -- Changes diagnostics' error color.
        },

        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'},
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  -- tabline = {},
  -- tabline = {
  --   lualine_a = {'buffers'},
  --   lualine_b = {'branch'},
  --   lualine_c = {'filename'},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {'tabs'}
  -- },
  winbar = {},
  inactive_winbar = {},
  extensions = {'nerdtree'}
}
require("tabby").setup{
}
END
" }}}
"
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
    nnoremap <silent><C-p> :CtrlSpace O<CR>
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

" telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

