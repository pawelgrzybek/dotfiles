return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- rename
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]ename member" })

				-- go to
				vim.keymap.set(
					"n",
					"<leader>gd",
					require("telescope.builtin").lsp_definitions,
					{ buffer = event.buf, desc = "[G]o to [d]efinition" }
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
					"<leader>gs",
					require("telescope.builtin").lsp_document_symbols,
					{ buffer = event.buf, desc = "[F]ind symbols (local)" }
				)
				vim.keymap.set(
					"n",
					"<leader>gS",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					{ buffer = event.buf, desc = "[F]ind [s]ymbols (global)" }
				)

				-- function calls
				vim.keymap.set(
					{ "n", "x" },
					"<leader>ci",
					require("telescope.builtin").lsp_incoming_calls,
					{ buffer = event.buf, desc = "[C]alls [i]ncoming" }
				)
				vim.keymap.set(
					{ "n", "x" },
					"<leader>co",
					require("telescope.builtin").lsp_outgoing_calls,
					{ buffer = event.buf, desc = "[C]alls [o]utgoing" }
				)

				-- show
				vim.keymap.set(
					{ "n", "x" },
					"<leader>sa",
					vim.lsp.buf.code_action,
					{ buffer = event.buf, desc = "[S]how [a]ctions" }
				)
				vim.keymap.set(
					"n",
					"<leader>ss",
					vim.lsp.buf.signature_help,
					{ buffer = event.buf, desc = "[S]how [s]ignature" }
				)
				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				-- This may be unwanted, since they displace some of your code
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					vim.lsp.inlay_hint.enable(true)

					vim.keymap.set("n", "<leader>sh", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, { buffer = event.buf, desc = "[S]how inlay [h]ints" })
				end

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
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
			end,
		})

		-- add boarder around hovers
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- lua
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			capabilities = capabilities,
		})

		-- ts
		require("lspconfig").ts_ls.setup({
			root_dir = require("lspconfig").util.root_pattern("package.json"),
			single_file_support = false,
			init_options = {
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
			capabilities = capabilities,
		})

		-- astro
		require("lspconfig").astro.setup({
			capabilities = capabilities,
		})

		-- deno
		require("lspconfig").denols.setup({
			root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
			capabilities = capabilities,
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

		-- rust
		require("lspconfig").rust_analyzer.setup({
			capabilities = capabilities,
		})

		-- go
		require("lspconfig").gopls.setup({
			capabilities = capabilities,
		})

		-- buf
		require("lspconfig").buf_ls.setup({
			capabilities = capabilities,
		})

		--emmet
		require("lspconfig").emmet_language_server.setup({
			filetypes = {
				"css",
				"scss",
				"html",
				"javascriptreact",
				"typescriptreact",
			},
			capabilities = capabilities,
		})

		--tailwind
		require("lspconfig").tailwindcss.setup({
			capabilities = capabilities,
		})
	end,
}
