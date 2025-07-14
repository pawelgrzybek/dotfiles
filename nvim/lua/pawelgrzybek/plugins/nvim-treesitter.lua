---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"comment",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"fish",
				"git_config",
				"gitcommit",
				"gitignore",
				"go",
				"graphql",
				"html",
				"javascript",
				"jq",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"mermaid",
				"proto",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-o>",
					node_incremental = "<A-o>",
					scope_incremental = "<A-O>",
					node_decremental = "<A-i>",
				},
			},
		})
	end,
}
