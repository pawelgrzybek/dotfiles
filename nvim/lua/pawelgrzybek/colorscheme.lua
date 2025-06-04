-- normal
-- 0
local black = "#323141"
-- 1
local red = "#ea9799"
-- 2
local green = "#7ec39b"
-- 3
local yellow = "#c6ae7e"
-- 4
local blue = "#95b5d6"
-- 5
local magenta = "#bba2e7"
-- 6
local cyan = "#71c2be"
-- 7
local white = "#b0b0b8"

-- light
-- 8
local blackLight = "#747286"
-- 9
local redLight = "#ffaaab"
-- 10
local greenLight = "#91d6ae"
-- 11
local yellowLight = "#d9c191"
-- 12
local blueLight = "#a7c8ea"
-- 13
local magentaLight = "#cfb5fb"
-- 14
local cyanLight = "#84d5d1"
-- 15
local whiteLight = "#e4e4ec"

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = "NONE", bg = "NONE", ctermfg = 15, fg = whiteLight })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = 8, fg = blackLight })
vim.api.nvim_set_hl(0, "StatusLine", { ctermbg = 0, bg = black, ctermfg = 15, fg = whiteLight })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = 0, bg = black, ctermfg = 7, fg = blackLight })
vim.api.nvim_set_hl(0, "WinSeparator", { ctermbg = "NONE", bg = "NONE", ctermfg = 0, fg = black })
vim.api.nvim_set_hl(0, "Visual", { ctermbg = 8, bg = blackLight })
vim.api.nvim_set_hl(0, "ErrorMsg", { ctermfg = 9, fg = redLight })
vim.api.nvim_set_hl(0, "WarningMsg", { ctermfg = 11, fg = yellowLight })

vim.api.nvim_set_hl(0, "Comment", { ctermfg = 7, fg = white, italic = true })
vim.api.nvim_set_hl(0, "LspInlayHint", { ctermfg = 8, fg = blackLight, italic = true })
vim.api.nvim_set_hl(0, "Whitespace", { ctermfg = 0, fg = black })
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 0, bg = black })
vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 0, bg = black })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = black })

-- popup menu
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { ctermbg = 8, bg = blackLight })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = 7, bg = white })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = 15, bg = whiteLight })

-- gitsigns
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { ctermfg = 8, fg = blackLight, italic = true })

-- todo/fix comments
vim.api.nvim_set_hl(0, "TodoBgTODO", { ctermbg = 9, bg = redLight, ctermfg = 0, fg = black, bold = true })
vim.api.nvim_set_hl(0, "TodoFgTODO", { ctermfg = 9, fg = redLight, bold = true })
vim.api.nvim_set_hl(0, "TodoBgFIX", { ctermbg = 9, bg = redLight, ctermfg = 0, fg = black, bold = true })
vim.api.nvim_set_hl(0, "TodoFgFIX", { ctermfg = 9, fg = redLight, bold = true })

-- more prominenet matching brackets
vim.api.nvim_set_hl(0, "MatchParen", { ctermbg = 8, bg = blackLight, underline = true })

-- changed indicator omre prominent, the default cyan is not too different to added green
vim.api.nvim_set_hl(0, "Changed", { ctermfg = 11, fg = yellowLight })
vim.api.nvim_set_hl(0, "MarkSignHL", { ctermfg = 13, fg = magentaLight })

-- diff
vim.api.nvim_set_hl(0, "DiffAdd", { ctermbg = 2, bg = green })
-- vim.api.nvim_set_hl(0, "DiffChange", { ctermbg = 3, bg = yellow })
vim.api.nvim_set_hl(0, "DiffText", { ctermbg = 4, bg = blue })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermbg = 1, bg = red })

vim.api.nvim_set_hl(0, "BlinkCmpSource", { ctermfg = 7, fg = white })
vim.api.nvim_set_hl(0, "DiffAdd", { ctermbg = 0, bg = black })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermbg = 0, bg = black })

vim.api.nvim_set_hl(0, "Folded", { ctermfg = 13, fg = magentaLight })
