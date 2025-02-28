return{

  "b0o/schemastore.nvim", -- json schema provider


  'simrat39/rust-tools.nvim',

  -- use "rafamadriz/friendly-snippets" -- This adds a ton of snippets maybe look at later

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "nvim-cmp",
    },
    config = function()
      require("rengers.plugin-conf.snippets")
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help"
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("rengers.lsp_config")
    end,
  },

  -- Language specific
  { "lvimuser/lsp-inlayhints.nvim", branch = "anticonceal"},
  "jose-elias-alvarez/null-ls.nvim", -- bridge between LSP client and external formatters/linters, not full fledged language servers

  "rust-lang/rust.vim",
  "kblin/vim-fountain",
  "Shougo/ddx.vim",
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '0.3.*',
    build = function() require 'typst-preview'.update() end,
  },

  "RRethy/vim-illuminate", -- Nice auto highlighting

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()
      require("ibl").setup()
    end,
  },
  "henrik/vim-indexed-search", -- show context on matches
  {
    "preservim/tagbar",
    config = function()
      vim.keymap.set("n", "<F8>", ":TagbarToggle<cr>", { noremap = true, silent = true })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.api.nvim_set_keymap('n', '<F4>', ":UndotreeToggle<cr>", { noremap = true, silent = true });
    end,
  },

  -- Look and theme
  --{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  "rcarriga/nvim-notify",
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
  }



}
