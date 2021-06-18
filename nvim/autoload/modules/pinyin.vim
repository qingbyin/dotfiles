function! modules#pinyin#plugins() abort
    let plugins = []
    if !s:is_wsl()
        call add(plugins, ['lilydjwg/fcitx.vim'])
    endif
    return plugins
endfunction

function! modules#pinyin#config() abort
endfunction

function! s:is_wsl() abort
  let proc_version = '/proc/version'
  return filereadable(proc_version)
        \  ? !empty(filter(
        \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
        \  : v:false
endfunction
