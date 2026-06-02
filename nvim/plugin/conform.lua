vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		css = { "biome" },
		scss = { "biome" },
		html = { "biome" },
		json = { "biome" },
		yaml = { "biome" },
		markdown = { "biome" },
		graphql = { "biome" },
		lua = { "stylua" },
		go = { "gofmt" },
		sql = { "sqruff" },
		proto = { "buf-format" },
	},
})
