return {
  "fatih/vim-go",
  config = function()
    vim.g.go_fmt_command = "goimports"
    vim.g.go_def_mapping_enabled = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_auto_sameids = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_structs = 1
  end,
}
