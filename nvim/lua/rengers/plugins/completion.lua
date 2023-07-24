return {
  "hrsh7th/nvim-cmp", -- autocomplete
  dependencies = {
    -- completion sources
    "hrsh7th/cmp-nvim-lsp" ,
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    'saecki/crates.nvim',
    -- complements
    "onsails/lspkind-nvim", -- add the nice source + completion item kind to the menu
    "lukas-reineke/cmp-under-comparator", -- better ordering for things with underscores
  },

  config = function()
    local cmp = require('cmp')
    if not cmp then return end

    local lspkind = require('lspkind')

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            return vim_item
          end
        })
      },

      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Tab should accept always
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 30 },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", keyword_length = 3 }, -- don't complete from buffer right away
        { name = 'luasnip' }, -- For luasnip users.
        { name = "crates" }, -- rust.io crates
      }, {
        { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    -- Setup lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  end,
}
