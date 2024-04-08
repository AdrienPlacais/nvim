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
