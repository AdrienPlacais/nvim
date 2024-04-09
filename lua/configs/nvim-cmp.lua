local cmp = require('cmp')
local luasnip = require('luasnip')

-- load vscode style snippets
require('luasnip.loaders.from_vscode').load()

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
   ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
   ["<C-e>"] = cmp.mapping.abort(), -- close completion window
   --
   ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   -- old
   -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
   -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
   -- ["<C-j>"] = cmp.mapping(function(fallback)
   --    if cmp.visible() then
   --       cmp.select_next_item()
   --    elseif luasnip.locally_jumpable(1) then
   --       luasnip.jump(1)
   --    else
   --       fallback()
   --    end
   -- end, { "i", "s" }),
   -- ["<C-l>"] = cmp.mapping.confirm(function(fallback)
   --    if cmp.visible() then
   --       cmp.confirm()
   --    else
   --       fallback()
   --    end
   -- end),

   -- ['<C-l>'] = cmp.mapping(function(fallback)
   --    if cmp.visible() then
   --       if luasnip.expandable() then
   --          luasnip.expand()
   --       else
   --          cmp.confirm({
   --             select = true,
   --          })
   --       end
   --    else
   --       fallback()
   --    end
   -- end),
--    ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--          cmp.select_next_item()
--       elseif luasnip.locally_jumpable(1) then
--          luasnip.jump(1)
--       else
--          fallback()
--       end
--    end, { "i", "s" }),
--
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--          cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--          luasnip.jump(-1)
--       else
--          fallback()
--       end
--    end, {'i', 's'})
}),
   -- sources for autocompletion
   sources = cmp.config.sources({
      { name = "nvim_lsp"},
      { name = "luasnip" }, -- snippets
      { name = "buffer" }, -- text within current buffer
      { name = "path" }, -- file system paths
   }),
   -- completion = {
   --    completeopt = 'menu,menuone,preview,noselect',
   -- },
})

