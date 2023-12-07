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
				function()
					return {
						exe = "importgroup",
						stdin = true,
						args = { "-std", "true" },
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
            jsonnet = {
                function ()
                    return {
                        exe = "jsonnetfmt",
                        args = { "-"},
                        stdin = true,
                    }
                end
            }
		},
	})

	vim.api.nvim_exec(
		[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.go,*.py,*.jsonnet FormatWrite
augroup END
]],
		true
	)
end
