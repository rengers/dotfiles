return {

  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",

  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  config = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "c", "comment", "cpp", "css", "diff", "gitcommit",
        "go", "html", "javascript", "jsdoc", "lua", "perl", "python",
        "regex", "ruby", "rust", "sql", "tsx", "typescript", "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["))"] = "@class.outer",
          },
          goto_next_end = {
            ["[]"] = "@function.outer",
            ["()"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["(("] = "@class.outer",
          },
          goto_previous_end = {
            ["]["] = "@function.outer",
            [")("] = "@class.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = "single",
          peek_definition_code = {
            ["<Leader>pf"] = "@function.outer",
            ["<Leader>pc"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<Leader>l"] = "@parameter.inner",
          },
          swap_previous = {
            ["<Leader>h"] = "@parameter.outer",
          },
        },
      },
    })
  end,
}
