return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			python = { "flake8" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
		}

		-- Auto-run linting on save
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
