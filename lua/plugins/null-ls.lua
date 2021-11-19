return function()
	local ok, null_ls = pcall(require, "null-ls")
	if not ok then
		return
	end

	local b = null_ls.builtins
	local sources = {
		-- lua formatting
		b.formatting.stylua,
		-- python formatting
		b.formatting.autopep8,

		-- b.formatting.codespell,

		-- go formatting
		-- b.formatting.gofumpt,
		-- b.formatting.goimports,

		-- go lint
		-- b.diagnostics.golangci_lint,
	}
	null_ls.config({
		sources = sources,
	})
	require("lspconfig")["null-ls"].setup({})
end
