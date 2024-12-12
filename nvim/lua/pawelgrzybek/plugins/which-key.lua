return { -- Useful plugin to show you pending keybinds.
	enabled = false,
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {

		-- Document existing key chains
		-- spec = {
		--   { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
		--   { '<leader>d', group = '[D]ocument' },
		--   { '<leader>r', group = '[R]ename' },
		--   { '<leader>s', group = '[S]earch' },
		--   { '<leader>w', group = '[W]orkspace' },
		--   { '<leader>t', group = '[T]oggle' },
		--   { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		-- },
	},
}
