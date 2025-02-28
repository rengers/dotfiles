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

if not vim.fn.has('nvim') then
  vim.opt.encoding = "utf8"
end

-- Set language
vim.cmd([[try | lang en_US | catch | endtry]])

vim.opt.fileformats = "unix,dos,mac" -- Default file types

-- Spell file
vim.opt.spellfile = "~/.vim/spell/en.utf-8.add"

-- Return cursor to last edit position in the buffer
vim.api.nvim_exec([[
  augroup RestoreCursor
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
]], false)

-- When vimrc is edited, reload it
vim.api.nvim_exec([[
  autocmd! bufwritepost vimrc,*.vim source $MYVIMRC
]], false)


-- Clipboard related
vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
