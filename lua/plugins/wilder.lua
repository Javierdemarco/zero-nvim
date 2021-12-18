-- Treesitter Plugin config
-- Author: Javier de Marco

vim.cmd [[
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('pipeline', [
        \   wilder#branch(
            \     wilder#cmdline_pipeline({
            \       'fuzzy': 1,
            \       'fuzzy_filter': wilder#lua_fzy_filter(),
            \     }),
            \     wilder#vim_search_pipeline(),
        \ )
    \ ])

    let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#lua_fzy_highlighter(),
    \ ]

    let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
        \ 'border': 'rounded',
        \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
        \ 'highlighter': s:highlighters,
        \ 'left': [
            \   ' ',
            \   wilder#popupmenu_devicons(),
        \ ],
        \ 'right': [],
        \ }))

    let s:wildmenu_renderer = wilder#wildmenu_renderer({
        \ 'highlighter': s:highlighters,
        \ 'separator': ' · ',
        \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
        \ 'right': [' ', wilder#wildmenu_index()],
    \ })

    call wilder#set_option('renderer', wilder#renderer_mux({
        \ ':': s:popupmenu_renderer,
        \ '/': s:wildmenu_renderer,
        \ 'substitute': s:wildmenu_renderer,
    \ }))
]]
