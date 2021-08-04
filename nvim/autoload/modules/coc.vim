" coc framework
" Run ":checkhealth" to check the dependencies of extensions
"
function! modules#coc#plugins() abort
    let plugins = []
    call add(plugins, ['neoclide/coc.nvim', {'branch': 'release'}])
    call add(g:coc_global_extensions, 'coc-marketplace')
    return plugins
endfunction

function! modules#coc#config() abort
    " Debug coc
    let g:node_client_debug = 1

   " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Auto pair
    autocmd FileType vim let b:coc_pairs_disabled = ['"']

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " --------------------------------------------------------
    " Text Objects
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " See format settings in coc-settings.json
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')


    " Load key mappings
    call s:mappings()
endfunction

" -------------------------------------------------------------------
"  Key mappings
" -------------------------------------------------------------------
function! s:mappings() abort

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gf <Plug>(coc-declaration)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Mouse hover
    nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
    " Symbol renaming.
    nmap <F2> <Plug>(coc-rename)

    " Toggle fix suggestions for a word (used to fix spell error, code error...)
    nmap <C-space> <Plug>(coc-codeaction-selected)w

endfunction
