-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true

		vim.keymap.set("n", "k", "gk", { buffer = true })
		vim.keymap.set("n", "j", "gj", { buffer = true })
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
