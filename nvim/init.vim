" --------------------------------------------------------------
" General Settings
" --------------------------------------------------------------
source $HOME/.config/nvim/general/settings.vim

" Key mappings
source $HOME/.config/nvim/general/key-mappings.vim

" --------------------------------------------------------------
" plugins
" --------------------------------------------------------------

" Plugin list
source $HOME/.config/nvim/plug/plugins.vim

" Theme
source $HOME/.config/nvim/plug-config/theme.vim

" coc settings and its extensions
source $HOME/.config/nvim/plug-config/coc.vim

" Explorer settings
source $HOME/.config/nvim/plug-config/explorer.vim
source $HOME/.config/nvim/plug-config/snippets.vim

" Git
source $HOME/.config/nvim/plug-config/git.vim

" Others
source $HOME/.config/nvim/plug-config/others.vim

" --------------------------------------------------------------
" VS Code configuration
" --------------------------------------------------------------
if exists('g:vscode')
    source $HOME/.config/nvim/vscode/settings.vim
    source $HOME/.config/nvim/plug-config/easymotion.vim
endif
