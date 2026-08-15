vim.pack.add({ "https://github.com/folke/snacks.nvim" })

---@class snacks.picker
---@field config_files fun(opts?: snacks.picker.files.Config|{}): snacks.Picker

local symbol_kinds = {
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
}

local search_opts = {
	hidden = true,
	ignored = true,
	exclude = { "node_modules" },
}

require("snacks").setup({
	scroll = {
		animate = {
			duration = { step = 6, total = 140 },
		},
	},
	image = {
		enabled = false,
	},
	picker = {
		layout = { preset = "main" },
		win = {
			input = {
				keys = {
					["<c-y>"] = { "confirm", mode = { "n", "i" } },
				},
				wo = {
					cursorlineopt = "line",
				},
			},
		},
		layouts = {
			main = {
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
			compact = {
				layout = {
					box = "horizontal",
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
		sources = {
			files = search_opts,
			grep = search_opts,
			grep_word = search_opts,
			config_files = vim.tbl_extend("force", {
				finder = "files",
				cwd = vim.fn.stdpath("config"),
			}, search_opts),
			lsp_symbols = {
				filter = {
					default = symbol_kinds,
					lua = vim.tbl_filter(function(kind)
						return kind ~= "Package"
					end, symbol_kinds),
				},
			},
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
						{ win = "list", border = "none" },
					},
				},
			},
			spelling = {
				layout = {
					preset = "compact",
					layout = { width = 0.6, min_width = 60, height = 0.8 },
				},
			},
			projects = {
				dev = { "~/Developer", "~/Sites" },
				projects = { vim.fn.expand("~/.dotfiles") },
				patterns = { ".git" },
				max_depth = 3,
				recent = false,
				cwd = vim.fn.expand("~"),
				confirm = function(picker, item)
					picker:close()
					if not item then
						return
					end

					local unsaved = vim.tbl_filter(function(buf)
						return vim.bo[buf.bufnr].buftype == ""
					end, vim.fn.getbufinfo({ buflisted = 1, bufmodified = 1 }))

					local modified = vim.tbl_map(function(buf)
						return buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":~:.") or "[No Name]"
					end, unsaved)

					if #modified > 0 then
						vim.notify(
							"Cannot switch project, unsaved changes:\n" .. table.concat(modified, "\n"),
							vim.log.levels.WARN
						)
						return
					end

					local auto_session = require("auto-session")

					auto_session.auto_save_session()
					vim.fn.chdir(item.file)

					if not auto_session.restore_session(nil, { show_message = false }) then
						vim.cmd("silent! tabonly | silent! only | silent! %bw!")
					end
				end,
				layout = {
					preset = "compact",
					layout = { width = 0.4, min_width = 50, height = 0.6 },
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

vim.keymap.set("n", "<leader>ff", Snacks.picker.files, { desc = "[F]ind [f]iles" })
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers, { desc = "[F]ind [b]uffers" })
vim.keymap.set("n", "<leader>fp", Snacks.picker.grep, { desc = "[F]ind [p]attern" })
vim.keymap.set("n", "<leader>fg", Snacks.picker.git_status, { desc = "[F]ind [g]it status" })
vim.keymap.set("n", "<leader>fl", Snacks.picker.git_log, { desc = "[F]ind [l]og" })
vim.keymap.set("n", "<leader>fL", Snacks.picker.git_log_file, { desc = "[F]ind [L]og file" })
vim.keymap.set("n", "<leader>fh", Snacks.picker.help, { desc = "[F]ind [h]elp" })
vim.keymap.set("n", "<leader>fk", Snacks.picker.keymaps, { desc = "[F]ind [k]eymaps" })
vim.keymap.set({ "n", "x" }, "<leader>fw", Snacks.picker.grep_word, { desc = "[F]ind [w]ord" })
vim.keymap.set("n", "<leader>fd", Snacks.picker.diagnostics_buffer, { desc = "[F]ind [d]iagnostics (buffer)" })
vim.keymap.set("n", "<leader>fD", Snacks.picker.diagnostics, { desc = "[F]ind [D]iagnostics (all buffers)" })
vim.keymap.set("n", "<leader>fm", Snacks.picker.marks, { desc = "[F]ind [m]arks" })
vim.keymap.set("n", "<leader><leader>", Snacks.picker.resume, { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>fc", Snacks.picker.config_files, { desc = "[F]ind [c]onfig" })
vim.keymap.set("n", "<leader>gd", Snacks.picker.lsp_definitions, { desc = "[G]o to [d]efinition" })
vim.keymap.set("n", "<leader>gt", Snacks.picker.lsp_type_definitions, { desc = "[G]o to [t]ype definition" })
vim.keymap.set("n", "<leader>gi", Snacks.picker.lsp_implementations, { desc = "[G]o to [i]mplementations" })
vim.keymap.set("n", "<leader>gr", Snacks.picker.lsp_references, { desc = "[G]o to [r]eferences" })
vim.keymap.set("n", "<leader>gc", Snacks.picker.lsp_incoming_calls, { desc = "[G]o to incoming [c]alls" })
vim.keymap.set("n", "<leader>gs", Snacks.picker.lsp_symbols, { desc = "[G]o to [s]ymbols (buffer)" })
vim.keymap.set("n", "<leader>gS", Snacks.picker.lsp_workspace_symbols, { desc = "[G]o to [S]ymbols (workspace)" })
vim.keymap.set("n", "<leader>ss", Snacks.picker.spelling, { desc = "[S]how [s]pelling suggestions" })
vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "[E]xplorer" })
vim.keymap.set("n", "<leader>p", Snacks.picker.projects, { desc = "[P]rojects" })
