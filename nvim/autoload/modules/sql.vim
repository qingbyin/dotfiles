function! modules#sql#plugins() abort
    let plugins = []
    call add(plugins, [''])
    return plugins
endfunction

function! modules#sql#config() abort
    let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }
    call mappings()
endfunction

function! s:mappings() abort
endfunction
