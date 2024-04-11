-- Load plugins
require('plugins')

-- Generic settings
require('globals')
require('keybindings')

-- Configure plugins

require('configs.lualine')
require('configs.colorscheme')
require('configs.telescope')
require('configs.comment')
require('configs.gitsigns')
require('configs.ufo')

require('configs.nvim-cmp')
require('configs.lsp.mason')
require('configs.lsp.lspconfig')

require('configs.formatting')

require('configs.doge')

-- Configure syntax highlighting
require('syntax.dat')
