vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
-- vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.winborder = "single"

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 6

vim.opt.colorcolumn = "80,120"

-- before the kickstart adoption
vim.opt.guicursor = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = false

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

vim.diagnostic.config({ virtual_text = true, virtual_lines = {
	current_line = true,
} })

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	filetypes = { "lua" },
}

vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = {
		"package.json",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayVariableTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
			importModuleSpecifierPreference = "non-relative",
		},
	},
	on_attach = function(client)
		if client.config.root_dir == nil then
			client.stop(client, true)
			return
		end

		local denoJsonExists = vim.fn.filereadable(client.config.root_dir .. "/package.json") == 1
		if denoJsonExists == false then
			client.stop(client, true)
		end
	end,
}

vim.lsp.config.astro = {
	cmd = { "astro-ls", "--stdio" },
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	filetypes = {
		"astro",
	},

	init_options = {
		typescript = {},
	},
	before_init = function(params, config)
		if vim.tbl_get(config.init_options, "typescript") and not config.init_options.typescript.tsdk then
			local project_root =
				vim.fs.dirname(vim.fs.find("node_modules", { path = params.rootPath, upward = true })[1])
			config.init_options.typescript.tsdk = project_root and (project_root .. "/node_modules/typescript/lib")
				or ""
		end
	end,
}

vim.lsp.config.deno = {
	cmd = { "deno", "lsp" },
	cmd_env = { NO_COLOR = true },
	root_markers = {
		"deno.json",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
					},
				},
			},
		},
	},
	on_attach = function(client)
		if client.config.root_dir == nil then
			client.stop(client, true)
			return
		end

		local denoJsonExists = vim.fn.filereadable(client.config.root_dir .. "/deno.json") == 1
		if denoJsonExists == false then
			client.stop(client, true)
		end
	end,
}

vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	root_markers = {
		"rust-project.json",
		"Cargo.toml",
		".git",
	},
	filetypes = {
		"rust",
	},
	capabilities = {
		experimental = {
			serverStatusNotification = true,
		},
	},
}

vim.lsp.config.gopls = {
	cmd = { "gopls" },
	root_markers = {
		"go.work",
		"go.mod",
		".git",
	},
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

vim.lsp.config.buf_ls = {
	cmd = { "buf", "beta", "lsp", "--timeout=0", "--log-format=text" },
	filetypes = { "proto" },
	root_markers = { "buf.yaml", ".git" },
}

vim.lsp.config.emmet_language_server = {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"css",
		"scss",
		"html",
		"javascriptreact",
		"typescriptreact",
	},
	root_markers = { ".git" },
}

vim.lsp.config.tailwindcss = {
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

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"astro",
	"deno",
	"rust_analyzer",
	"gopls",
	"buf_ls",
	"emmet_language_server",
	"tailwindcss",
})
