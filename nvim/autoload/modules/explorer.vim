function! modules#explorer#plugins() abort
    let plugins = []
    call add(g:coc_global_extensions, 'coc-explorer')
    call add(plugins, ['voldikss/vim-floaterm'])
    call add(g:coc_global_extensions, 'coc-floaterm')
    return plugins
endfunction

" also view some related setting in`coc-settings.json`
function! modules#explorer#config() abort
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

    let g:floaterm_wintype = 'split'
    let g:floaterm_height = 0.3
    " Avoid empty window after exit
    " see https://github.com/voldikss/vim-floaterm/issues/170
    let g:floaterm_autoclose = 1

    call s:mappings()
endfunction

function! s:mappings() abort
    " Open explorer
    nnoremap <space>E :CocCommand explorer<CR>
    " Open explorer as a floating window in different positions
    nmap <Leader>e :CocCommand explorer --preset floatingTop<CR>
    " nmap <Leader>em :CocCommand explorer --preset floating<CR> " middle position
    " nmap <Leader>el :CocCommand explorer --preset floatingLeftside<CR>
    " nmap <Leader>er :CocCommand explorer --preset floatingRightside<CR>
    
    " Open a horizontal terminal at the bottom of the window
    " nnoremap <space>t :FloatermToggle<CR>
    " tnoremap <C-o> <C-\><C-n>:FloatermToggle<CR>
endfunction
