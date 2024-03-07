return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'gbprod/yanky.nvim',
  },

  config = function()

    --extensions
    require("telescope").load_extension("yank_history")
    require("telescope").load_extension("notify")

    -- key bindings
    local keymap_opts = { buffer = false, silent = true, noremap = true }
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>gg", ":Telescope live_grep<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", keymap_opts)
    vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", keymap_opts)

    local function telescope_grep()
      vim.cmd('Telescope live_grep default_text=' .. vim.fn.expand('<cword>'))
    end
    vim.keymap.set("n", "<leader>wg", telescope_grep, keymap_opts)

  end,
}
