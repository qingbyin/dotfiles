function! modules#workspace#plugins() abort
    let plugins = []
    " Save session.vim
    " Need run `:ToggleWorkspace`
    call add(plugins, ['thaerkh/vim-workspace'])
    " Auto switch current pwd to workspace directory
    call add(g:coc_global_extensions, 'coc-project')
    call add(plugins, ['mhinz/vim-startify'])
    call add(plugins, ['wesQ3/vim-windowswap'])
    call add(plugins, ['moll/vim-bbye'])
    " Reopen files at the last edit position
    call add(plugins, ['farmergreg/vim-lastplace'])
    " Add a diff option when Vim finds a swap file
    call add(plugins, ['chrisbra/recover.vim'])
    return plugins
endfunction

function! modules#workspace#config() abort
    let g:startify_session_dir = '~/.vim/sessions'

    let g:startify_lists = [
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ ]
    
    " Disable autosave which is conflicted with coclist
    let g:workspace_autosave = 0
    " save all your session files in a single directory outside of your workspace
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
endfunction
