local cmp = require('cmp')
local luasnip = require('luasnip')

-- load vscode style snippets
require('luasnip.loaders.from_vscode')

cmp.setup({
   completion = {
      completeopt = 'menu,menuone,preview,noselect',
   },
   snippet = { -- configure how nvim-cmp interacts with other engines
   expand = function(args)
      luasnip.lps_expand(args.body)
   end,
},
mapping = cmp.mapping.preset.insert({
   ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
   ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
   ["<C-b>"] = cmp.mapping.scroll_docs(-4),
   ["<C-f>"] = cmp.mapping.scroll_docs(4),
   ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
   ["<C-e>"] = cmp.mapping.abort(), -- close completion window
   ["<CR>"] = cmp.mapping.confirm({ select = false }),
}),
-- sources for autocompletion
sources = cmp.config.sources({
   { name = "nvim_lsp"},
   { name = "luasnip" }, -- snippets
   { name = "buffer" }, -- text within current buffer
   { name = "path" }, -- file system paths
}),
})

