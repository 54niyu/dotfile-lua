require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "yaml", "json", "python", "rust" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {},
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	context_commentstring = {
		enable = true,
	},
})
