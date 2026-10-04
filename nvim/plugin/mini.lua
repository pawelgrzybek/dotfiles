vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- ai
require("mini.ai").setup({
	n_lines = 500,
})

-- surround
require("mini.surround").setup()

-- pairs
require("mini.pairs").setup()

-- notify
require("mini.notify").setup()

-- comment
require("mini.comment").setup({
	-- totally claude coded solution for jsx and tsx commenting
	-- i understand 0% of this solution, zero, nil, nada!
	options = {
		custom_commentstring = function(ref)
			local ft = vim.bo.filetype
			if ft ~= "typescriptreact" and ft ~= "javascriptreact" then
				return nil
			end
			pcall(function()
				vim.treesitter.get_parser():parse()
			end)
			local line = vim.fn.getline(ref[1])
			local col = (line:find("%S") or 1) - 1
			local ok, node = pcall(vim.treesitter.get_node, { pos = { ref[1] - 1, col } })
			while ok and node do
				local t = node:type()
				if t == "jsx_expression" then
					return "// %s"
				elseif t == "jsx_element" or t == "jsx_fragment" or t == "jsx_self_closing_element" then
					return "{/* %s */}"
				end
				node = node:parent()
			end
		end,
	},
})

-- files
require("mini.files").setup({
	windows = {
		width_nofocus = 50,
	},
})

vim.keymap.set("n", "<leader>-", function()
	local mf = require("mini.files")
	if not mf.close() then
		mf.open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Open mini files" })
