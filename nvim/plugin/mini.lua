vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

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
	-- TODO: on 0.12 this fails
	-- will need to find a way for smooth ts/tsx commenting
	-- options = {
	-- 	custom_commentstring = function()
	-- 		return require("ts_context_commentstring.internal").calculate_commentstring()
	-- 			or vim.bo.commentstring
	-- 	end,
	-- },
})
