return {

	"b0o/schemastore.nvim", -- json schema provider

	-- Snippet engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"nvim-cmp",
		},
		config = function()
			require("rengers.plugin-conf.snippets")
		end,
	},

	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("rengers.lsp_config")
		end,
	},

	-- Language specific
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
	"rust-lang/rust.vim",
	"kblin/vim-fountain",
	"Shougo/ddx.vim",
	{
		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "0.3.*",
		build = function()
			require("typst-preview").update()
		end,
	},

	"RRethy/vim-illuminate",

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.api.nvim_set_keymap("n", "<F4>", ":UndotreeToggle<cr>", { noremap = true, silent = true })
		end,
	},

	-- Look and theme
	"rcarriga/nvim-notify",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Navigation & editing
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "^2",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({ check_ts = true })
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
		},
		opts = {},
	},
}
