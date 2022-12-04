function! modules#common#plugins() abort
    let plugins = []
    call add(plugins, ['tpope/vim-surround'])
    " (cooporated with surround.vim, so that ds, cs, yss can be repeated)
    call add(plugins, ['tpope/vim-repeat'])
    
    call add(g:coc_global_extensions, 'coc-pairs')
    " Better Comments (gcc key)
    call add(plugins, ['tpope/vim-commentary'])

    " Highlight word under cursor and its occurrences
    " also color colorcodes, e.g. #ff0000
    call add(g:coc_global_extensions, 'coc-highlight')
    call add(g:coc_global_extensions, 'coc-spell-checker')

    " Highlight yanked text and persist yank list across vim.
    " Make sure have `:echo exists('##TextYankPost')`
    call add(g:coc_global_extensions, 'coc-yank')

    " call add(plugins, ['dstein64/vim-startuptime'])
    " whichkey
    call add(plugins, ['liuchengxu/vim-which-key'])
    return plugins
endfunction

function! modules#common#config() abort

    " Auto pair
    autocmd FileType vim let b:coc_pairs_disabled = ['"']

    nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
    vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
endfunction
