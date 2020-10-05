" ----------------------------
" Explorer settings
" Explorer settings
" also view some related setting in`coc-settings.json`

" Define functions which will be called by key bindings
let g:coc_explorer_global_presets = {
            \   'floating': {
            \     'position': 'floating',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingTop': {
            \     'position': 'floating',
            \     'floating-position': 'center-top',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingLeftside': {
            \     'position': 'floating',
            \     'floating-position': 'left-center',
            \     'floating-width': 50,
            \     'floating-height': -10,
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingRightside': {
            \     'position': 'floating',
            \     'floating-position': 'right-center',
            \     'floating-width': 50,
            \     'floating-height': -10,
            \     'open-action-strategy': 'sourceWindow',
            \   }
            \ }
" Open explorer
nnoremap <space>E :CocCommand explorer<CR>
" Open explorer as a floating window in different positions
nmap <Leader>e :CocCommand explorer --preset floatingTop<CR>
" nmap <Leader>em :CocCommand explorer --preset floating<CR> " middle position
" nmap <Leader>el :CocCommand explorer --preset floatingLeftside<CR>
" nmap <Leader>er :CocCommand explorer --preset floatingRightside<CR>
