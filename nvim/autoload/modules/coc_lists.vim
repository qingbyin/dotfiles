function! modules#coc_lists#plugins() abort
    let plugins = []
    call add(g:coc_global_extensions, 'coc-lists')
    return plugins
endfunction

function! modules#coc_lists#config() abort
    call s:mappings()
endfunction

function! s:mappings() abort
    " Search files from current cwd
    " Mimic quick open key in VS Code
    nmap <C-p> :CocList files<CR>
    " List opened files
    nmap <space>l :CocList buffers<CR>

    " Find word in current buffer
    nmap <silent> <space>f :CocList words<CR>
    " Find current word in current buffer (and enter normal mode in the list)
    nmap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
    " Find in current cwd
    nmap <silent> <space>F :CocList grep<CR>

    " Diagnostics (similar to VS Code problem windows)
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

    " Show all commands (Similar to ctrl+shift+p in VS Code)
    nnoremap <silent><nowait> <space>C  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <Leader>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    " nnoremap <silent><nowait> <Leader>O  :<C-u>CocList -I symbols<cr>
endfunction
