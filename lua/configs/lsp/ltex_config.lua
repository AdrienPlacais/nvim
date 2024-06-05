local util = require "lspconfig.util"

local filename = vim.fn.expand("~/.config/nvim/ltex_config.json")
local dictionary_file = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")

local function read_dictionary(file)
   local dict = {}
   local f = io.open(file, "r")
   if f then
      for line in f:lines() do
         table.insert(dict, line)
      end
      f:close()
   end
   return dict
end

local function load_config()
   local file = io.open(filename, "r")
   local config
   if file then
      config = vim.json.decode(file:read "a")
      file:close()
   else
      config = { dictionary = {}, disabledRules = {}, hiddenFalsePositives = {} }
   end

   config.dictionary["en-US"] = read_dictionary(dictionary_file)

   return config
end

local function update_config()
   local ltex = util.get_active_client_by_name(0, "ltex")
   local config = load_config()
   if ltex then
      ltex.config.settings.ltex = config
      ltex.request("workspace/didChangeConfiguration", { settings = ltex.config.settings }, function(err, result) end)
   end
end

local function add_to_config(type, lang, value)
   local config = load_config()
   if not config[type] then
      config[type] = {}
   end

   local key = config[type][lang]
   if key then
      if not vim.tbl_contains(key, value) then
         table.insert(key, value)
      end
   else
      config[type][lang] = { value }
   end

   local file = io.open(filename, "w")
   if file then
      file:write(vim.json.encode(config))
      file:close()
   end
   update_config()
end

return {
   load_config = load_config,
   update_config = update_config,
   add_to_config = add_to_config
}
