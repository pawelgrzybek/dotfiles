return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			win_options = {
				colorcolumn = "",
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
				-- the default is <c-l>, which i use for window navigation
				-- also, r for refresh makes more sense to me
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
					desc = "Split (vertival)",
					mode = "n",
					opts = {
						vertical = true,
					},
				},
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle floating Oil buffer" })
	end,
	lazy = false,
}
