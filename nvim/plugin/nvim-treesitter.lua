local languages = {
	"astro",
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
	"query",
	"regex",
	"scss",
	"sql",
	"tsx",
	"typescript",
	"yaml",
}

vim.api.nvim_create_autocmd("FileType", { -- enable treesitter highlighting and indents
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if vim.treesitter.language.add(lang) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.treesitter.start()
		end
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

local ts = require("nvim-treesitter")

ts.install(languages)

-- equivalent to :TSUpdate
ts.update("all")

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		ts.update()
	end,
})
