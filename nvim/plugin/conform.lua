vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local util = require("conform.util")

require("conform").setup({
	formatters = {
		vp_fmt = {
			command = util.from_node_modules("vp"),
			args = { "fmt", "--stdin-filepath", "$FILENAME" },
			stdin = true,
			cwd = util.root_file({ "vite.config.ts", "vite.config.js", "vite.config.mjs" }),
			require_cwd = true,
			condition = function(_, ctx)
				return vim.fs.find("node_modules/.bin/vp", { path = ctx.dirname, upward = true })[1] ~= nil
			end,
		},
	},
	format_on_save = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		javascript = { "vp_fmt", "oxfmt", stop_after_first = true },
		javascriptreact = { "vp_fmt", "oxfmt", stop_after_first = true },
		typescript = { "vp_fmt", "oxfmt", stop_after_first = true },
		typescriptreact = { "vp_fmt", "oxfmt", stop_after_first = true },
		astro = { "prettier" },
		css = { "vp_fmt", "prettier", stop_after_first = true },
		scss = { "vp_fmt", "prettier", stop_after_first = true },
		html = { "vp_fmt", "prettier", stop_after_first = true },
		json = { "vp_fmt", "prettier", stop_after_first = true },
		yaml = { "vp_fmt", "prettier", stop_after_first = true },
		markdown = { "vp_fmt", "prettier", stop_after_first = true },
		graphql = { "vp_fmt", "prettier", stop_after_first = true },
		lua = { "stylua" },
		go = { "gofmt" },
		sql = { "sqruff" },
		proto = { "buf-format" },
	},
})
