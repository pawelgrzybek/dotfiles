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
	"tsgo",
}

vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup({
	ui = {
		border = "single",
	},
})

-- Auto-install anything missing (no mason-tool-installer plugin needed).
local registry = require("mason-registry")

local function install_missing()
	for _, name in ipairs(ensure_installed) do
		local ok, pkg = pcall(registry.get_package, name)
		if ok and not pkg:is_installed() then
			pkg:install()
		end
	end
end

-- Only hit the network to refresh the registry index if something is missing.
local needs_refresh = false
for _, name in ipairs(ensure_installed) do
	local ok, pkg = pcall(registry.get_package, name)
	if not ok or not pkg:is_installed() then
		needs_refresh = true
		break
	end
end

if needs_refresh then
	registry.refresh(install_missing)
else
	install_missing()
end
