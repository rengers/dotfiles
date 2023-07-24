vim.opt.list = true

--require("luasnip.loaders.from_vscode").lazy_load()

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults

vim.g.clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

-- Yankring:
vim.g.yankring_history_dir = "$HOME.'/.vim/"

