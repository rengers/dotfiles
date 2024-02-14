vim.cmd([[
  augroup lua_snippets
    autocmd!
    autocmd BufWritePost snippets.lua source <afile>
  augroup end
]])

local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynnode = ls.dynamic_node
local restnode = ls.restore_node

local lambda = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local partial = require("luasnip.extras").partial
local match = require("luasnip.extras").match
local nonempty = require("luasnip.extras").nonempty
local dynlambda = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

-- You can also use lazy loading so you only get in memory snippets of languages you use
require("luasnip/loaders/from_vscode").lazy_load() -- You can pass { path = "./my-snippets/"} as well

-- Load snippets from snippet file in config
local snippets_folder = vim.fn.stdpath "config" .. "/lua/config/snip/snippets/"

require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

ls.setup({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

local date = function() return {os.date('%Y-%m-%d')} end

ls.snippets = {}

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),

  },
  lua = {
    snip({
      trig = "snip",
      namr = "Snippet",
      dscr = "Create a new Snippet",
    },
    fmt([=[
    snip({{
      trig = "{1}",
      namr = "{2}",
      descr = "{3}",
    }},
    fmt([[
    {}
    ]])
    ),
    ]=], {
      insert(1, "trigger"),
      rep(1),
      rep(1),
      insert(2, "-- TODO"),
    })
    ),
    snip({
      trig = "keymap",
      namr = "keymap",
      descr = "Add a lua nvim keymap",
    },
    fmt([[vim.keymap.set("n", "{}", "{}", keymap_opts)]],
    {
      insert(1, "key"),
      insert(2, "mappping")
    })
    ),
  },
  go = {
    snip({
      trig = "iferr",
      namr = "if err not nil",
      descr = "if block checking for non-nil error",
    },
    fmt([[
    if err != nil {{
      {}
    }}
    ]], {
      insert(1, "return err")
    })
    ),
  },
})


local cmp = require('cmp')
if not cmp then return end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


--local luasnip = require("luasnip")

--cmp.setup({
--  mapping = cmp.mapping.preset.insert({
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      elseif has_words_before() then
--        cmp.complete()
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--  }),
--})
