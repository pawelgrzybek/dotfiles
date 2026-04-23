vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })

require("blink.cmp").setup({
	-- when i write, i write, do not interupt please
	enabled = function()
		return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
	end,

	completion = {
		-- im testing this out
		-- accept = { auto_brackets = { enabled = false } },
		menu = {
			draw = {
				gap = 2,
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind", "source_name", gap = 1 },
				},
			},
		},
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
	},
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
	},
	-- im testing this out
	-- Experimental signature help support
	signature = { enabled = true },
})
