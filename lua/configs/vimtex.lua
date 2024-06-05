vim.cmd('let g:config_dir = stdpath("config")')
vim.cmd("execute 'source ' . g:config_dir . '/lua/configs/vimtex.vim'")


-- Function to insert \item automatically
local function insert_item()
   local line = vim.api.nvim_get_current_line()
   local pos = vim.api.nvim_win_get_cursor(0)

   if string.match(line, "^%s*\\item") then
      -- If the current line starts with \item, insert a new \item on the next line
      vim.api.nvim_set_current_line(line .. "\n\\item ")
      vim.api.nvim_win_set_cursor(0, { pos[1] + 1, 7 }) -- Position cursor after \item
   else
      -- Otherwise, just insert a newline and position the cursor at the correct location
      vim.api.nvim_set_current_line(line:sub(1, pos[2]) .. "\n" .. line:sub(pos[2] + 1))
      vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] + 1 })
   end
end

-- Map Shift+CR in LaTeX buffers
vim.api.nvim_exec([[
augroup LaTeXAutoItem
  autocmd!
  autocmd FileType tex inoremap <silent> <S-CR> <C-o>:lua insert_item()<CR>
augroup END
]], false)
