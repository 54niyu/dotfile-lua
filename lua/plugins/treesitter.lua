return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "go", "yaml", "json", "python", "rust", "norg" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		ignore_install = {},
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		context_commentstring = {
			enable = true,
		},
	})
end
