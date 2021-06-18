" Load modules and corresponding configurations in autoload/modules/
"

" -----------------------------------------------
" Add the module into the module list for loading
let s:module_list = []
let g:coc_global_extensions = []
function! modules#add(module) abort
    if index(s:module_list, a:module) == -1 " if not found
        call add(s:module_list, a:module)
    endif
endfunction

" -----------------------------------------------
" Recursively load modules from the list
function! modules#load_modules() abort
    call plug#begin('~/.config/nvim/autoload/plugged')
    for module in s:module_list
        " Get required plugins for this module
        for plugin in s:getModulePlugins(module)
            if len(plugin) == 2
                call s:load_plugin(plugin[0], extend(plugin[1], {'overwrite' : 1}))
            else
                call s:load_plugin(plugin[0], {'overwrite' : 1})
            endif
        endfor
        call s:loadModuleConfig(module)
    endfor
    " Note: Plugins become available only after plug#end
    call plug#end()
endfunction

" -----------------------------------------------
" Read required plugins in the module file
function! s:getModulePlugins(module) abort
    let p = []
    try
        let p = modules#{a:module}#plugins()
    catch /^Vim\%((\a\+)\)\=:E117/
    endtry
    return p
endfunction

" -----------------------------------------------
" Read required configurations in the module file
function! s:loadModuleConfig(module) abort
  try
    call modules#{a:module}#config()
  catch /^Vim\%((\a\+)\)\=:E117/
  endtry
endfunction


" -----------------------------------------------
"  Install required plugins for the module
function! s:load_plugin(repo,...) abort
    if len(a:000) > 0
        exec "Plug '".a:repo."', ".join(a:000,',')
    else
        exec "Plug '".a:repo."'"
    endif
endfunction
