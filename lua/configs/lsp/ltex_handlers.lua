local config = require 'configs.lsp.ltex_config'
local handlers = require "vim.lsp.handlers"

local function populate_config(type, data)
    for k, vv in pairs(data) do
        for _, v in pairs(vv) do
            config.add_to_config(type, k, v)
        end
    end
end

local function on_workspace_executecommand(err, content, ctx)
    if ctx.params.command == "_ltex.addToDictionary" then
        local data = ctx.params.arguments[1].words
        populate_config("dictionary", data)
    elseif ctx.params.command == "_ltex.disableRules" then
        local data = ctx.params.arguments[1].ruleIds
        populate_config("disabledRules", data)
    elseif ctx.params.command == "_ltex.hideFalsePositives" then
        local data = ctx.params.arguments[1].falsePositives
        populate_config("hiddenFalsePositives", data)
    else
        handlers[ctx.method](err, content, ctx)
    end
end

return {
    on_workspace_executecommand = on_workspace_executecommand
}

