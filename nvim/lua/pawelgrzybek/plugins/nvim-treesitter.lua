return { -- Highlight, edit, and navigate code

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	opts = {
		ensure_installed = {
			"astro",
			"bash",
			"css",
			"fish",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"rust",
			"scss",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		-- Autoinstall languages that are not installed
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<A-o>",
				node_incremental = "<A-o>",
				scope_incremental = "<A-O>",
				node_decremental = "<A-i>",
			},
		},
	},
}
