-- Global
-- vim.opt.fillchars = { vert = ' ' }
vim.opt.showtabline = 2
vim.opt.scrolloff = 5
vim.opt.mouse = "a"
vim.opt.backupcopy = "yes"
vim.opt.undolevels = 1000
vim.opt.shortmess:append({ c = true, S = true })
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrapscan = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.title = true
vim.opt.lazyredraw = true
vim.opt.encoding = "utf-8"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.opt.clipboard = "unnamedplus"
vim.opt.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→", eol = "↲", nbsp = "␣" }
-- Buffer
vim.opt.fileformat = "unix"
vim.opt.tabstop = 4
-- vim.opt.spelllang = 'it'
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
-- Window
vim.opt.number = true
vim.opt.colorcolumn = "+1"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.list = false
vim.opt.foldnestmax = 10
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.foldenable = false
vim.opt.cursorline = true
vim.opt.timeoutlen = 600

vim.cmd([[autocmd BufReadPost * lua goto_last_pos()]])
function goto_last_pos()
	local last_pos = vim.fn.line("'\"")
	if last_pos > 0 and last_pos <= vim.fn.line("$") then
		vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
	end
end

vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- disable builtin plugin
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
