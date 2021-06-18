function! modules#common#plugins() abort
    let plugins = []
    call add(plugins, ['tpope/vim-surround'])
    " (cooporated with surround.vim, so that ds, cs, yss can be repeated)
    call add(plugins, ['tpope/vim-repeat'])
    call add(g:coc_global_extensions, 'coc-pairs')
    " Better Comments (gcc key)
    call add(plugins, ['tpope/vim-commentary'])

    " Highlight word under cursor and its occurrences
    call add(g:coc_global_extensions, 'coc-highlight')
    call add(g:coc_global_extensions, 'coc-spell-checker')

    " Highlight yanked text and persist yank list across vim.
    " Make sure have `:echo exists('##TextYankPost')`
    call add(g:coc_global_extensions, 'coc-yank')

    return plugins
endfunction

function! modules#common#config() abort
endfunction
