require('mini.pairs').setup({
   -- TODO does not work as expected
   ['"""'] = { action = 'closeopen', pair = '""""""', neigh_pattern = '[^\\].', register = { cr = false } },
})
require('mini.starter').setup({
   header = 'Bonjoure',
})
