local keyset = vim.keymap.set
keyset('n', 'ga', '<Plug>(coc-codeaction-line)', {silent = True})
keyset('x', 'ga', '<Plug>(coc-codeaction-selected)', {silent = True})
keyset('n', 'gA', '<Plug>(coc-codeaction)', {silent = True})
