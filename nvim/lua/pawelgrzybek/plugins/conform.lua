return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			javascript = vim.fn.filereadable("deno.json") == 1 and {
				"deno_fmt",
			} or { "prettier" },
			javascriptreact = vim.fn.filereadable("deno.json") == 1 and {
				"deno_fmt",
			} or { "prettier" },
			typescript = vim.fn.filereadable("deno.json") == 1 and {
				"deno_fmt",
			} or { "prettier" },
			typescriptreact = vim.fn.filereadable("deno.json") == 1 and {
				"deno_fmt",
			} or { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
			go = { "gofmt" },
			sql = { "sqruff" },
		},
	},
}
