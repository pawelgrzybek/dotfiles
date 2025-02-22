vim.api.nvim_create_user_command("ESLintFix", function()
	vim.cmd("silent !eslint_d --fix " .. vim.fn.expand("%"))
	vim.cmd("redraw!")
end, {})
