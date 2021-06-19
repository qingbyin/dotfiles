function! modules#markdown#plugins() abort
    let plugins = []
    " Format tables (This plugin must come before vim-markdown)
    call add(plugins, ['godlygeek/tabular'])
    " Markdown syntax highlight (dependency: tabular plugin)
    call add(plugins, ['plasticboy/vim-markdown'])
    " Table of Contents
    call add(plugins, ['mzlogin/vim-markdown-toc'])
    call add(g:coc_global_extensions, 'coc-markdownlint')
    " Note: nodejs and yarn are required
    " See tricks for WSL https://github.com/iamcco/markdown-preview.nvim/issues/199
    call add(plugins, ['iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}])
    return plugins
endfunction

function! modules#markdown#config() abort
    " Disable folding (vim-markdown)
    let g:vim_markdown_folding_disabled = 1
    " Disable plugin's key mappings
    let g:vim_markdown_no_default_key_mappings = 1
    " Highlight YAML front matter (vim-markdown)
    let g:vim_markdown_frontmatter = 1
    
    autocmd FileType markdown let b:coc_pairs = [["**", "**"]]
    
    call s:mappings()
endfunction

function! s:mappings() abort
    autocmd filetype markdown nmap <Leader>v <Plug>MarkdownPreview
    autocmd filetype markdown nmap <Leader>V <Plug>MarkdownPreviewStop
endfunction
