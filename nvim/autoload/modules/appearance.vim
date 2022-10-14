function! modules#appearance#plugins() abort
    let plugins = []
    call add(plugins, ['flazz/vim-colorschemes'])
    call add(plugins, ['kristijanhusak/vim-hybrid-material'])
    call add(plugins, ['sainnhe/forest-night'])
    call add(plugins, ['arcticicestudio/nord-vim'])
    " Status line theme (Note install a font that supports powerline icons)
    call add(plugins, ['nvim-lualine/lualine.nvim'])
    " Icons shown in status/tab lines (can show file icon alongside filename)
    call add(plugins, ['kyazdani42/nvim-web-devicons'])
    return plugins
endfunction

function! modules#appearance#config() abort
    " this next line is needed to enable your custom colors
    syntax enable

    " checks if the terminal has 24-bit color (true colors) support
    if (has("termguicolors"))
        set termguicolors
    endif

    " some of the code to be bolded, like functions and language controls
    let g:enable_bold_font = 1

    " We don't need to see things like -- INSERT -- anymore (statusline already has one)
    set noshowmode
endfunction

function! modules#appearance#config_after() abort
    " Enable theme (must be after theme settings)
    set background=dark
    colorscheme hybrid_material

    " Turn off Vim background, in order to use terminal GUI's background.
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE

    " ----------------------------------------
    " Note: custom highlights should be set below colorscheme
    " ----------------------------------------
    " Coc message color, consistent with color scheme
    autocmd ColorScheme *
                \ hi CocErrorSign  ctermfg=Red guifg=#ff0000 |
                \ hi CocWarningSign  ctermfg=Brown guifg=#ff922b |
                \ hi CocInfoSign  ctermfg=Yellow guifg=#fab005 |
                \ hi CocHintSign  ctermfg=Blue guifg=#15aabf |
                \ hi CocUnderline  cterm=underline gui=underline

    " Change SignColumn color, see this in https://github.com/airblade/vim-gitgutter#sign-column
    highlight! link SignColumn LineNr

    " Highlight the symbol and its references when holding the cursor.
    " Note: this color in windows terminal is controlled by `gui` arugment instead of `cterm`
    " See ":h highlight-args"
    autocmd CursorHold * silent call CocActionAsync('highlight')
    highlight CocHighlightText  guibg=#646470 ctermbg=223
    " Get rid of highlighting matches after searching text
    set nohlsearch

    " Set highlight for the selected line when using CocList grep
    highlight CocListLine ctermfg=237 guibg=#13354A
    " Set highlight for the current popmenu item
    " highlight CocMenuSel ctermfg=Red guibg=#ff0000

endfunction
