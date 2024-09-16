return
{
  "nvim-lualine/lualine.nvim",
  config = function()
    package.loaded['lualine'] = nil
    -- Detect the OS
    local is_mac = jit.os == 'OSX'

    local lualine_config = {
      options = {
        component_separators = { left = '', right = ''}, -- Adjust these as needed
        section_separators = { left = '', right = ''}, -- Rounded edges
        theme = "catppuccin"
      },
      sections = { }
    }
    -- Add macOS-specific section if running on macOS
    if is_mac then
      lualine_config.sections.lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" }
    end

    require('lualine').setup(lualine_config)
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
}

