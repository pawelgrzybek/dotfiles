return {
	cmd = { "vtsls", "--stdio" },
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
}
