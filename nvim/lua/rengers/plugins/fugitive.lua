return {
    "tpope/vim-fugitive",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gs', ":Git<cr>", { noremap = true, silent = true });
      vim.opt.diffopt:append("vertical")

      local fug_group = vim.api.nvim_create_augroup("Fugitive hidden", { clear = true })
      vim.api.nvim_create_autocmd("BufReadPost", { pattern = "fugitive://*", command = "set bufhidden=delete", group = fug_group })

      vim.api.nvim_create_autocmd("BufEnter", { pattern = "gitcommit", command = "set bufhidden=delete", group = fug_group })
    end,
  }
