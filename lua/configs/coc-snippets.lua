local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Use <C-l> for trigger snippet expand.
-- keyset('i', '<C-l>', '<Plug>(coc-snippets-expand)', opts)

-- Use <C-j> for select text for visual placeholder of snippet.
-- keyset('v', '<C-j>', '<Plug>(coc-snippets-select)', opts)

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
-- let g:coc_snippet_next = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
-- let g:coc_snippet_prev = '<c-k>'

-- Use <C-j> for both expand and jump (make expand higher priority.)
-- keyset('i', '<C-j>', '<Plug>(coc-snippets-expand-jump)', opts)

-- Use <leader>x for convert visual selected code to snippet
-- keyset('x', '<leader>x', ' <Plug>(coc-convert-snippet)', opts)

vim.g.ultisnips_python_style = "numpy"
-- vim.cmd [[let g:ultisnips_python_style = "numpy"]]
