return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  keys = {
    { "<F5>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function()
    require("nvim-tree").setup()
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
