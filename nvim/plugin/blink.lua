vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })

require("blink.cmp").setup({

	-- enabled = function()
	-- 	return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
	-- end,

	completion = {
		-- Disable auto brackets
		-- NOTE: some LSPs may add auto brackets themselves anyway
		accept = { auto_brackets = { enabled = false } },
		menu = {
			border = "single",
			draw = {
				gap = 2,
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind", "source_name", gap = 1 },
				},
			},
		},
		documentation = { window = { border = "single" } },
	},
	signature = { window = { border = "single" } },

	-- 'default' for mappings similar to built-in completion
	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	-- see the "default configuration" section below for full documentation on how to define
	-- your own keymap.
	keymap = { preset = "default" },

	appearance = {
		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- Useful for when your theme doesn't support blink.cmp
		-- will be removed in a future release
		use_nvim_cmp_as_default = true,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "lazydev" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
		-- default = { "lsp", "path", "snippets", "buffer" },
		-- optionally disable cmdline completions
		-- cmdline = {},
	},

	-- experimental signature help support
	-- signature = { enabled = true }
})
