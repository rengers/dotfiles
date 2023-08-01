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
