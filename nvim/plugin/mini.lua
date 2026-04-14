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
require("mini.comment").setup({})

-- files
require("mini.files").setup({
	windows = {
		width_focus = 50,
		width_nofocus = 50,
	},
})

vim.keymap.set("n", "<leader>-", require("mini.files").open, { desc = "Open mini files" })
