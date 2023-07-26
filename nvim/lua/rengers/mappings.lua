-- First, map the terminal's escape sequence to <C-Left> (with recursive mapping)
local keymap_opts = { buffer = false, silent = true, noremap = true }

vim.g.mapleader = ","

vim.keymap.set("n", "<space>", ":noh<cr>", keymap_opts)

-- Motion related
vim.keymap.set("", "j", "gj", keymap_opts)
vim.keymap.set("", "k", "gk", keymap_opts)
vim.keymap.set("", "0", "^", keymap_opts)


-- Pane navigation
vim.keymap.set("n", "<C-Left>", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<C-n>", "<C-w>j", keymap_opts)
vim.keymap.set("n", "<C-e>", "<C-w>k", keymap_opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", keymap_opts)

vim.keymap.set("n", "<BS>", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", keymap_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", keymap_opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", keymap_opts)


-- Leader conveniance
vim.keymap.set("n", "<leader>q", ":q<cr>", keymap_opts)
vim.keymap.set("", "<leader><cr>", ":noh<cr>", keymap_opts)

-- Use the arrows to something usefull
vim.keymap.set("n", "<Right>", "l", keymap_opts)
vim.keymap.set("n", "<Left>", "h", keymap_opts)

-- When pressing <leader>cd switch to the directory of the open buffer
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>", keymap_opts)

-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<cr>", keymap_opts)

-- Fast editing of the .vimrc
vim.keymap.set("n", "<leader>e", ":e! ~/.vim/vimrc<cr>", keymap_opts)

-- Undo and redo in insert mode
vim.keymap.set("i", "<C-u>", "<C-o>u", keymap_opts)
vim.keymap.set("i", "<C-y>", "<C-o><C-R>", keymap_opts)

-- Spell check
vim.keymap.set("n", "<leader>z", "1z=", keymap_opts)

-- Buffer navigation
vim.keymap.set("n", "<leader><Left>", ":bprev<cr>", keymap_opts)
vim.keymap.set("n", "<leader><Right>", ":bnext<cr>", keymap_opts)

-- Location list
vim.keymap.set("n", "<leader>lp", ":lprev<cr>", keymap_opts)
vim.keymap.set("n", "<leader>ln", ":lnext<cr>", keymap_opts)

-- Close the current buffer
vim.keymap.set("n", "<leader>bd", ":Bclose<cr>", keymap_opts)
