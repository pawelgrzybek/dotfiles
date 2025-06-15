return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		scroll = {
			animate = {
				duration = { step = 10, total = 100 },
				easing = "linear",
			},
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
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["<c-y>"] = { "confirm", mode = { "n", "i" } },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					hidden = true,
				})
			end,
			desc = "[F]ind [f]iles",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[F]ind [b]uffers",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.grep()
			end,
			desc = "[F]ind [p]attern",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "[F]ind [g]it diffs",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "[F]ind [h]elp",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[F]ind [k]eymaps",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[F]ind [w]ord",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "[F]ind [d]iagnostics",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[F]ind [d]iagnostics in all buffers",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "[F]ind [m]arks",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.smart()
			end,
			desc = "[F]ind ??",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [c]onfig",
		},
	},
}
