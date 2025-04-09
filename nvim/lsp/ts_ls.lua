return {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = {
		"package.json",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayVariableTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
			importModuleSpecifierPreference = "non-relative",
		},
	},
	on_attach = function(client)
		if client.config.root_dir == nil then
			client.stop(client, true)
			return
		end

		local denoJsonExists = vim.fn.filereadable(client.config.root_dir .. "/package.json") == 1
		if denoJsonExists == false then
			client.stop(client, true)
		end
	end,
}
