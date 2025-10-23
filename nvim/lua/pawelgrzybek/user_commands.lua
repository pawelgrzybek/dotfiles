vim.api.nvim_create_user_command("ESLintFix", function()
	vim.cmd("silent !eslint_d --fix " .. vim.fn.expand("%"))
	vim.cmd("redraw!")
end, {})

vim.api.nvim_create_user_command("CopyPath", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, {})

vim.api.nvim_create_user_command("CopyPathAbsolute", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})
