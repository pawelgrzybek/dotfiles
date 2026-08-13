vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	win_options = {
		colorcolumn = "",
	},
	columns = {},
	float = {
		padding = 3,
	},
	watch_for_changes = true,
	keymaps = {
		-- i use these two for window navigation
		["<C-l>"] = false,
		["<C-h>"] = false,
		-- the default is <c-l>, which i use for window navigation
		-- also, r for refresh makes more sense to me
		["<C-r>"] = {
			callback = "actions.refresh",
			desc = "Refresh oil",
			mode = "n",
		},
		["<C-s>"] = {
			callback = "actions.select",
			desc = "Split (horizontal)",
			mode = "n",
			opts = {
				horizontal = true,
			},
		},
		["<C-v>"] = {
			callback = "actions.select",
			desc = "Split (vertical)",
			mode = "n",
			opts = {
				vertical = true,
			},
		},
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
