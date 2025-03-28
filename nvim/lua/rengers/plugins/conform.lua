return {
	"stevearc/conform.nvim", -- Provides formatting support
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				--python = { "black" }, -- flake8 is for linting, black for formatting
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file" })
	end,
}
