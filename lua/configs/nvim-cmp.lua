local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load vscode style snippets
require('luasnip.loaders.from_vscode').lazy_load(
   { paths = "/home/placais/.config/nvim/snippets/" }
)

-- Clear old nodes, cf https://www.reddit.com/r/neovim/comments/yiimig/cmp_luasnip_jump_points_strange_behaviour/
luasnip.config.set_config({
   region_check_events = 'InsertEnter',
   delete_check_events = 'InsertLeave'
})

cmp.setup({
   snippet = { -- configure how nvim-cmp interacts with other engines
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      -- Scrollers
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),

      -- Accept currently selected item or go to next placeholder
      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      -- Navigate snippets or confirm completion
      ['<C-j>'] = cmp.mapping(function(fallback)
         if luasnip.expand_or_jumpable(1) then
            luasnip.expand_or_jump(1)
         elseif cmp.visible() then
            cmp.confirm({ select = false })
         else
            fallback()
         end
      end, { "i", "s" }),
      ['<C-k>'] = cmp.mapping(function(fallback)
         if luasnip.expand_or_jumpable(-1) then
            luasnip.expand_or_jump(-1)
         else
            fallback()
         end
      end, { "i", "s" }),
   }), -- sources for autocompletion
   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- snippets
      { name = "buffer" },  -- text within current buffer
      { name = "path" },    -- file system paths
   }),
   completion = {
      completeopt = 'menu,menuone,preview,noselect',
   },
})
