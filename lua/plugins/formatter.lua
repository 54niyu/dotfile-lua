return function()
	require("formatter").setup({
		filetype = {
			lua = {
				function()
					return {
						exe = "stylua",
						args = {
							-- "--config-path " .. os.getenv("XDG_CONFIG_HOME") .. "/stylua/stylua.toml",
							"-",
						},
						stdin = true,
					}
				end,
			},
			go = {
				function()
					return {
						exe = "goimports",
						stdin = true,
					}
				end,
			},
			python = {
				-- Configuration for psf/black
				function()
					return {
						exe = "black", -- this should be available on your $PATH
						args = { "-" },
						stdin = true,
					}
				end,
			},
		},
	})

	vim.api.nvim_exec(
		[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.go,*.py,*.lua FormatWrite
augroup END
]],
		true
	)
end
