local ltex_config = require 'configs.lsp.ltex_config'
local ltex_handlers = require 'configs.lsp.ltex_handlers'

require("lspconfig").ltex.setup {
    on_init = function(client)
        client.config.settings.ltex = ltex_config.load_config()
    end,
    handlers = {
        ["workspace/executeCommand"] = ltex_handlers.on_workspace_executecommand,
    },
    settings = {
        ltex = ltex_config.load_config(),
    },
}

