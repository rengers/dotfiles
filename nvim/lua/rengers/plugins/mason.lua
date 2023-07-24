return {
  'williamboman/mason.nvim',
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
    require("mason").setup()
  end
}
