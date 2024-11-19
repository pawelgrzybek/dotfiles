return {
	"rebelot/kanagawa.nvim",
	lazy = false, -- load during startup
	priority = 1000, -- load this before other colorschemes
	config = function()
		-- Optional: configure the colorscheme
		require("kanagawa").setup({
			-- you can add configuration options here
			-- leave empty for default settings
		})

		-- Optional: set the colorscheme
		vim.cmd("colorscheme kanagawa")
	end,
}
