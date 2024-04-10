local cmp = require('cmp')
local luasnip = require('luasnip')

-- load vscode style snippets
require('luasnip.loaders.from_vscode').lazy_load()
-- load docstring python
require('luasnip').filetype_extend("python", { "pydoc" })

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
      ["<C-Space>"] = cmp.mapping.complete(),             -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(),                    -- close completion window
      --
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item (nothing if no item is selected)
      --
      ['<C-j>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.confirm({ select = false }) -- <CR> behavior. To go to next node, needs to <C-e> first
         elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)                 -- Go to next node
         else
            fallback()
         end
      end, { "i", "s" }),
   }),
   -- sources for autocompletion
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
