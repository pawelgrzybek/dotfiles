return {

	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint_d" },
				javascriptreact = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint_d" },
				typescript = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint_d" },
				typescriptreact = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint_d" },
			}
			--
			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify in order to
					-- avoid superfluous noise, notably within the handy LSP pop-ups that
					-- describe the hovered symbol using Markdown.
					if vim.opt_local.modifiable:get() then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
