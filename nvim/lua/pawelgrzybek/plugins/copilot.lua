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
	end,
}
