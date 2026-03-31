return {
  url = "https://codeberg.org/andyg/leap.nvim",

  keys = {
    { "<leader>s", "<Plug>(leap-forward-to)", mode = "n", desc = "Leap forward" },
    { "<leader>S", "<Plug>(leap-backward-to)", mode = "n", desc = "Leap backward" },
    { "<leader>s", "<Plug>(leap-forward-to)", mode = "v", desc = "Leap forward" },
    { "<leader>S", "<Plug>(leap-backward-to)", mode = "v", desc = "Leap backward" },
    { "<leader>x", "<Plug>(leap-forward-till)", mode = "v", desc = "Leap forward till" },
    { "<leader>X", "<Plug>(leap-backward-till)", mode = "v", desc = "Leap backward till" },
  },

  config = function()
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',
      bold = true,
      nocombine = true,
    })
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end
}
