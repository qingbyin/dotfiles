function! modules#latex#plugins() abort
    let plugins = []
    call add(plugins, ['lervag/vimtex', {'merged' : 0, 'on_ft': ['bib', 'tex']}])
    call add(plugins, ['KeitaNakamura/tex-conceal.vim', {'for': 'tex'}])
    call add(g:coc_global_extensions, 'coc-texlab')
    return plugins
endfunction

function! modules#latex#config() abort
    autocmd FileType tex let b:coc_pairs = [["$", "$"]]

    let g:tex_flavor = 'latex'
    let g:vimtex_view_general_viewer = 'sumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    " Convert unfocused LaTex math code into real symbols
    autocmd filetype tex set conceallevel=2
    let g:tex_conceal='abdmg'

    let g:vimtex_mappings_enabled=0
    call s:mappings()
endfunction

function! s:mappings() abort
    autocmd filetype tex imap <F5> <plug>(vimtex-compile)
    autocmd filetype tex nmap <F5> <plug>(vimtex-compile)
    autocmd filetype tex nmap <Space>v <plug>(vimtex-view)
endfunction
