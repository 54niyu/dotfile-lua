return function()
	require("lint").linters_by_ft = {
		go = { "golangcilint", "codespell" },
		lua = { "codespell" },
		markdown = { "codespell" },
		python = { "codespell" },
	}
	vim.cmd([[autocmd BufEnter,BufWritePost *.go lua require("lint").try_lint()]])
end
