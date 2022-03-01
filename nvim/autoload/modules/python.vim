function! modules#python#plugins() abort
    let plugins = []
    call add(plugins, ['vim-python/python-syntax'])
    call add(g:coc_global_extensions, 'coc-pyright')

    call add(plugins, ['heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }])

    call add(plugins, ['jpalardy/vim-slime', { 'for': 'python' }])
    call add(plugins, ['hanschen/vim-ipython-cell', { 'for': 'python' }])

    call add(plugins, ['kalekundert/vim-coiled-snake',{ 'for': 'python'}])
    " call add(plugins, ['tmhedberg/SimpylFold',{ 'for': 'python'}])
    call add(plugins, ['Konfekt/FastFold',{ 'for': 'python'}])
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
    
    " the path to the virtual env's path
    let g:python3_host_skip_check=1
    let g:python3_host_prog = '~/miniconda3/bin/python'
    " Disable python 2 support
    let g:loaded_python_provider = 0


    let g:slime_target = 'neovim'
    let g:slime_dont_ask_default = 1
    " fix paste issues in ipython
    let g:slime_python_ipython = 1
    " let g:slime_no_mappings = 1

    call s:mappings()
endfunction

function! s:mappings() abort
    autocmd filetype python nmap <silent> <space>d <Plug>(pydocstring)

    " Run codi for interactive coding
    autocmd filetype python nmap <space>r :Codi<CR>
    autocmd filetype python nmap <space>R :Codi!<CR>

    " Open IPython terminal
    autocmd filetype python nmap <space>t :call IPythonOpen()<CR>
    " Run
    autocmd filetype python nmap <F5> :IPythonCellExecuteCell<CR>
    autocmd filetype python imap <F5> :IPythonCellExecuteCell<CR>
    autocmd filetype python nnoremap <F6> :IPythonCellRun<CR>
    autocmd filetype python inoremap <F6> :IPythonCellRun<CR>
    " close all Matplotlib figure windows
    autocmd filetype python nnoremap <Leader>x :IPythonCellClose<CR>


endfunction

" Auto open a terminal and enter into IPython
function! IPythonOpen()
    " open a new terminal in vertical split and run IPython
    vnew|call termopen('ipython --matplotlib')
    file ipython " name the new buffer

    " set slime target to new terminal
    if !exists('g:slime_default_config')
        let g:slime_default_config = {}
    end
    let g:slime_default_config['jobid'] = b:terminal_job_id

    wincmd p " switch to the previous buffer
endfunction
