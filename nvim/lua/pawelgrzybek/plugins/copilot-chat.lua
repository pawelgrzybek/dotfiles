return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup()

			-- this may not be needed in neovim 0.11
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt.completeopt = vim.opt.completeopt + "noinsert" + "noselect" + "menuone" + "popup"
				end,
			})

			-- this may not be needed in neovim 0.11
			vim.api.nvim_create_autocmd("BufLeave", {
				pattern = "copilot-*",
				callback = function()
					vim.opt.completeopt = vim.opt.completeopt - "noinsert" - "noselect" + "menuone" + "popup"
				end,
			})
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
}
