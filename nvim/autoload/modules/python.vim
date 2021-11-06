function! modules#python#plugins() abort
    let plugins = []
    call add(plugins, ['vim-python/python-syntax'])
    call add(g:coc_global_extensions, 'coc-pyright')

    call add(plugins, ['heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }])
    return plugins
endfunction

function! modules#python#config() abort
    " Python doc string style
    " let g:doge_doc_standard_python = 'numpy'
    " Disable its key maps
    " let g:doge_enable_mappings = 0

    " Python highlighting
    let g:python_highlight_all = 1

    " doc auto generator style
    let g:pydocstring_formatter = 'numpy'
    
    " the path to the virtual env's path
    let g:python3_host_prog = '~/miniconda3/bin/python'
    " Disable python 2 support
    let g:loaded_python_provider = 0
    call s:mappings()
endfunction

function! s:mappings() abort
    nmap <silent> <space>d <Plug>(pydocstring)
endfunction
