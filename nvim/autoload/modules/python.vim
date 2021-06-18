function! modules#python#plugins() abort
    let plugins = []
    call add(plugins, ['vim-python/python-syntax'])
    call add(g:coc_global_extensions, 'coc-pyright')
    return plugins
endfunction

function! modules#python#config() abort
    " Python doc string style
    " let g:doge_doc_standard_python = 'numpy'
    " Disable its key maps
    " let g:doge_enable_mappings = 0

    " Python highlighting
    let g:python_highlight_all = 1
    
    call s:mappings()
endfunction

function! s:mappings() abort
endfunction
