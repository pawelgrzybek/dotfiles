return {

	"echasnovski/mini.nvim",
	version = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
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
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
	end,
}
