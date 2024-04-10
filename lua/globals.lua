-- Line numbering
vim.opt.number = true

-- Tabs
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

-- New filetypes
vim.filetype.add({
   extension = {
      ['dat'] = 'dat',
      ['out'] = 'out',
      ['sty'] = 'tex',
      ['tikz'] = 'tex',
   },
})

-- Symbols
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- Always keep 3 lines above/under cursor
vim.opt.scrolloff = 3

vim.wo.wrap = false
