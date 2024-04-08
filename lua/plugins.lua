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

-- Base lua functions, required by telescope
Plug('nvim-lua/plenary.nvim')

-- Fuzzy finder
Plug('nvim-telescope/telescope.nvim')

-- Nice exploration of git branchs
Plug('lewis6991/gitsigns.nvim')

-- LSP
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Folding
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo', { ['branch'] = master, ['run'] = 'yarn install --frozen-lockfile' })


vim.call('plug#end')
