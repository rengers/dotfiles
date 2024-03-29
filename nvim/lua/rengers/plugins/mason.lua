return {
  'williamboman/mason.nvim',
  enabled = not onNix(),
  opts = {
    ensure_installed = {
      "gopls",
      "rust-analyzer",
      "lua-language-server"
    },
  },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },

  config = function ()
    local mason = require("mason")
    mason.setup()

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "cmake",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "nil_ls",
        "pyright",
        "rust_analyzer",
        "solargraph",
        "taplo",
        "tsserver",
        "yamlls"
      },
    })
  end
}
