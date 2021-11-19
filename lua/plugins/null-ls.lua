return function()
	local ok, null_ls = pcall(require, "null-ls")
	if not ok then
		return
	end

	local b = null_ls.builtins
	local sources = {
		-- go formatting
		b.formatting.gofumpt,
		-- b.formatting.goimports,

		-- go lint
		b.diagnostics.golangci_lint,
	}

	local M = {}
	M.setup = function(on_attach)
		null_ls.config({
			sources = sources,
		})
		require("lspconfig")["null-ls"].setup({ on_attach = on_attach })
	end
	return M
end
