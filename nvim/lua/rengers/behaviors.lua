vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Try to set the undo directory and enable undofile
local undodir = vim.fn.expand("~/.vim/undodir")
local ok, _ = pcall(function()
	vim.o.undodir = undodir
	vim.o.undofile = true
end)
if not ok then
	vim.api.nvim_err_writeln("Failed to set undodir. Please ensure the directory exists: " .. undodir)
end

-- Change buffer - without saving
vim.opt.hidden = true

-- Set backspace config
vim.opt.backspace = "eol,start,indent"
vim.opt.whichwrap:append("<,>,h,l")

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search things
vim.opt.hlsearch = true

-- Make search act like search in modern browsers
vim.opt.incsearch = true

-- Set magic on, for regular expressions
vim.opt.magic = true

-- No sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Timeouts and updates
vim.opt.timeoutlen = 500
vim.opt.updatetime = 100

-- Specify the behavior when switching between buffers
vim.opt.switchbuf = "usetab"
vim.opt.stal = 1

-- Enable mouse
vim.opt.mouse = "a"

-- Set to auto-read when a file is changed from the outside
vim.opt.autoread = true

-- Sets how many lines of history VIM has to remember
vim.opt.history = 700

-- Text, tab and indent, encoding related
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true

vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.autoindent = true -- Auto indent
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = true -- Wrap lines

if not vim.fn.has("nvim") then
	vim.opt.encoding = "utf8"
end

-- Set language
vim.cmd([[try | lang en_US | catch | endtry]])

vim.opt.fileformats = "unix,dos,mac" -- Default file types

-- Spell file
vim.opt.spellfile = "~/.vim/spell/en.utf-8.add"

-- Return cursor to last edit position in the buffer
vim.api.nvim_exec(
	[[
  augroup RestoreCursor
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
]],
	false
)

-- When vimrc is edited, reload it
vim.api.nvim_exec(
	[[
  autocmd! bufwritepost vimrc,*.vim source $MYVIMRC
]],
	false
)

-- Clipboard related
--[[
📌 Neovim Clipboard & OSC-52 Summary

| Method                      | Works Locally?  | Works Over SSH?     | Notes                                        |
|-----------------------------|-----------------|---------------------|----------------------------------------------|
| Default (`yy`, `p`)         | ✅ Internal buf | ✅ Internal buf     | No system clipboard access                   |
| `"*y`, `"*p`                | ✅ (Linux only) | 🚫                  | Uses PRIMARY selection (middle mouse paste)  |
| `"+y`, `"+p`                | ✅ (All OS)     | 🚫 (without OSC-52) | Uses SYSTEM clipboard (Ctrl/Cmd + C & V)     |
| `set clipboard=unnamedplus` | ✅ (macOS/Win)  | 🚫 (without OSC-52) | Makes `yy`, `p` use system clipboard         |
| **OSC-52**                  | 🚫              | ✅                  | Copies from SSH Neovim to local clipboard    |

📌 Recommended Setup:

🔹 For **local use (Mac/Linux/Windows)**:
  set clipboard=""

🔹 For **remote SSH use**, enable **OSC-52**:
  if vim.env.SSH_TTY then
    require("osc52").setup({ silent = true })
    vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
    vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)
  end

🚀 Now, yy stays in Neovim, "+y yanks to system clipboard, and SSH yanks work!
--]]

-- Ensure we do NOT use unnamedplus so `yy` stays in Neovim
vim.opt.clipboard = ""

-- Keybinds for explicit system clipboard usage
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { noremap = true, silent = true, desc = "Yank line to system clipboard" })

-- Enable OSC-52 only when in SSH (remote Neovim)
if vim.env.SSH_TTY then
	require("osc52").setup({ silent = true })
	vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
	vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)
end
