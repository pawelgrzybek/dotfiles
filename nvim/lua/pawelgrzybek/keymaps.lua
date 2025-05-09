-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Move/duplicate lines up and down (normal mode)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-J>", ":t.<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-K>", ":t-1<CR>", { noremap = true, silent = true })

-- Move/duplicate lines up and down (insert mode)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "<A-J>", "<C-o>:t.<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-K>", "<C-o>:t-1<CR>", { noremap = true, silent = true })

-- Move/duplicate lines up and down (visual mode)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-J>", ":t-1<CR>gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-K>", ":t'><CR>gv", { noremap = true, silent = true })

-- Copy/paste to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- Select all
vim.keymap.set("n", "<leader>a", "ggVG")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostics (locatoin list)" })
vim.keymap.set("n", "<leader><A-d>", vim.diagnostic.open_float, { desc = "Open [d]iagnostics (float)" })
vim.keymap.set("n", "<leader>D", vim.diagnostic.setqflist, { desc = "Open [D]iagnostics (quickfix list)" })

-- Quickfix stuff
vim.keymap.set("n", "<leader>q", function()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end, { desc = "Toggle quickfix list" })
-- looks like in 0.11 it is the default
-- vim.keymap.set("n", "[q", "<cmd>:cprev<Cr>", { desc = "Quick fix next" })
-- vim.keymap.set("n", "]q", "<cmd>:cnext<Cr>", { desc = "Quick fix next" })

-- Location list stuff
vim.keymap.set("n", "<leader>l", function()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win.loclist == 1 then
			vim.cmd("lclose")
			return
		end
	end
	vim.cmd("lopen")
end, { desc = "Toggle locatoin list" })
-- looks like in 0.11 it is the default
-- vim.keymap.set("n", "[l", "<cmd>:lprev<Cr>", { desc = "Location list previous" })
-- vim.keymap.set("n", "]l", "<cmd>:lnext<Cr>", { desc = "Location list next" })

-- looks like in 0.11 it is the default
-- quickly navigate between buffers
-- vim.keymap.set("n", "[b", "<cmd>:bprevious<Cr>")
-- vim.keymap.set("n", "]b", "<cmd>:bnext<Cr>")
-- vim.keymap.set("n", "[B", "<cmd>:bfirst<Cr>")
-- vim.keymap.set("n", "]B", "<cmd>:blast<Cr>")

-- looks like in 0.11 it is the default
-- quickly navigate between tabs
-- vim.keymap.set("n", "[t", "<cmd>:tabprevious<Cr>")
-- vim.keymap.set("n", "]t", "<cmd>:tabnext<Cr>")
-- vim.keymap.set("n", "[T", "<cmd>:tabfirst<Cr>")
-- vim.keymap.set("n", "]T", "<cmd>:tablast<Cr>")
--
vim.keymap.set("n", "<leader>v", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
