return {
  "ggandor/leap.nvim",

  config = function()
    --require('leap').add_default_mappings()
    -- mappings
    local keymap_opts = { buffer = false, silent = true, noremap = true }
    vim.keymap.set("n", "<leader>s", "<Plug>(leap-forward-to)", keymap_opts)
    vim.keymap.set("n", "<leader>S", "<Plug>(leap-backward-to)", keymap_opts)
    vim.keymap.set("v", "<leader>s", "<Plug>(leap-forward-to)", keymap_opts)
    vim.keymap.set("v", "<leader>S", "<Plug>(leap-backward-to)", keymap_opts)
    vim.keymap.set("v", "<leader>x", "<Plug>(leap-forward-till)", keymap_opts)
    vim.keymap.set("v", "<leader>X", "<Plug>(leap-backward-till)", keymap_opts)

    -- The below settings make Leap's highlighting a bit closer to what you've been
    -- used to in Lightspeed.
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',  -- for light themes, set to 'black' or similar
      bold = true,
      nocombine = true,
    })
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end
}
