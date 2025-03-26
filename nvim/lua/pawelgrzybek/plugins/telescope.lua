return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = true },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		local actions = require("telescope.actions")
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			defaults = {
				path_display = { "truncate" },
				color_devicons = false,
				mappings = {
					i = { ["<C-y>"] = "select_default" },
					n = { ["<C-y>"] = "select_default" },
				},
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
				lsp_references = {
					show_line = false,
				},
				lsp_incoming_calls = {
					show_line = false,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]iles" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [b]uffers" })
		vim.keymap.set("n", "<leader>fp", builtin.live_grep, { desc = "[F]ind [p]attern" })
		vim.keymap.set("n", "<leader>fg", builtin.git_status, { desc = "[F]ind [g]it changes" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [h]elp tags" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [k]eymaps" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [c]urrent [w]ord" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [d]iagnostics" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[F]ind [m]arks" })
		vim.keymap.set("n", "<leader><leader>", builtin.resume, { desc = "Find  (recent)" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [c]onfig files" })

		-- disable cursorline for Telescope prompt
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopePrompt",
			callback = function()
				vim.opt_local.cursorline = false
			end,
		})
	end,
}
