vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
-- vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 6

vim.opt.colorcolumn = "80,120"

-- before the kickstart adoption
vim.opt.guicursor = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = false

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

vim.diagnostic.config({
	float = {
		border = "single",
	},
})
