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
require('configs.coc')
require('configs.ufo')

-- Configure syntax highlighting
require('syntax.dat')
