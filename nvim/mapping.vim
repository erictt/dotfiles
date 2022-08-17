" -------------------------------------- ale -------------------------------------------
nmap <silent> <leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <leader>en <Plug>(ale_next_wrap)

nnoremap <silent> <leader>ec :ALEToggle<CR>
nnoremap <silent> <leader>fix :ALEFix<CR>

nnoremap <leader>ee :call ToggleErrors()<cr>

" -------------------------------------- coc -------------------------------------------
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Working with buffers
nnoremap <silent> <leader>bl :ls<cr>
nnoremap <silent> <leader>c :bd<cr>
nnoremap <silent> <leader>\ :bn<cr>
nnoremap <silent> <leader>t :tabn<CR>

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" -------------------------------------- easymotion ------------------------------------
" <leader>f{char} to move to {char}
map  <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader><leader>l <Plug>(easymotion-overwin-line)

" -------------------------------------- easyalign -------------------------------------
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" -------------------------------------- vim-better-whitespace -------------------------
nnoremap <silent> <leader><leader> :StripWhitespace<CR>

" -------------------------------------- nerdtree --------------------------------------
map <leader>n :NERDTreeToggle<CR>

" -------------------------------------- tagbar ----------------------------------------
nmap <F8> :TagbarToggle<CR>

" -------------------------------------- ctrlspace -------------------------------------
nnoremap <silent><C-p> :CtrlSpace O<CR>

" -------------------------------------- gitgutter -------------------------------------
nnoremap <leader>gs :GitGutterToggle<CR>
nnoremap <leader>gh ::GitGutterLineHighlightsToggle<CR>


