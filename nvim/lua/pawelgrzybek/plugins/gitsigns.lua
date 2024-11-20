return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame_opts = {
			delay = 300,
		},
	},
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { buffer = bufnr })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { buffer = bufnr })
			end,
		})
	end,
}
