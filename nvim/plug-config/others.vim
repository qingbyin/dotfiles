" Other plugins
"
" -------------------------
" vim-sneak plugin
" : Mimic EasyMotion, namely add label for search results.
let g:sneak#label = 1


" -------------------------
" cmake4vim
" export `compile_commands.json` for Intellisense
let g:cmake_compile_commands = 1

" -------------------------
" Avoid empty window after exit
" see https://github.com/voldikss/vim-floaterm/issues/170
let g:floaterm_autoclose = 1


" -------------------------
" Auto format after saving
au BufWrite * :Autoformat
autocmd FileType gitignore,tex let b:autoformat_autoindent=0


" Disable autosave which is conflicted with coclist
let g:workspace_autosave = 0

" -------------------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
