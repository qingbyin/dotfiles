" --------------------------------------------------------------
" General Settings
" --------------------------------------------------------------
if !exists('g:vscode')
source $HOME/.config/nvim/general/settings.vim

" Key mappings
source $HOME/.config/nvim/general/key-mappings.vim

" Download `vim-plug` plugin automatically
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" --------------------------------------------------------------
" Modules
" --------------------------------------------------------------
call modules#add('common')
call modules#add('appearance')
call modules#add('coc')
call modules#add('coc_lists')
call modules#add('git')
call modules#add('explorer')
call modules#add('workspace')
call modules#add('motion')
call modules#add('snippets')
call modules#add('org')
" Language
call modules#add('cpp')
call modules#add('python')
call modules#add('rust')
call modules#add('latex')
call modules#add('markdown')
call modules#add('otherlang')
call modules#add('pinyin')
" Load all added modules (i.e. install and config plugins)
call modules#load_modules()
call modules#appearance#config_after() " Set themes after installing plugins

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif


"-----------------------------------------
" Luna scripts
"-----------------------------------------
lua << EOF
require'lualine'.setup {
    options = {theme = 'onedark'},
    tabline = {
      lualine_a = {},
      lualine_b = {'buffers'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    }
}
EOF
endif

" --------------------------------------------------------------
" VS Code configuration
" --------------------------------------------------------------
if exists('g:vscode')
    source $HOME/.config/nvim/vscode/settings.vim
    " source $HOME/.config/nvim/plug-config/easymotion.vim
endif
