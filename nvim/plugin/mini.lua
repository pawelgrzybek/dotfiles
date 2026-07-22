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

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

vim.keymap.set("n", "<leader>-", function()
	local mf = require("mini.files")
	if not mf.close() then
		mf.open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Open mini files" })

vim.api.nvim_set_hl(0, "MiniTablineTabpagesection", { ctermbg = 4, ctermfg = 0 })
