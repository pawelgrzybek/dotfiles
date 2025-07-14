return {
	cmd = { "sqls" },
	root_markers = { "config.yml" },
	filetypes = {
		"sql",
	},
	settings = {
		sqls = {
			connections = {
				{
					driver = "postgresql",
					dataSourceName = "host=localhost port=5432 user=postgres password=password dbname=postgres sslmode=prefer",
				},
			},
		},
	},
}
