let mapleader ="\<Space>"
" Open Vs Code explorer
nnoremap <leader>e :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
xnoremap <leader>e :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" Toggle zen mode
nnoremap <leader>z :call VSCodeNotify('workbench.action.toggleZenMode')<CR>
xnoremap <leader>z :call VSCodeNotify('workbench.action.toggleZenMode')<CR>

" Find and Replac
" in local file
nnoremap <leader>f :call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
xnoremap <leader>f :call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
" in project
nnoremap <leader>F :call VSCodeNotify('workbench.action.replaceInFiles')<CR>
xnoremap <leader>F :call VSCodeNotify('workbench.action.replaceInFiles')<CR>

" BookMark
nnoremap <leader>m :call VSCodeNotify('bookmarks.toggle')<CR>
xnoremap <leader>m :call VSCodeNotify('bookmarks.toggle')<CR>
nnoremap <leader>b :call VSCodeNotify('bookmarks.list')<CR>
xnoremap <leader>b :call VSCodeNotify('bookmarks.list')<CR>


" Commentary
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Better switch between tabs
nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

" Better Navigation of split windows
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
