return {
	cmd = { "deno", "lsp" },
	cmd_env = { NO_COLOR = true },
	root_markers = { "deno.json" },
	workspace_required = true,
	---@diagnostic disable-next-line: unused-local
	-- root_dir = function(bufnr, on_dir)
	-- 	local root_path = vim.fs.find("deno.json", {
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
	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
					},
				},
			},
		},
	},
}
