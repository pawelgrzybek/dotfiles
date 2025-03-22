return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				layout = {
					position = "right",
					ratio = 0.5,
				},
			},
			suggestion = {
				auto_trigger = true,
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				require("copilot.suggestion").dismiss()
				vim.b.copilot_suggestion_hidden = true
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuClose",
			callback = function()
				require("copilot.suggestion").next()
				vim.b.copilot_suggestion_hidden = false
			end,
		})
	end,
}
