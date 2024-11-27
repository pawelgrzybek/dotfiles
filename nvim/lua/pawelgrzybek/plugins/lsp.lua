return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				vim.keymap.set(
					"n",
					"<leader>gd",
					require("telescope.builtin").lsp_definitions,
					{ buffer = event.buf, desc = "[G]o to [d]efinition" }
				)
				vim.keymap.set(
					"n",
					"<leader>gD",
					vim.lsp.buf.declaration,
					{ buffer = event.buf, desc = "[G]o to [d]eclatation" }
				)
				vim.keymap.set(
					"n",
					"<leader>gt",
					require("telescope.builtin").lsp_type_definitions,
					{ buffer = event.buf, desc = "[G]o to [t]ype" }
				)
				vim.keymap.set(
					"n",
					"<leader>gi",
					require("telescope.builtin").lsp_implementations,
					{ buffer = event.buf, desc = "[G]o to [i]mplementation" }
				)
				vim.keymap.set(
					"n",
					"<leader>gr",
					require("telescope.builtin").lsp_references,
					{ buffer = event.buf, desc = "[G]oto [r]eferences" }
				)

				vim.keymap.set(
					"n",
					"<leader>fs",
					require("telescope.builtin").lsp_document_symbols,
					{ buffer = event.buf, desc = "[F]ind symbols" }
				)
				vim.keymap.set(
					"n",
					"<leader>fS",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					{ buffer = event.buf, desc = "[F]ind [s]ymbols (global)" }
				)

				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]ename" })

				vim.keymap.set(
					{ "n", "x" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ buffer = event.buf, desc = "[C]ode [A]ction" }
				)

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					--
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				-- This may be unwanted, since they displace some of your code
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					vim.keymap.set("n", "<leader>ah", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, { buffer = event.buf, desc = "Inlay [h]ints" })
				end
			end,
		})

		local capabilities_extended = vim.lsp.protocol.make_client_capabilities()
		capabilities_extended =
			vim.tbl_deep_extend("force", capabilities_extended, require("cmp_nvim_lsp").default_capabilities())

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "denols" },
		})

		-- lua
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			capabilities = vim.tbl_deep_extend(
				"force",
				{},
				capabilities_extended,
				require("lspconfig").lua_ls.capabilities or {}
			),
		})

		-- ts
		require("lspconfig").ts_ls.setup({
			root_dir = require("lspconfig").util.root_pattern("package.json"),
			single_file_support = false,
			capabilities = vim.tbl_deep_extend(
				"force",
				{},
				capabilities_extended,
				require("lspconfig").ts_ls.capabilities or {}
			),
		})

		-- astro
		require("lspconfig").astro.setup({
			capabilities = vim.tbl_deep_extend(
				"force",
				{},
				capabilities_extended,
				require("lspconfig").astro.capabilities or {}
			),
		})

		-- deno
		require("lspconfig").denols.setup({
			root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
			capabilities = vim.tbl_deep_extend(
				"force",
				{},
				capabilities_extended,
				require("lspconfig").denols.capabilities or {}
			),
			init_options = {
				lint = true,
				unstable = true,
				suggest = {
					imports = {
						hosts = {
							["https://deno.land"] = true,
						},
					},
				},
			},
		})
	end,
}
