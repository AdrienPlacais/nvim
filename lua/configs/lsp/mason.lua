-- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require('mason-tool-installer')

-- enable mason and configure icons
mason.setup({
   ui = {
      icons = {
         package_installed = "✓",
         package_pending = "➜",
         package_uninstalled = "✗",
      },
   },
})

mason_lspconfig.setup({
   -- list of servers for mason to install
   ensure_installed = {
      "ltex",
      "lua_ls",
      "marksman",
      "pyright",
      "taplo",
      "texlab"
   },
   automatic_installation = true,
})
mason_tool_installer.setup({
   ensure_installed = {
      -- Formatters
      "black",
      "isort",
      "latexindent",
      "prettier",
      -- Linters
      "rstcheck",
   },
})
