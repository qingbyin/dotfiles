function! modules#rust#plugins() abort
    let plugins = []
    call add(plugins, ['rust-lang/rust.vim'])
    call add(g:coc_global_extensions, 'coc-rls')
    return plugins
endfunction

function! modules#rust#config() abort
    
    call s:mappings()
endfunction

function! s:mappings() abort
endfunction
