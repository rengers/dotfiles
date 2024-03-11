require("rengers.utils")

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
vim.keymap.set("n", "<leader>W", ":silent w !sudo tee % > /dev/null<cr>", keymap_opts)

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

-- Bash like keys for the command line
vim.keymap.set("c", "<C-a>", "<Home>", {})
vim.keymap.set("c", "<C-e>", "<End>", {})

-- Key mappings for ToggleList
vim.api.nvim_set_keymap('n', '<leader>ll', [[<Cmd>lua ToggleList("Location List", 'l')<CR>]], {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ql', [[<Cmd>lua ToggleList("Quickfix List", 'c')<CR>]], {silent = true})

-- Key mapping for JSON formatting
vim.api.nvim_set_keymap("n", "=j", ":%!python -m json.tool<CR>", { silent = true })

-- Key mappings for profiling
vim.api.nvim_set_keymap("n", "<leader>p", ":lua StartProfiling()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>sp", ":exe \":profile pause\"<CR>:noautocmd qall!<CR>", { silent = true })

