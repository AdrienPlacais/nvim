local map = vim.keymap
local opt = { noremap = true, silent = false }
vim.g.doge_doc_standard_python = 'numpy'

-- map('n', '<leader>dg', ':DogeGenerate<CR>', opt)
vim.g.doge_enable_mappings = 0
vim.cmd [[
let g:doge_python_settings = {
\  'single_quotes': 0,
\  'omit_redundant_param_types': 0
\}
]]
-- Generate comment for current line
map.set('n', '<Leader>dg', '<Plug>(doge-generate)')
-- Interactive mode comment todo-jumping
map.set('n', '<C-j>', '<Plug>(doge-comment-jump-forward)', opt)
map.set('i', '<C-j>', '<Plug>(doge-comment-jump-forward)', opt)
map.set('x', '<C-j>', '<Plug>(doge-comment-jump-forward)', opt)
map.set('n', '<C-k>', '<Plug>(doge-comment-jump-backward)', opt)
map.set('i', '<C-k>', '<Plug>(doge-comment-jump-backward)', opt)
map.set('x', '<C-k>', '<Plug>(doge-comment-jump-backward)', opt)
