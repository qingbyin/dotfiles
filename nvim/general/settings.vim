" Geenral settings
" i.e. build-in parameters without plugins

" not working in WSL by far
" set clipboard=unnamedplus       " Use system clipboard

" Tab settings
set expandtab  " Convert tab to spaces automatically
set tabstop=4  " 1 tab = 4 spaces
set shiftwidth=4
" Show whitespace/tab/break explicitly (Use symbols similar to Office Word)
set list listchars=tab:→\ ,trail:·,precedes:←,extends:→,space:·

" Hybrid line numbers
set number relativenumber
" Hard wrap settings (only break at the end of a word)
" TODO: Chinese wrap?
set textwidth=120
" Vertical ruler
set colorcolumn=80,100,120

" Vertical splits will automatically be to the right
set splitright
" Horizontal splits will automatically be below
set splitbelow

" Enable highlightling of the current line
set cursorline

" Avoid auto-pairs and auto-identing when paste in terminal (non-gui) Vim
set pastetoggle=<F4>
