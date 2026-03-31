vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		require("lazydev").setup({
			library = {
				"~/.local/share/nvim/lazy/",
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		})
	end,
})
