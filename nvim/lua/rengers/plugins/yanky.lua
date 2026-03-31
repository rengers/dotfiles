return {
  "gbprod/yanky.nvim",
  keys = {
    { "p", "<Plug>(YankyPutAfter)", mode = {"n", "x"} },
    { "P", "<Plug>(YankyPutBefore)", mode = {"n", "x"} },
    { "gp", "<Plug>(YankyGPutAfter)", mode = {"n", "x"} },
    { "gP", "<Plug>(YankyGPutBefore)", mode = {"n", "x"} },
    { "<c-n>", "<Plug>(YankyCycleForward)" },
    { "<c-p>", "<Plug>(YankyCycleBackward)" },
  },
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      picker = {
        select = {
          action = nil,
        },
        telescope = {
          use_default_mappings = true,
          mappings = nil,
        },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
      preserve_cursor_position = {
        enabled = true,
      },
    })
  end,
}
