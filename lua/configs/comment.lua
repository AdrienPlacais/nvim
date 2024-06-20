require('Comment').setup()

-- Define comment for TraceWin .dat
vim.api.nvim_exec([[
augroup CustomCommentStrings
    autocmd!
    autocmd FileType * lua require('Comment.ft').set('dat', '; %s')
augroup END
]], false)
