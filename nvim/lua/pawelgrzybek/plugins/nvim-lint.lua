return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				go = { "golangcilint" },
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

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					if vim.opt_local.modifiable:get() then
						lint.try_lint(nil, { ignore_errors = true })
					end
				end,
			})
		end,
	},
}
