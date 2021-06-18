function! modules#motion#plugins() abort
    let plugins = []
    call add(plugins, ['justinmk/vim-sneak'])
    " Smooth scroll
    call add(plugins, ['psliwka/vim-smoothie'])
    call add(plugins, ['rhysd/accelerated-jk'])
    return plugins
endfunction

function! modules#motion#config() abort
    " : Mimic EasyMotion, namely add label for search results.
    let g:sneak#label = 1
    
    call s:mappings()
endfunction

function! s:mappings() abort
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
endfunction
