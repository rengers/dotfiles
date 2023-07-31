return {
    "tpope/vim-fugitive",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gs', ":Git<cr>", { noremap = true, silent = true });
      vim.opt.diffopt:append("vertical")
    end,
  }
