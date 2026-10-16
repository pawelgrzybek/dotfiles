local function file_contains(file, patterns, all)
	if not file then
		return false
	end
	local ok, lines = pcall(vim.fn.readfile, file)
	if not ok then
		return false
	end
	local content = table.concat(lines, "\n")
	for _, pattern in ipairs(patterns) do
		local found = content:find(pattern, 1, true) ~= nil
		if all and not found then
			return false
		end
		if not all and found then
			return true
		end
	end
	return all
end

local function find_up(name, path)
	return vim.fs.find(name, { path = path, upward = true, type = "file" })[1]
end

return {
	cmd = function(dispatchers, config)
		if config and config.root_dir then
			for _, name in ipairs({ "vp", "oxlint" }) do
				local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", name)
				if vim.fn.executable(local_cmd) == 1 then
					local cmd = name == "vp" and { local_cmd, "lint", "--lsp" } or { local_cmd, "--lsp" }
					return vim.lsp.rpc.start(cmd, dispatchers)
				end
			end
		end
		local cmd = { "oxlint", "--lsp" }
		if vim.fn.executable("oxlint") == 0 and vim.fn.executable("vp") == 1 then
			cmd = { "vp", "lint", "--lsp" }
		end
		return vim.lsp.rpc.start(cmd, dispatchers)
	end,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local markers = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" }
		if file_contains(find_up("package.json", fname), { "oxlint", "vite-plus" }, false) then
			table.insert(markers, "package.json")
		end
		if file_contains(find_up("vite.config.ts", fname), { "vite-plus", "lint:" }, true) then
			table.insert(markers, "vite.config.ts")
		end
		local root = vim.fs.find(markers, { path = fname, upward = true })[1]
		if root then
			on_dir(vim.fs.dirname(root))
		end
	end,
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspOxlintFixAll", function()
			client:exec_cmd({
				title = "Apply Oxlint automatic fixes",
				command = "oxc.fixAll",
				arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
			})
		end, { desc = "Apply Oxlint automatic fixes" })
	end,
	settings = {},
	before_init = function(init_params, config)
		local settings = config.settings or {}
		local has_tsgolint = vim.fn.executable("tsgolint") == 1
		if not has_tsgolint and config.root_dir then
			has_tsgolint = vim.fn.executable(vim.fs.joinpath(config.root_dir, "node_modules/.bin", "tsgolint")) == 1
		end
		if settings.typeAware == nil and has_tsgolint and config.root_dir then
			if file_contains(vim.fs.joinpath(config.root_dir, ".oxlintrc.json"), { "typescript" }, false) then
				settings = vim.tbl_extend("force", settings, { typeAware = true })
			end
		end
		local init_options = config.init_options or {}
		init_options.settings = vim.tbl_extend("force", init_options.settings or {}, settings)
		init_params.initializationOptions = init_options
	end,
}
