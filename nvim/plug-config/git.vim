" Git settings
" Use coc-git, lazygit, vim-fugitive, blamer, git-messenger

" ---------------------------------------------------------------
" Settings
" ---------------------------------------------------------------
" git-messenger
" set the cursor goes into a popup window when running git-messenger
let g:git_messenger_always_into_popup=v:true
let g:git_messenger_no_default_mappings=v:true " Disable default mapping

" Auto show git status (i.e., file has been modified or not) in status line B area
" +-----------------------------------------------------------------------------+
" | A | B |                     C                            X | Y | Z |  ...][ |
" +-----------------------------------------------------------------------------]
" Change decorator:
" "*": changed
" "●": staged
" "...": untracked
" "x": conflicted
autocmd User CocGitStatusChange call s:update_git_status()
function! s:update_git_status()
    let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
endfunction

" Open git commit in the floaterm window (neovim-remote is required)
let g:floaterm_gitcommit = 'floaterm'

" Open git blame
let g:blamer_enabled = 1

" Add gitignore filetype
au BufRead,BufNewFile .gitignore setfiletype gitignore


" ---------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------
" Open lazygit (need to install lazygit first)
nnoremap <silent>  <Leader><Leader>g :wa<CR> :FloatermNew lazygit<CR>

" Show git difference of the current file
nnoremap <silent>  <Leader>gD :Gdiffsplit<CR>
" Show chunk diff at current position
nmap <Leader>gd <Plug>(coc-git-chunkinfo)

" Show git commit at current position
nmap <Leader>gh <Plug>(git-messenger)

function! s:setup_git_messenger_popup() abort
    " Go back/forward history in git messenger popup window
    nmap <buffer><C-k> o
    nmap <buffer><C-j> O
    " Close popup window
    nmap <buffer><Esc> q
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

" Navigate chunks (i.e. a block of git changes) of current buffer
nmap gk <Plug>(coc-git-prevchunk)
nmap gj <Plug>(coc-git-nextchunk)

" Create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Chunk stage
nmap gs :CocCommand git.chunkStage<CR>

" Chunk redo
" Mannual use :CocCommand git.chunkUndo

