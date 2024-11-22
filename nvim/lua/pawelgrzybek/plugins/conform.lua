return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- javascript = { "deno_fmt" },
			-- javascriptreact = { "deno_fmt" },
			-- typescript = { "deno_fmt" },
			-- typescriptreact = { "deno_fmt" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
		},
	},
}
