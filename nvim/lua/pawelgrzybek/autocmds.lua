vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "txt" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true

		vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true })
		vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true })
		vim.keymap.set({ "n", "v" }, "$", "g$", { buffer = true })
		vim.keymap.set({ "n", "v" }, "0", "g0", { buffer = true })
	end,
})

-- Disable cursorline and cursorcolumn for inactive windows
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	callback = function()
		vim.opt_local.cursorline = false
		vim.opt_local.cursorcolumn = false
	end,
})
vim.api.nvim_create_autocmd({ "WinEnter" }, {
	callback = function()
		vim.opt_local.cursorline = true
		vim.opt_local.cursorcolumn = true
	end,
})

-- enable line wrapping in quickfix window
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		-- rename
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]ename member" })

		-- function calls
		-- I would love this one to be in the `Snacks.picker`
		vim.keymap.set(
			{ "n", "x" },
			"<leader>ci",
			vim.lsp.buf.incoming_calls,
			{ buffer = event.buf, desc = "[C]alls [i]ncoming" }
		)

		vim.keymap.set(
			{ "n", "x" },
			"<leader>co",
			vim.lsp.buf.outgoing_calls,
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
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
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
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

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
