" General settings
" i.e. build-in parameters without plugins

function! Is_WSL() abort
  let proc_version = '/proc/version'
  return filereadable(proc_version)
        \  ? !empty(filter(
        \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
        \  : v:false
endfunction

" if !Is_WSL()
"     set clipboard=unnamedplus       " Use system clipboard
" end

" Tab settings
set expandtab  " Convert tab to spaces automatically
set tabstop=4  " 1 tab = 4 spaces
set shiftwidth=4
" Show whitespace/tab/break explicitly (Use symbols similar to Office Word)
set list listchars=tab:→\ ,trail:·,precedes:←,extends:→,space:·

" Hybrid line numbers
set number relativenumber
" Hard wrap settings (only break at the end of a word)
set textwidth=80
" Vertical ruler
set colorcolumn=80,100,120
" Enable Chinese characters wrap, see ":help fo-table"
set formatoptions+=m
" When joning lines, don't insert a space before/after a Chinese characters.
set formatoptions+=M
" Disable soft wrap
set nowrap

" Vertical splits will automatically be to the right
set splitright
" Horizontal splits will automatically be below
set splitbelow

" Enable highlightling of the current line
set cursorline

" Avoid auto-pairs and auto-indenting when paste in terminal (non-gui) Vim
set pastetoggle=<F4>

" Command line auto completion
set wildmode=longest:full,full

" Auto remove trailing whitespace when saving
autocmd FileType markdown,tex autocmd BufWritePre <buffer> %s/\s\+$//e
