" coc.nvim settings
"----------------------------------------------
" Note: Node.js >= 10.12 is required by coc.vim
" Run ":checkhealth" to check the depencies of extensions
"----------------------------------------------

" Add extensions (auto installation)
" View extensions in Vim, run command:   :CocList extensions
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            "\  provide completion and validation for the coc-settings.json file
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-git',
            "\ Similar to mouse right click (show what can be done for)
            "\ Need cooporate with LSP
            \ 'coc-actions',
            \ 'coc-pairs',
            "\ better performance than Nerdtree
            \ 'coc-explorer',
            "\ Choose floating windows by using coc-lists
            \ 'coc-floaterm',
            "\ C/C++ Language server
            \ 'coc-clangd',
            "\ cmake code autocompletion
            \ 'coc-cmake',
            \ 'coc-pyright',
            \ 'coc-markdownlint',
            "\ need to run "python3 -m pip install --user --upgrade pynvim" first
            \ 'coc-snippets',
            "\ Highlight word under cursor and its occurrences
            \ 'coc-highlight',
            \ 'coc-spell-checker',
            "\ Highlight yanked text and persist yank list across vim.
            "\ Make sure have `:echo exists('##TextYankPost')`
            \ 'coc-yank',
            "\ Auto switch current pwd to workspace directory
            \ 'coc-project',
            \ 'coc-texlab',
            \ ]

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
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs = [["**", "**"]]

autocmd FileType vim let b:coc_pairs_disabled = ['"']

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------------------------------------------------------------
"  Key mappings
" -------------------------------------------------------------------

" -------------------------------------------------------------------
" Finder
"
" Search files from current cwd
" Mimic quick open key in VS Code
nmap <C-p> :CocList files<CR>

" Find word in current buffer
nmap <silent> <space>f :CocList words<CR>
" Find current word in current buffer (and enter normal mode in the list)
nmap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" Find in current cwd
nmap <silent> <space>F :CocList grep<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mouse hover
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>

" -------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" -------------------------------------------------------------------
" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" -------------------------------------------------------------------
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" -------------------------------------------------------------------
"  Modification

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Toggle fix suggestions (used to fix spell error, code error...)
nmap <C-space> <Plug>(coc-codeaction-selected)<cr>

" --------------------------------------------------------
" Diagnostics (similar to VS Code problem windows)
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" --------------------------------------------------------
" Text Objects
"
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

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" --------------------------------------------------------
" Show all commands (Similar to ctrl+shift+p in VS Code)
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>O  :<C-u>CocList -I symbols<cr>

" --------------------------------------------------------
" Bookmark
nmap <Leader>m <Plug>(coc-bookmark-toggle)
nmap <Leader>b :CocList --normal bookmark<CR> " Open bookmark list in normal mode
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)

