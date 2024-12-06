return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	opts = {
		window = {
			width = 50,
		},
	},
	keys = {
		{ "\\", ":Neotree toggle last<CR>", desc = "[E]xplorer toggle", silent = true },
		{
			"|",
			function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd.wincmd("p")
				else
					vim.cmd("Neotree focus last")
				end
			end,
			desc = "[E]xplorer focus",
			silent = true,
		},
		{ "<leader>ef", ":Neotree filesystem focus reveal<CR>", desc = "[E]xplorer [f]iles", silent = true },
		{ "<leader>eb", ":Neotree buffers focus<CR>", desc = "[E]xplorer [b]uffers", silent = true },
		{ "<leader>eg", ":Neotree git_status focus<CR>", desc = "[E]xplorer [g]it status", silent = true },
	},
}
