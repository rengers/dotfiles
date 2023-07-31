local go_group = vim.api.nvim_create_augroup("Golang format", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*.go", command = "setlocal noet ts=4 sw=4 sts=4", group = go_group })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.go", command = "setlocal noet ts=4 sw=4 sts=4", group = go_group })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*.go", command = "silent! !ctags -R &", group = go_group })


local md_group = vim.api.nvim_create_augroup("Markdown format", { clear = true })
-- Turn on spelling for markdown files
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "setlocal spell", group = md_group })


-- Ensure the git commit buffer cursor is reset
local git_commit_group = vim.api.nvim_create_augroup("GitCommitEdit", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "COMMIT_EDITMSG",
      callback = function()
        vim.fn.setpos('.', {0, 1, 1, 0})
      end,
      group = git_commit_group,
      once = true
    })
  end,
  group = git_commit_group
})
