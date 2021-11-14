function! modules#common#plugins() abort
    let plugins = []
    call add(plugins, ['tpope/vim-surround'])
    " (cooporated with surround.vim, so that ds, cs, yss can be repeated)
    call add(plugins, ['tpope/vim-repeat'])
    " Enhanced pairs match up
    call add(plugins, ['andymass/vim-matchup'])
    
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
    return plugins
endfunction

function! modules#common#config() abort
    " Fixe the match pairs lag
    let g:matchup_matchparen_timeout = 60
    let g:matchup_matchparen_insert_timeout = 60
endfunction
