return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			win_options = {
				cursorcolumn = true,
			},
			columns = {},
			float = {
				padding = 3,
				border = "single",
			},
			confirmation = {
				border = "single",
			},
			progress = {
				border = "single",
			},
			keymaps_help = {
				border = "single",
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "_", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
	lazy = false,
}
