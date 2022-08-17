set nocompatible
filetype off " required! turn off
" set hidden: opening a new file when the current buffer has unsaved changes causes
" files to be hidden instead of closed
set hidden

if !exists('g:bundle_groups')
    let g:bundle_groups=['python', 'go', 'php', 'javascript', 'json']
endif

" ----------------------------------------------------------------------------
" use vim-plug to manage plugins
" vim plugin bundle control, command model
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')


" common setup for runtime, will be overwritten by init.vim
Plug 'tpope/vim-sensible'

" -------------------------- lint/fix/autocompletion -------------------------
let g:ale_disable_lsp = 1
Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Group dependencies, vim-snippets depends on ultisnips
" Snippets are separated from the engine. Add this if you want them:
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

"" automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'

" -------------------------- quick move and quick format ---------------------
" inline move, triggered by f/F/t/T
" quickscope
Plug 'unblevable/quick-scope'

" easymotion
"move to specific char/line [<Leader><Leader> + f/l or s{char}{char}]
Plug 'Lokaltog/vim-easymotion'

" align/format
Plug 'junegunn/vim-easy-align'

" quick comment
Plug 'scrooloose/nerdcommenter'

" vim-better-whitespace
" remove extra spaces [<leader> + <Space>]
Plug 'ntpeters/vim-better-whitespace'

" manage marks
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks
Plug 'kshenoy/vim-signature'

" -------------------------- theme -------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ellisonleao/gruvbox.nvim'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" highlight syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" -------------------------- navigation --------------------------------------
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
" need the fonts to be installed at first
" https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
Plug 'ryanoasis/vim-devicons'

" -------------------------- manage open files -------------------------------
" bookmarks workspaces files buffers and tabs
" Plug 'vim-ctrlspace/vim-ctrlspace'

" -------------------------- git ---------------------------------------------
" gitgutter
Plug 'airblade/vim-gitgutter'

" -------------------------- tmux ---------------------------------------------

" tmux navigator Ctrl-hjkl
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" -------------------------- for languages/tools ----------------------
" go
" if count(g:bundle_groups, 'go')
"     Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" endif

" use the editconfig file to make the coding style consistent
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" terraform
Plug 'hashivim/vim-terraform'

call plug#end()
