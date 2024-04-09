vim.g.mapleader = ','
local map = vim.api.nvim_set_keymap

-- Allow to move in numbered lines as in displayed lines
map('n', 'k', 'gk', { noremap = true, silent = false })
map('n', 'j', 'gj', { noremap = true, silent = false })
map('n', '$', 'g$', { noremap = true, silent = false })
map('n', '^', 'g^', { noremap = true, silent = false })

-- Navigate between splits
map('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = false })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = false })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = false })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = false })

-- Navigate between buffers
map('n', '<C-]>', '<cmd>bn<CR>', { noremap = true, silent = false })
map('n', '<C-[>', '<cmd>bp<CR>', { noremap = true, silent = false })

-- Close a buffer but keep window layout
-- https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true, silent = false })
