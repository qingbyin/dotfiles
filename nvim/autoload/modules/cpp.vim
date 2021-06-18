function! modules#cpp#plugins() abort
    let plugins = []
    " C/C++ Language server
    call add(g:coc_global_extensions, 'coc-clangd')
    " cmake code autocompletion
    call add(g:coc_global_extensions, 'coc-cmake')
    " C/C++ semantic highlighting
    " See the comparison in https://github.com/clangd/coc-clangd/pull/27
    call add(plugins, ['jackguo380/vim-lsp-cxx-highlight'])
    return plugins
endfunction

function! modules#cpp#config() abort
    " Enable Doxygen syntax highlightling
    let g:load_doxygen_syntax=1
    " C/C++ comment style
    autocmd FileType c,cpp,java,edp setlocal commentstring=//\ %s
endfunction
