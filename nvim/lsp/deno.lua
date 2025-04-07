return {
	cmd = { "deno", "lsp" },
	cmd_env = { NO_COLOR = true },
	root_markers = {
		"deno.json",
	},
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
	on_attach = function(client)
		if client.config.root_dir == nil then
			client.stop(client, true)
			return
		end

		local denoJsonExists = vim.fn.filereadable(client.config.root_dir .. "/deno.json") == 1
		if denoJsonExists == false then
			client.stop(client, true)
		end
	end,
}
