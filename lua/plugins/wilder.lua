-- Treesitter Plugin config
-- Author: Javier de Marco

vim.cmd [[
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('pipeline', [
        \   wilder#branch(
            \     wilder#cmdline_pipeline({
            \       'language': 'python',
            \       'fuzzy': 1,
            \     }),
            \     wilder#python_search_pipeline({
            \       'pattern': wilder#python_fuzzy_pattern(),
            \       'sorter': wilder#python_difflib_sorter(),
            \       'engine': 're',
            \     }),
        \ )
    \ ])

    let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

    call wilder#set_option('renderer', wilder#renderer_mux({
        \ ':': wilder#popupmenu_renderer({
            \   'highlighter': s:highlighters,
            \ 'left': [
            \   ' ', wilder#popupmenu_devicons(),
            \ ],
            \ 'right': [
            \   ' ', wilder#popupmenu_scrollbar(),
            \ ],
        \ }),
        \ '/': wilder#wildmenu_renderer({
            \   'highlighter': s:highlighters,
            \ 'right': [
            \   ' ', wilder#popupmenu_scrollbar(),
            \ ],
        \ }),
    \ }))
]]
