-- TerminalColor0  - Black
-- TerminalColor1  - Red
-- TerminalColor2  - Green
-- TerminalColor3  - Yellow
-- TerminalColor4  - Blue
-- TerminalColor5  - Magenta
-- TerminalColor6  - Cyan
-- TerminalColor7  - White
--
-- TerminalColor8  - Bright Black (Gray)
-- TerminalColor9  - Bright Red
-- TerminalColor10 - Bright Green
-- TerminalColor11 - Bright Yellow
-- TerminalColor12 - Bright Blue
-- TerminalColor13 - Bright Magenta
-- TerminalColor14 - Bright Cyan
-- TerminalColor15 - Bright White

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE" })

vim.api.nvim_set_hl(0, "Comment", { ctermfg = 8, fg = "#3c3b4c" })
vim.api.nvim_set_hl(0, "Whitespace", { ctermfg = 8, fg = "#3c3b4c" })
