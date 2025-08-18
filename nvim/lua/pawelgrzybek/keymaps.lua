-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Move/duplicate lines up and down (normal mode)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-J>", ":t.<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-K>", ":t-1<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "<A-J>", "<C-o>:t.<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<A-K>", "<C-o>:t-1<CR>", { noremap = true, silent = true })
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
vim.keymap.set("n", "<leader>d", function()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win.loclist == 1 then
			vim.cmd("lclose")
			return
		end
	end
	vim.diagnostic.setloclist()
end, { desc = "Toggle [d]iagnostics (location list)" })
vim.keymap.set("n", "<leader><A-d>", vim.diagnostic.open_float, { desc = "Open [d]iagnostics (float)" })
vim.keymap.set("n", "<leader>D", vim.diagnostic.setqflist, { desc = "Open [D]iagnostics (quickfix list)" })

-- Toggle quickfix/location list
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

-- Tab navigation
vim.keymap.set("n", "]t", "gt")
vim.keymap.set("n", "[t", "gT")

-- Undotree toggle
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "[U]ndotree toggle" })
