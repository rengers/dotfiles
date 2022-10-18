--require("rengers.autocmd") -- lua autocommands
local no_plugins = require("rengers.plugins") -- plugins
--require("rengers.mappings") -- keymaps
--
--if no_plugins then return end
require("rengers.lsp_config") -- LSP configs
require("rengers.treesitter") -- treesitter configs
require("rengers.rust_tools") -- rust_tools setup
require("rengers.plugin_setup") -- setup general plugins
require("rengers.plugin-conf")
