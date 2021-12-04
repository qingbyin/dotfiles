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


    " Interactive coding
    " drawback: multi-line output is currently not supported
    call add(plugins, ['metakirby5/codi.vim'])

    " call add(plugins, ['dstein64/vim-startuptime'])
    return plugins
endfunction

function! modules#common#config() abort
    " Use a split window for the output
    "https://github.com/metakirby5/codi.vim/issues/138
    let g:codi#virtual_text = 0

    let g:codi#log="/tmp/codi.log"
endfunction
