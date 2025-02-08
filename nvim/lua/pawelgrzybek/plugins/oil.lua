return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
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
	},
	lazy = false,
}
