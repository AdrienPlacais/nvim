vim.cmd('let g:config_dir = stdpath("config")')
vim.cmd("execute 'source ' . g:config_dir . '/lua/configs/vimtex.vim'")


-- Function to insert \item automatically
local function insert_item()
   local line = vim.api.nvim_get_current_line()
   local pos = vim.api.nvim_win_get_cursor(0)

   if string.match(line, "^%s*\\item") then
      -- If the current line starts with \item, insert a new \item on the next line
      vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, { "\\item " })
      vim.api.nvim_win_set_cursor(0, { pos[1] + 1, 6 }) -- Position cursor after \item
   else
      -- Otherwise, just insert a newline and position the cursor at the correct location
      vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, { "" })
      vim.api.nvim_win_set_cursor(0, { pos[1] + 1, 0 })
   end
end
vim.g.vimtex_compiler_latexmk = {
   build_dir = 'build',
   options = {
      '-pdf',
      '-shell-escape',
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
   },
}

-- Map Shift+CR in LaTeX buffers
vim.api.nvim_exec([[
augroup LaTeXAutoItem
  autocmd!
  autocmd FileType tex inoremap <silent> <S-CR> <C-o>:lua insert_item()<CR>
augroup END
]], false)
