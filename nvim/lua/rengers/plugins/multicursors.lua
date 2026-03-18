return {
	"jake-stewart/multicursor.nvim",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		set({ "n", "v" }, "<leader>m", mc.matchAddCursor, { desc = "Add cursor on next match" })
		set({ "n", "v" }, "<leader>M", mc.matchSkipCursor, { desc = "Skip match, move to next" })
		set("n", "<Esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			end
		end)
		set("n", "<leader>ma", mc.alignCursors, { desc = "Align cursors" })
	end,
}
