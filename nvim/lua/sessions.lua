local M = {}

local dir = vim.fn.stdpath("data") .. "/sessions/"

local function path()
	local cwd = vim.fn.getcwd()
	return dir .. cwd:gsub("/", "%%") .. ".vim"
end

function M.save()
	vim.fn.mkdir(dir, "p")
	vim.cmd("mksession! " .. vim.fn.fnameescape(path()))
end

function M.restore()
	local file = path()
	if vim.fn.filereadable(file) == 0 then
		return false
	end
	vim.cmd("silent! source " .. vim.fn.fnameescape(file))
	return true
end

function M.list()
	local items = {}
	for _, file in ipairs(vim.fn.glob(dir .. "*.vim", true, true)) do
		local session_dir = file:sub(#dir + 1, -5):gsub("%%", "/")
		items[#items + 1] = {
			dir = session_dir,
			text = vim.fn.fnamemodify(session_dir, ":~"),
			mtime = vim.fn.getftime(file),
		}
	end
	table.sort(items, function(a, b)
		return a.mtime > b.mtime
	end)
	return items
end

vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		if vim.fn.argc() == 0 then
			M.restore()
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = M.save,
})

vim.api.nvim_create_user_command("SessionSave", M.save, {})
vim.api.nvim_create_user_command("SessionRestore", M.restore, {})

return M
