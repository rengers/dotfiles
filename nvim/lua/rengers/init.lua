local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("rengers.plugins") -- plugins

require("rengers.looks") -- Look and feel
require("rengers.lsp_config") -- LSP configs
require("rengers.plugin_setup") -- setup general plugins
require("rengers.plugin-conf")
require("rengers.mappings")
