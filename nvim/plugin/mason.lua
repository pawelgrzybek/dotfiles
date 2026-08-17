-- LSPs, formatters and other tools to auto-install via Mason.
-- Keep this list in sync with the LSP and conform.nvim configs.
local ensure_installed = {
	"astro-language-server",
	"emmet-language-server",
	"eslint_d",
	"gopls",
	"lua-language-server",
	"postgres-language-server",
	"prettier",
	"sqruff",
	"stylua",
	"tsc",
}

vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup()

-- Auto-install anything missing (no mason-tool-installer plugin needed).
local registry = require("mason-registry")

local missing = {}
for _, name in ipairs(ensure_installed) do
	local ok, pkg = pcall(registry.get_package, name)
	if not ok or not pkg:is_installed() then
		missing[#missing + 1] = name
	end
end

-- Only hit the network to refresh the registry index if something is missing.
if #missing > 0 then
	registry.refresh(function()
		for _, name in ipairs(missing) do
			local ok, pkg = pcall(registry.get_package, name)
			if ok and not pkg:is_installed() then
				pkg:install()
			end
		end
	end)
end
