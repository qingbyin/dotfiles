function! modules#markdown#plugins() abort
    let plugins = []
    call add(plugins, ['vim-pandoc/vim-pandoc-syntax'])
    call add(g:coc_global_extensions, 'coc-webview')
    call add(g:coc_global_extensions, 'coc-markdown-preview-enhanced')
    return plugins
endfunction

function! modules#markdown#config() abort
    
    autocmd FileType markdown let b:coc_pairs = [["**", "**"]]

    autocmd! FileType markdown set syntax=markdown.pandoc
    
    call s:mappings()
endfunction

function! s:mappings() abort
    " Disable it, because it will conflict with the tex file preview
    " autocmd filetype markdown nmap <space>v :CocCommand markdown-preview-enhanced.openPreview<CR>
endfunction
