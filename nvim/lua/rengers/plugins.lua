-- This file can be loaded by calling `lua require('plugins')` from your init.vim

--local lsp_filetypes = require("rengers.lsp_config")

-- Init setup
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require('packer.util')

-- Packer configuration starts here
packer.startup({
  function(use)
    use({"wbthomason/packer.nvim", opt = true})

    use("b0o/schemastore.nvim") -- json schema provider

    use({
      "nvim-treesitter/nvim-treesitter", -- treesitter
      run = ":TSUpdate",
    })

    use 'simrat39/rust-tools.nvim'

    use({
      "hrsh7th/nvim-cmp", -- autocomplete
      requires = {
        -- completion sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-vsnip",
        -- complements
        "onsails/lspkind-nvim", -- add the nice source + completion item kind to the menu
        "lukas-reineke/cmp-under-comparator", -- better ordering for things with underscores
      },
      config = function() require("rengers.plugin-conf.completion") end,
      module = "cmp",
    })

    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('rengers.lsp_config')]] })
    use("jose-elias-alvarez/null-ls.nvim") -- bridge between LSP client and external formatters/linters, not full fledged language servers

    use 'RRethy/vim-illuminate' -- Nice auto highlighting
    use "lukas-reineke/indent-blankline.nvim"

    use "kyazdani42/nvim-web-devicons"

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use "ggandor/leap.nvim"

  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
