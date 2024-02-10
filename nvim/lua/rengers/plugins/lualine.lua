return
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      package.loaded['lualine'] = nil
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = ''}, -- Adjust these as needed
          section_separators = { left = '', right = ''}, -- Rounded edges
          theme = "catppuccin"
        }
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  }
