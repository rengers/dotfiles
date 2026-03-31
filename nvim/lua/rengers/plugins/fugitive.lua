return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
  },
  config = function()
    vim.opt.diffopt:append("vertical")

    local fug_group = vim.api.nvim_create_augroup("Fugitive hidden", { clear = true })
    vim.api.nvim_create_autocmd("BufReadPost", { pattern = "fugitive://*", command = "set bufhidden=delete", group = fug_group })
    vim.api.nvim_create_autocmd("BufEnter", { pattern = "gitcommit", command = "set bufhidden=delete", group = fug_group })
  end,
}
