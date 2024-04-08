local vim = vim local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Nice line at the bottom of the editor, with additional icons
Plug('nvim-lualine/lualine.nvim')
Plug 'nvim-tree/nvim-web-devicons'

-- Colorscheme
Plug('ellisonleao/gruvbox.nvim')

-- Comments
Plug('numToStr/Comment.nvim')

-- Finder/previewer, optional for telescope
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Fuzzy finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- Helper functions, nice interface with telescope
Plug('stevearc/dressing.nvim')

-- Nice exploration of git branchs
Plug('lewis6991/gitsigns.nvim')

-- Autocompletion
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v2.*' })
Plug('saadparwaiz1/cmp_luasnip')
Plug('rafamadriz/friendly-snippets')
Plug('hrsh7th/nvim-cmp')

-- To manage LSP
Plug('antosha417/nvim-lsp-file-operations')  -- rename files
Plug('hrsh7th/cmp-nvim-lsp')
Plug('williamboman/mason-lspconfig.nvim')
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')

-- LSP
-- Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Folding
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo', { ['branch'] = master, ['run'] = 'yarn install --frozen-lockfile' })
--
--
vim.call('plug#end')
