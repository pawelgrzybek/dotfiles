return {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { "package.json" },
	workspace_required = true,
	---@diagnostic disable-next-line: unused-local
	-- root_dir = function(bufnr, on_dir)
	-- 	local root_path = vim.fs.find("package.json", {
	-- 		upward = true,
	-- 		type = "file",
	-- 		path = vim.fn.getcwd(),
	-- 	})[1]
	-- 	if root_path then
	-- 		on_dir(vim.fn.fnamemodify(root_path, ":h"))
	-- 	end
	-- end,
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
}
