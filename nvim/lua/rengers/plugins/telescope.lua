return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'gbprod/yanky.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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

    local keymap_opts = { buffer = false, silent = true, noremap = true }
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>gg", ":Telescope live_grep<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", keymap_opts)

    vim.keymap.set("n", "<leader>e", ":Telescope find_files search_dirs=~/dotfiles<cr>", keymap_opts)

    local function telescope_grep()
      vim.cmd('Telescope live_grep default_text=' .. vim.fn.expand('<cword>'))
    end
    vim.keymap.set("n", "<leader>wg", telescope_grep, keymap_opts)

  end,
}
