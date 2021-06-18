function! modules#snippets#plugins() abort
    let plugins = []
    call add(g:coc_global_extensions, 'coc-snippets')
    " Collection of common snippets files for various languages
    call add(plugins, ['honza/vim-snippets'])
    call add(plugins, ['sirver/ultisnips'])
    return plugins
endfunction

function! modules#snippets#config() abort
    call s:mappings()
endfunction

function! s:mappings() abort
    let g:coc_snippet_next = '<tab>'
    " Jump after inserting a snippet
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)
    " Make <tab> used for trigger completion, completion confirm,
    " snippet expand and jump like VSCode.
    " Note: expand means to toggle the selection.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
