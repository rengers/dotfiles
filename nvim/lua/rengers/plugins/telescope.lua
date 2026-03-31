return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'gbprod/yanky.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>gg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo comments" },
    { "<leader>e", "<cmd>Telescope find_files search_dirs=~/dotfiles<cr>", desc = "Dotfiles" },
    { "<leader>wg", function() vim.cmd('Telescope live_grep default_text=' .. vim.fn.expand('<cword>')) end, desc = "Grep word under cursor" },
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("yank_history")
    telescope.load_extension("notify")
    telescope.load_extension("todo-comments")
  end,
}
