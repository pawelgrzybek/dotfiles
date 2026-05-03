---@type vim.lsp.Config
return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"astro",
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescriptreact",
		"vue",
	},
	workspace_required = true,
	root_markers = {
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lockb",
		"bun.lock",
		"deno.lock",
	},
}
