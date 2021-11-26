function! modules#latex#plugins() abort
    let plugins = []
    " Use coc-texlab to build and view pdf
    call add(plugins, ['lervag/vimtex', {'merged' : 0, 'on_ft': ['bib', 'tex']}])
    call add(plugins, ['KeitaNakamura/tex-conceal.vim', {'for': 'tex'}])
    call add(g:coc_global_extensions, 'coc-texlab')
    return plugins
endfunction

function! modules#latex#config() abort
    autocmd FileType tex let b:coc_pairs = [["$", "$"]]

    let g:tex_flavor = 'latex'
    " Setting for sumatraPDF
    " let g:vimtex_view_general_viewer = 'sumatraPDF'
    " let g:vimtex_view_general_options = '-reuse-instance @pdf'
    " let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    
    " Setting for zathura
    " Remark: configure neovim backforward search using neovim-remote (see vimtex help)
    let g:vimtex_view_method='zathura'

    " latexmk options
    let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-xelatex',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ]
      \}

    " suppress the warning
    " let g:vimtex_quickfix_ignore_filters = ['while executing']
    let g:vim_log_ignore = 0
    let g:vimtex_quickfix_enabled = 0

    " vimtex toc
    let g:vimtex_toc_config = {
                \ 'split_pos': 'vert rightbelow',
                \}

    " Convert unfocused LaTex math code into real symbols
    autocmd filetype tex set conceallevel=2
    let g:tex_conceal='abdmg'
    call s:mappings()
endfunction

function! s:mappings() abort
    " autocmd filetype tex imap <F5> :CocCommand latex.Build<CR>
    " autocmd filetype tex nmap <F5> :CocCommand latex.Build<CR>
    autocmd filetype tex nmap <Space>v :CocCommand latex.ForwardSearch<CR>
    autocmd filetype tex imap <F5> <plug>(vimtex-compile)
    autocmd filetype tex nmap <F5> <plug>(vimtex-compile)
    " autocmd filetype tex nmap <Space>v <plug>(vimtex-view)
endfunction
