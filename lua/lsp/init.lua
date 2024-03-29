-- local nvim_lsp = require("lspconfig")
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- nvim-cmp supports additional completion capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Diagnostics symbols for display in the sign column.
vim.cmd("sign define LspDiagnosticsSignError text=")
vim.cmd("sign define LspDiagnosticsSignWarning text=")
vim.cmd("sign define LspDiagnosticsSignInformation text=")
vim.cmd("sign define LspDiagnosticsSignHint text=")
-- vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

require("lspconfig").gopls.setup({
	-- filetype = { "go" },
	-- cmd = { "gopls", "-rpc.trace", "-logfile", "/Users/bing.wang/gopls.log" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { gopls = { analyses = { unusedparams = true, fillstruct = false }, staticcheck = true } },
	init_options = { usePlaceholders = true, completeUnimported = true },
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require'lspconfig'.vuels.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

require'lspconfig'.bufls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

require'lspconfig'.jsonnet_ls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

-- function OrgImports(wait_ms)
-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = { only = { "source.organizeImports" } }
-- 	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
-- 	for _, res in pairs(result or {}) do
-- 		for _, r in pairs(res.result or {}) do
-- 			if r.edit then
-- 				vim.lsp.util.apply_workspace_edit(r.edit)
-- 			else
-- 				vim.lsp.buf.execute_command(r.command)
-- 			end
-- 		end
-- 	end
-- end
