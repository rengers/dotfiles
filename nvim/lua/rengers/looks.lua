vim.cmd [[colorscheme catppuccin]]

vim.wo.number = true
vim.opt.laststatus=2 --always display status line
vim.wo.cursorline = true
vim.opt.showmode = false
vim.opt.foldlevel = 99

-- Set 7 lines to the cursor - when moving vertically
vim.opt.so = 7

vim.opt.ruler = true -- Always show current position

-- The command bar height
vim.opt.cmdheight = 2

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true
vim.opt.mat = 2 -- How many tenths of a second to blink

-- Highlight trailing space
vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")

local function set_extra_whitespace_match(pattern)
  vim.fn.matchadd('ExtraWhitespace', pattern)
end

local function clear_extra_whitespace_match()
  vim.fn.clearmatches()
end

local whitespace_group = vim.api.nvim_create_augroup("ExtraWhitespace", { clear = true })

-- Matching trailing space on different events
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*", callback = function() set_extra_whitespace_match('\\s\\+$') end, group = whitespace_group })
vim.api.nvim_create_autocmd("InsertEnter", { pattern = "*", callback = function() set_extra_whitespace_match('\\s\\+\\%#@<!$') end, group = whitespace_group })
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", callback = function() set_extra_whitespace_match('\\s\\+$') end, group = whitespace_group })
vim.api.nvim_create_autocmd("BufWinLeave", { pattern = "*", callback = clear_extra_whitespace_match, group = whitespace_group })


-- Ported from old config to set 24-bit RGB
--if vim.o.termguicolors then
  --vim.o.t_8f = "\\e[38;2;%lu;%lu;%lum"
  --vim.o.t_8b = "\\e[48;2;%lu;%lu;%lum"
  --vim.o.termguicolors = true
--end

-- Enable true color support
vim.opt.termguicolors = true

-- Set the ANSI color codes for 24-bit color in the terminal using Vimscript
vim.cmd [[
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
]]
