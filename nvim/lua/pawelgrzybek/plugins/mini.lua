return {

	"nvim-mini/mini.nvim",
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

		-- tabline
		require("mini.tabline").setup({})

		-- pairs
		require("mini.pairs").setup({})

		-- notify
		require("mini.notify").setup({})

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
