return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint" },
				javascriptreact = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint" },
				typescript = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint" },
				typescriptreact = vim.fn.filereadable("deno.json") == 1 and {
					"deno",
				} or { "eslint" },
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
