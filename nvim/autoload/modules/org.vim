function! modules#org#plugins() abort
    let plugins = []
    call add(plugins, ['jceb/vim-orgmode'])
    return plugins
endfunction

function! modules#org#config() abort
    
    call s:mappings()
endfunction

function! s:mappings() abort
endfunction
