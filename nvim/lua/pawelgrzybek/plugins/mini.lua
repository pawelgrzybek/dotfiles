return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup({
			n_lines = 500,
		})
		require("mini.surround").setup({})
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(),
			},
			symbol = "┆",
		})
		require("mini.pairs").setup({
			modes = { insert = true, command = true, terminal = false },
		})
	end,
}
