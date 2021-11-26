function! modules#snippets#plugins() abort
    let plugins = []
    call add(g:coc_global_extensions, 'coc-snippets')
    " Collection of common snippets files for various languages
    " call add(plugins, ['honza/vim-snippets'])
    call add(plugins, ['sirver/ultisnips'])
    return plugins
endfunction

function! modules#snippets#config() abort
    call s:mappings()
endfunction

function! s:mappings() abort
    " Jump after inserting a snippet
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    " Use <C-j> for select text for "visual mode" placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " -------------------------------------------------------------------
    " Make <tab> used for trigger completion, completion confirm,
    " Use <TAB> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    if exists('*complete_info')
        inoremap <expr> <Tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<TAB>"
    else
        " "pumvisible()" checks if the popup menu is visible
        " If true, insert the selected one; If false, insert the normal tab
        inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
    endif

    " -------------------------------------------------------------------
    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Do not use <Enter> key to trigger completion
    inoremap <expr> <CR> pumvisible() ? "\<C-E>\<CR>" : "\<CR>"

    " Note: Let coc.nvim handles the completion key mappings
    " but let ultisnips expand function snippets such as create_matrix
    let g:UltiSnipsExpandTrigger = "<s-tab>" 
    " let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    " let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
endfunction
