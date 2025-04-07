return {
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
