local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

local status_pu, packer_util = pcall(require, "packer.util")
if not status_pu then
	return
end

-- Packer configuration starts here
packer.startup({
  function(use)
    use({"wbthomason/packer.nvim"})

    use("b0o/schemastore.nvim") -- json schema provider

    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
      end,
    })

    use 'simrat39/rust-tools.nvim'

    -- use "rafamadriz/friendly-snippets" -- This adds a ton of snippets maybe look at later

    -- Snippet engine
    use({ "L3MON4D3/LuaSnip", after = "nvim-cmp",
      config = function()
        require("rengers.plugin-conf.snippets")
      end,
      --module = "luasnip",
    })


    use({
      "hrsh7th/nvim-cmp", -- autocomplete
      requires = {
        -- completion sources
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-nvim-lsp", },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp", },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp", },
        -- complements
        { "onsails/lspkind-nvim", after = "nvim-cmp", }, -- add the nice source + completion item kind to the menu
        { "lukas-reineke/cmp-under-comparator", after = "nvim-cmp", }, -- better ordering for things with underscores
      },

      config = function()
       -- require("rengers.plugin-conf.completion")
      end,
      --module = "cmp",
    })

    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim") -- bridge between LSP client and external formatters/linters, not full fledged language servers

    use 'RRethy/vim-illuminate' -- Nice auto highlighting
    use "lukas-reineke/indent-blankline.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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

    -- Look and theme
    use 'bluz71/vim-nightfly-guicolors'

    if packer_bootstrap then
      require("packer").sync()
    end

  end,

  config = {
    max_jobs = 16,
    --compile_path = packer_util.join_paths(vim.fn.stdpath('cache'), 'site', 'lua', 'packer_compiled.lua'),
  },

})
