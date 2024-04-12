vim.opt.colorcolumn = "79"

-- Function to open terminal and run current python file with F5
-- Exit with Ctrl \    Ctrl N     :q
local function run_curr_python_file()
   -- Get file name in the current buffer
   local file_name = vim.api.nvim_buf_get_name(0)

   -- Get terminal codes for running python file
   -- ("i" to enter insert before typing rest of the command)
   local py_cmd = vim.api.nvim_replace_termcodes("ipython \"" .. file_name .. "\"<cr>", true, false, true)

   -- Determine terminal window split and launch terminal
   local percent_of_win = 0.4
   local curr_win_width = vim.api.nvim_win_get_width(0)           -- Current window height
   local term_width = math.floor(curr_win_width * percent_of_win) -- Terminal width
   -- vim.cmd(":vsplit " .. term_width .. "vsplit | term")             -- Launch terminal (vertical split)
   vim.cmd(":" .. term_width .. "vsplit | term")                  -- Launch terminal (vertical split)

   -- Press keys to run python command on current file
   vim.api.nvim_feedkeys(py_cmd, "t", false)
end

vim.keymap.set({ 'n' }, '<F5>', '', {
   desc = "Run .py file via Neovim built-in terminal",
   callback = run_curr_python_file
})


local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = false }
-- Format
map('n', '<Leader>fc', 'bi:class:`<Esc>ea`<Esc>', opt)
