return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"astro",
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
	},
	---@diagnostic disable-next-line: unused-local
	root_dir = function(bufnr, on_dir)
		local root_path = vim.fs.find("tailwind.config.js", {
			upward = true,
			type = "file",
			path = vim.fn.getcwd(),
		})[1]

		if root_path then
			on_dir(vim.fn.fnamemodify(root_path, ":h"))
		end
	end,
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
			includeLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
				templ = "html",
				htmlangular = "html",
			},
		},
	},
}
