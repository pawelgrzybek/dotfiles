vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	scroll = {
		animate = {
			duration = { step = 6, total = 140 },
			easing = "linear",
		},
	},
	image = {
		enabled = false, -- NOTE: Disable snacks.image
		formats = {}, -- HACK: Disable image preview for other modules like picker
	},
	picker = {
		layout = {
			layout = {
				box = "horizontal",
				width = 0.9,
				min_width = 120,
				height = 0.9,
				{
					box = "vertical",
					border = "single",
					title = "{title}",
					{ win = "input", height = 1, border = "bottom" },
					{ win = "list", border = "none" },
				},
				{
					win = "preview",
					title = "{preview}",
					width = 0.5,
					border = "single",
					wo = {
						cursorcolumn = false,
					},
				},
			},
		},
		win = {
			input = {
				keys = {
					-- ["<Esc>"] = { "close", mode = { "n", "i" } },
					["<c-y>"] = { "confirm", mode = { "n", "i" } },
				},
				wo = {
					cursorlineopt = "line",
				},
			},
		},
		sources = {
			explorer = {
				hidden = true,
				layout = {
					layout = {
						backdrop = false,
						width = 55,
						min_width = 55,
						height = 0,
						position = "right",
						border = "none",
						box = "vertical",
						-- {
						-- 	win = "input",
						-- 	height = 1,
						-- 	border = "single",
						-- 	title = "{title} {live} {flags}",
						-- 	title_pos = "center",
						-- },
						{ win = "list", border = "none" },
						-- { win = "preview", title = "{preview}", height = 0.4, border = "top" },
					},
				},
			},
			spelling = {
				layout = {
					layout = {
						box = "horizontal",
						width = 0.6,
						min_width = 60,
						height = 0.8,
						{
							box = "vertical",
							border = "single",
							title = "{title}",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
					},
				},
			},
		},
	},
	indent = {
		animate = {
			enabled = false,
		},
	},
})

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files({
		hidden = true,
	})
end, { desc = "[F]ind [f]iles" })

vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "[F]ind [b]uffers" })

vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.grep()
end, { desc = "[F]ind [p]attern" })

vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_status()
end, { desc = "[F]ind [g]it diffs" })

vim.keymap.set("n", "<leader>fl", function()
	Snacks.picker.git_log()
end, { desc = "[F]ind [l]og" })

vim.keymap.set("n", "<leader>fL", function()
	Snacks.picker.git_log_file()
end, { desc = "[F]ind [L]og file" })

vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "[F]ind [h]elp" })

vim.keymap.set("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "[F]ind [k]eymaps" })

vim.keymap.set("n", "<leader>fw", function()
	Snacks.picker.grep_word()
end, { desc = "[F]ind [w]ord" })

vim.keymap.set("n", "<leader>fd", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "[F]ind [d]iagnostics" })

vim.keymap.set("n", "<leader>fD", function()
	Snacks.picker.diagnostics()
end, { desc = "[F]ind [d]iagnostics in all buffers" })

vim.keymap.set("n", "<leader>fm", function()
	Snacks.picker.marks()
end, { desc = "[F]ind [m]arks" })

vim.keymap.set("n", "<leader><leader>", function()
	Snacks.picker.resume()
end, { desc = "[F]ind ??" })

vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [c]onfig" })

vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "[G]o to [d]efinition" })

vim.keymap.set("n", "<leader>gt", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "[G]o to [t]ype definition" })

vim.keymap.set("n", "<leader>gi", function()
	Snacks.picker.lsp_implementations()
end, { desc = "[G]o to [i]mplementations" })

vim.keymap.set("n", "<leader>gr", function()
	Snacks.picker.lsp_references()
end, { desc = "[G]o to [r]eferences" })

vim.keymap.set("n", "<leader>gc", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "[G]o to incoming [c]alls" })

vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.lsp_symbols({
		filter = {
			default = {
				"Class",
				"Constructor",
				"Enum",
				"Field",
				"Function",
				"Interface",
				"Method",
				"Module",
				"Namespace",
				"Package",
				"Property",
				"Struct",
				"Trait",
				"Variable",
				"Constant",
				"Object",
			},
		},
	})
end, { desc = "[F]ind [s]ymbols (local)" })

vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "[F]ind [s]ymbols (global)" })

vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.spelling()
end, { desc = "[F]ind [s]show [s]pelling suggestions" })

vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "[E]xplorer" })
