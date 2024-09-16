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
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.api.nvim_set_keymap('n', '<F5>', ":NvimTreeToggle<cr>", { noremap = true, silent = true });
    end,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Look and theme
  --{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  "rcarriga/nvim-notify",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },


}
