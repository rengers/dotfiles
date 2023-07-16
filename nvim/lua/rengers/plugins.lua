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


-- Packer configuration starts here
require('lazy').setup({

  "b0o/schemastore.nvim", -- json schema provider

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },


  {
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
  },

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
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "hrsh7th/nvim-cmp", -- autocomplete
    dependencies = {
      -- completion sources
      "hrsh7th/cmp-nvim-lsp" ,
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      -- complements
      "onsails/lspkind-nvim", -- add the nice source + completion item kind to the menu
      "lukas-reineke/cmp-under-comparator", -- better ordering for things with underscores
    },

    config = function()
       require("rengers.plugin-conf.completion")
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help"
    }
  },

  "tpope/vim-fugitive",

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("rengers.lsp_config")
    end,
  },

  -- Language specific
  { "lvimuser/lsp-inlayhints.nvim", branch = "anticonceal"},
  "jose-elias-alvarez/null-ls.nvim", -- bridge between LSP client and external formatters/linters, not full fledged language servers
  "fatih/vim-go",
  "rust-lang/rust.vim",
  "kblin/vim-fountain",
  "Shougo/ddx.vim",

  "RRethy/vim-illuminate", -- Nice auto highlighting
  "lukas-reineke/indent-blankline.nvim",
  "henrik/vim-indexed-search", -- show context on matches

  "ryanoasis/vim-devicons",
  "lewis6991/gitsigns.nvim",

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  "ggandor/leap.nvim",
  "preservim/tagbar",
  "mbbill/undotree",

  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- Look and theme
  'bluz71/vim-nightfly-guicolors',

  })



