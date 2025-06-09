return {

	"echasnovski/mini.nvim",
	version = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- ai
		require("mini.ai").setup({
			n_lines = 500,
		})

		-- surround
		require("mini.surround").setup({})

		-- indentscope
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(),
			},
			symbol = "┆",
		})

		-- pairs
		require("mini.pairs").setup({})

		-- comment
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
