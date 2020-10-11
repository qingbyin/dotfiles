" Use coc nvim build-in format
" which will invoke formatter used by the language server.
"
" cpp: use clangd build-in clang-format

" --------------------------------------
" See format settings in coc-settings.json

" --------------------------------------

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
