function! modules#otherlang#plugins() abort
    let plugins = []
    call add(g:coc_global_extensions, 'coc-json')
    call add(plugins, ['cespare/vim-toml'])
    call add(plugins, ['mboughaba/i3config.vim'])
    return plugins
endfunction

function! modules#otherlang#config() abort
endfunction
