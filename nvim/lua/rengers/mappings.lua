-- First, map the terminal's escape sequence to <C-Left> (with recursive mapping)
local keymap_opts = { buffer = false, silent = true, noremap = true }

-- Pane navigation
vim.keymap.set("n", "<C-Left>", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<C-n>", "<C-w>j", keymap_opts)
vim.keymap.set("n", "<C-e>", "<C-w>k", keymap_opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", keymap_opts)



-- Leader conveniance
vim.keymap.set("n", "<leader>q", ":q<cr>", keymap_opts)
