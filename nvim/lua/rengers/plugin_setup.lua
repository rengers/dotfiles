vim.opt.list = true

--require("luasnip.loaders.from_vscode").lazy_load()

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults

vim.g.clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'


vim.api.nvim_set_keymap('n', '<F4>', ":UndotreeToggle<cr>", { noremap = true, silent = true });


-- Yankring:
vim.g.yankring_history_dir = "$HOME.'/.vim/"

-- Golang:
vim.g.go_fmt_command = "goimports"
vim.g.go_def_mapping_enabled = 1
vim.g.go_highlight_fields = 1
vim.g.go_auto_sameids = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_structs = 1

vim.g.pymode_options_max_line_length=100

-- Fugitive:
vim.api.nvim_set_keymap('n', '<leader>gs', ":Git<cr>", { noremap = true, silent = true });
vim.opt.diffopt:append("vertical")



