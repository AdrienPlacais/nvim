vim.g.mapleader = ','
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = false }

-- Allow to move in numbered lines as in displayed lines
map('n', 'k', 'gk', opt)
map('n', 'j', 'gj', opt)
map('n', '$', 'g$', opt)
map('n', '^', 'g^', opt)

-- Navigate between splits
map('n', '<C-J>', '<C-W><C-J>', opt)
map('n', '<C-K>', '<C-W><C-K>', opt)
map('n', '<C-L>', '<C-W><C-L>', opt)
map('n', '<C-H>', '<C-W><C-H>', opt)

-- Navigate between buffers
map('n', '<Tab>', '<cmd>bn<CR>', opt)
map('n', '<S-Tab>', '<cmd>bp<CR>', opt)

-- Close a buffer but keep window layout
-- https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', opt)
