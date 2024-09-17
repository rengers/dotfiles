return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup()
    vim.api.nvim_set_keymap('n', '<F5>', ":NvimTreeToggle<cr>", { noremap = true, silent = true });
  end,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
