" Downalod `vim-plug` plugin automatically
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Surround
Plug 'tpope/vim-surround'
" Extended repeat key "."
" (cooporated with surround.vim, so that ds, cs, yss can be repeated)
Plug 'tpope/vim-repeat'

if exists('g:vscode')
    " Easy motion (jump to any location) for VS Code
    Plug 'asvetliakov/vim-easymotion'
else " Features already exist in VS Code
    " Pinyin (not working in WSL)
    " Plug 'Neur1n/neuims'

    " Better Comments (gcc key)
    Plug 'tpope/vim-commentary'
    " Jump to any location by two characters (alternative to EasyMotion)
    Plug 'justinmk/vim-sneak'

    " Collection of common sinppets files for various languages (e.g., c++, python, markdown)
    Plug 'honza/vim-snippets'

    " Floating windows (I used it only for terminal)
    Plug 'voldikss/vim-floaterm'
    " Open terminal
    Plug 'skywind3000/vim-terminal-help'

    " Git tools
    " Show git diff in windows (similar to VS Code)
    Plug 'tpope/vim-fugitive'
    " Show real-time git blame
    Plug 'APZelos/blamer.nvim'
    " View commmit under the cursor
    Plug 'rhysd/git-messenger.vim'

    " Fuzzy finder (coc-nvim has build-in fzf)

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " C/C++ semantic highlighting
    " See the comparison in https://github.com/clangd/coc-clangd/pull/27
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    " cmake tool
    Plug 'ilyachur/cmake4vim'
    " Doxygen
    Plug 'vim-scripts/DoxygenToolkit.vim'

    " -----------------
    " Markdown tools
    " Format tables (This plugin must come before vim-markdown)
    Plug 'godlygeek/tabular'
    " Markdown syntax highlight (dependency: tabular plugin)
    Plug 'plasticboy/vim-markdown'
    " Table of Contents
    Plug 'mzlogin/vim-markdown-toc'
    " Note: nodejs and yarn are required
    " See tricks for WSL https://github.com/iamcco/markdown-preview.nvim/issues/199
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " Auto generate Markdown tags
    Plug 'ludovicchabant/vim-gutentags', {'for': 'markdown'}

    " vim theme
    " My requirements:
    " Dark theme
    " Background should not be too green
    " Main text color is not pure white.
    " Do not use purple color for syntax highlight
    Plug 'flazz/vim-colorschemes'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'sainnhe/forest-night' " Another material theme
    Plug 'arcticicestudio/nord-vim'

    " Status line theme (Note install a font that supports powerline icons)
    Plug 'vim-airline/vim-airline'
    " Colore scheme for airline
    Plug 'vim-airline/vim-airline-themes'

    " Icons shown in status/tab lines
    Plug 'ryanoasis/vim-devicons'

    " Auto format (Python is required),
    " including removing trailing
    " whitespace
    " Use coc nvim build-in format instead
    " Plug 'Chiel92/vim-autoformat'

    " Reopen files at the last edit position
    Plug 'farmergreg/vim-lastplace'

    " Save session.vim
    " Need run `:ToggleWorkspace`
    Plug 'thaerkh/vim-workspace'

    " Keep buffers grouped separately in workspaces
    Plug 'dosimple/workspace.vim'

    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    Plug 'rhysd/accelerated-jk'

    " Swap windows without ruining its layout
    Plug 'wesQ3/vim-windowswap'
    " Delete buffers without ruining windows layout
    Plug 'moll/vim-bbye'

    " Startup screen: show recently used files/sessions
    Plug 'mhinz/vim-startify'

endif

" Initialize plugin system
call plug#end()

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
"-----------------------------------------
