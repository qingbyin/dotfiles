function! modules#python#plugins() abort
    let plugins = []
    call add(plugins, ['vim-python/python-syntax'])
    call add(g:coc_global_extensions, 'coc-pyright')

    call add(plugins, ['heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }])
    call add(plugins, ['kalekundert/vim-coiled-snake',{ 'for': 'python'}])
    " call add(plugins, ['tmhedberg/SimpylFold',{ 'for': 'python'}])
    call add(plugins, ['luk400/vim-jukit' ])

    call add(plugins, ['Yggdroot/indentLine',{ 'for': 'python'}])
    return plugins
endfunction

function! modules#python#config() abort
    " Python doc string style
    " let g:doge_doc_standard_python = 'numpy'
    " Disable its key maps
    " let g:doge_enable_mappings = 0

    " Python highlighting
    let g:python_highlight_all = 1

    " doc auto generator style
    " let g:pydocstring_formatter = 'sphinx'
    let g:pydocstring_templates_path = '~/.config/pydocstring/'
    let g:pydocstring_doq_path= '~/miniconda3/envs/sci/bin/doq'
    let g:pydocstring_enable_mapping = 0 " Disable default mappings
    
    " the path to the virtual env's path
    let g:python3_host_skip_check=1
    let g:python3_host_prog = '~/miniconda3/bin/python'
    " Disable python 2 support
    let g:loaded_python_provider = 0

    "
    let g:jukit_output_new_os_window = 1
    let g:jukit_mappings = 0 " Disable default mappings
    let g:jukit_highlight_markers = 0 " Disable cell markers highlight

    call s:mappings()
endfunction

function! s:mappings() abort
    autocmd filetype python nmap <silent> <space>d <Plug>(pydocstring)

    " Run codi for interactive coding
    " autocmd filetype python nmap <space>r :Codi<CR>
    " autocmd filetype python nmap <space>R :Codi!<CR>

    " Open IPython terminal
    " autocmd filetype python nmap <space>t :call IPythonOpen()<CR>
    " Run
    " autocmd filetype python nmap <F5> :IPythonCellExecuteCell<CR>
    " autocmd filetype python imap <F5> :IPythonCellExecuteCell<CR>
    " autocmd filetype python nnoremap <F6> :IPythonCellRun<CR>
    " autocmd filetype python inoremap <F6> :IPythonCellRun<CR>
    " close all Matplotlib figure windows
    " autocmd filetype python nnoremap <Leader>x :IPythonCellClose<CR>

    " nnoremap <expr><silent> <LocalLeader>r  nvim_exec('MagmaEvaluateOperator', v:true)
    " nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
    " xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
    " nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
    " nnoremap <expr><silent> <Space>r  nvim_exec('MagmaEvaluateOperator', v:true)ip
    
    autocmd filetype python nmap <space>r :JukitOut conda activate sci<CR>
    " Send current cell to output split
    autocmd filetype python nmap <cr> :call jukit#send#section(0)<cr>
    " Send visually selected code to output split
    autocmd filetype python vnoremap <cr> :<C-U>call jukit#send#selection()<cr>
    autocmd filetype python nmap <space><space> :call jukit#send#line()<cr>
    " Execute all cells until the current cell
    nnoremap <leader>cc :call jukit#send#until_current_section()<cr>
    " Execute all cells
    autocmd filetype python nmap <F5> :call jukit#send#all()<cr>
    autocmd filetype python imap <F5> :call jukit#send#all()<cr>
    " Create new code cell above/below
    nnoremap <leader>ca :call jukit#cells#create_above(0)<cr>
    nnoremap <leader>cb :call jukit#cells#create_below(0)<cr>
    " Create new text cell above/below
    nnoremap <leader>cA :call jukit#cells#create_above(1)<cr>
    nnoremap <leader>cB :call jukit#cells#create_below(1)<cr>
    " Merge current cell with the cell above/below
    nnoremap <leader>cM :call jukit#cells#merge_above()<cr>
    nnoremap <leader>cm :call jukit#cells#merge_below()<cr>
    " split current cell
    nnoremap <leader>cs :call jukit#cells#split()<cr>
    " Move current cell up/down
    nnoremap <leader>ck :call jukit#cells#move_up()<cr>
    nnoremap <leader>cj :call jukit#cells#move_down()<cr>
    " Delete saved output of current/all cell(s)
    nnoremap <leader>cd :call jukit#cells#delete_outputs(0)<cr>
    nnoremap <leader>cD :call jukit#cells#delete_outputs(0)<cr>
    " Convert from ipynb to py or vice versa.
    nnoremap <leader>np :call jukit#convert#notebook_convert("jupyter-notebook")<cr>

endfunction
