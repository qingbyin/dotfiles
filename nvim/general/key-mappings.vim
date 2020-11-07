" Basic key mappings

" Remap Escape key
inoremap jk <Esc>
" Avoid the delay after only typing `j`
autocmd InsertEnter * set timeoutlen=200
autocmd InsertLeave * set timeoutlen=1000

" Map <space> to <leader>
let mapleader ="\<Space>"

" Move in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

" Move in completion popup menu
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Tab to move to next/previous buffer
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-q> :wq!<CR>
" vim-bbye (Save and Kill a buffer)
nnoremap <silent>  <Leader>q :Bdelete<CR>

" use alt + hjkl to resize windows
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

" Switch windows
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
