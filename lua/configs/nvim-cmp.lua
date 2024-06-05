local cmp = require('cmp')
local luasnip = require('luasnip')

-- load vscode style snippets
require('luasnip.loaders.from_vscode').lazy_load(
   { paths = "/home/placais/.config/nvim/snippets/" }
)

-- load docstring python (commented out, use neogen instead)
-- require('luasnip').filetype_extend("python", { "pydoc" })

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
         if luasnip.jumpable(1) then
            luasnip.jump(1)
         elseif cmp.visible() then
            cmp.confirm({ select = false })
         else
            fallback()
         end
      end, { "i", "s" }),
      ['<C-k>'] = cmp.mapping(function(fallback)
         if luasnip.jumpable(-1) then
            luasnip.jump(-1)
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
