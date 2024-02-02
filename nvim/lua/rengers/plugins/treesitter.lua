return {

  "nvim-treesitter/nvim-treesitter",

  dependencies = {
    "windwp/nvim-ts-autotag", -- auto rename html tags etc
    "JoosepAlviste/nvim-ts-context-commentstring", -- understand embedded comments
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,

  config = function()
    vim.opt.foldmethod = "expr" -- use function to determine folds,
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter for folding

    require("nvim-treesitter.configs").setup({
      -- either "all" or a list of languages
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "lua",
        "perl",
        "python",
        "regex",
        "ruby",
        "rust",
        "sql",
        "tsx",
        "typescript",
        "yaml",
      },
      highlight = {
        -- false will disable the whole extension
        enable = true,
      },
      indent = {
        enable = false, -- buggy :/
      },
      -- custom text objects
      textobjects = {
        -- change/delete/select in function or class
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
        -- easily move to next function/class
        move = {
          enable = true,
          set_jumps = true, -- track in jumplist (<C-o>, <C-i>)
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
        -- peek definitions from LSP
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
      autotag = {
        enable = true,
        filetypes = { "html", "vue" },
      },
    })
  end,
}
